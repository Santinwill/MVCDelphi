unit UnitModelCliente;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, System.SysUtils,
  UnitControllerConexao;

type
  TModelCliente = class
    private
    FNome: string;
    FCpf: string;
    FNasc: string;
    FId: Integer;

    protected

    public
      property StrId : Integer read FId write FId;
      property StrNome : String read FNome write FNome;
      property StrCpf : String read FCpf write FCpf;
      property StrNasc : String read FNasc write FNasc;

      //CRUD


    published
  end;

implementation

end.
