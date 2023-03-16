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
  cxCalendar, cxDBEdit, cxTextEdit;

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
    procedure ButtonSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormViewCadastroPessoa: TFormViewCadastroPessoa;

implementation

{$R *.dfm}

uses UnitControllerConexao, UnitModelCliente;

procedure TFormViewCadastroPessoa.ButtonSalvarClick(Sender: TObject);
var
  cliente : TModelCliente;
begin

//  if (EditNome.Text <> '') and (EditCpf.Text <> '')
//  and (DateTimePickerNasc.Date <= Date) then
    cliente := TModelCliente.Create;
    try
      cliente.StrNome := EditNome.Text;
      cliente.StrCpf := EditCpf.Text;
      cliente.StrNasc := DateToStr(DateTimePickerNasc.Date);
      cliente.StrId := StrToInt(EditIdCliente.Text);
      if cliente.persistir then
      begin
        ShowMessage('Operação realizada com sucesso!');
      end
      else
      begin
         showMessage('Campo Invalido');
      end;

    finally
       cliente.Free;
    end;

  EditNome.Text := '';
  EditCpf.Text := '';
  DateTimePickerNasc.Date := Date;
end;

end.
