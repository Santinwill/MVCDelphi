unit UnitDAODriverLink;

interface

uses
  FireDAC.Phys.PGDef, FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.ODBCDef, FireDAC.Phys.ODBCBase, FireDAC.Phys.ODBC;

type
  TDAODriverLink = class
  private
    FPgDriverLink : TFDPhysPgDriverLink;
  public
    function getDriverLink : TFDPhysPgDriverLink;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TDAODriverLink }

constructor TDAODriverLink.Create;
begin
  inherited Create;

  FPgDriverLink := TFDPhysPgDriverLink.Create(nil);
  FPgDriverLink.VendorLib := '.\libpq.dll';
end;

destructor TDAODriverLink.Destroy;
begin
  inherited;
end;

function TDAODriverLink.getDriverLink: TFDPhysPgDriverLink;
begin
    Result := FPgDriverLink;
end;

end.
