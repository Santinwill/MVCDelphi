unit UnitViewTelaPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TFormViewTelaPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Cadastro2: TMenuItem;
    procedure Cadastro2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormViewTelaPrincipal: TFormViewTelaPrincipal;

implementation

{$R *.dfm}

uses UnitViewCadastroPessoa, UnitControllerConexao, UnitControllerDriverLink;

procedure TFormViewTelaPrincipal.Cadastro2Click(Sender: TObject);
var
  form: TFormViewCadastroPessoa;
begin
  form := TFormViewCadastroPessoa.Create(Self);
  form.ShowModal;
  form.Free;
end;

procedure TFormViewTelaPrincipal.FormCreate(Sender: TObject);
begin
  TControllerDriverLink.getInstanceDriverLink.daoDriverLink.getDriverLink;
  TControllerConexao.getInstance.daoConexao.getConexao.Connected := True;

  if TControllerConexao.getInstance.daoConexao.getConexao.Connected then
    ShowMessage('Conectado ao bd');

end;

end.
