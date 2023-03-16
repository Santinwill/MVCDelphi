object FormViewCadastroPessoa: TFormViewCadastroPessoa
  Left = 0
  Top = 0
  Caption = 'Cadastro de Pessoas'
  ClientHeight = 482
  ClientWidth = 742
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 104
    Top = 155
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object Label2: TLabel
    Left = 104
    Top = 195
    Width = 23
    Height = 13
    Caption = 'CPF:'
  end
  object Label3: TLabel
    Left = 104
    Top = 235
    Width = 49
    Height = 13
    Caption = 'Data Nasc'
  end
  object DBEditNome: TDBEdit
    Left = 160
    Top = 152
    Width = 185
    Height = 21
    TabOrder = 0
  end
  object DBEditcpf: TDBEdit
    Left = 160
    Top = 192
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object DateTimePickerNasc: TDateTimePicker
    Left = 159
    Top = 231
    Width = 186
    Height = 21
    Date = 45000.406064756940000000
    Time = 45000.406064756940000000
    TabOrder = 2
  end
end
