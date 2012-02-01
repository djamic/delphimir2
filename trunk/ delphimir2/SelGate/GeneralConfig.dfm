object frmGeneralConfig: TfrmGeneralConfig
  Left = 475
  Top = 286
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'General'
  ClientHeight = 198
  ClientWidth = 463
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = '??'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 15
  object GroupBoxNet: TGroupBox
    Left = 10
    Top = 10
    Width = 231
    Height = 141
    Caption = 'IP / Ports'
    TabOrder = 0
    object LabelGateIPaddr: TLabel
      Left = 10
      Top = 25
      Width = 56
      Height = 15
      Caption = 'Gate Addr:'
    end
    object LabelGatePort: TLabel
      Left = 10
      Top = 55
      Width = 54
      Height = 15
      Caption = 'Gate Port:'
    end
    object LabelServerPort: TLabel
      Left = 10
      Top = 115
      Width = 63
      Height = 15
      Caption = 'Server Port:'
    end
    object LabelServerIPaddr: TLabel
      Left = 10
      Top = 85
      Width = 65
      Height = 15
      Caption = 'Server Addr:'
    end
    object EditGateIPaddr: TEdit
      Left = 100
      Top = 20
      Width = 121
      Height = 23
      TabOrder = 0
      Text = '127.0.0.1'
    end
    object EditGatePort: TEdit
      Left = 100
      Top = 50
      Width = 51
      Height = 23
      TabOrder = 1
      Text = '7200'
    end
    object EditServerPort: TEdit
      Left = 100
      Top = 110
      Width = 51
      Height = 23
      TabOrder = 2
      Text = '5000'
    end
    object EditServerIPaddr: TEdit
      Left = 100
      Top = 80
      Width = 121
      Height = 23
      TabOrder = 3
      Text = '127.0.0.1'
    end
  end
  object GroupBoxInfo: TGroupBox
    Left = 250
    Top = 10
    Width = 201
    Height = 141
    Caption = 'Server'
    TabOrder = 1
    object Label1: TLabel
      Left = 10
      Top = 25
      Width = 26
      Height = 15
      Caption = 'Title:'
    end
    object Label2: TLabel
      Left = 10
      Top = 55
      Width = 60
      Height = 15
      Caption = 'Max Count:'
    end
    object EditTitle: TEdit
      Left = 50
      Top = 20
      Width = 131
      Height = 23
      TabOrder = 0
      Text = '????'
    end
    object CheckBoxMinimize: TCheckBox
      Left = 10
      Top = 80
      Width = 171
      Height = 21
      Caption = 'Minimize'
      TabOrder = 1
      OnClick = CheckBoxMinimizeClick
    end
    object EditMaxCount: TSpinEdit
      Left = 110
      Top = 50
      Width = 71
      Height = 24
      MaxValue = 5000
      MinValue = 1
      TabOrder = 2
      Value = 2000
    end
  end
  object ButtonOK: TButton
    Left = 370
    Top = 160
    Width = 81
    Height = 31
    Caption = 'OK (&O)'
    TabOrder = 2
    OnClick = ButtonOKClick
  end
end
