object frmConfigMerchant: TfrmConfigMerchant
  Left = 458
  Top = 338
  Caption = 'frmConfigMerchant'
  ClientHeight = 309
  ClientWidth = 672
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object PanelStatus: TPanel
    Left = 0
    Top = 0
    Width = 672
    Height = 309
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 896
    ExplicitHeight = 403
    object ListView: TListView
      Left = 1
      Top = 1
      Width = 894
      Height = 400
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      Columns = <
        item
          Caption = #24207#21495
          Width = 67
        end
        item
          Caption = #21517#31216
          Width = 133
        end
        item
          Caption = #22352#26631
          Width = 107
        end
        item
          Caption = #20132#26131'NPC'
          Width = 80
        end
        item
          Caption = #31649#29702'NPC'
          Width = 80
        end
        item
          Caption = #38544#34255
          Width = 67
        end
        item
          Caption = #20449#24687
          Width = 267
        end>
      GridLines = True
      MultiSelect = True
      ReadOnly = True
      RowSelect = True
      PopupMenu = PopupMenu
      TabOrder = 0
      ViewStyle = vsReport
      OnClick = ListViewClick
      OnDblClick = ListViewDblClick
    end
  end
  object PopupMenu: TPopupMenu
    Left = 344
    Top = 160
    object PopupMenu_Ref: TMenuItem
      Caption = #21047#26032'(&R)'
      OnClick = PopupMenu_RefClick
    end
    object PopupMenu_AutoRef: TMenuItem
      Caption = #33258#21160#21047#26032'(&A)'
      Enabled = False
    end
    object PopupMenu_: TMenuItem
      Caption = '-'
    end
    object PopupMenu_Load: TMenuItem
      Caption = #37325#26032#21152#36733'(&K)'
      OnClick = PopupMenu_LoadClick
    end
    object PopupMenu_Clear: TMenuItem
      Caption = #28165#38500#25968#25454'(&C)'
      OnClick = PopupMenu_ClearClick
    end
    object PopupMenu_Open: TMenuItem
      Caption = #25171#24320#33050#26412'(&O)'
      OnClick = PopupMenu_OpenClick
    end
  end
end
