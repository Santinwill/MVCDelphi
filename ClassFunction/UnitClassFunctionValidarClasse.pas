unit UnitClassFunctionValidarClasse;

interface

uses System.Variants, System.TypInfo, System.Rtti, Vcl.Dialogs, System.SysUtils;

type
  TValidador = class(TCustomAttribute)
    private
    FDescricao: string;

    public
      constructor Create(const Descricao : string);
      property Descricao : string read FDescricao;

      class function Validar(Objeto: TObject): WideString;
  end;

implementation

{ TValidador }

constructor TValidador.Create(const Descricao: string);
begin
 FDescricao := Descricao;
end;

class function TValidador.Validar(Objeto: TObject): WideString;
var
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Propriedade: TRttiProperty;
  Atributo: TCustomAttribute;
  widAlerta: WideString;
  Valor: Variant;
begin
  Contexto := TRttiContext.Create;
  //Obtem as informações de Rtti da classe
  Tipo := Contexto.GetType(Objeto.ClassInfo);
  //loop de propriedades da Tcliente
  widAlerta := '';
  for Propriedade in Tipo.GetProperties do
  begin
    //loop nos atributos da propriedade
    for Atributo in Propriedade.GetAttributes do
    begin
      //atributo é do tipo descricao
      if Atributo is TValidador then
      begin
        Valor := Propriedade.GetValue(Objeto).AsVariant;
        if not (VarToStr(Valor) <> EmptyStr) and (VarToStr(Valor) <> '0') then
        begin
          //exibe a mensagem com a descreicao que definimos para a propriedade
          if widAlerta = '' then                    //#13#10 quebra de linha
            widAlerta := 'valor nao preenchido: ' + #13#10;

          widAlerta := widAlerta + (Atributo as TValidador).Descricao + #13#10;
        end;

      end;

    end;

  end;
  Result := widAlerta;
end;

end.
