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
    btnMax: TButton;
    btnMin: TButton;
    btnClose: TButton;
    imgConn: TImage;
    pnlImgs: TPanel;
    img2: TImage;
    img3: TImage;
    pnlRightImg: TPanel;
    pnlLeftImg: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddClientClick(Sender: TObject);
    procedure btnAddProductClick(Sender: TObject);
    procedure btnStockClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSyncClick(Sender: TObject);
    procedure imgClick(Sender: TObject);
    procedure btnReportClick(Sender: TObject);
    procedure dbGrid2CellClick(Column: TColumn);
    procedure btnCloseClick(Sender: TObject);
    procedure btnMaxClick(Sender: TObject);
    procedure btnMinClick(Sender: TObject);
    procedure btnConfigClick(Sender: TObject);
    procedure dbGridCellClick(Column: TColumn);
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
//
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin

  frameAddProductMain.Visible := False;
  frameStockMain.Visible := False;
  frameAddProductMain.edtDate.Text := DateToStr(Now);

end;

procedure TfrmMain.imgClick(Sender: TObject);
begin
//
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

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.btnConfigClick(Sender: TObject);
begin
  frmDB.ShowModal;
end;

procedure TfrmMain.btnMaxClick(Sender: TObject);
begin

  if Self.WindowState = TWindowState.wsNormal then
  begin
    Self.WindowState := TWindowState.wsMaximized;
  end
  else
    Self.WindowState := TWindowState.wsNormal;

end;

procedure TfrmMain.btnMinClick(Sender: TObject);
begin
  Self.WindowState := TWindowState.wsMinimized;
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
var
  qry: TFDQuery;
begin

  try

    qry := TFDQuery.Create(nil);
    qry.Connection := DM.ConnDbERP;


    DM.clientes.RefreshMetadata;
    DM.endereco.RefreshMetadata;
    DM.produtos.RefreshMetadata;
    dbGrid.Refresh;
    dbGrid2.Refresh;

  finally

    FreeAndNil(qry);

  end;

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

end;

procedure TfrmMain.btnReportClick(Sender: TObject);
begin
//
end;

procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  KeysDown(Sender, Key, Shift);

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
