unit dlgConfirm;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.DB;

type
  TdlgConfirmDelete = class(TForm)
    pnl: TPanel;
    btnCancel: TButton;
    btnConfirm: TButton;
    lbl: TLabel;
    procedure btnConfirmClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dlgConfirmDelete: TdlgConfirmDelete;

implementation

uses
  uMain;

{$R *.dfm}

procedure TdlgConfirmDelete.btnConfirmClick(Sender: TObject);
var
  ds: TDataSet;
begin

  try

    ds := frmMain.dbGrid2.DataSource.DataSet;

    if not ds.IsEmpty then
    begin

      ds.Delete;

    end;

  finally

    frmMain.dbGrid2.Update;
    frmMain.dbGrid2.Refresh;
    //Close;

  end;

end;

end.
