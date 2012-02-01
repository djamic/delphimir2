object FrmOnLineHum: TFrmOnLineHum
  Left = 677
  Top = 213
  BorderStyle = bsDialog
  Caption = 'ng'#432#7901'i tr'#7921'c tuy'#7871'n'
  ClientHeight = 427
  ClientWidth = 672
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial Unicode MS'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object GroupBox1: TGroupBox
    Left = 11
    Top = 11
    Width = 652
    Height = 364
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'ng'#432#7901'i tr'#7921'c tuy'#7871'n'
    TabOrder = 0
    object ListViewOnLine: TListView
      Left = 11
      Top = 21
      Width = 630
      Height = 332
      Hint = 'Ctrl + F T'#236'm IP'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Columns = <
        item
          Caption = 's'#7889
          Width = 67
        end
        item
          Caption = #272#259'ng nh'#7853'p '#273#7883'a ch'#7881' IP'
          Width = 133
        end
        item
          Caption = 'session ID'
          Width = 107
        end
        item
          Caption = 'chi'#7873'u d'#224'i d'#7919' li'#7879'u'
          Width = 107
        end
        item
          Caption = 'c'#225'c tr'#7841'ng th'#225'i hi'#7879'n t'#7841'i'
          Width = 200
        end>
      GridLines = True
      ReadOnly = True
      RowSelect = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      ViewStyle = vsReport
      OnClick = ListViewOnLineClick
      OnKeyDown = ListViewOnLineKeyDown
    end
  end
  object ButtonRef: TButton
    Left = 11
    Top = 384
    Width = 100
    Height = 33
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'L'#224'm m'#7899'i(&R)'
    TabOrder = 1
    OnClick = ButtonRefClick
  end
  object ButtonKick: TButton
    Left = 117
    Top = 384
    Width = 100
    Height = 33
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Kh'#7903'i '#273#7897'ng(&T)'
    TabOrder = 2
    OnClick = ButtonKickClick
  end
  object ButtonAddTempList: TButton
    Left = 309
    Top = 384
    Width = 172
    Height = 33
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Th'#234'm n'#259'ng '#273#7897'ng(&A)'
    TabOrder = 3
    OnClick = ButtonAddTempListClick
  end
  object ButtonAddBlockList: TButton
    Left = 491
    Top = 384
    Width = 172
    Height = 33
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Th'#234'm v'#224'o danh s'#225'ch l'#7885'c(&D)'
    TabOrder = 4
    OnClick = ButtonAddBlockListClick
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 184
    Top = 288
  end
end
