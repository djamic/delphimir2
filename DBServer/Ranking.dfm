object FrmRankingDlg: TFrmRankingDlg
  Left = 709
  Top = 244
  BorderStyle = bsDialog
  Caption = 'Ranking'
  ClientHeight = 620
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial Unicode MS'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object GroupBox1: TGroupBox
    Left = 11
    Top = 11
    Width = 577
    Height = 129
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = '?????'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 11
      Top = 59
      Width = 32
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '????:'
    end
    object Label2: TLabel
      Left = 11
      Top = 91
      Width = 32
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '????:'
    end
    object Label3: TLabel
      Left = 171
      Top = 59
      Width = 7
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '?'
    end
    object Label4: TLabel
      Left = 171
      Top = 91
      Width = 7
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '?'
    end
    object Label5: TLabel
      Left = 341
      Top = 56
      Width = 7
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '?'
    end
    object Label6: TLabel
      Left = 341
      Top = 88
      Width = 14
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '??'
    end
    object Label7: TLabel
      Left = 459
      Top = 56
      Width = 7
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '?'
    end
    object Label8: TLabel
      Left = 459
      Top = 88
      Width = 7
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '?'
    end
    object CheckBoxAutoRefRanking: TCheckBox
      Left = 11
      Top = 21
      Width = 140
      Height = 23
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Auto ref Ranking'
      TabOrder = 0
      OnClick = CheckBoxAutoRefRankingClick
    end
    object EditMinLevel: TSpinEdit
      Left = 85
      Top = 53
      Width = 76
      Height = 30
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      MaxValue = 65535
      MinValue = 0
      TabOrder = 1
      Value = 0
      OnChange = EditMinLevelChange
    end
    object EditMaxLevel: TSpinEdit
      Left = 85
      Top = 85
      Width = 76
      Height = 30
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      MaxValue = 65535
      MinValue = 0
      TabOrder = 2
      Value = 0
      OnChange = EditMaxLevelChange
    end
    object RadioButton1: TRadioButton
      Left = 192
      Top = 56
      Width = 65
      Height = 23
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '??'
      TabOrder = 3
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Left = 192
      Top = 88
      Width = 65
      Height = 23
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '??'
      Checked = True
      TabOrder = 4
      TabStop = True
      OnClick = RadioButton1Click
    end
    object EditTime: TSpinEdit
      Left = 267
      Top = 53
      Width = 65
      Height = 30
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      MaxValue = 65535
      MinValue = 0
      TabOrder = 5
      Value = 0
      OnChange = EditTimeChange
    end
    object EditHour: TSpinEdit
      Left = 267
      Top = 85
      Width = 65
      Height = 30
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      MaxValue = 65535
      MinValue = 0
      TabOrder = 6
      Value = 0
      OnChange = EditHourChange
    end
    object EditMinute1: TSpinEdit
      Left = 384
      Top = 53
      Width = 65
      Height = 30
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      MaxValue = 65535
      MinValue = 0
      TabOrder = 7
      Value = 0
      OnChange = EditMinute1Change
    end
    object EditMinute2: TSpinEdit
      Left = 384
      Top = 85
      Width = 65
      Height = 30
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      MaxValue = 65535
      MinValue = 0
      TabOrder = 8
      Value = 0
      OnChange = EditMinute2Change
    end
    object ButtonSave: TButton
      Left = 474
      Top = 51
      Width = 93
      Height = 26
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Save(&S)'
      TabOrder = 9
      OnClick = ButtonSaveClick
    end
    object ButtonRefRanking: TButton
      Left = 474
      Top = 85
      Width = 93
      Height = 27
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'RefRanking(&R)'
      TabOrder = 10
      OnClick = ButtonRefRankingClick
    end
  end
  object PageControl1: TPageControl
    Left = 11
    Top = 149
    Width = 577
    Height = 460
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ActivePage = TabSheet1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object TabSheet1: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Characters'
      object PageControl2: TPageControl
        Left = 0
        Top = 0
        Width = 569
        Height = 425
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ActivePage = TabSheet10
        Align = alClient
        TabOrder = 0
        object TabSheet4: TTabSheet
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'All'
          object ListViewHum: TListView
            Left = 0
            Top = 0
            Width = 561
            Height = 390
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alClient
            Columns = <
              item
                Caption = 'Class'
                Width = 80
              end
              item
                Caption = 'Name'
                Width = 133
              end
              item
                Caption = 'Level'
                Width = 80
              end>
            GridLines = True
            ReadOnly = True
            RowSelect = True
            TabOrder = 0
            ViewStyle = vsReport
          end
        end
        object TabSheet5: TTabSheet
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Warrior'
          ImageIndex = 1
          object ListViewWarrior: TListView
            Left = 0
            Top = 0
            Width = 561
            Height = 390
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alClient
            Columns = <
              item
                Caption = 'Index'
                Width = 80
              end
              item
                Caption = 'Name'
                Width = 133
              end
              item
                Caption = 'Level'
                Width = 80
              end>
            GridLines = True
            ReadOnly = True
            RowSelect = True
            TabOrder = 0
            ViewStyle = vsReport
          end
        end
        object TabSheet6: TTabSheet
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Wizard'
          ImageIndex = 2
          object ListViewWizzard: TListView
            Left = 0
            Top = 0
            Width = 561
            Height = 390
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alClient
            Columns = <
              item
                Caption = 'Index'
                Width = 80
              end
              item
                Caption = 'Name'
                Width = 133
              end
              item
                Caption = 'level'
                Width = 80
              end>
            GridLines = True
            ReadOnly = True
            RowSelect = True
            TabOrder = 0
            ViewStyle = vsReport
          end
        end
        object TabSheet10: TTabSheet
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Taoist'
          ImageIndex = 3
          object ListViewMonk: TListView
            Left = 0
            Top = 0
            Width = 561
            Height = 390
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alClient
            Columns = <
              item
                Caption = 'Index'
                Width = 80
              end
              item
                Caption = 'Name'
                Width = 133
              end
              item
                Caption = 'Level'
                Width = 80
              end>
            GridLines = True
            ReadOnly = True
            RowSelect = True
            TabOrder = 0
            ViewStyle = vsReport
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Hero'
      ImageIndex = 1
      object PageControl3: TPageControl
        Left = 0
        Top = 0
        Width = 569
        Height = 425
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ActivePage = TabSheet11
        Align = alClient
        TabOrder = 0
        object TabSheet7: TTabSheet
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'All'
          object ListViewHero: TListView
            Left = 0
            Top = 0
            Width = 561
            Height = 390
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alClient
            Columns = <
              item
                Caption = 'Class'
                Width = 80
              end
              item
                Caption = 'Name'
                Width = 133
              end
              item
                Caption = 'Owner'
                Width = 133
              end
              item
                Caption = 'Level'
                Width = 80
              end>
            GridLines = True
            ReadOnly = True
            RowSelect = True
            TabOrder = 0
            ViewStyle = vsReport
          end
        end
        object TabSheet8: TTabSheet
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Warrior'
          ImageIndex = 1
          object ListViewHeroWarrior: TListView
            Left = 0
            Top = 0
            Width = 561
            Height = 390
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alClient
            Columns = <
              item
                Caption = 'Index'
                Width = 80
              end
              item
                Caption = 'name'
                Width = 133
              end
              item
                Caption = 'Owner'
                Width = 133
              end
              item
                Caption = 'Level'
                Width = 80
              end>
            GridLines = True
            ReadOnly = True
            RowSelect = True
            TabOrder = 0
            ViewStyle = vsReport
          end
        end
        object TabSheet9: TTabSheet
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Wizard'
          ImageIndex = 2
          object ListViewHeroWizzard: TListView
            Left = 0
            Top = 0
            Width = 561
            Height = 390
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alClient
            Columns = <
              item
                Caption = 'Index'
                Width = 80
              end
              item
                Caption = 'Name'
                Width = 133
              end
              item
                Caption = 'Owner'
                Width = 133
              end
              item
                Caption = 'Class'
                Width = 80
              end>
            GridLines = True
            ReadOnly = True
            RowSelect = True
            TabOrder = 0
            ViewStyle = vsReport
          end
        end
        object TabSheet11: TTabSheet
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Taoist'
          ImageIndex = 3
          object ListViewHeroMonk: TListView
            Left = 0
            Top = 0
            Width = 561
            Height = 390
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alClient
            Columns = <
              item
                Caption = 'Index'
                Width = 80
              end
              item
                Caption = 'Name'
                Width = 133
              end
              item
                Caption = 'Owner'
                Width = 133
              end
              item
                Caption = 'Level'
                Width = 80
              end>
            GridLines = True
            ReadOnly = True
            RowSelect = True
            TabOrder = 0
            ViewStyle = vsReport
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Master'
      ImageIndex = 2
      object ListViewMaster: TListView
        Left = 0
        Top = 0
        Width = 569
        Height = 425
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        Columns = <
          item
            Caption = 'Index'
            Width = 80
          end
          item
            Caption = 'Name'
            Width = 133
          end
          item
            Caption = 'Level'
            Width = 133
          end>
        GridLines = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
  end
end
