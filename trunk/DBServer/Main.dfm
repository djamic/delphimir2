object FrmMain: TFrmMain
  Left = 215
  Top = 222
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'DBServer'
  ClientHeight = 319
  ClientWidth = 650
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = '??'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 16
  object MemoLog: TMemo
    Left = 0
    Top = 0
    Width = 650
    Height = 109
    Align = alTop
    ScrollBars = ssVertical
    TabOrder = 0
    OnChange = MemoLogChange
    OnDblClick = MemoLogDblClick
  end
  object Panel: TPanel
    Left = 0
    Top = 109
    Width = 650
    Height = 75
    Align = alTop
    TabOrder = 1
    object LabelLoadHumRcd: TLabel
      Left = 246
      Top = 10
      Width = 58
      Height = 16
      Caption = 'Load Hum'
    end
    object LabelSaveHumRcd: TLabel
      Left = 246
      Top = 42
      Width = 58
      Height = 16
      BiDiMode = bdLeftToRight
      Caption = 'Save Hum'
      ParentBiDiMode = False
    end
    object LabelLoadHeroRcd: TLabel
      Left = 394
      Top = 10
      Width = 58
      Height = 16
      Caption = 'Load Hero'
    end
    object LabelSaveHeroRcd: TLabel
      Left = 394
      Top = 42
      Width = 58
      Height = 16
      Caption = 'Save Hero'
    end
    object LabelCreateHero: TLabel
      Left = 128
      Top = 10
      Width = 74
      Height = 16
      Caption = 'Created Hero'
    end
    object LabelCreateHum: TLabel
      Left = 10
      Top = 10
      Width = 74
      Height = 16
      Caption = 'Created Hum'
    end
    object LabelDeleteHum: TLabel
      Left = 10
      Top = 42
      Width = 49
      Height = 16
      Caption = 'Del Hum'
    end
    object LabelDeleteHero: TLabel
      Left = 128
      Top = 42
      Width = 52
      Height = 16
      Caption = 'Del Hero:'
    end
    object LabelWorkStatus: TLabel
      Left = 618
      Top = 10
      Width = 5
      Height = 23
      Font.Charset = GB2312_CHARSET
      Font.Color = clGreen
      Font.Height = -17
      Font.Name = '??'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object CheckBoxShowMainLogMsg: TCheckBox
      Left = 554
      Top = 32
      Width = 87
      Height = 23
      Caption = 'Show Log'
      TabOrder = 0
      OnClick = CheckBoxShowMainLogMsgClick
    end
  end
  object ModuleGrid: TStringGrid
    Left = 0
    Top = 184
    Width = 650
    Height = 135
    Align = alClient
    ColCount = 3
    DefaultColWidth = 158
    DefaultRowHeight = 14
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 2
  end
  object TimerStart: TTimer
    Enabled = False
    OnTimer = TimerStartTimer
    Left = 48
    Top = 16
  end
  object TimerMain: TTimer
    Interval = 1
    OnTimer = TimerMainTimer
    Left = 88
    Top = 16
  end
  object MainMenu: TMainMenu
    Left = 168
    Top = 16
    object MENU_CONTROL: TMenuItem
      Caption = 'Control (&C)'
      object MENU_CONTROL_START: TMenuItem
        Caption = 'Start (&S)'
        OnClick = MENU_CONTROL_STARTClick
      end
      object MENU_CONTROL_STOP: TMenuItem
        Caption = 'Stop (&T)'
        OnClick = MENU_CONTROL_STOPClick
      end
      object N1: TMenuItem
        Caption = 'Reload'
        object G1: TMenuItem
          Caption = 'Reload Gate ID/IP Table (&G)'
          OnClick = G1Click
        end
        object C1: TMenuItem
          Caption = 'Reload Char Name List (&C)'
          OnClick = C1Click
        end
      end
      object MENU_CONTROL_EXIT: TMenuItem
        Caption = 'Exit (&X)'
        OnClick = MENU_CONTROL_EXITClick
      end
    end
    object MENU_OPTION: TMenuItem
      Caption = 'Options (&O)'
      object MENU_OPTION_GENERAL: TMenuItem
        Caption = 'General (&G)'
        OnClick = MENU_OPTION_GENERALClick
      end
      object MENU_OPTION_GAMEGATE: TMenuItem
        Caption = 'Game Gate(&R)'
        OnClick = MENU_OPTION_GAMEGATEClick
      end
    end
    object MENU_MANAGE: TMenuItem
      Caption = 'Manage (&M)'
      object MENU_MANAGE_DATA: TMenuItem
        Caption = 'Manage Data(&D)'
        OnClick = MENU_MANAGE_DATAClick
      end
      object MENU_RANKING: TMenuItem
        Caption = 'Ranking (&R)'
        OnClick = MENU_RANKINGClick
      end
    end
    object MENU_TEST: TMenuItem
      Caption = 'Test (&T)'
      object MENU_TEST_SELGATE: TMenuItem
        Caption = 'Test Select Gate (&S)'
        OnClick = MENU_TEST_SELGATEClick
      end
    end
    object MENU_HELP: TMenuItem
      Caption = 'Help (&H)'
      object MENU_HELP_VERSION: TMenuItem
        Caption = 'Help (&A)'
        OnClick = MENU_HELP_VERSIONClick
      end
    end
  end
  object TimerClose: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimerCloseTimer
    Left = 16
    Top = 16
  end
end
