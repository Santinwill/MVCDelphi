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
  object Label4: TLabel
    Left = 104
    Top = 115
    Width = 55
    Height = 13
    Caption = 'Cod Cliente'
  end
  object ButtonSalvar: TButton
    Left = 608
    Top = 432
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 0
    OnClick = ButtonSalvarClick
  end
  object EditNome: TEdit
    Left = 176
    Top = 152
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object EditCpf: TEdit
    Left = 176
    Top = 192
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object DateTimePickerNasc: TDateTimePicker
    Left = 176
    Top = 230
    Width = 186
    Height = 21
    Date = 45001.385010277780000000
    Time = 45001.385010277780000000
    TabOrder = 3
  end
  object EditIdCliente: TEdit
    Left = 176
    Top = 112
    Width = 121
    Height = 21
    TabOrder = 4
  end
end
