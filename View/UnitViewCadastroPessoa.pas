unit UnitViewCadastroPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxDBEdit, cxTextEdit, Vcl.Grids, Vcl.DBGrids;

type
  TFormViewCadastroPessoa = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ButtonSalvar: TButton;
    EditNome: TEdit;
    EditCpf: TEdit;
    DateTimePickerNasc: TDateTimePicker;
    EditIdCliente: TEdit;
    Label4: TLabel;
    DBGrid1: TDBGrid;
    ButtonPesquisar: TButton;
    ButtonAlterar: TButton;
    DataSource: TDataSource;
    MemTable: TFDMemTable;
    procedure ButtonSalvarClick(Sender: TObject);
    procedure ButtonPesquisarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ButtonAlterarClick(Sender: TObject);
    procedure EditCpfExit(Sender: TObject);
  private
    { Private declarations }
    procedure limpaCampos;
    function validarCpf(strCpf: String): String;
  public
    { Public declarations }
  end;

var
  FormViewCadastroPessoa: TFormViewCadastroPessoa;
  qCliente : TFDQuery;

implementation

{$R *.dfm}

uses UnitControllerConexao, UnitModelCliente, UnitEnumerador,
  UnitControllerCliente;

procedure TFormViewCadastroPessoa.ButtonAlterarClick(Sender: TObject);
var
  controllerCliente : TControllerCliente;
begin
  controllerCliente := TControllerCliente.Create;
  try
    controllerCliente.ModelCliente.enuTipo := UnitEnumerador.tipoAlteracao;
    controllerCliente.ModelCliente.StrId := StrToInt(EditIdCliente.text);
    controllerCliente.ModelCliente.StrNome := EditNome.Text;
    controllerCliente.ModelCliente.StrCpf := EditCpf.Text;
    controllerCliente.ModelCliente.StrNasc := DateToStr(DateTimePickerNasc.Date);

    if controllerCliente.Persistir then
    begin
      ShowMessage('Operação realizada com sucesso');
    end
    else
    begin
      ShowMessage('Não foi possivel realizar operação');
    end;
  finally
    controllerCliente.Free;
  end;
  limpaCampos;
  qCliente.Refresh;
  DBGrid1.Refresh;
end;

procedure TFormViewCadastroPessoa.ButtonPesquisarClick(Sender: TObject);
var
  controllerCliente : TControllerCliente;
begin
  qCliente := TFDQuery.Create(nil);
  controllerCliente := TControllerCliente.Create;
  try
    qCliente := controllerCliente.Selecionar;
    qCliente.Active := True;
    DataSource.DataSet := qCliente;
  finally
    controllerCliente.Free;
  end;

end;

procedure TFormViewCadastroPessoa.ButtonSalvarClick(Sender: TObject);
var
  controllerCliente : TControllerCliente;
begin
  controllerCliente := TControllerCliente.Create;
  try
    controllerCliente.ModelCliente.enuTipo := UnitEnumerador.tipoInclusao;
    controllerCliente.ModelCliente.strNome := EditNome.text;
    controllerCliente.ModelCliente.strCpf := EditCpf.text;
    controllerCliente.ModelCliente.strNasc := DatetoStr(DateTimePickerNasc.date);

    if controllerCliente.Persistir then
    begin
      showmessage('Operação Realizada com sucesso');
    end
    else
    begin
      showmessage('Não foi possivel realizar operação');
    end;

  finally
    controllerCliente.Free;
  end;
  limpaCampos;
end;

procedure TFormViewCadastroPessoa.DBGrid1DblClick(Sender: TObject);
begin
  EditIdCliente.Text := inttostr(qCliente.FieldByName('IDCLIENTE').AsInteger) ;
  EditNome.Text := qCliente.FieldByName('NMCLIENTE').AsString;
  EditCpf.Text := qCliente.FieldByName('CPFCLIENTE').AsString;
  DateTimePickerNasc.Date := qCliente.FieldByName('DTCLIENTE').AsDateTime;
end;

procedure TFormViewCadastroPessoa.EditCpfExit(Sender: TObject);
begin
  if trim(EditCpf.Text) <> '' then
  begin
    EditCpf.Text := validarCpf(EditCpf.Text);
  end;

end;

procedure TFormViewCadastroPessoa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qCliente.Free;
end;

procedure TFormViewCadastroPessoa.limpaCampos;
begin
  EditIdCliente.Text := '';
  EditNome.Text := '';
  EditCpf.Text := '';
  DateTimePickerNasc.Date := Date;
end;

function TFormViewCadastroPessoa.validarCpf(strCpf: String): String;
var
  n1, n2, n3 : Integer;
  n4, n5, n6 : Integer;
  n7, n8, n9 : Integer;
  d1, d2 : Integer;
  digitando : string;
  calculando : string;
begin
    if (strCpf[1] = '') or (strCpf[2] = '') or (strCpf[3] = '') or
     (strCpf[4] = '') or (strCpf[5] = '') or (strCpf[6] = '') or
     (strCpf[7] = '') or (strCpf[8] = '') or (strCpf[9] = '') then
  begin
    ShowMessage('CPF inválido');
    EditCpf.Text := '';
    EditCpf.SetFocus;
    Exit;
  end;

  n1 := StrToInt(strCpf[1]);
  n2 := StrToInt(strCpf[2]);
  n3 := StrToInt(strCpf[3]);
  n4 := StrToInt(strCpf[4]);
  n5 := StrToInt(strCpf[5]);
  n6 := StrToInt(strCpf[6]);
  n7 := StrToInt(strCpf[7]);
  n8 := StrToInt(strCpf[8]);
  n9 := StrToInt(strCpf[9]);

  d1 := n9*2 + n8*3 + n7*4 + n6*5 + n5*6 + n4*7 + n3*8 + n2*9 + n1*10;
  d1 := 11-(d1 mod 11);
  if d1>10 then d1:= 0;
    d2 := d1*2 + n9*3 +n8*4 + n7*5 + n6*6 + n5*7 +n4*8 + n3*9 + n2*10 + n1*11;

  d2:= 11 - (d2 mod 11);

  if d2 >= 10 then d2:=0;
    calculando := IntToStr(d1) + IntToStr(d2);

  digitando := strCpf[10] + strCpf[11];

  if calculando <> digitando then
  begin
    Result := '';
    ShowMessage('CPF invalido');
    EditCpf.SetFocus;
  end
  else
  begin
    Result := strCpf;
  end;

end;

end.
