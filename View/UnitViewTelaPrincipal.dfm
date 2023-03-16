object FormViewTelaPrincipal: TFormViewTelaPrincipal
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Tela Principal'
  ClientHeight = 413
  ClientWidth = 701
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 344
    Top = 216
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object Cadastro2: TMenuItem
        Caption = 'Cadastro Pessoas'
        OnClick = Cadastro2Click
      end
    end
  end
end
