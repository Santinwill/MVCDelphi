program mvc;

uses
  Vcl.Forms,
  UnitViewTelaPrincipal in 'View\UnitViewTelaPrincipal.pas' {FormViewTelaPrincipal},
  UnitViewCadastroPessoa in 'View\UnitViewCadastroPessoa.pas' {FormViewCadastroPessoa},
  UnitControllerConexao in 'Controller\UnitControllerConexao.pas',
  UnitDAOConexao in 'DAO\UnitDAOConexao.pas',
  UnitDAODriverLink in 'DAO\UnitDAODriverLink.pas',
  UnitControllerDriverLink in 'Controller\UnitControllerDriverLink.pas',
  UnitModelCliente in 'Model\UnitModelCliente.pas',
  UnitDAOCliente in 'DAO\UnitDAOCliente.pas',
  UnitControllerCliente in 'Controller\UnitControllerCliente.pas',
  UnitEnumerador in 'Model\UnitEnumerador.pas',
  UnitClassFunctionValidarClasse in 'ClassFunction\UnitClassFunctionValidarClasse.pas',
  UnitClassFunctionValidarCpf in 'ClassFunction\UnitClassFunctionValidarCpf.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormViewTelaPrincipal, FormViewTelaPrincipal);
  Application.Run;
end.
