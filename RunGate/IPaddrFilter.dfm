object frmIPaddrFilter: TfrmIPaddrFilter
  Left = 947
  Top = 379
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'IP Filter'
  ClientHeight = 369
  ClientWidth = 488
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 10
    Top = 10
    Width = 471
    Height = 351
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'IP Blocks'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object LabelTempList: TLabel
        Left = 10
        Top = 10
        Width = 91
        Height = 15
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Temp Block List:'
      end
      object Label1: TLabel
        Left = 170
        Top = 10
        Width = 56
        Height = 15
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Block List:'
      end
      object ListBoxTempList: TListBox
        Left = 11
        Top = 33
        Width = 152
        Height = 281
        Hint = 'This is a list of temp blocked IPs'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ItemHeight = 15
        Items.Strings = (
          '888.888.888.888')
        MultiSelect = True
        ParentShowHint = False
        PopupMenu = TempBlockListPopupMenu
        ShowHint = True
        Sorted = True
        TabOrder = 0
        OnKeyDown = ListBoxTempListKeyDown
      end
      object ListBoxBlockList: TListBox
        Left = 170
        Top = 30
        Width = 151
        Height = 281
        Hint = 'This is a list of blocked IPs'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ItemHeight = 15
        Items.Strings = (
          '888.888.888.888')
        MultiSelect = True
        ParentShowHint = False
        PopupMenu = BlockListPopupMenu
        ShowHint = True
        Sorted = True
        TabOrder = 1
        OnKeyDown = ListBoxBlockListKeyDown
      end
    end
    object TabSheet2: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Client'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label2: TLabel
        Left = 10
        Top = 25
        Width = 63
        Height = 15
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Max Ip Con:'
      end
      object Label9: TLabel
        Left = 10
        Top = 55
        Width = 83
        Height = 15
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Client Timeout:'
      end
      object Label7: TLabel
        Left = 301
        Top = 226
        Width = 135
        Height = 17
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'LOMCN - Mir Heroes'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -15
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object EditMaxConnect: TSpinEdit
        Left = 80
        Top = 20
        Width = 81
        Height = 21
        Hint = 'This is where you edit the maximum connections'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        EditorEnabled = False
        MaxValue = 1000
        MinValue = 1
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Value = 50
        OnChange = EditMaxConnectChange
      end
      object EditClientTimeOutTime: TSpinEdit
        Left = 80
        Top = 50
        Width = 81
        Height = 21
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        EditorEnabled = False
        MaxValue = 10
        MinValue = 1
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Value = 5
        OnChange = EditClientTimeOutTimeChange
      end
      object GroupBox4: TGroupBox
        Left = 240
        Top = 10
        Width = 211
        Height = 201
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Client'
        TabOrder = 2
        object Label6: TLabel
          Left = 10
          Top = 55
          Width = 50
          Height = 15
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Max Size:'
        end
        object Label8: TLabel
          Left = 10
          Top = 85
          Width = 50
          Height = 15
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Max Msg:'
        end
        object Label5: TLabel
          Left = 10
          Top = 25
          Width = 48
          Height = 15
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Min Size:'
        end
        object Label11: TLabel
          Left = 10
          Top = 115
          Width = 35
          Height = 15
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Attack:'
        end
        object Label12: TLabel
          Left = 10
          Top = 145
          Width = 71
          Height = 15
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Attack Count:'
        end
        object EditMaxSize: TSpinEdit
          Left = 80
          Top = 50
          Width = 81
          Height = 21
          Hint = 'Maximum client packet size'
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          MaxValue = 20000
          MinValue = 1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Value = 6000
          OnChange = EditMaxSizeChange
        end
        object EditMaxClientMsgCount: TSpinEdit
          Left = 80
          Top = 80
          Width = 81
          Height = 21
          Hint = 'Maximum client message count'
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          EditorEnabled = False
          MaxValue = 100
          MinValue = 1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Value = 5
          OnChange = EditMaxClientMsgCountChange
        end
        object CheckBoxLostLine: TCheckBox
          Left = 80
          Top = 170
          Width = 121
          Height = 21
          Hint = 'Auto mimimize on start up'
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          BiDiMode = bdLeftToRight
          Caption = 'Minimize'
          ParentBiDiMode = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = CheckBoxLostLineClick
        end
        object EditNomSize: TSpinEdit
          Left = 80
          Top = 20
          Width = 81
          Height = 21
          Hint = 'Minimum client packet size'
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Increment = 10
          MaxValue = 20000
          MinValue = 1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          Value = 100
          OnChange = EditNomSizeChange
        end
        object SpinEditAttackTick: TSpinEdit
          Left = 110
          Top = 110
          Width = 81
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Increment = 10
          MaxValue = 6000
          MinValue = 100
          TabOrder = 4
          Value = 200
          OnChange = SpinEditAttackTickChange
        end
        object SpinEditAttackCount: TSpinEdit
          Left = 110
          Top = 140
          Width = 81
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          MaxValue = 100
          MinValue = 1
          TabOrder = 5
          Value = 10
          OnChange = SpinEditAttackCountChange
        end
      end
      object GroupBox3: TGroupBox
        Left = 10
        Top = 90
        Width = 211
        Height = 91
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Radio'
        TabOrder = 3
        object RadioAddBlockList: TRadioButton
          Left = 20
          Top = 60
          Width = 161
          Height = 21
          Hint = 'Not sure'
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Add Block'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = RadioAddBlockListClick
        end
        object RadioAddTempList: TRadioButton
          Left = 20
          Top = 40
          Width = 161
          Height = 21
          Hint = 'Not sure'
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Add Temp'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = RadioAddTempListClick
        end
        object RadioDisConnect: TRadioButton
          Left = 20
          Top = 20
          Width = 161
          Height = 21
          Hint = 'Not sure'
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Disconnect'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = RadioDisConnectClick
        end
      end
      object ButtonOK: TButton
        Left = 330
        Top = 260
        Width = 111
        Height = 31
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'OK (&O)'
        Default = True
        TabOrder = 4
        OnClick = ButtonOKClick
      end
    end
  end
  object BlockListPopupMenu: TPopupMenu
    OnPopup = BlockListPopupMenuPopup
    Left = 168
    Top = 144
    object BPOPMENU_REFLIST: TMenuItem
      Caption = 'Ref (&R)'
      OnClick = BPOPMENU_REFLISTClick
    end
    object BPOPMENU_SORT: TMenuItem
      Caption = 'Sort(&S)'
      OnClick = BPOPMENU_SORTClick
    end
    object BPOPMENU_ADD: TMenuItem
      Caption = 'Add(&A)'
      OnClick = BPOPMENU_ADDClick
    end
    object BPOPMENU_ADDTEMPLIST: TMenuItem
      Caption = 'Add Temp List(&A)'
      OnClick = BPOPMENU_ADDTEMPLISTClick
    end
    object BPOPMENU_DELETE: TMenuItem
      Caption = 'Delete (&D)'
      OnClick = BPOPMENU_DELETEClick
    end
  end
  object TempBlockListPopupMenu: TPopupMenu
    OnPopup = TempBlockListPopupMenuPopup
    Left = 40
    Top = 144
    object TPOPMENU_REFLIST: TMenuItem
      Caption = 'Ref(&R)'
      OnClick = TPOPMENU_REFLISTClick
    end
    object TPOPMENU_SORT: TMenuItem
      Caption = 'Sort (&S)'
      OnClick = TPOPMENU_SORTClick
    end
    object TPOPMENU_ADD: TMenuItem
      Caption = 'Add (&A)'
      OnClick = TPOPMENU_ADDClick
    end
    object TPOPMENU_BLOCKLIST: TMenuItem
      Caption = 'Block List(&D)'
      OnClick = TPOPMENU_BLOCKLISTClick
    end
    object TPOPMENU_DELETE: TMenuItem
      Caption = 'Delete (&D)'
      OnClick = TPOPMENU_DELETEClick
    end
  end
end
