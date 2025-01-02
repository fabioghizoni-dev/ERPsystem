unit uVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.Types, System.ImageList, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ImgList, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmVenda = class(TForm)
    pnlClient: TPanel;
    pnlMargins: TPanel;
    pnlTop: TPanel;
    lblCodProd: TLabel;
    lblIDProduct: TLabel;
    lblNameProd: TLabel;
    pnlBtns: TPanel;
    pnlEdts: TPanel;
    pnlLbls: TPanel;
    pnlDate: TPanel;
    pnlEdts2: TPanel;
    pnlLeft: TPanel;
    pnlRight: TPanel;
    pnlQuite: TPanel;
    edtCodProd: TEdit;
    edtNameProd: TEdit;
    edtPrice: TEdit;
    lblAmount: TLabel;
    edtDate: TEdit;
    btnSale: TButton;
    btnExlude: TButton;
    grid: TDBGrid;
    ds: TDataSource;
    vendas: TFDTable;
    pnlAmount: TPanel;
    edtAmount: TEdit;
    lblDate: TLabel;
    pnlDiscount: TPanel;
    edtDiscount: TEdit;
    lblDiscount: TLabel;
    Panel1: TPanel;
    edtName: TEdit;
    lblName: TLabel;
    vendasnome_vendedor: TWideStringField;
    vendasnome_prod_vendido: TWideStringField;
    vendasid_prod_vendido: TIntegerField;
    vendasdata_venda: TDateField;
    vendasqntd_total_vendida: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure btnSaleClick(Sender: TObject);
    procedure btnExludeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVenda: TfrmVenda;

implementation

uses
  uDM;

{$R *.dfm}

procedure TfrmVenda.FormCreate(Sender: TObject);
begin
  edtDate.Text := DateToStr(Now);
end;

procedure TfrmVenda.btnExludeClick(Sender: TObject);
begin

  if not grid.DataSource.DataSet.IsEmpty then
  grid.DataSource.DataSet.Delete;

end;

procedure TfrmVenda.btnSaleClick(Sender: TObject);
var
  id:
  Integer;
  nomeprod:
  String;
  qry:
  TFDQuery;
begin

  qry := TFDQuery.Create(nil);
  qry.Connection := DM.ConnDbERP;

  try

    if Trim(edtNameProd.Text) = EmptyStr then
    begin
      edtNameProd.Text := 'Produto 1';
    end;

    if Trim(edtCodProd.Text) = EmptyStr then
    begin
      edtCodProd.Text := '1';
    end;

    if Trim(edtDate.Text) = EmptyStr then
    begin
      edtDate.Text := DateToStr(Now);
    end;

    if Trim(edtAmount.Text) = EmptyStr then
    begin
      edtAmount.Text := IntToStr(2);
    end;

    qry.SQL.Text :=

    'SELECT id_produto, nome_produto FROM produtos;';

    qry.Open;

    id := qry.FieldByName('id_produto').AsInteger;
    nomeprod := qry.FieldByName('nome_produto').AsString;

    if qry.IsEmpty then
    begin

      ShowMessage(IntToStr(id) + nomeprod);

    end
    else
    begin

      ShowMessage('Erro em ' + IntToStr(id) + nomeprod);

    end;

    qry.Close;

     // Configura a consulta SQL
    qry.SQL.Text :=

      'INSERT INTO vendas ' +
      '(nome_vendedor, nome_prod_vendido, id_prod_vendido, data_venda, ' +
      'qntd_total_vendida, preco_prod) VALUES (' +
      ':nome_vendedor, :nome_prod_vendido, :id_prod_vendido, :data_venda, ' +
      ':qntd_total_vendida, :preco_prod);';

    // Define os par�metros da consulta
    qry.ParamByName('nome_vendedor').AsString := edtName.Text;
    qry.ParamByName('nome_prod_vendido').AsString := edtNameProd.Text;
    qry.ParamByName('id_prod_vendido').AsInteger := StrToInt(edtCodProd.Text);
    qry.ParamByName('data_venda').AsDateTime := StrToDate(edtDate.Text);
    qry.ParamByName('qntd_total_vendida').AsInteger := StrToInt(edtAmount.Text);
    qry.ParamByName('preco_prod').AsCurrency := StrToCurr(edtPrice.Text);

    qry.ExecSQL;
    vendas.RefreshMetadata;

  finally


    FreeAndNil(qry);

  end;

end;

//procedure TfrmVenda.btnMinClick(Sender: TObject);
//begin
//  Self.WindowState := TWindowState.wsMinimized;
//end;

//
//rocedure TfrmVenda.btnMaxClick(Sender: TObject);
//begin
//
//  if Self.WindowState = TWindowState.wsNormal then
//  begin
//    Self.WindowState := TWindowState.wsMaximized;
//  end
//  else
//    Self.WindowState := TWindowState.wsNormal;
//
//end;
//
//procedure TfrmVenda.btnCloseClick(Sender: TObject);
//begin
//  Close;
//end;

end.