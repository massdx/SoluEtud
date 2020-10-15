object form_list: Tform_list
  Left = 0
  Top = 0
  Caption = 'Listes'
  ClientHeight = 518
  ClientWidth = 920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object PanelEtudiant: TPanel
    Left = 0
    Top = 0
    Width = 920
    Height = 518
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 242
      Top = 70
      Width = 73
      Height = 22
      Caption = 'Par Filiere'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 918
      Height = 41
      Align = alTop
      Caption = 'Liste des Etudiants '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'HP Simplified'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 98
      Width = 918
      Height = 392
      Align = alCustom
      DataSource = DataM.DS_etud_list
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'HP Simplified'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = 'HP Simplified'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'Num_E'
          Title.Alignment = taCenter
          Title.Caption = 'Num'#233'ro'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Nom'
          Title.Alignment = taCenter
          Width = 133
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Prenom'
          Title.Alignment = taCenter
          Width = 165
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Code_F'
          Title.Alignment = taCenter
          Title.Caption = 'Fili'#232're'
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Sexe'
          Title.Alignment = taCenter
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Adresse'
          Title.Alignment = taCenter
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Telephone'
          Title.Alignment = taCenter
          Width = 167
          Visible = True
        end>
    end
    object Button1: TButton
      Left = 2
      Top = 62
      Width = 100
      Height = 30
      Caption = 'Imprimer'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ImageIndex = 3
      Images = DataM.ImageList3
      ParentFont = False
      TabOrder = 2
      OnClick = Button1Click
    end
    object Filiere: TDBLookupComboBox
      Left = 355
      Top = 62
      Width = 137
      Height = 30
      Color = clGrayText
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      KeyField = 'Code_F'
      ListField = 'Code_F'
      ListSource = DataM.DS_filiere
      ParentFont = False
      TabOrder = 3
      OnCloseUp = FiliereCloseUp
    end
    object Button3: TButton
      Left = 506
      Top = 503
      Width = 25
      Height = 25
      ImageIndex = 1
      Images = DataM.ImageList
      TabOrder = 4
      OnClick = Button3Click
    end
    object Button7: TButton
      Left = 580
      Top = 503
      Width = 25
      Height = 25
      ImageIndex = 0
      Images = DataM.ImageList
      TabOrder = 5
      OnClick = Button7Click
    end
    object Button6: TButton
      Left = 355
      Top = 503
      Width = 25
      Height = 25
      ImageIndex = 2
      Images = DataM.ImageList
      TabOrder = 6
      OnClick = Button6Click
    end
    object Button5: TButton
      Left = 267
      Top = 503
      Width = 26
      Height = 25
      ImageIndex = 3
      Images = DataM.ImageList
      TabOrder = 7
      OnClick = Button5Click
    end
  end
  object PanelFiliere: TPanel
    Left = 0
    Top = 0
    Width = 920
    Height = 518
    Align = alClient
    TabOrder = 1
    ExplicitTop = 272
    ExplicitHeight = 246
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 918
      Height = 41
      Align = alTop
      Caption = 'Liste des fili'#232'res'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'HP Simplified'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object DBGrid2: TDBGrid
      Left = 1
      Top = 42
      Width = 918
      Height = 398
      Align = alTop
      DataSource = DataM.DS_filiere
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'HP Simplified'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -19
      TitleFont.Name = 'HP Simplified'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'Code_F'
          Title.Caption = 'Code Fili'#233're'
          Width = 471
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'libelle'
          Title.Caption = 'lib'#233'lle'
          Width = 409
          Visible = True
        end>
    end
  end
  object PanelRecouvre: TPanel
    Left = 0
    Top = 0
    Width = 920
    Height = 518
    Align = alClient
    TabOrder = 2
    ExplicitTop = 344
    ExplicitHeight = 174
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 918
      Height = 41
      Align = alTop
      Caption = 'Liste des Recouvrement '#233'tablie'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'HP Simplified'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object DBGrid3: TDBGrid
      Left = 1
      Top = 42
      Width = 918
      Height = 475
      Align = alClient
      DataSource = DataM.DS_recouvr
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'HP Simplified'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = 'HP Simplified'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'Num_R'
          Width = 203
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Date_R'
          Width = 317
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Mois'
          Width = 258
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Montant'
          Visible = True
        end>
    end
  end
end
