unit uFrameAddProduct;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants,
  System.Classes, System.SysUtils, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask,
  Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TframeAddProduct = class(TFrame)
    pnlAddClient: TPanel;
    pnlMargins: TPanel;
    pnlTitle: TPanel;
    pnlLbls: TPanel;
    pnlEdts: TPanel;
    lblProduct: TLabel;
    lblAmount: TLabel;
    edtProduct: TEdit;
    pnlEdtProduct: TPanel;
    pnlAmount: TPanel;
    edtAmount: TEdit;
    pnlLbls2: TPanel;
    lblProdID: TLabel;
    pnlEdts2: TPanel;
    pnlCod: TPanel;
    edtCod: TEdit;
    pnlPrice: TPanel;
    lblPrice: TLabel;
    edtPrice: TEdit;
    btnAddProduct: TButton;
    lblTitle: TLabel;
    pnlBtns: TPanel;
    btnExclude: TButton;
    pnl: TPanel;
    pnlID: TPanel;
    edtDate: TEdit;
    pnl2: TPanel;
    lblDate: TLabel;
    procedure btnAddProductClick(Sender: TObject);
    procedure btnExcludeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  uDM, uMain, dlgConfirm;

{$R *.dfm}


{ TframeAddProduct }

procedure TframeAddProduct.btnAddProductClick(Sender: TObject);
var
  qry: TFDQuery;
  nome_produto: String;
  preco_unitario: Real;
  qntd_estoque: Integer;
  data_lanca: TDate;
begin

  if Trim(edtPrice.Text) = '' then
    raise Exception.Create('O pre�o do produto deve ser informado.');

  if not TryStrToInt(edtAmount.Text, qntd_estoque) then
    raise Exception.Create('Estoque inv�lido!');

  qry := TFDQuery.Create(nil);
  qry.Connection := DM.ConnDbERP;
  data_lanca := StrToDate(edtDate.Text);
  nome_produto := edtProduct.Text;
  preco_unitario := StrToCurr(edtPrice.Text);
  qntd_estoque := StrToInt(edtAmount.Text);

  try

    if frmMain.frameAddProductMain.Visible = True then
    begin

      qry.SQL.Text := 'SELECT id_produto FROM produtos limit 1;';
      qry.Open;

        if qry.IsEmpty then
        begin

          qry.Close;
          qry.SQL.Text := 'ALTER SEQUENCE produtos_id_produto_seq RESTART WITH 1;';
          qry.ExecSQL;

        end;

      qry.Close;
      qry.SQL.Text :=

      'INSERT INTO produtos' +
      '(id_produto, nome_produto, preco_unitario, qntd_estoque)' + sLineBreak +
      'VALUES(nextval(''produtos_id_produto_seq''::regclass), '', 0, 0);';

      qry.ParamByName('nome_produto').AsString := nome_produto;
      qry.ParamByName('preco_unitario').AsCurrency := preco_unitario;
      qry.ParamByName('qntd_estoque').AsInteger := qntd_estoque;

      qry.ExecSQL;

      DM.produtos.RefreshMetadata;
      frmMain.dbGrid2.Update;
      frmMain.dbGrid2.Refresh;

    end;

  finally

    FreeAndNil(qry);

  end;


end;

procedure TframeAddProduct.btnExcludeClick(Sender: TObject);
var
  dlg: TdlgConfirmDelete;
  ds: TDataSet;
begin

  if frmMain.frameAddProductMain.Visible = True then
  begin

    ds := frmMain.dbGrid2.DataSource.DataSet;
    dlg := TdlgConfirmDelete.Create(Self);

    dlg.Caption := 'Deseja mesmo deletar ' + ds.FieldByName('nome_produto').AsString;
    dlg.Show;

  end;

end;

end.
