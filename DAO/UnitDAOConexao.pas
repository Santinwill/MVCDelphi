unit UnitDAOConexao;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client;

type
  TDAOConexao = class
    private
      FConexao : TFDConnection;
    public
      function getConexao : TFDConnection;

      constructor Create;
      destructor Destroy; override;
  end;

implementation

{ TDAOConexao }

constructor TDAOConexao.Create;
begin
  inherited Create;

  FConexao := TFDConnection.Create(nil);
  FConexao.Params.DriverID := 'PG';
  FConexao.Params.Database := 'mvc';
  FConexao.Params.UserName := 'postgres';
  FConexao.Params.Password := 'postgres';
 // FConexao.Params.add := 'localhost';
  FConexao.LoginPrompt := false;
end;

destructor TDAOConexao.Destroy;
begin
  inherited;
  FConexao.Free;
end;

function TDAOConexao.getConexao: TFDConnection;
begin
  Result := FConexao;
end;

end.
