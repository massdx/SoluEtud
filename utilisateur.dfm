object Form_utilisateur: TForm_utilisateur
  Left = 0
  Top = 0
  Caption = 'Utilisateur '
  ClientHeight = 397
  ClientWidth = 646
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 646
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 208
    ExplicitTop = 56
    ExplicitWidth = 185
    object Label1: TLabel
      Left = 248
      Top = 4
      Width = 125
      Height = 27
      Caption = 'UTILISATEUR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 56
    Width = 630
    Height = 289
    DataSource = DataM.DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Trebuchet MS'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 351
    Width = 610
    Height = 38
    DataSource = DataM.DataSource1
    TabOrder = 2
  end
end
