object frmRouteEdit: TfrmRouteEdit
  Left = 653
  Top = 337
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Edit'
  ClientHeight = 270
  ClientWidth = 503
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = '??'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 15
  object GroupBox1: TGroupBox
    Left = 10
    Top = 10
    Width = 481
    Height = 251
    TabOrder = 0
    object Label1: TLabel
      Left = 20
      Top = 25
      Width = 14
      Height = 15
      Caption = 'IP:'
    end
    object EditSelGate: TEdit
      Left = 90
      Top = 20
      Width = 121
      Height = 23
      TabOrder = 0
    end
    object GroupBox2: TGroupBox
      Left = 10
      Top = 50
      Width = 461
      Height = 151
      Caption = 'Gate IP and Addr'
      TabOrder = 3
      object Label2: TLabel
        Left = 20
        Top = 25
        Width = 14
        Height = 15
        Caption = 'IP:'
      end
      object Label3: TLabel
        Left = 20
        Top = 55
        Width = 14
        Height = 15
        Caption = 'IP:'
      end
      object Label4: TLabel
        Left = 20
        Top = 85
        Width = 14
        Height = 15
        Caption = 'IP:'
      end
      object Label5: TLabel
        Left = 20
        Top = 115
        Width = 14
        Height = 15
        Caption = 'IP:'
      end
      object Label6: TLabel
        Left = 240
        Top = 25
        Width = 14
        Height = 15
        Caption = 'IP:'
      end
      object Label7: TLabel
        Left = 240
        Top = 55
        Width = 14
        Height = 15
        Caption = 'IP:'
      end
      object Label8: TLabel
        Left = 240
        Top = 85
        Width = 14
        Height = 15
        Caption = 'IP:'
      end
      object Label9: TLabel
        Left = 240
        Top = 115
        Width = 14
        Height = 15
        Caption = 'IP:'
      end
      object EditGateIPaddr1: TEdit
        Left = 50
        Top = 20
        Width = 121
        Height = 23
        TabOrder = 0
      end
      object EditGateIPaddr2: TEdit
        Left = 50
        Top = 50
        Width = 121
        Height = 23
        TabOrder = 2
      end
      object EditGatePort1: TEdit
        Left = 180
        Top = 20
        Width = 51
        Height = 23
        TabOrder = 1
      end
      object EditGatePort2: TEdit
        Left = 180
        Top = 50
        Width = 51
        Height = 23
        TabOrder = 3
      end
      object EditGateIPaddr3: TEdit
        Left = 50
        Top = 80
        Width = 121
        Height = 23
        TabOrder = 4
      end
      object EditGatePort3: TEdit
        Left = 180
        Top = 80
        Width = 51
        Height = 23
        TabOrder = 5
      end
      object EditGateIPaddr4: TEdit
        Left = 50
        Top = 110
        Width = 121
        Height = 23
        TabOrder = 6
      end
      object EditGatePort4: TEdit
        Left = 180
        Top = 110
        Width = 51
        Height = 23
        TabOrder = 7
      end
      object EditGateIPaddr5: TEdit
        Left = 270
        Top = 20
        Width = 121
        Height = 23
        TabOrder = 8
      end
      object EditGatePort5: TEdit
        Left = 400
        Top = 20
        Width = 51
        Height = 23
        TabOrder = 9
      end
      object EditGateIPaddr6: TEdit
        Left = 270
        Top = 50
        Width = 121
        Height = 23
        TabOrder = 10
      end
      object EditGatePort6: TEdit
        Left = 400
        Top = 50
        Width = 51
        Height = 23
        TabOrder = 11
      end
      object EditGateIPaddr7: TEdit
        Left = 270
        Top = 80
        Width = 121
        Height = 23
        TabOrder = 12
      end
      object EditGatePort7: TEdit
        Left = 400
        Top = 80
        Width = 51
        Height = 23
        TabOrder = 13
      end
      object EditGateIPaddr8: TEdit
        Left = 270
        Top = 110
        Width = 121
        Height = 23
        TabOrder = 14
      end
      object EditGatePort8: TEdit
        Left = 400
        Top = 110
        Width = 51
        Height = 23
        TabOrder = 15
      end
    end
    object ButtonOK: TButton
      Left = 10
      Top = 210
      Width = 91
      Height = 31
      Caption = 'OK (&O)'
      TabOrder = 1
      OnClick = ButtonOKClick
    end
    object ButtonCancel: TButton
      Left = 110
      Top = 210
      Width = 91
      Height = 31
      Caption = 'Close (&C)'
      TabOrder = 2
      OnClick = ButtonOKClick
    end
  end
end
