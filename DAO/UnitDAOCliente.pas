unit UnitDAOCliente;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, System.SysUtils,
  vcl.Dialogs, UnitControllerConexao, UnitModelCliente;

type
  TDAOCliente = class
    private

    protected

    public
      function selecionarCliente : TFDQuery;
      function incluir (ModelCliente : TModelCliente): Boolean;
      function alterar (ModelCliente : TModelCliente): Boolean;

    published
  end;

implementation

{ TModelCliente }

function TDAOCliente.alterar(ModelCliente: TModelCliente): Boolean;
var
  Qcliente : TFDQuery;
begin
  try
    Qcliente := TControllerConexao.getInstance.daoConexao.criarQuery;
    try
      Qcliente.SQL.Text := ' SELECT IDCLIENTE,  ' +
                           '        NMCLIENTE,  ' +
                           '        CPFCLIENTE, ' +
                           '        DTCLIENTE   ' +
                           '   FROM CLIENTE     ' +
                           '  WHERE IDCLIENTE = :IDCLIENTE ';
      Qcliente.ParamByName('IDCLIENTE').AsInteger := ModelCliente.StrId;
      Qcliente.Open;
      Qcliente.Edit;
      Qcliente.FieldByName('NMCLIENTE').AsString := ModelCliente.StrNome;
      Qcliente.FieldByName('CPFCLIENTE').AsString := ModelCliente.StrCpf;
      Qcliente.FieldByName('DTCLIENTE').AsDateTime := StrToDate(ModelCliente.StrNasc);
      Qcliente.Post;
    finally
      Qcliente.Free;
    end;
    Result := True;
  except
    Result := False;
  end;
end;

function TDAOCliente.incluir(ModelCliente: TModelCliente): Boolean;
var
  Qcliente : TFDQuery;
begin
  try
    Qcliente := TControllerConexao.getInstance.daoConexao.criarQuery;
    try
      Qcliente.SQL.Text := ' SELECT IDCLIENTE,  ' +
                           '        NMCLIENTE,  ' +
                           '        CPFCLIENTE, ' +
                           '        DTCLIENTE   ' +
                           '   FROM CLIENTE     ' ;
      Qcliente.Open;
      Qcliente.Append;
      Qcliente.FieldByName('NMCLIENTE').AsString := ModelCliente.StrNome;
      Qcliente.FieldByName('CPFCLIENTE').AsString := ModelCliente.StrCpf;
      Qcliente.FieldByName('DTCLIENTE').AsDateTime := StrToDate(ModelCliente.StrNasc);
      Qcliente.Post;
    finally
      Qcliente.Free;
    end;
    Result := True;
  except
    Result := False;
  end;
end;

function TDAOCliente.selecionarCliente: TFDQuery;
var
  Qcliente : TFDQuery;
begin
  Qcliente := TControllerConexao.getInstance.daoConexao.criarQuery;
  Qcliente.SQL.Text := ' SELECT IDCLIENTE,  ' +
                       '        NMCLIENTE,  ' +
                       '        CPFCLIENTE, ' +
                       '        DTCLIENTE   ' +
                       '   FROM CLIENTE     ' ;
  Result := Qcliente;
end;

end.
