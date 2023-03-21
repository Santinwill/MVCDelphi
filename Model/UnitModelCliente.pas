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

      //=================================
      [TValidador('Nome do Cliente')]
      [TComponente('TDBEditCliente')]
      property StrNome : String read FNome write FNome;
      //=================================

      //=================================
      [TValidador('CPF do Cliente')]
      property StrCpf : String read FCpf write FCpf;
      //=================================

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
  Result := False;
  Self.widAlerta := '';

  if (Self.enuTipo = tipoInclusao) or (Self.enuTipo = tipoAlteracao) then
  begin
    ValidarDados;
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

procedure TModelCliente.ValidarDados;
var
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Propriedade: TRttiProperty;
  Atributo: TCustomAttribute;
begin
  Contexto := TRttiContext.Create;
  //Obtem as informações de Rtti da classe Tcliente
  Tipo := Contexto.GetType(TModelCliente.ClassInfo);
  //loop de propriedades da Tcliente
  Self.widAlerta := '';
  for Propriedade in Tipo.GetProperties do
  begin
    //loop nos atributos da propriedade
    for Atributo in Propriedade.GetAttributes do
    begin
      //atributo é do tipo descricao
      if Atributo is TValidador then
      begin
        //chama o metodo de validacao do proprio atributo
        if not TValidador(Atributo).ValidarValor(Propriedade, Self) then
        begin
          //exibe a mensagem com a descreicao que definimos para a propriedade
//          ShowMessage('Valor nao preenchido: ' + (Atributo as TValidador).Descricao);
//          Abort;
          if Self.widAlerta = '' then                    //#13#10 quebra de linha

            Self.widAlerta := 'valor nao preenchido: ' + #13#10;

          Self.widAlerta := Self.widAlerta + (Atributo as TValidador).Descricao + #13#10;


        end;

      end;

    end;

  end;


end;

{ TValidador }

constructor TValidador.Create(const Descricao: string);
begin
  FDescricao := Descricao;
end;

function TValidador.ValidarValor(Propriedade: TRttiProperty;
  Objeto: TObject): Boolean;
var
  Valor: Variant;
begin
  //obtem o valor da propriedade
  Valor := Propriedade.GetValue(Objeto).AsVariant;
  //valida o valor, exigindo que ele seja diferente de 0 e diferente de vazio
  Result := (VarToStr(Valor) <> EmptyStr) and (VarToStr(Valor) <> '0');
end;

end.
