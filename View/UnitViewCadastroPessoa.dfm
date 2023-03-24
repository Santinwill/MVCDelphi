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
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Tag = 1
    Left = 40
    Top = 155
    Width = 37
    Height = 13
    Caption = '*Nome:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Tag = 1
    Left = 40
    Top = 195
    Width = 29
    Height = 13
    Caption = '*CPF:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 40
    Top = 235
    Width = 49
    Height = 13
    Caption = 'Data Nasc'
  end
  object Label4: TLabel
    Left = 40
    Top = 115
    Width = 55
    Height = 13
    Caption = 'Cod Cliente'
  end
  object ButtonSalvar: TButton
    Left = 112
    Top = 280
    Width = 81
    Height = 25
    Caption = 'Salvar Novo'
    TabOrder = 0
    OnClick = ButtonSalvarClick
  end
  object EditNome: TEdit
    Tag = 1
    Left = 112
    Top = 152
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object EditCpf: TEdit
    Tag = 1
    Left = 112
    Top = 192
    Width = 121
    Height = 21
    TabOrder = 2
    OnExit = EditCpfExit
  end
  object DateTimePickerNasc: TDateTimePicker
    Left = 112
    Top = 230
    Width = 186
    Height = 21
    Date = 45001.385010277780000000
    Time = 45001.385010277780000000
    TabOrder = 3
  end
  object EditIdCliente: TEdit
    Left = 112
    Top = 112
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object DBGrid1: TDBGrid
    Left = 363
    Top = 112
    Width = 320
    Height = 136
    DataSource = DataSource
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object ButtonPesquisar: TButton
    Left = 496
    Top = 254
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 6
    OnClick = ButtonPesquisarClick
  end
  object ButtonAlterar: TButton
    Left = 216
    Top = 280
    Width = 82
    Height = 25
    Caption = 'Alterar'
    TabOrder = 7
    OnClick = ButtonAlterarClick
  end
  object ButtonLimparCampos: TButton
    Left = 216
    Top = 336
    Width = 82
    Height = 25
    Caption = 'Limpar Campos'
    TabOrder = 8
    OnClick = ButtonLimparCamposClick
  end
  object DataSource: TDataSource
    Left = 584
    Top = 160
  end
end
