unit UnitClassFunctionValidarCpf;

interface

uses System.SysUtils;

type
  TValidarCpf = class
    public
      class function validarCpf(strCpf: string): string;

    end;

implementation

{ TValidarCpf }

class function TValidarCpf.validarCpf(strCpf: string): string;
var
  n1, n2, n3 : Integer;
  n4, n5, n6 : Integer;
  n7, n8, n9 : Integer;
  d1, d2 : Integer;
  digitando : string;
  calculando : string;
begin
    if (strCpf[1] = '') or (strCpf[2] = '') or (strCpf[3] = '') or
     (strCpf[4] = '') or (strCpf[5] = '') or (strCpf[6] = '') or
     (strCpf[7] = '') or (strCpf[8] = '') or (strCpf[9] = '') then
    begin
      Result := '';
      Exit;
    end;

  n1 := StrToInt(strCpf[1]);
  n2 := StrToInt(strCpf[2]);
  n3 := StrToInt(strCpf[3]);
  n4 := StrToInt(strCpf[4]);
  n5 := StrToInt(strCpf[5]);
  n6 := StrToInt(strCpf[6]);
  n7 := StrToInt(strCpf[7]);
  n8 := StrToInt(strCpf[8]);
  n9 := StrToInt(strCpf[9]);

  d1 := n9*2 + n8*3 + n7*4 + n6*5 + n5*6 + n4*7 + n3*8 + n2*9 + n1*10;
  d1 := 11-(d1 mod 11);
  if d1>10 then d1:= 0;
    d2 := d1*2 + n9*3 +n8*4 + n7*5 + n6*6 + n5*7 +n4*8 + n3*9 + n2*10 + n1*11;

  d2:= 11 - (d2 mod 11);

  if d2 >= 10 then d2:=0;
    calculando := IntToStr(d1) + IntToStr(d2);

  digitando := strCpf[10] + strCpf[11];

  if calculando <> digitando then
  begin
    Result := '';

  end
  else
  begin
    Result := strCpf;
  end;

end;


end.
