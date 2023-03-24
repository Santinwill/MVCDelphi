unit UnitModelCliente;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, System.SysUtils,
  UnitEnumerador, UnitControllerConexao, UnitClassFunctionValidarClasse,
  System.Variants, System.TypInfo, System.Rtti, Vcl.Dialogs;

type
  TModelCliente = class
    private
    FNome: string;
    FCpf: string;
    FNasc: string;
    FId: Integer;
    FEnumerador: TEnumerador;
    FAlerta: WideString;

    protected

    public
      property StrId : Integer read FId write FId;

      [TValidador('Nome do Cliente')]
      [TComponente('TDBEditCliente')]
      property StrNome : String read FNome write FNome;

      [TValidador('CPF do Cliente')]
      property StrCpf : String read FCpf write FCpf;

      property StrNasc : String read FNasc write FNasc;
      property enuTipo : TEnumerador read FEnumerador write FEnumerador;
      property widAlerta : WideString read FAlerta write FAlerta;
      //CRUD
      function Persistir : Boolean;
      function Selecionar : TFDQuery;

    published
  end;

implementation

{ TModelCliente }

uses UnitDAOCliente;


function TModelCliente.Persistir: Boolean;
var
  daoCliente : TDAOCliente;
begin
  Result := False;
  Self.widAlerta := '';

  if (Self.enuTipo = tipoInclusao) or (Self.enuTipo = tipoAlteracao) then
  begin
    Self.widAlerta := TValidador.Validar(Self);
  end;

  if Self.widAlerta = '' then
  begin
    daoCliente := TDAOCliente.Create;
    try
      case FEnumerador of
        tipoInclusao:
          result := daoCliente.incluir(Self);
        tipoAlteracao:
          result := daoCliente.alterar(Self);
      end;
    finally
      daoCliente.Free;
    end;
  end;
end;

function TModelCliente.Selecionar: TFDQuery;
var
  daoCliente : TDAOCliente;
begin
  daoCliente := TDAOCliente.Create;
  try
    result := daoCliente.selecionarCliente;
  finally
    daoCliente.Free;
  end;
end;

end.
