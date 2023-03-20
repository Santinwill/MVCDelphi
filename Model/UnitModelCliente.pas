unit UnitModelCliente;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, System.SysUtils,
  UnitEnumerador, UnitControllerConexao,
  System.Variants, System.TypInfo, System.Rtti, Vcl.Dialogs;

type
  TValidador = class(TCustomAttribute)
    private
    FDescricao: string;

    public
      constructor Create(const Descricao : string);
      property Descricao : string read FDescricao;

      function ValidarValor(Propriedade: TRttiProperty; Objeto: TObject): Boolean;
  end;

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
      property StrNome : String read FNome write FNome;

      [TValidador('CPF do Cliente')]
      property StrCpf : String read FCpf write FCpf;

      property StrNasc : String read FNasc write FNasc;
      property enuTipo : TEnumerador read FEnumerador write FEnumerador;
      property widAlerta : WideString read FAlerta write FAlerta;
      //CRUD
      function Persistir : Boolean;
      function Selecionar : TFDQuery;
      procedure ValidarDados;

    published
  end;

implementation

{ TModelCliente }

uses UnitDAOCliente;


function TModelCliente.Persistir: Boolean;
var
  daoCliente : TDAOCliente;
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

procedure TModelCliente.ValidarDados;
var
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Propriedade: TRttiProperty;
  Atributo: TCustomAttribute;
begin
  contexto := TRttiContext.Create;
  //Obtem as informações de Rtti da classe Tcliente
  Tipo := Contexto.GetType(TModelCliente.ClassInfo);
  //loop de propriedades da Tcliente
  Self.widAlerta := '';


end;

{ TValidador }

constructor TValidador.Create(const Descricao: string);
begin

end;

function TValidador.ValidarValor(Propriedade: TRttiProperty;
  Objeto: TObject): Boolean;
begin

end;

end.
