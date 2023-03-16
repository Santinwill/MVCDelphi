unit UnitControllerCliente;

interface

uses UnitModelCliente;

type
  TControllerCliente = class
    private
      FModelCliente: TModelCliente;

    public
      property ModelCliente : TModelCliente read FModelCliente write FModelCliente;

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

end.
