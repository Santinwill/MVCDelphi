unit UnitViewCadastroPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ComCtrls;

type
  TFormViewCadastroPessoa = class(TForm)
    DBEditNome: TDBEdit;
    DBEditcpf: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DateTimePickerNasc: TDateTimePicker;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormViewCadastroPessoa: TFormViewCadastroPessoa;

implementation

{$R *.dfm}

end.
