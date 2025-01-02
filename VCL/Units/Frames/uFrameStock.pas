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
    pnlLbls2: TPanel;
    lblProduct: TLabel;
    pnlEdts2: TPanel;
    lblTitle: TLabel;
    pnlEdtName: TPanel;
    edtNameProduct: TEdit;
    btnVenda: TButton;
    pnlClient: TPanel;
    edtNameClient: TEdit;
    lblNameClient: TLabel;
    procedure btnVendaClick(Sender: TObject);
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

end.

