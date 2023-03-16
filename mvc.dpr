program mvc;

uses
  Vcl.Forms,
  UnitViewTelaPrincipal in 'View\UnitViewTelaPrincipal.pas' {FormViewTelaPrincipal},
  UnitViewCadastroPessoa in 'View\UnitViewCadastroPessoa.pas' {FormViewCadastroPessoa},
  UnitControllerConexao in 'Controller\UnitControllerConexao.pas',
  UnitDAOConexao in 'DAO\UnitDAOConexao.pas',
  UnitDAODriverLink in 'DAO\UnitDAODriverLink.pas',
  UnitControllerDriverLink in 'Controller\UnitControllerDriverLink.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormViewTelaPrincipal, FormViewTelaPrincipal);
  Application.CreateForm(TFormViewCadastroPessoa, FormViewCadastroPessoa);
  Application.Run;
end.