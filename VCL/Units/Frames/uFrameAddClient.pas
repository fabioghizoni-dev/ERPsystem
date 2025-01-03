unit uFrameAddClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TframeAddClient = class(TFrame)
    pnlAddClient: TPanel;
    pnlMargins: TPanel;
    pnlLbls: TPanel;
    lblPhone: TLabel;
    lblCPF: TLabel;
    lblName: TLabel;
    pnlEdts: TPanel;
    edtName: TEdit;
    maskCPF: TMaskEdit;
    pnlMaskCPF: TPanel;
    pnlPhone: TPanel;
    maskPhone: TMaskEdit;
    pnlLbls2: TPanel;
    pnlEdts2: TPanel;
    lblState: TLabel;
    lblCity: TLabel;
    lblDistrict: TLabel;
    edtState: TEdit;
    edtCity: TEdit;
    pnlEdtCity: TPanel;
    edtDistrict: TEdit;
    pnlEdtDistrict: TPanel;
    pnlName: TPanel;
    pnlEdtState: TPanel;
    pnlTitle: TPanel;
    btnAdd: TButton;
    pnlLbls4: TPanel;
    pnl5: TPanel;
    lblMemo: TLabel;
    lblTitle: TLabel;
    check: TCheckBox;
    check2: TCheckBox;
    pnlBtns: TPanel;
    btnExclude: TButton;
    checkPadrao: TCheckBox;
    procedure btnAddClick(Sender: TObject);
    procedure checkClick(Sender: TObject);
    procedure check2Click(Sender: TObject);
    procedure btnExcludeClick(Sender: TObject);
    procedure maskCPFExit(Sender: TObject);
    procedure checkPadraoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  System.Math, uDM, uMain, dlgConfirm;

function IsValidCPF(pCPF: string): Boolean;
var
  v: array [0 .. 1] of Word;
  cpf: array [0 .. 10] of Byte;
  I: Byte;
begin

  Result := False;

  { Verificando se tem 11 caracteres }
  if Length(pCPF) <> 11 then
  begin
  Exit;
  end;

  { Conferindo se todos d�gitos s�o iguais }
  if pCPF = StringOfChar('0', 11) then
  Exit;

  if pCPF = StringOfChar('1', 11) then
  Exit;

  if pCPF = StringOfChar('2', 11) then
  Exit;

  if pCPF = StringOfChar('3', 11) then
  Exit;

  if pCPF = StringOfChar('4', 11) then
  Exit;

  if pCPF = StringOfChar('5', 11) then
  Exit;

  if pCPF = StringOfChar('6', 11) then
  Exit;

  if pCPF = StringOfChar('7', 11) then
  Exit;

  if pCPF = StringOfChar('8', 11) then
  Exit;

  if pCPF = StringOfChar('9', 11) then
  Exit;

  try

    for I := 1 to 11 do
    cpf[I - 1] := StrToInt(pCPF[I]);
    // Nota: Calcula o primeiro d�gito de verifica��o.
    v[0] := 10 * cpf[0] + 9 * cpf[1] + 8 * cpf[2];
    v[0] := v[0] + 7 * cpf[3] + 6 * cpf[4] + 5 * cpf[5];
    v[0] := v[0] + 4 * cpf[6] + 3 * cpf[7] + 2 * cpf[8];
    v[0] := 11 - v[0] mod 11;
    v[0] := IfThen(v[0] >= 10, 0, v[0]);
    // Nota: Calcula o segundo d�gito de verifica��o.
    v[1] := 11 * cpf[0] + 10 * cpf[1] + 9 * cpf[2];
    v[1] := v[1] + 8 * cpf[3] + 7 * cpf[4] + 6 * cpf[5];
    v[1] := v[1] + 5 * cpf[6] + 4 * cpf[7] + 3 * cpf[8];
    v[1] := v[1] + 2 * v[0];
    v[1] := 11 - v[1] mod 11;
    v[1] := IfThen(v[1] >= 10, 0, v[1]);
    // Nota: Verdadeiro se os d�gitos de verifica��o s�o os esperados.
    Result := ((v[0] = cpf[9]) and (v[1] = cpf[10]));

    except
    on E: Exception do
    Result := False;

  end;
end;

