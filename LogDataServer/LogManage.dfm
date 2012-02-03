object FrmLogManage: TFrmLogManage
  Left = 664
  Top = 273
  Caption = 'L'#7883'ch truy v'#7845'n'
  ClientHeight = 507
  ClientWidth = 741
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 16
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 741
    Height = 65
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 11
      Top = 21
      Width = 76
      Height = 16
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Ng'#224'y b'#7855't '#273#7847'u:'
    end
    object Label2: TLabel
      Left = 256
      Top = 21
      Width = 77
      Height = 16
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'K'#7871't th'#250'c ng'#224'y:'
    end
    object Label3: TLabel
      Left = 501
      Top = 21
      Width = 50
      Height = 16
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Truy v'#7845'n:'
    end
    object DateTimeEditBegin: TRzDateTimeEdit
      Left = 91
      Top = 17
      Width = 145
      Height = 24
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      EditType = etDate
      OnDateTimeChange = DateTimeEditBeginDateTimeChange
      TabOrder = 0
    end
    object DateTimeEditEnd: TRzDateTimeEdit
      Left = 336
      Top = 17
      Width = 145
      Height = 24
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      EditType = etDate
      OnDateTimeChange = DateTimeEditEndDateTimeChange
      TabOrder = 1
    end
    object ComboBoxCondition: TComboBox
      Left = 581
      Top = 17
      Width = 135
      Height = 24
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      TabOrder = 2
      Items.Strings = (
        #26080#26465#20214
        #20154#29289#21517#31216
        #29289#21697#21517#31216
        #29289#21697'ID'
        #20132#26131#23545#35937)
    end
    object EditSearch: TEdit
      Left = 724
      Top = 17
      Width = 137
      Height = 24
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 3
    end
    object ButtonStart: TButton
      Left = 869
      Top = 15
      Width = 100
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #24320#22987#26597#35810
      TabOrder = 4
      OnClick = ButtonStartClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 65
    Width = 217
    Height = 423
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alLeft
    TabOrder = 1
    object CheckListBox: TCheckListBox
      Left = 1
      Top = 1
      Width = 215
      Height = 421
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      OnClickCheck = CheckListBoxClickCheck
      Align = alClient
      Items.Strings = (
        'M'#7885'i th'#7855'c m'#7855'c'
        'l'#7845'y l'#7841'i c'#225'c m'#7909'c'
        #272#7875' l'#432'u tr'#7919
        'Tinh ch'#7881'nh thu'#7889'c'
        'l'#226'u d'#224'i bi'#7871'n m'#7845't'
        'Gi'#7919' h'#224'ng ho'#225
        'S'#7843'n xu'#7845't c'#225'c b'#224'i b'#225'o'
        'ti'#234'u h'#7911'y h'#224'ng h'#243'a'
        'V'#7913't b'#7887' c'#225'c m'#7909'c'
        'Th'#432#417'ng m'#7841'i m'#7863't h'#224'ng'
        'c'#225'c m'#7909'c '#273#7875' b'#225'n'
        'S'#7917' d'#7909'ng c'#225'c m'#7909'c'
        'H'#236'nh n'#226'ng c'#7845'p'
        'gi'#7843'm v'#224'ng'
        't'#259'ng v'#224'ng'
        'tr'#432#7901'ng h'#7907'p t'#7917' vong gi'#7843'm'
        'c'#432#417#833'p b'#244#833'c'
        'nh'#226'n v'#7853't ch'#7871't'
        'n'#226'ng c'#7845'p '#273#227' th'#224'nh c'#244'ng'
        'N'#226'ng c'#7845'p th'#7845't b'#7841'i'
        'Castle r'#250't ti'#7873'n'
        'Castle '#273#7875' ti'#7871't ki'#7879'm ti'#7873'n'
        'N'#226'ng c'#7845'p '#273#7875' l'#7845'y'
        'v'#361' kh'#237' n'#226'ng c'#7845'p'
        'ba l'#244' '#273#7875' gi'#7843'm'
        'Thay '#273#7893'i c'#225'c Santo'
        'ph'#244'i thay '#273#7893'i'
        'n'#259'ng l'#432#7907'ng thay '#273#7893'i'
        'c'#225'c c'#7917'a h'#224'ng '#273#7875' mua'
        'Thi'#7871't b'#7883' n'#226'ng c'#7845'p'
        'l'#244' h'#224'ng m'#7909'c'
        'l'#244' h'#224'ng mua'
        'Th'#225'ch th'#7913'c m'#7909'c'
        'stall m'#7909'c')
      TabOrder = 0
    end
  end
  object ListView: TListView
    Left = 217
    Top = 65
    Width = 524
    Height = 423
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Columns = <
      item
        Caption = 's'#7889
        Width = 67
      end
      item
        Caption = 'H'#224'nh '#273#7897'ng'
        Width = 107
      end
      item
        Caption = 'B'#7843'n '#273#7891
        Width = 80
      end
      item
        Caption = 'Ph'#7889'i h'#7907'pX'
        Width = 67
      end
      item
        Caption = 'Ph'#7889'i h'#7907'pY'
        Width = 67
      end
      item
        Caption = 'nh'#226'n v'#7853't T'#234'n'
        Width = 93
      end
      item
        Caption = 'Ti'#234'u '#273#7873' c'#7911'a b'#224'i'
        Width = 93
      end
      item
        Caption = 'H'#224'ng h'#243'aID'
        Width = 73
      end
      item
        Caption = #273#7889'i t'#225'c th'#432#417'ng m'#7841'i'
        Width = 93
      end
      item
        Caption = 'Th'#7901'i gian'
        Width = 93
      end>
    GridLines = True
    MultiSelect = True
    RowSelect = True
    PopupMenu = PopupMenu
    TabOrder = 2
    ViewStyle = vsReport
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 488
    Width = 741
    Height = 19
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Panels = <
      item
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 400
      end
      item
        Width = 50
      end>
  end
  object PopupMenu: TPopupMenu
    Left = 368
    Top = 248
    object PopupMenu_COPY: TMenuItem
      Caption = #22797#21046
      OnClick = PopupMenu_COPYClick
    end
    object PopupMenu_SELECTALL: TMenuItem
      Caption = #20840#36873
      OnClick = PopupMenu_SELECTALLClick
    end
  end
  object Timer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TimerTimer
    Left = 424
    Top = 328
  end
end
