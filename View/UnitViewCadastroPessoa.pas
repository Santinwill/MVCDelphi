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
    ButtonLimparCampos: TButton;
    procedure ButtonSalvarClick(Sender: TObject);
    procedure ButtonPesquisarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ButtonAlterarClick(Sender: TObject);
    procedure EditCpfExit(Sender: TObject);
    procedure ButtonLimparCamposClick(Sender: TObject);
  private
    { Private declarations }
    procedure limpaCampos;
   // function validarCpf(strCpf: String): String;
  public
    { Public declarations }
  end;

var
  FormViewCadastroPessoa: TFormViewCadastroPessoa;
  qCliente : TFDQuery;

implementation

{$R *.dfm}

uses UnitControllerConexao, UnitModelCliente, UnitEnumerador,
  UnitControllerCliente, UnitClassFunctionValidarCpf;

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

procedure TFormViewCadastroPessoa.ButtonLimparCamposClick(Sender: TObject);
begin
 limpaCampos;
end;

procedure TFormViewCadastroPessoa.ButtonPesquisarClick(Sender: TObject);
var
  controllerCliente : TControllerCliente;
begin
  qCliente := TFDQuery.Create(FormViewCadastroPessoa);
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
  i: Integer;
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
      limpaCampos;
    end
    else
    begin
      if controllerCliente.ModelCliente.widAlerta = '' then
      begin
        showmessage('Não foi possivel realizar operação');
      end
      else
      begin
        for i := 0 to ComponentCount -1 do
          begin
            if ((Components[i] is TLabel)) and ((Components[i] as TLabel).Tag = 1) then
            begin
              (Components[i] as TLabel).Font.Color := $00bbbbff;
            end
            else if ((Components[i] is TEdit)) and ((Components[i] as TEdit).Tag = 1) then
            begin
              (Components[i] as TEdit).Color := $00bbbbff;
            end;
          end;

          ShowMessage(controllerCliente.ModelCliente.widAlerta);

      end;
    end;

  finally
    controllerCliente.Free;
  end;
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
    EditCpf.Text := TValidarCpf.validarCpf(EditCpf.Text);
    if EditCpf.Text = '' then
    begin
      ShowMessage('CPF invalido');
      EditCpf.SetFocus;
    end;
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

end.
