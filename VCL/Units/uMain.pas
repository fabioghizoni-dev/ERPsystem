unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, uFrameAddClient, uFrameAddProduct, uFrameStock, Data.DB,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, frCoreClasses, frxClass, Vcl.Menus, IPPeerClient,
  IPPeerServer, System.Tether.Manager, Vcl.Mask;

type
  TfrmMain = class(TForm)
    pnlClient: TPanel;
    pnlTop: TPanel;
    btnDbGrid: TButton;
    btnAddClient: TButton;
    btnReport: TButton;
    btnStock: TButton;
    btnAddProduct: TButton;
    imgList: TImageList;
    pnlMain: TPanel;
    btnSync: TButton;
    imgList32bits: TImageList;
    pnlBtnConf: TPanel;
    btnConfig: TButton;
    frameAddClientMain: TframeAddClient;
    frameAddProductMain: TframeAddProduct;
    frameStockMain: TframeStock;
    pnlBtns: TPanel;
    pnlLbls: TPanel;
    lblCadClients: TLabel;
    lblCadProducts: TLabel;
    lblStock: TLabel;
    lblReport: TLabel;
    lblRefresh: TLabel;
    pnlGrid: TPanel;
    lblClientGrid: TLabel;
    lblStockGrid: TLabel;
    dbGrid: TDBGrid;
    dbGrid2: TDBGrid;
    imgConn: TImage;
    pnlImgs: TPanel;
    img2: TImage;
    img3: TImage;
    pnlRightImg: TPanel;
    pnlLeftImg: TPanel;
    pnlColor: TPanel;
    pnlColor2: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddClientClick(Sender: TObject);
    procedure btnAddProductClick(Sender: TObject);
    procedure btnStockClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSyncClick(Sender: TObject);
    procedure btnReportClick(Sender: TObject);
    procedure dbGrid2CellClick(Column: TColumn);
    procedure btnConfigClick(Sender: TObject);
    procedure dbGridCellClick(Column: TColumn);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
  private
    procedure KeysDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  uDM, uConf;

procedure TfrmMain.FormCreate(Sender: TObject);
begin

  frameAddProductMain.edtDate.Text := DateToStr(Now);

  frameAddClientMain.edtName.Text := 'Fabio';
  frameAddClientMain.maskCPF.Text := '101.462.419-32';
  frameAddClientMain.maskPhone.Text := '(43)99828-0078';
  frameAddClientMain.edtState.Text := 'Paran�';
  frameAddClientMain.edtCity.Text := 'Manoel Ribas';
  frameAddClientMain.edtDistrict.Text := 'Centro';

end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  num: Double;
  qry: TFDQuery;
begin
  frameAddProductMain.Visible := False;
  frameStockMain.Visible := False;
  frameAddProductMain.edtDate.Text := DateToStr(Now);

  qry := TFDQuery.Create(nil);

  try
    if not (DM = nil) and DM.ConnDbERP.Connected then
    begin
      qry.Connection := DM.ConnDbERP;
      qry.SQL.Text := 'SELECT SUM(qntd_estoque) AS total_estoque FROM produtos;';
      qry.Open;

      if not qry.IsEmpty then
      begin
        num := qry.FieldByName('total_estoque').AsFloat;
        frameStockMain.edtStock.Text := FormatFloat('###,###,###,###', num);
        frameStockMain.edtStock.Text := StringReplace(frameStockMain.edtStock.Text, ',', '.', [rfReplaceAll]);
      end
      else
        frameStockMain.edtStock.Text := '0';

    end
    else
      ShowMessage('Erro com a inicializa��o');

    qry.Close;
    qry.SQL.Text := 'SELECT id_produto, nome_produto FROM produtos;';
    qry.Open;

    while not qry.Eof do
    begin
      frameStockMain.combo.Items.AddObject(qry.FieldByName('nome_produto').AsString,
      TObject(qry.FieldByName('id_produto').AsInteger));
      qry.Next;
    end;

  finally
    frameStockMain.combo.ItemIndex := 0;
    FreeAndNil(qry);
  end;
end;

