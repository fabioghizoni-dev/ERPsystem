unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    DriverPG: TFDPhysPgDriverLink;
    ConnDbERP: TFDConnection;
    clientes: TFDTable;
    endereco: TFDTable;
    produtos: TFDTable;
    dtSrc: TDataSource;
    dtSrc2: TDataSource;
    dtSrc3: TDataSource;
    endereconome_cliente_identify: TIntegerField;
    enderecopais_cliente: TWideStringField;
    enderecoestado_cliente: TWideStringField;
    enderecocidade_cliente: TWideStringField;
    enderecobairro_cliente: TWideStringField;
    produtosid_produto: TIntegerField;
    produtosnome_produto: TWideStringField;
    produtospreco_unitario: TCurrencyField;
    produtosqntd_estoque: TIntegerField;
    clientesid_cliente: TIntegerField;
    clientesnome_cliente: TWideStringField;
    clientescpf_cliente: TWideStringField;
    clientescelular_cliente: TWideStringField;
    clientesdata_adicionado: TDateField;
    procedure DataModuleCreate(Sender: TObject);
    procedure produtosBeforeApplyUpdates(DataSet: TFDDataSet);
    procedure produtosAfterApplyUpdates(DataSet: TFDDataSet; AErrors: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses
  Vcl.Forms, Vcl.Dialogs, dlgConfirm, uMain;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
var
  Path: String;
begin

  try

    DriverPG.VendorLib := ExtractFilePath(Application.ExeName) + '\dlls32\libpq.dll';

    if ConnDbERP.Connected = False then
    begin

      ConnDbERP.Connected := True;

    end
    else
    begin

      Path := 'C:\Users\User\Documents\Embarcadero\Studio\Projects\ERP-main\VCL\Src\32px\Online_32px.png';
      frmMain.imgConn.Picture.LoadFromFile(Path);

    end;

    if clientes.Active = False then
    begin
      clientes.Connection := ConnDbERP;
      clientes.Active := True;
    end;


    if endereco.Active = False then
    begin
      endereco.Connection := ConnDbERP;
      endereco.Active := True;
    end;

    if produtos.Active = False then
    begin
      produtos.Connection := ConnDbERP;
      produtos.Active := True;
    end;

  except

    on E: Exception do
    begin
      Exception.Create('Falha na Conex�o com o Banco!');
      Path := 'C:\Users\User\Documents\Embarcadero\Studio\Projects\ERP-main\VCL\Src\32px\Offline_32px.png';
      frmMain.imgConn.Picture.LoadFromFile(Path);
    end;

  end;

end;

procedure TDM.produtosAfterApplyUpdates(DataSet: TFDDataSet; AErrors: Integer);
var
  ds: TDataSet;
  str: string;
begin

  ds := frmMain.dbGrid2.DataSource.DataSet;
  str := 'Deseja mesmo deletar ' + ds.FieldByName('nome_produto').AsString;

  if dlgConfirmDelete.Visible = True then
  begin

    dlgConfirmDelete.Caption := str;

  end;

  frmMain.dbGrid2.Update;
  frmMain.dbGrid2.Refresh;

end;

procedure TDM.produtosBeforeApplyUpdates(DataSet: TFDDataSet);
var
  ds: TDataSet;
  str: string;
begin

  ds := frmMain.dbGrid2.DataSource.DataSet;
  str := 'Deseja mesmo deletar ' + ds.FieldByName('nome_produto').AsString;

  if dlgConfirmDelete.Visible = True then
  begin

    dlgConfirmDelete.Caption := str;

  end;

  frmMain.dbGrid2.Update;
  frmMain.dbGrid2.Refresh;

end;

end.