procedure TframeAddClient.btnAddClick(Sender: TObject);
var
  qry: TFDQuery;
  id_cliente: Integer;
  nome_cliente,
  cpf_cliente,
  celular_cliente,
  estado_cliente,
  cidade_cliente,
  bairro_cliente:
  String;

begin

  qry := TFDQuery.Create(nil);
  qry.Connection := DM.ConnDbERP;
  nome_cliente := edtName.Text;
  cpf_cliente := maskCPF.Text;
  celular_cliente := maskPhone.Text;
  estado_cliente := edtState.Text;
  cidade_cliente := edtCity.Text;
  bairro_cliente := edtDistrict.Text;

  try

    if frmMain.frameAddClientMain.Visible = True then
    begin

      if not ((maskCPF.Text = '   .   .   -  ') and (maskPhone.Text = '(  )     -    ')) then
      begin

        qry.SQL.Text :=
        'INSERT INTO clientes' +
        '(id_cliente, nome_cliente, cpf_cliente, celular_cliente, data_adicionado) ' +
        'VALUES(nextval(''clientes_id_cliente_seq''::regclass), '':pNome'', '':pCPF'', '':pCelular'', '':pData'');';

//        ShowMessage('Par�metros definidos: ' + sLineBreak  +
//                    ' Nome: ' + nome_cliente + sLineBreak +
//                    ' CPF: ' + cpf_cliente + sLineBreak +
//                    ' Celular: ' + celular_cliente + sLineBreak +
//                    ' Estado: ' + estado_cliente + sLineBreak +
//                    ' Cidade: ' + cidade_cliente + sLineBreak +
//                    ' Bairro: ' + bairro_cliente);

        qry.ParamByName('pNome').AsString := nome_cliente;
        qry.ParamByName('pCPF').AsString := cpf_cliente;
        qry.ParamByName('pCelular').AsString := celular_cliente;
        qry.ParamByName('pData').AsDate := Now;

        qry.ExecSQL;

        DM.clientes.RefreshMetadata;
        frmMain.dbGrid.Update;
        frmMain.dbGrid.Refresh;

      end;

    end;

  finally

    FreeAndNil(qry);

  end;

end;

procedure TframeAddClient.maskCPFExit(Sender: TObject);
var
  rawCPF:
  String;
begin

  rawCPF := StringReplace(maskCPF.Text, '.', '', [rfReplaceAll]);
  rawCPF := StringReplace(rawCPF, '-', '', [rfReplaceAll]);

  if IsValidCPF(rawCPF) = True then
  begin

    ShowMessage('Campo CPF V�lido!');

  end
  else
  begin

    ShowMessage('Campo CPF Inv�lido!');

  end;

end;

procedure TframeAddClient.btnExcludeClick(Sender: TObject);
var
  ds: TDataSet;
begin

  ds := frmMain.dbGrid.DataSource.DataSet;

  if not ds.IsEmpty then
  begin
    ds.Delete;
    ShowMessage('Cliente exclu�do com sucesso.');
  end;

end;

procedure TframeAddClient.checkClick(Sender: TObject);
begin

  if check.Checked = True then
  begin

    maskCPF.EditMask := 'AAA.AAA.AAA-AA;1;_';

    if check2.Checked = True then
    begin
      check2.Checked := False;
    end;

  end
  else if check.Checked = False then
  begin

    if check2.Checked = False then
    begin
      check2.Checked := True;
    end;

  end;

end;

procedure TframeAddClient.check2Click(Sender: TObject);
begin

  if check2.Checked = True then
  begin

    maskCPF.EditMask := 'AA.AAA.AAA/AAAA-AA;1;_';

    if check.Checked = True then
    begin
      check.Checked := False;
    end;

  end
  else if check2.Checked = False then
  begin

    if check.Checked = False then
    begin
      check.Checked := True;
    end;

  end;

end;

procedure TframeAddClient.checkPadraoClick(Sender: TObject);
begin

  if checkPadrao.Checked then
  begin
    edtName.Text := 'Fabio';
    maskCPF.Text := '101.462.419-32';
    maskPhone.Text := '(43)99828-0078';
    edtState.Text := 'Paran�';
    edtCity.Text := 'Manoel Ribas';
    edtDistrict.Text := 'Centro';
  end
  else
  begin
    edtName.Text := '';
    maskCPF.Text := '';
    maskPhone.Text := '';
    edtState.Text := '';
    edtCity.Text := '';
    edtDistrict.Text := '';
  end;

end;

end.

