unit UnitControllerConexao;

interface

uses UnitDAOConexao;

type
  //singleton
  TControllerConexao = class
    private
      Fconexao: TDAOConexao;
      constructor Create;
      destructor Destroy; override;

    public
      property daoConexao : TDAOConexao read Fconexao write Fconexao;

      class function getInstance : TControllerConexao;
  end;
implementation

var
  instanciaBD : TControllerConexao;

{ TControllerConexao }

constructor TControllerConexao.Create;
begin
  inherited Create;

  Fconexao := TDAOConexao.Create;
end;

destructor TControllerConexao.Destroy;
begin
  inherited;

  Fconexao.Free;
end;

class function TControllerConexao.getInstance: TControllerConexao;
begin
  if instanciaBD = nil then //se nao existe objeto instanciado na memoria
    instanciaBD := TControllerConexao.Create; //cria instancia

  Result := instanciaBD; //retorna a instancia
end;

initialization
  instanciaBD := nil;

finalization
  if instanciaBD <> nil then
    instanciaBD.Free;


end.
