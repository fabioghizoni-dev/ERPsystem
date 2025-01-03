unit uFrameStock;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait;

type
  TframeStock = class(TFrame)
    pnlAddClient: TPanel;
    pnlMargins: TPanel;
    pnlTitle: TPanel;
    pnlLbls: TPanel;
    lblFull: TLabel;
    pnlEdts: TPanel;
    pnlEdtStock: TPanel;
    edtStock: TEdit;
    lblProduct: TLabel;
    lblTitle: TLabel;
    btnVenda: TButton;
    pnlCombo: TPanel;
    combo: TComboBox;
    pnlLbls2: TPanel;
    lblNameProd: TLabel;
    lblIDProd: TLabel;
    pnlEdtNameProd: TPanel;
    Panel3: TPanel;
    edtNameProd: TEdit;
    pnlEdtID: TPanel;
    edtID: TEdit;
    procedure btnVendaClick(Sender: TObject);
    procedure comboChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  uDM, uVenda;

procedure TframeStock.btnVendaClick(Sender: TObject);
begin
  frmVenda.Show;
end;

procedure TframeStock.comboChange(Sender: TObject);
var
  qry:
  TFDQuery;
  produtoId:
  Integer;
  totalEstoque,
  prodEstoque:
  Double;

begin

  if combo.ItemIndex = -1 then
    Exit;

  produtoId := Integer(combo.Items.Objects[combo.ItemIndex]);

  qry := TFDQuery.Create(nil);
  try

    qry.Connection := DM.ConnDbERP;

    if combo.ItemIndex = 0 then
    begin

      qry.SQL.Text := 'SELECT SUM(qntd_estoque) AS total FROM produtos;';

      qry.Open;

      if not qry.IsEmpty then
      begin
        totalEstoque := qry.FieldByName('total').AsFloat;
        edtStock.Text := FormatFloat('###,###,###,###', totalEstoque);
      end;

      FreeAndNil(qry);
      Exit;

    end;

    qry.SQL.Text := 'SELECT qntd_estoque FROM produtos ' +
                    'WHERE id_produto = :produto_id';
    qry.ParamByName('produto_id').AsInteger := produtoId;

    qry.Open;

//     if not TryStrToInt(edtAmount.Text, qntd_estoque) then
//    raise Exception.Create('Estoque inválido!');


    if not qry.IsEmpty then
    begin
      // Pega a quantidade do produto
      prodEstoque := qry.FieldByName('qntd_estoque').AsFloat;
      edtStock.Text := FormatFloat('###,###,###,###', prodEstoque);
    end
    else
    begin
      edtStock.Text := '0';
    end;

  finally
    qry.Free;
  end;
end;

end.

