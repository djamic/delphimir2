object frmOption: TfrmOption
  Left = 487
  Top = 310
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'IP Filter'
  ClientHeight = 439
  ClientWidth = 848
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object Label2: TLabel
    Left = 587
    Top = 27
    Width = 75
    Height = 16
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Max Connect:'
  end
  object Label5: TLabel
    Left = 587
    Top = 59
    Width = 76
    Height = 16
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Con TimeOut:'
  end
  object Label11: TLabel
    Left = 587
    Top = 91
    Width = 64
    Height = 16
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Con Check:'
  end
  object Label1: TLabel
    Left = 587
    Top = 123
    Width = 81
    Height = 16
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Max On Count:'
  end
  object Label7: TLabel
    Left = 587
    Top = 155
    Width = 67
    Height = 16
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Load IP List:'
  end
  object GroupBoxActive: TGroupBox
    Left = 11
    Top = 11
    Width = 182
    Height = 342
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Block List'
    TabOrder = 0
    object LabelActive: TLabel
      Left = 11
      Top = 32
      Width = 29
      Height = 16
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'test1:'
    end
    object ListBoxActiveList: TListBox
      Left = 11
      Top = 53
      Width = 161
      Height = 279
      Hint = ' command? Ctrl + F IP'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ItemHeight = 12
      Items.Strings = (
        '888.888.888.888')
      MultiSelect = True
      ParentShowHint = False
      PopupMenu = ActiveListPopupMenu
      ShowHint = True
      Sorted = True
      TabOrder = 0
      OnKeyDown = ListBoxActiveListKeyDown
    end
  end
  object GroupBox1: TGroupBox
    Left = 203
    Top = 11
    Width = 182
    Height = 342
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Char Block List'
    TabOrder = 1
    object LabelBlock: TLabel
      Left = 11
      Top = 32
      Width = 36
      Height = 16
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'test13:'
    end
    object ListBoxBlockList: TListBox
      Left = 17
      Top = 56
      Width = 162
      Height = 279
      Hint = 'hint box 2'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ItemHeight = 12
      Items.Strings = (
        '888.888.888.888')
      MultiSelect = True
      ParentShowHint = False
      PopupMenu = BlockListPopupMenu
      ShowHint = True
      Sorted = True
      TabOrder = 0
      OnKeyDown = ListBoxBlockListKeyDown
    end
  end
  object EditMaxConnect: TSpinEdit
    Left = 693
    Top = 21
    Width = 87
    Height = 21
    Hint = 'hint box 6'
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    MaxValue = 10000
    MinValue = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Value = 50
    OnChange = EditMaxConnectChange
  end
  object ButtonOK: TButton
    Left = 720
    Top = 395
    Width = 119
    Height = 33
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'OK(&O)'
    Default = True
    TabOrder = 3
    OnClick = ButtonOKClick
  end
  object EditKeepConnectTimeOut: TSpinEdit
    Left = 693
    Top = 53
    Width = 140
    Height = 21
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Increment = 1000
    MaxValue = 100000000
    MinValue = 10000
    TabOrder = 4
    Value = 180000
    OnChange = EditKeepConnectTimeOutChange
  end
  object EditConnctCheckTime: TSpinEdit
    Left = 693
    Top = 85
    Width = 108
    Height = 21
    Hint = 'hint box 5'
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Increment = 10
    MaxValue = 1000
    MinValue = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Value = 100
    OnChange = EditConnctCheckTimeChange
  end
  object GroupBox2: TGroupBox
    Left = 395
    Top = 11
    Width = 182
    Height = 342
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'IP Block List'
    TabOrder = 6
    object LabelIPArray: TLabel
      Left = 11
      Top = 32
      Width = 47
      Height = 16
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'IPtest15:'
    end
    object ListBoxIPArrayList: TListBox
      Left = 11
      Top = 53
      Width = 161
      Height = 279
      Hint = 'box hint1'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ItemHeight = 12
      Items.Strings = (
        '*.*.*.*')
      MultiSelect = True
      ParentShowHint = False
      PopupMenu = ArrayPopupMenu
      ShowHint = True
      Sorted = True
      TabOrder = 0
    end
  end
  object EditMaxOnlineCount: TSpinEdit
    Left = 693
    Top = 117
    Width = 87
    Height = 21
    Hint = 'Max Online Count Edited'
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    EditorEnabled = False
    MaxValue = 10000
    MinValue = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    Value = 500
    OnChange = EditMaxOnlineCountChange
  end
  object GroupBox3: TGroupBox
    Left = 11
    Top = 357
    Width = 566
    Height = 71
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'IP List Site'
    TabOrder = 8
    object Label6: TLabel
      Left = 11
      Top = 32
      Width = 36
      Height = 16
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'IP List:'
    end
    object ButtonLoadIpList: TButton
      Left = 489
      Top = 27
      Width = 67
      Height = 26
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Save'
      TabOrder = 0
      OnClick = ButtonLoadIpListClick
    end
    object EditIpList: TEdit
      Left = 75
      Top = 27
      Width = 406
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 1
      Text = 'http://www.cqfir.net/IpList.txt'
    end
  end
  object EditRefLoadIpListTime: TSpinEdit
    Left = 693
    Top = 149
    Width = 87
    Height = 21
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    MaxValue = 0
    MinValue = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    Value = 5000
    OnChange = EditRefLoadIpListTimeChange
  end
  object ActiveListPopupMenu: TPopupMenu
    Left = 56
    Top = 160
    object APOPMENU_REFLIST: TMenuItem
      Caption = 'Ref List(&R)'
      OnClick = APOPMENU_REFLISTClick
    end
    object APOPMENU_BLOCKLIST: TMenuItem
      Caption = 'Block List(&D)'
      OnClick = APOPMENU_BLOCKLISTClick
    end
    object APOPMENU_ALLADDLIST: TMenuItem
      Caption = 'Add List(&S'
      OnClick = APOPMENU_ALLADDLISTClick
    end
    object APOPMENU_KICK: TMenuItem
      Caption = 'Kick(&K)'
      OnClick = APOPMENU_KICKClick
    end
  end
  object BlockListPopupMenu: TPopupMenu
    Left = 200
    Top = 160
    object BPOPMENU_REFLIST: TMenuItem
      Caption = 'Ref List(&R)'
      OnClick = BPOPMENU_REFLISTClick
    end
    object BPOPMENU_ADD: TMenuItem
      Caption = 'Add(&A)'
      OnClick = BPOPMENU_ADDClick
    end
    object BPOPMENU_CLEAR: TMenuItem
      Caption = 'Clear(&C)'
      OnClick = BPOPMENU_CLEARClick
    end
    object BPOPMENU_DELETE: TMenuItem
      Caption = 'Delete(&D)'
      OnClick = BPOPMENU_DELETEClick
    end
  end
  object ArrayPopupMenu: TPopupMenu
    Left = 352
    Top = 160
    object AYPOPMENU_REFLIST: TMenuItem
      Caption = 'Ref List(&R)'
      OnClick = AYPOPMENU_REFLISTClick
    end
    object AYPOPMENU_ADD: TMenuItem
      Caption = 'Add(&A)'
      OnClick = AYPOPMENU_ADDClick
    end
    object AYPOPMENU_CLEAR: TMenuItem
      Caption = 'Clear(&C)'
      OnClick = AYPOPMENU_CLEARClick
    end
    object AYPOPMENU_DELETE: TMenuItem
      Caption = 'Delete(&D)'
      OnClick = AYPOPMENU_DELETEClick
    end
  end
  object OpenDialog: TOpenDialog
    Filter = 'IpList|*.txt'
    Left = 440
    Top = 272
  end
end
