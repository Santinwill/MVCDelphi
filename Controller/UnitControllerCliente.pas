unit UnitControllerCliente;

interface

uses UnitModelCliente, System.SysUtils ,FireDAC.Comp.Client;

type
  TControllerCliente = class
    private
      FModelCliente: TModelCliente;

    public
      property ModelCliente : TModelCliente read FModelCliente write FModelCliente;

      function Persistir : Boolean;
      function Selecionar : TFDQuery;

      constructor Create;
      destructor Destroy; override;
  end;

implementation



{ TControllerCliente }

constructor TControllerCliente.Create;
begin
  FModelCliente := TModelCliente.Create;
  inherited Create;
end;

destructor TControllerCliente.Destroy;
begin
  FModelCliente.Free;
  inherited;
end;

function TControllerCliente.Persistir: Boolean;
begin
  result := FModelCliente.Persistir;
end;

function TControllerCliente.Selecionar: TFDQuery;
begin
  result := FModelCliente.Selecionar;
end;

end.