procedure TfrmMain.btnAddClientClick(Sender: TObject);
begin

  if frameAddProductMain.Visible or frameStockMain.Visible then
  begin
    frameAddProductMain.Visible := False;
    frameStockMain.Visible := False;
    frameAddClientMain.Visible := True;
  end
  else if not frameAddProductMain.Visible or frameStockMain.Visible then
  begin
    frameAddClientMain.Visible := True;
  end
  else
    ShowMessage('N�o foi possivel continuar!!');

end;

procedure TfrmMain.btnAddProductClick(Sender: TObject);
begin

  if frameAddClientMain.Visible or frameStockMain.Visible then
  begin
    frameAddClientMain.Visible := False;
    frameStockMain.Visible := False;
    frameAddProductMain.Visible := True;
  end
  else if not frameAddClientMain.Visible or frameStockMain.Visible then
  begin
    frameAddProductMain.Visible := True;
  end
  else
    ShowMessage('N�o foi possivel continuar!!');

end;

procedure TfrmMain.btnConfigClick(Sender: TObject);
begin
  frmDB.ShowModal;
end;

procedure TfrmMain.btnStockClick(Sender: TObject);
begin

  if frameAddClientMain.Visible or frameAddProductMain.Visible then
  begin
    frameAddClientMain.Visible := False;
    frameAddProductMain.Visible := False;
    frameStockMain.Visible := True;
  end
  else if not frameAddClientMain.Visible then
  begin
    frameStockMain.Visible := True;
  end
  else
    ShowMessage('N�o foi possivel continuar!!');

end;

procedure TfrmMain.btnSyncClick(Sender: TObject);
begin
  DM.ConnDbERP.RefreshMetadataCache;
end;

procedure TfrmMain.dbGridCellClick(Column: TColumn);
var
  edtName:
  TEdit;
  maskCPF,
  maskPhone:
  TMaskEdit;
  ds:
  TDataSet;
begin

  if frameAddClientMain.Visible = true then
  begin

    edtName := frameAddClientMain.edtName;
    maskCPF := frameAddClientMain.maskCPF;
    maskPhone := frameAddClientMain.maskPhone;
    ds := dbGrid.DataSource.DataSet;

    edtName.Text := ds.FieldByName('nome_cliente').AsString;
    maskCPF.Text := ds.FieldByName('cpf_cliente').AsString;
    maskPhone.Text := ds.FieldByName('celular_cliente').AsString;

  end;

end;

procedure TfrmMain.dbGrid2CellClick(Column: TColumn);
var
  edtProduct,
  edtAmount,
  edtCod,
  edtPrice:
  TEdit;
  ds:
  TDataSet;
begin

  if frameAddProductMain.Visible = True then
  begin

    edtProduct := frameAddProductMain.edtProduct;
    edtAmount := frameAddProductMain.edtAmount;
    edtCod := frameAddProductMain.edtCod;
    edtPrice := frameAddProductMain.edtPrice;
    ds := dbGrid2.DataSource.DataSet;

    edtProduct.Text := ds.FieldByName('nome_produto').AsString;
    edtAmount.Text := ds.FieldByName('qntd_prod_estoque').AsString;
    edtCod.Text := ds.FieldByName('cod_produto_id').AsString;
    edtPrice.Text := 'R$ ' + ds.FieldByName('preco_unitario').AsString + ',00';

  end;

  if frameStockMain.Visible = True then
  begin

    if not frameStockMain.combo.ItemIndex = 0 then
    begin
      frameStockMain.edtStock.Text := '';
    end;

  end;

end;

procedure TfrmMain.btnReportClick(Sender: TObject);
begin
//
end;

procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  KeysDown(Sender, Key, Shift);

end;

procedure TfrmMain.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin

//  if frameAddClientMain.Visible = True then
//  begin
//    dbGrid.DataSource.DataSet.Last;
//  end;
//
//  if frameAddProductMain.Visible = True then
//  begin
//    dbGrid2.DataSource.DataSet.Last;
//  end;

end;

procedure TfrmMain.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin

//  if frameAddClientMain.Visible = True then
//  begin
//    dbGrid.DataSource.DataSet.Next;
//  end;
//
//  if frameAddProductMain.Visible = True then
//  begin
//    dbGrid2.DataSource.DataSet.Next;
//  end;

end;

procedure TfrmMain.KeysDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if Key = VK_ESCAPE then
  begin
    Close;
  end;

end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//
end;

end.

