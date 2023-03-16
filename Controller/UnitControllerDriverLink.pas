unit UnitControllerDriverLink;

interface

uses UnitDAODriverLink;

type
  TControllerDriverLink = class
    private
      FDriverLink : TDAODriverLink;

      constructor Create;
      destructor Destroy; override;

    public
      property daoDriverLink : TDAODriverLink read FDriverLink write FDriverLink;

      class function getInstanceDriverLink : TControllerDriverLink;

  end;

implementation

var
  instanciaDL : TControllerDriverLink;

{ TControllerDriverLink }

constructor TControllerDriverLink.Create;
begin
  inherited Create;

  FDriverLink := TDAODriverLink.Create;
end;

destructor TControllerDriverLink.Destroy;
begin
  inherited;

  FDriverLink.Free;
end;

class function TControllerDriverLink.getInstanceDriverLink: TControllerDriverLink;
begin
  if instanciaDL = nil then
    instanciaDL := TControllerDriverLink.Create;

  Result := instanciaDL;
end;

initialization
  instanciaDL := nil;

finalization
  if instanciaDL <> nil then
    instanciaDL.Free;

end.
