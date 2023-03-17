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
  private
    { Private declarations }
    procedure limpaCampos;
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
  cliente : TModelCliente;
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
