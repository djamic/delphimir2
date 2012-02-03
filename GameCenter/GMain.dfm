object frmMain: TfrmMain
  Left = 366
  Top = 134
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Mir2: Heroes Game Center - www.lomcn.co.uk'
  ClientHeight = 470
  ClientWidth = 670
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 10
    Top = 10
    Width = 650
    Height = 450
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ActivePage = TabSheet1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    HotTrack = True
    ParentFont = False
    TabOrder = 0
    object TabSheet1: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Main'
      object GroupBox5: TGroupBox
        Left = 10
        Top = 10
        Width = 621
        Height = 391
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Server Components'
        TabOrder = 0
        object EditM2ServerProgram: TEdit
          Left = 590
          Top = 80
          Width = 371
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ReadOnly = True
          TabOrder = 0
          Visible = False
        end
        object EditDBServerProgram: TEdit
          Left = 590
          Top = 20
          Width = 371
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ReadOnly = True
          TabOrder = 1
          Visible = False
        end
        object EditLoginSrvProgram: TEdit
          Left = 590
          Top = 50
          Width = 371
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ReadOnly = True
          TabOrder = 2
          Visible = False
        end
        object EditLogServerProgram: TEdit
          Left = 590
          Top = 110
          Width = 371
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ReadOnly = True
          TabOrder = 3
          Visible = False
        end
        object EditLoginGateProgram: TEdit
          Left = 590
          Top = 140
          Width = 371
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ReadOnly = True
          TabOrder = 4
          Visible = False
        end
        object EditSelGateProgram: TEdit
          Left = 590
          Top = 170
          Width = 371
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ReadOnly = True
          TabOrder = 5
          Visible = False
        end
        object EditRunGateProgram: TEdit
          Left = 590
          Top = 200
          Width = 371
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ReadOnly = True
          TabOrder = 6
          Visible = False
        end
        object ButtonStartGame: TButton
          Left = 220
          Top = 340
          Width = 181
          Height = 41
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '&Start Server'
          TabOrder = 7
          OnClick = ButtonStartGameClick
        end
        object CheckBoxM2Server: TCheckBox
          Left = 10
          Top = 45
          Width = 201
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'M2Server'
          TabOrder = 8
          OnClick = CheckBoxM2ServerClick
        end
        object CheckBoxDBServer: TCheckBox
          Left = 10
          Top = 25
          Width = 221
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'DBServer'
          TabOrder = 9
          OnClick = CheckBoxDBServerClick
        end
        object CheckBoxLoginServer: TCheckBox
          Left = 230
          Top = 25
          Width = 221
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'LoginSrv'
          TabOrder = 10
          OnClick = CheckBoxLoginServerClick
        end
        object CheckBoxLogServer: TCheckBox
          Left = 230
          Top = 45
          Width = 221
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'LogServer'
          TabOrder = 11
          OnClick = CheckBoxLogServerClick
        end
        object CheckBoxLoginGate: TCheckBox
          Left = 10
          Top = 65
          Width = 201
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'LoginGate'
          TabOrder = 12
          OnClick = CheckBoxLoginGateClick
        end
        object CheckBoxSelGate: TCheckBox
          Left = 230
          Top = 65
          Width = 201
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'SelGate'
          TabOrder = 13
          OnClick = CheckBoxSelGateClick
        end
        object CheckBoxRunGate: TCheckBox
          Left = 10
          Top = 85
          Width = 201
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Rungate'
          TabOrder = 14
          OnClick = CheckBoxRunGateClick
        end
        object EditRunGate1Program: TEdit
          Left = 590
          Top = 230
          Width = 371
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ReadOnly = True
          TabOrder = 15
          Visible = False
        end
        object EditRunGate2Program: TEdit
          Left = 590
          Top = 260
          Width = 371
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ReadOnly = True
          TabOrder = 16
          Visible = False
        end
        object MemoLog: TMemo
          Left = 10
          Top = 190
          Width = 591
          Height = 131
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Color = clNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clLime
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 17
          OnChange = MemoLogChange
        end
      end
    end
    object TabSheet15: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Account'
      ImageIndex = 5
      object GroupBox25: TGroupBox
        Left = 10
        Top = 10
        Width = 621
        Height = 401
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Account Management'
        TabOrder = 0
        object Label30: TLabel
          Left = 20
          Top = 30
          Width = 57
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Account:'
        end
        object EditSearchLoginAccount: TEdit
          Left = 90
          Top = 25
          Width = 131
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 0
        end
        object ButtonSearchLoginAccount: TButton
          Left = 230
          Top = 20
          Width = 81
          Height = 31
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '&Search'
          TabOrder = 1
          OnClick = ButtonSearchLoginAccountClick
        end
        object GroupBox26: TGroupBox
          Left = 10
          Top = 60
          Width = 601
          Height = 331
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Account Details'
          TabOrder = 2
          object Label31: TLabel
            Left = 70
            Top = 20
            Width = 18
            Height = 17
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Alignment = taRightJustify
            Caption = 'ID:'
          end
          object Label32: TLabel
            Left = 266
            Top = 20
            Width = 62
            Height = 17
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Alignment = taRightJustify
            Caption = 'M'#7853't kh'#7849'u:'
          end
          object Label33: TLabel
            Left = -13
            Top = 50
            Width = 101
            Height = 17
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Alignment = taRightJustify
            Caption = 'T'#234'n '#273#259'ng nh'#7853'p:'
          end
          object Label34: TLabel
            Left = 290
            Top = 50
            Width = 38
            Height = 17
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Alignment = taRightJustify
            Caption = 'ID s'#7889':'
          end
          object Label35: TLabel
            Left = 22
            Top = 80
            Width = 66
            Height = 17
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Alignment = taRightJustify
            Caption = 'ng'#224'y sinh:'
          end
          object Label36: TLabel
            Left = 14
            Top = 170
            Width = 74
            Height = 17
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Alignment = taRightJustify
            Caption = 'M'#7897't v'#7845'n '#273#7873':'
          end
          object Label37: TLabel
            Left = 1
            Top = 200
            Width = 87
            Height = 17
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Alignment = taRightJustify
            Caption = 'C'#226'u tr'#7843' l'#7901'i l'#224':'
          end
          object Label38: TLabel
            Left = 12
            Top = 230
            Width = 76
            Height = 17
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Alignment = taRightJustify
            Caption = 'Hai c'#226'u h'#7887'i:'
          end
          object Label39: TLabel
            Left = 19
            Top = 260
            Width = 69
            Height = 17
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Alignment = taRightJustify
            Caption = 'Tr'#7843' l'#7901'i hai:'
          end
          object Label40: TLabel
            Left = -32
            Top = 140
            Width = 120
            Height = 17
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Alignment = taRightJustify
            Caption = #272'i'#7879'n tho'#7841'i di '#273#7897'ng:'
          end
          object Label41: TLabel
            Left = 275
            Top = 80
            Width = 53
            Height = 17
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Alignment = taRightJustify
            Caption = 'L'#432'u '#253' 1:'
          end
          object Label42: TLabel
            Left = 259
            Top = 110
            Width = 69
            Height = 17
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Alignment = taRightJustify
            Caption = 'Ch'#250' gi'#7843'i 2:'
          end
          object Label43: TLabel
            Left = 52
            Top = 293
            Width = 46
            Height = 17
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Alignment = taRightJustify
            Caption = 'E-mail:'
          end
          object Label44: TLabel
            Left = 19
            Top = 110
            Width = 69
            Height = 17
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Alignment = taRightJustify
            Caption = #272'i'#7879'n tho'#7841'i:'
          end
          object EditLoginAccount: TEdit
            Left = 100
            Top = 20
            Width = 151
            Height = 25
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Enabled = False
            MaxLength = 10
            TabOrder = 0
            OnChange = EditLoginAccountChange
          end
          object EditLoginAccountPasswd: TEdit
            Left = 340
            Top = 20
            Width = 121
            Height = 25
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            MaxLength = 10
            TabOrder = 1
            OnChange = EditLoginAccountChange
          end
          object EditLoginAccountUserName: TEdit
            Left = 100
            Top = 50
            Width = 151
            Height = 25
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            MaxLength = 20
            TabOrder = 2
            OnChange = EditLoginAccountChange
          end
          object EditLoginAccountSSNo: TEdit
            Left = 340
            Top = 50
            Width = 151
            Height = 25
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            MaxLength = 14
            TabOrder = 3
            OnChange = EditLoginAccountChange
          end
          object EditLoginAccountBirthDay: TEdit
            Left = 100
            Top = 80
            Width = 151
            Height = 25
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            MaxLength = 10
            TabOrder = 4
            OnChange = EditLoginAccountChange
          end
          object EditLoginAccountQuiz: TEdit
            Left = 100
            Top = 170
            Width = 261
            Height = 25
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            MaxLength = 20
            TabOrder = 5
            OnChange = EditLoginAccountChange
          end
          object EditLoginAccountAnswer: TEdit
            Left = 100
            Top = 200
            Width = 261
            Height = 25
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            MaxLength = 12
            TabOrder = 6
            OnChange = EditLoginAccountChange
          end
          object EditLoginAccountQuiz2: TEdit
            Left = 100
            Top = 230
            Width = 261
            Height = 25
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            MaxLength = 20
            TabOrder = 7
            OnChange = EditLoginAccountChange
          end
          object EditLoginAccountAnswer2: TEdit
            Left = 100
            Top = 260
            Width = 261
            Height = 25
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            MaxLength = 12
            TabOrder = 8
            OnChange = EditLoginAccountChange
          end
          object EditLoginAccountMobilePhone: TEdit
            Left = 100
            Top = 140
            Width = 151
            Height = 25
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            MaxLength = 13
            TabOrder = 9
            OnChange = EditLoginAccountChange
          end
          object EditLoginAccountMemo1: TEdit
            Left = 340
            Top = 80
            Width = 251
            Height = 25
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            MaxLength = 20
            TabOrder = 10
            OnChange = EditLoginAccountChange
          end
          object EditLoginAccountEMail: TEdit
            Left = 100
            Top = 290
            Width = 261
            Height = 25
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            MaxLength = 40
            TabOrder = 11
            OnChange = EditLoginAccountChange
          end
          object EditLoginAccountMemo2: TEdit
            Left = 340
            Top = 110
            Width = 251
            Height = 25
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            MaxLength = 20
            TabOrder = 12
            OnChange = EditLoginAccountChange
          end
          object CkFullEditMode: TCheckBox
            Left = 470
            Top = 20
            Width = 121
            Height = 21
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'S'#7917'a '#273#7893'i c'#225'c th'#244'ng tin t'#224'i kho'#7843'n'
            TabOrder = 13
            OnClick = CkFullEditModeClick
          end
          object ButtonLoginAccountOK: TButton
            Left = 510
            Top = 280
            Width = 81
            Height = 31
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'X'#225'c '#273#7883'nh(&O)'
            Enabled = False
            TabOrder = 14
            OnClick = ButtonLoginAccountOKClick
          end
          object EditLoginAccountPhone: TEdit
            Left = 100
            Top = 110
            Width = 151
            Height = 25
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            MaxLength = 13
            TabOrder = 15
            OnChange = EditLoginAccountChange
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Server'
      ImageIndex = 1
      object PageControl2: TPageControl
        Left = 600
        Top = 180
        Width = 361
        Height = 241
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 0
      end
      object PageControl3: TPageControl
        Left = 0
        Top = 0
        Width = 642
        Height = 418
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ActivePage = TabSheet4
        Align = alClient
        TabOrder = 1
        TabPosition = tpBottom
        object TabSheet4: TTabSheet
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Server Details'
          object GroupBox1: TGroupBox
            Left = 10
            Top = 10
            Width = 611
            Height = 221
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'Server Details'
            TabOrder = 0
            object Label1: TLabel
              Left = 10
              Top = 35
              Width = 125
              Height = 17
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'MirServer Location:'
            end
            object Label2: TLabel
              Left = 10
              Top = 65
              Width = 110
              Height = 17
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Database Name:'
            end
            object Label3: TLabel
              Left = 10
              Top = 95
              Width = 90
              Height = 17
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Server Name:'
            end
            object Label4: TLabel
              Left = 10
              Top = 125
              Width = 122
              Height = 17
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Server IP Address:'
            end
            object Label59: TLabel
              Left = 230
              Top = 163
              Width = 41
              Height = 17
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Delay:'
            end
            object Label66: TLabel
              Left = 350
              Top = 163
              Width = 56
              Height = 17
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'seconds'
            end
            object EditGameDir: TEdit
              Left = 170
              Top = 30
              Width = 281
              Height = 25
              Hint = #36755#20837#26381#21153#22120#25152#22312#30446#24405#12290#19968#33324#40664#35748#20026#8220'D:\MirServer\'#8221#12290
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              TabOrder = 0
              Text = '.\'
            end
            object Button1: TButton
              Left = 500
              Top = 25
              Width = 91
              Height = 31
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Duy'#7879't(&B)'
              TabOrder = 1
              Visible = False
            end
            object EditHeroDB: TEdit
              Left = 170
              Top = 60
              Width = 281
              Height = 25
              Hint = #26381#21153#22120#31471'BDE '#25968#25454#24211#21517#31216#65292#40664#35748#20026' '#8220'HeroDB'#8221#12290
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              TabOrder = 2
              Text = 'HeroDB'
            end
            object EditGameName: TEdit
              Left = 170
              Top = 90
              Width = 201
              Height = 25
              Hint = #36755#20837#28216#25103#30340#21517#31216#12290
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              TabOrder = 3
              Text = 'LOMCN'
            end
            object EditGameExtIPaddr: TEdit
              Left = 170
              Top = 120
              Width = 121
              Height = 25
              Hint = #36755#20837#26381#21153#22120#30340#22806#32593'IP'#22320#22336#12290
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              TabOrder = 4
              Text = '127.0.0.1'
            end
            object CheckBoxDynamicIPMode: TCheckBox
              Left = 300
              Top = 120
              Width = 101
              Height = 21
              Hint = #21160#24577'IP'#22320#22336#27169#24335#65292#25903#25345#25300#21495#21160#24577'IP'#32593#32476#26465#20214#65292#25171#24320#27492#27169#24335#21518#65292#26381#21153#22120#31471#19981#38656#35201#25913#20219#20309'IP'#65292#33258#21160#35782#21035#30331#24405'IP'#22320#22336#12290
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Dynamic IP'
              TabOrder = 5
              OnClick = CheckBoxDynamicIPModeClick
            end
            object ButtonGeneralDefalult: TButton
              Left = 500
              Top = 180
              Width = 101
              Height = 31
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = '&Default'
              TabOrder = 6
              OnClick = ButtonGeneralDefalultClick
            end
            object CheckBoxAutoStartServer: TCheckBox
              Left = 10
              Top = 160
              Width = 221
              Height = 21
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Auto Start Server'
              TabOrder = 7
              OnClick = CheckBoxAutoStartServerClick
            end
            object EditAutoStartDelayTime: TSpinEdit
              Left = 280
              Top = 160
              Width = 61
              Height = 27
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              MaxValue = 0
              MinValue = 0
              TabOrder = 8
              Value = 0
              OnChange = EditAutoStartDelayTimeChange
            end
          end
          object ButtonNext1: TButton
            Left = 510
            Top = 329
            Width = 101
            Height = 41
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = '&Next'
            TabOrder = 1
            OnClick = ButtonNext1Click
          end
          object ButtonReLoadConfig: TButton
            Left = 510
            Top = 279
            Width = 101
            Height = 41
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = '&Reload'
            TabOrder = 2
            OnClick = ButtonReLoadConfigClick
          end
        end
        object TabSheet5: TTabSheet
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'LoginGate Details'
          ImageIndex = 1
          object ButtonNext2: TButton
            Left = 510
            Top = 329
            Width = 101
            Height = 41
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = '&Next'
            TabOrder = 0
            OnClick = ButtonNext2Click
          end
          object GroupBox2: TGroupBox
            Left = 10
            Top = 10
            Width = 611
            Height = 221
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'LoginGate'
            TabOrder = 1
            object GroupBox7: TGroupBox
              Left = 10
              Top = 20
              Width = 131
              Height = 91
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Position'
              TabOrder = 0
              object Label9: TLabel
                Left = 10
                Top = 25
                Width = 13
                Height = 17
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'X:'
              end
              object Label10: TLabel
                Left = 10
                Top = 55
                Width = 13
                Height = 17
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Y:'
              end
              object EditLoginGate_MainFormX: TSpinEdit
                Left = 30
                Top = 20
                Width = 81
                Height = 27
                Hint = #21551#21160#31243#24207#31383#21475#22312#23631#24149#19978#30340#20301#32622#65292#24231#26631'X'#12290
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                MaxValue = 10000
                MinValue = 0
                TabOrder = 0
                Value = 0
                OnChange = EditLoginGate_MainFormXChange
              end
              object EditLoginGate_MainFormY: TSpinEdit
                Left = 30
                Top = 50
                Width = 81
                Height = 27
                Hint = #21551#21160#31243#24207#31383#21475#22312#23631#24149#19978#30340#20301#32622#65292#24231#26631'Y'#12290
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                MaxValue = 10000
                MinValue = 0
                TabOrder = 1
                Value = 0
                OnChange = EditLoginGate_MainFormYChange
              end
            end
            object ButtonLoginGateDefault: TButton
              Left = 500
              Top = 180
              Width = 101
              Height = 31
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = '&Default'
              TabOrder = 1
              OnClick = ButtonLoginGateDefaultClick
            end
            object GroupBox23: TGroupBox
              Left = 150
              Top = 20
              Width = 161
              Height = 61
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Port used'
              TabOrder = 2
              object Label28: TLabel
                Left = 10
                Top = 25
                Width = 27
                Height = 17
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Port'
              end
              object EditLoginGate_GatePort: TEdit
                Left = 70
                Top = 20
                Width = 51
                Height = 25
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                TabOrder = 0
                Text = '7000'
              end
            end
            object GroupBox27: TGroupBox
              Left = 10
              Top = 120
              Width = 91
              Height = 51
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Auto Start'
              TabOrder = 3
              object CheckBoxboLoginGate_GetStart: TCheckBox
                Left = 10
                Top = 20
                Width = 71
                Height = 21
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Enable'
                TabOrder = 0
                OnClick = CheckBoxboLoginGate_GetStartClick
              end
            end
          end
          object ButtonPrv2: TButton
            Left = 400
            Top = 329
            Width = 101
            Height = 41
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = '&Previous'
            TabOrder = 2
            OnClick = ButtonPrv2Click
          end
        end
        object TabSheet6: TTabSheet
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'SelGate Details'
          ImageIndex = 2
          object GroupBox3: TGroupBox
            Left = 10
            Top = 10
            Width = 611
            Height = 221
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'SelGate'
            TabOrder = 0
            object GroupBox8: TGroupBox
              Left = 10
              Top = 20
              Width = 131
              Height = 91
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Position'
              TabOrder = 0
              object Label11: TLabel
                Left = 10
                Top = 25
                Width = 13
                Height = 17
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'X:'
              end
              object Label12: TLabel
                Left = 10
                Top = 55
                Width = 13
                Height = 17
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Y:'
              end
              object EditSelGate_MainFormX: TSpinEdit
                Left = 30
                Top = 20
                Width = 81
                Height = 27
                Hint = #21551#21160#31243#24207#31383#21475#22312#23631#24149#19978#30340#20301#32622#65292#24231#26631'X'#12290
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                MaxValue = 10000
                MinValue = 0
                TabOrder = 0
                Value = 0
                OnChange = EditSelGate_MainFormXChange
              end
              object EditSelGate_MainFormY: TSpinEdit
                Left = 30
                Top = 50
                Width = 81
                Height = 27
                Hint = #21551#21160#31243#24207#31383#21475#22312#23631#24149#19978#30340#20301#32622#65292#24231#26631'Y'#12290
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                MaxValue = 10000
                MinValue = 0
                TabOrder = 1
                Value = 0
                OnChange = EditSelGate_MainFormYChange
              end
            end
            object ButtonSelGateDefault: TButton
              Left = 500
              Top = 180
              Width = 101
              Height = 31
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = '&Default'
              TabOrder = 1
              OnClick = ButtonSelGateDefaultClick
            end
            object GroupBox24: TGroupBox
              Left = 150
              Top = 20
              Width = 161
              Height = 91
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Port used'
              TabOrder = 2
              object Label29: TLabel
                Left = 10
                Top = 25
                Width = 31
                Height = 17
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Port:'
              end
              object Label49: TLabel
                Left = 10
                Top = 55
                Width = 31
                Height = 17
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Port:'
              end
              object EditSelGate_GatePort: TEdit
                Left = 70
                Top = 20
                Width = 51
                Height = 25
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                TabOrder = 0
                Text = '7100'
              end
              object EditSelGate_GatePort1: TEdit
                Left = 70
                Top = 50
                Width = 51
                Height = 25
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                TabOrder = 1
                Text = '7100'
              end
            end
            object GroupBox28: TGroupBox
              Left = 10
              Top = 120
              Width = 91
              Height = 51
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Auto Start'
              TabOrder = 3
              object CheckBoxboSelGate_GetStart: TCheckBox
                Left = 10
                Top = 20
                Width = 71
                Height = 21
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Enable'
                TabOrder = 0
                OnClick = CheckBoxboSelGate_GetStartClick
              end
            end
          end
          object ButtonPrv3: TButton
            Left = 400
            Top = 329
            Width = 101
            Height = 41
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = '&Previous'
            TabOrder = 1
            OnClick = ButtonPrv3Click
          end
          object ButtonNext3: TButton
            Left = 510
            Top = 329
            Width = 101
            Height = 41
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = '&Next'
            TabOrder = 2
            OnClick = ButtonNext3Click
          end
        end
        object TabSheet12: TTabSheet
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'RunGate Details'
          ImageIndex = 8
          object ButtonPrv4: TButton
            Left = 400
            Top = 329
            Width = 101
            Height = 41
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = '&Previous'
            TabOrder = 0
            OnClick = ButtonPrv4Click
          end
          object ButtonNext4: TButton
            Left = 510
            Top = 329
            Width = 101
            Height = 41
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = '&Next'
            TabOrder = 1
            OnClick = ButtonNext4Click
          end
          object GroupBox17: TGroupBox
            Left = 10
            Top = 10
            Width = 611
            Height = 221
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'RunGate'
            TabOrder = 2
            object GroupBox18: TGroupBox
              Left = 10
              Top = 20
              Width = 131
              Height = 91
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Position'
              Enabled = False
              TabOrder = 0
              object Label21: TLabel
                Left = 10
                Top = 25
                Width = 13
                Height = 17
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'X:'
              end
              object Label22: TLabel
                Left = 10
                Top = 55
                Width = 13
                Height = 17
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Y:'
              end
              object EditRunGate_MainFormX: TSpinEdit
                Left = 30
                Top = 20
                Width = 81
                Height = 27
                Hint = #21551#21160#31243#24207#31383#21475#22312#23631#24149#19978#30340#20301#32622#65292#24231#26631'X'#12290
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Enabled = False
                MaxValue = 10000
                MinValue = 0
                TabOrder = 0
                Value = 0
              end
              object EditRunGate_MainFormY: TSpinEdit
                Left = 30
                Top = 50
                Width = 81
                Height = 27
                Hint = #21551#21160#31243#24207#31383#21475#22312#23631#24149#19978#30340#20301#32622#65292#24231#26631'Y'#12290
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Enabled = False
                MaxValue = 10000
                MinValue = 0
                TabOrder = 1
                Value = 0
              end
            end
            object GroupBox19: TGroupBox
              Left = 10
              Top = 120
              Width = 161
              Height = 71
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Number of RunGates'
              TabOrder = 1
              object Label23: TLabel
                Left = 10
                Top = 25
                Width = 56
                Height = 17
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Number:'
              end
              object EditRunGate_Connt: TSpinEdit
                Left = 80
                Top = 20
                Width = 51
                Height = 27
                Hint = #35774#32622#24320#21551#28216#25103#32593#20851#25968#37327#65292#19968#33324'200'#20154#20197#19979#30340#24320#19968#20010#32593#20851#65292'400'#20154#20197#19979#30340#24320#20108#20010#32593#20851#65292'400'#20154#20197#19978#30340#24320#19977#20010#32593#20851#12290
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                EditorEnabled = False
                Enabled = False
                MaxValue = 8
                MinValue = 1
                TabOrder = 0
                Value = 1
                OnChange = EditRunGate_ConntChange
              end
            end
            object GroupBox22: TGroupBox
              Left = 150
              Top = 20
              Width = 121
              Height = 61
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Port used'
              TabOrder = 2
              object LabelRunGate_GatePort1: TLabel
                Left = 10
                Top = 25
                Width = 31
                Height = 17
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Port:'
              end
              object EditRunGate_GatePort1: TEdit
                Left = 50
                Top = 20
                Width = 51
                Height = 25
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                TabOrder = 0
                Text = '7200'
              end
            end
            object ButtonRunGateDefault: TButton
              Left = 500
              Top = 180
              Width = 101
              Height = 31
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = '&Default'
              TabOrder = 3
              OnClick = ButtonRunGateDefaultClick
            end
          end
        end
        object TabSheet7: TTabSheet
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'LoginSrv Details'
          ImageIndex = 3
          object GroupBox9: TGroupBox
            Left = 10
            Top = 10
            Width = 611
            Height = 221
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'LoginServer'
            TabOrder = 0
            object GroupBox10: TGroupBox
              Left = 10
              Top = 20
              Width = 131
              Height = 91
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Position'
              TabOrder = 0
              object Label13: TLabel
                Left = 10
                Top = 25
                Width = 13
                Height = 17
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'X:'
              end
              object Label14: TLabel
                Left = 10
                Top = 55
                Width = 13
                Height = 17
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Y:'
              end
              object EditLoginServer_MainFormX: TSpinEdit
                Left = 30
                Top = 20
                Width = 81
                Height = 27
                Hint = #21551#21160#31243#24207#31383#21475#22312#23631#24149#19978#30340#20301#32622#65292#24231#26631'X'#12290
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                MaxValue = 10000
                MinValue = 0
                TabOrder = 0
                Value = 0
                OnChange = EditLoginServer_MainFormXChange
              end
              object EditLoginServer_MainFormY: TSpinEdit
                Left = 30
                Top = 50
                Width = 81
                Height = 27
                Hint = #21551#21160#31243#24207#31383#21475#22312#23631#24149#19978#30340#20301#32622#65292#24231#26631'Y'#12290
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                MaxValue = 10000
                MinValue = 0
                TabOrder = 1
                Value = 0
                OnChange = EditLoginServer_MainFormYChange
              end
            end
            object ButtonLoginServerConfig: TButton
              Left = 370
              Top = 180
              Width = 121
              Height = 31
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'LoginSrv Config'
              TabOrder = 1
              Visible = False
              OnClick = ButtonLoginServerConfigClick
            end
            object ButtonLoginSrvDefault: TButton
              Left = 500
              Top = 180
              Width = 101
              Height = 31
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = '&Default'
              TabOrder = 2
              OnClick = ButtonLoginSrvDefaultClick
            end
            object GroupBox33: TGroupBox
              Left = 150
              Top = 20
              Width = 161
              Height = 91
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Ports used'
              TabOrder = 3
              object Label50: TLabel
                Left = 10
                Top = 25
                Width = 62
                Height = 17
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'GatePort:'
              end
              object Label51: TLabel
                Left = 10
                Top = 55
                Width = 74
                Height = 17
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'ServerPort:'
              end
              object EditLoginServerGatePort: TEdit
                Left = 90
                Top = 20
                Width = 51
                Height = 25
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                TabOrder = 0
                Text = '7200'
              end
              object EditLoginServerServerPort: TEdit
                Left = 90
                Top = 50
                Width = 51
                Height = 25
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                TabOrder = 1
                Text = '7200'
              end
            end
            object GroupBox34: TGroupBox
              Left = 10
              Top = 120
              Width = 91
              Height = 51
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Auto Start'
              TabOrder = 4
              object CheckBoxboLoginServer_GetStart: TCheckBox
                Left = 10
                Top = 20
                Width = 71
                Height = 21
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Enable'
                TabOrder = 0
                OnClick = CheckBoxboLoginServer_GetStartClick
              end
            end
          end
          object ButtonPrv5: TButton
            Left = 400
            Top = 329
            Width = 101
            Height = 41
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = '&Previous'
            TabOrder = 1
            OnClick = ButtonPrv5Click
          end
          object ButtonNext5: TButton
            Left = 510
            Top = 329
            Width = 101
            Height = 41
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = '&Next'
            TabOrder = 2
            OnClick = ButtonNext5Click
          end
        end
        object TabSheet8: TTabSheet
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'DBSrv Details'
          ImageIndex = 4
          object GroupBox11: TGroupBox
            Left = 10
            Top = 10
            Width = 611
            Height = 221
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'DB Server'
            TabOrder = 0
            object GroupBox12: TGroupBox
              Left = 10
              Top = 20
              Width = 121
              Height = 91
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Position'
              TabOrder = 0
              object Label15: TLabel
                Left = 10
                Top = 25
                Width = 13
                Height = 17
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'X:'
              end
              object Label16: TLabel
                Left = 10
                Top = 55
                Width = 13
                Height = 17
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Y:'
              end
              object EditDBServer_MainFormX: TSpinEdit
                Left = 30
                Top = 20
                Width = 81
                Height = 27
                Hint = #21551#21160#31243#24207#31383#21475#22312#23631#24149#19978#30340#20301#32622#65292#24231#26631'X'#12290
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                MaxValue = 10000
                MinValue = 0
                TabOrder = 0
                Value = 0
                OnChange = EditDBServer_MainFormXChange
              end
              object EditDBServer_MainFormY: TSpinEdit
                Left = 30
                Top = 50
                Width = 81
                Height = 27
                Hint = #21551#21160#31243#24207#31383#21475#22312#23631#24149#19978#30340#20301#32622#65292#24231#26631'Y'#12290
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                MaxValue = 10000
                MinValue = 0
                TabOrder = 1
                Value = 0
                OnChange = EditDBServer_MainFormYChange
              end
            end
            object GroupBox20: TGroupBox
              Left = 110
              Top = 120
              Width = 111
              Height = 51
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Auto Game'
              TabOrder = 1
              Visible = False
              object CheckBoxDisableAutoGame: TCheckBox
                Left = 10
                Top = 20
                Width = 91
                Height = 21
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Disable'
                TabOrder = 0
                OnClick = CheckBoxDisableAutoGameClick
              end
            end
            object ButtonDBServerDefault: TButton
              Left = 500
              Top = 180
              Width = 101
              Height = 31
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = '&Default'
              TabOrder = 2
              OnClick = ButtonDBServerDefaultClick
            end
            object GroupBox35: TGroupBox
              Left = 10
              Top = 120
              Width = 91
              Height = 51
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Auto Start'
              TabOrder = 3
              object CheckBoxDBServerGetStart: TCheckBox
                Left = 10
                Top = 20
                Width = 71
                Height = 21
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Enable'
                TabOrder = 0
                OnClick = CheckBoxDBServerGetStartClick
              end
            end
            object GroupBox36: TGroupBox
              Left = 140
              Top = 20
              Width = 161
              Height = 91
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Ports used'
              TabOrder = 4
              object Label52: TLabel
                Left = 10
                Top = 25
                Width = 62
                Height = 17
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'GatePort:'
              end
              object Label53: TLabel
                Left = 10
                Top = 55
                Width = 74
                Height = 17
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'ServerPort:'
              end
              object EditDBServerGatePort: TEdit
                Left = 90
                Top = 20
                Width = 51
                Height = 25
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                TabOrder = 0
                Text = '5100'
              end
              object EditDBServerServerPort: TEdit
                Left = 90
                Top = 50
                Width = 51
                Height = 25
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                TabOrder = 1
                Text = '6000'
              end
            end
          end
          object ButtonPrv6: TButton
            Left = 400
            Top = 329
            Width = 101
            Height = 41
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = '&Previous'
            TabOrder = 1
            OnClick = ButtonPrv6Click
          end
          object ButtonNext6: TButton
            Left = 510
            Top = 329
            Width = 101
            Height = 41
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = '&Next'
            TabOrder = 2
            OnClick = ButtonNext6Click
          end
        end
        object TabSheet9: TTabSheet
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'LogData Details'
          ImageIndex = 5
          object GroupBox13: TGroupBox
            Left = 10
            Top = 10
            Width = 611
            Height = 221
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'LogData Server'
            TabOrder = 0
            object GroupBox14: TGroupBox
              Left = 10
              Top = 20
              Width = 131
              Height = 91
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Position'
              TabOrder = 0
              object Label17: TLabel
                Left = 10
                Top = 25
                Width = 13
                Height = 17
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'X:'
              end
              object Label18: TLabel
                Left = 10
                Top = 55
                Width = 13
                Height = 17
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Y:'
              end
              object EditLogServer_MainFormX: TSpinEdit
                Left = 30
                Top = 20
                Width = 81
                Height = 27
                Hint = #21551#21160#31243#24207#31383#21475#22312#23631#24149#19978#30340#20301#32622#65292#24231#26631'X'#12290
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                MaxValue = 10000
                MinValue = 0
                TabOrder = 0
                Value = 0
                OnChange = EditLogServer_MainFormXChange
              end
              object EditLogServer_MainFormY: TSpinEdit
                Left = 30
                Top = 50
                Width = 81
                Height = 27
                Hint = #21551#21160#31243#24207#31383#21475#22312#23631#24149#19978#30340#20301#32622#65292#24231#26631'Y'#12290
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                MaxValue = 10000
                MinValue = 0
                TabOrder = 1
                Value = 0
                OnChange = EditLogServer_MainFormYChange
              end
            end
            object ButtonLogServerDefault: TButton
              Left = 500
              Top = 180
              Width = 101
              Height = 31
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = '&Default'
              TabOrder = 1
              OnClick = ButtonLogServerDefaultClick
            end
            object GroupBox37: TGroupBox
              Left = 10
              Top = 120
              Width = 161
              Height = 51
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Auto Start'
              TabOrder = 2
              object CheckBoxLogServerGetStart: TCheckBox
                Left = 10
                Top = 20
                Width = 141
                Height = 21
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Enable'
                TabOrder = 0
                OnClick = CheckBoxLogServerGetStartClick
              end
            end
            object GroupBox38: TGroupBox
              Left = 150
              Top = 20
              Width = 111
              Height = 61
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Port used'
              TabOrder = 3
              object Label54: TLabel
                Left = 10
                Top = 25
                Width = 31
                Height = 17
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Port:'
              end
              object EditLogServerPort: TEdit
                Left = 50
                Top = 20
                Width = 51
                Height = 25
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                TabOrder = 0
                Text = '10000'
              end
            end
          end
          object ButtonPrv7: TButton
            Left = 400
            Top = 329
            Width = 101
            Height = 41
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = '&Previous'
            TabOrder = 1
            OnClick = ButtonPrv7Click
          end
          object ButtonNext7: TButton
            Left = 510
            Top = 329
            Width = 101
            Height = 41
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = '&Next'
            TabOrder = 2
            OnClick = ButtonNext7Click
          end
        end
        object TabSheet10: TTabSheet
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'M2Server Details'
          ImageIndex = 6
          object GroupBox15: TGroupBox
            Left = 10
            Top = 10
            Width = 611
            Height = 221
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'M2Server'
            TabOrder = 0
            object GroupBox16: TGroupBox
              Left = 10
              Top = 20
              Width = 121
              Height = 91
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Position'
              TabOrder = 0
              object Label19: TLabel
                Left = 10
                Top = 25
                Width = 13
                Height = 17
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'X:'
              end
              object Label20: TLabel
                Left = 10
                Top = 55
                Width = 13
                Height = 17
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Y:'
              end
              object EditM2Server_MainFormX: TSpinEdit
                Left = 30
                Top = 20
                Width = 81
                Height = 27
                Hint = #21551#21160#31243#24207#31383#21475#22312#23631#24149#19978#30340#20301#32622#65292#24231#26631'X'#12290
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                MaxValue = 10000
                MinValue = 0
                TabOrder = 0
                Value = 0
                OnChange = EditM2Server_MainFormXChange
              end
              object EditM2Server_MainFormY: TSpinEdit
                Left = 30
                Top = 50
                Width = 81
                Height = 27
                Hint = #21551#21160#31243#24207#31383#21475#22312#23631#24149#19978#30340#20301#32622#65292#24231#26631'Y'#12290
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                MaxValue = 10000
                MinValue = 0
                TabOrder = 1
                Value = 0
                OnChange = EditM2Server_MainFormYChange
              end
            end
            object ButtonM2ServerDefault: TButton
              Left = 500
              Top = 180
              Width = 101
              Height = 31
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = '&Default'
              TabOrder = 1
              OnClick = ButtonM2ServerDefaultClick
            end
            object GroupBox32: TGroupBox
              Left = 310
              Top = 20
              Width = 181
              Height = 91
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'TestServer Details'
              TabOrder = 2
              object Label61: TLabel
                Left = 10
                Top = 25
                Width = 71
                Height = 17
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Test Level:'
              end
              object Label62: TLabel
                Left = 10
                Top = 55
                Width = 67
                Height = 17
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Test Gold:'
              end
              object EditM2Server_TestLevel: TSpinEdit
                Left = 85
                Top = 20
                Width = 86
                Height = 27
                Hint = #20154#29289#36215#22987#31561#32423#12290
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                MaxValue = 20000
                MinValue = 0
                TabOrder = 0
                Value = 10
                OnChange = EditM2Server_TestLevelChange
              end
              object EditM2Server_TestGold: TSpinEdit
                Left = 85
                Top = 50
                Width = 86
                Height = 27
                Hint = #27979#35797#27169#24335#20154#29289#36215#22987#37329#24065#25968#12290
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Increment = 1000
                MaxValue = 20000000
                MinValue = 0
                TabOrder = 1
                Value = 10
                OnChange = EditM2Server_TestGoldChange
              end
            end
            object GroupBox39: TGroupBox
              Left = 140
              Top = 20
              Width = 161
              Height = 91
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Ports used'
              TabOrder = 3
              object Label55: TLabel
                Left = 10
                Top = 25
                Width = 66
                Height = 17
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Gate Port:'
              end
              object Label56: TLabel
                Left = 10
                Top = 55
                Width = 78
                Height = 17
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Server Port:'
              end
              object EditM2ServerGatePort: TEdit
                Left = 90
                Top = 20
                Width = 51
                Height = 25
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                TabOrder = 0
                Text = '5000'
              end
              object EditM2ServerMsgSrvPort: TEdit
                Left = 90
                Top = 50
                Width = 51
                Height = 25
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                TabOrder = 1
                Text = '4900'
              end
            end
            object GroupBox40: TGroupBox
              Left = 10
              Top = 120
              Width = 241
              Height = 51
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Auto Start'
              TabOrder = 4
              object CheckBoxM2ServerGetStart: TCheckBox
                Left = 10
                Top = 20
                Width = 211
                Height = 21
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Enable'
                TabOrder = 0
                OnClick = CheckBoxM2ServerGetStartClick
              end
            end
          end
          object ButtonPrv8: TButton
            Left = 400
            Top = 329
            Width = 101
            Height = 41
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = '&Previous'
            TabOrder = 1
            OnClick = ButtonPrv8Click
          end
          object ButtonNext8: TButton
            Left = 510
            Top = 329
            Width = 101
            Height = 41
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = '&Next'
            TabOrder = 2
            OnClick = ButtonNext8Click
          end
        end
        object TabSheet11: TTabSheet
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Save Details'
          ImageIndex = 7
          object ButtonSave: TButton
            Left = 510
            Top = 329
            Width = 101
            Height = 41
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = '&Save'
            TabOrder = 0
            OnClick = ButtonSaveClick
          end
          object ButtonGenGameConfig: TButton
            Left = 270
            Top = 329
            Width = 121
            Height = 41
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = '&Generate Config'
            TabOrder = 1
            OnClick = ButtonGenGameConfigClick
          end
          object ButtonPrv9: TButton
            Left = 400
            Top = 329
            Width = 101
            Height = 41
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = '&Previous'
            TabOrder = 2
            OnClick = ButtonPrv9Click
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Backup'
      ImageIndex = 2
      object LabelBackMsg: TLabel
        Left = 480
        Top = 380
        Width = 4
        Height = 20
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Font.Charset = GB2312_CHARSET
        Font.Color = clGreen
        Font.Height = -15
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object GroupBox4: TGroupBox
        Left = 10
        Top = 10
        Width = 621
        Height = 191
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Sao l'#432'u danh s'#225'ch'
        TabOrder = 0
        object ListViewDataBackup: TListView
          Left = 10
          Top = 20
          Width = 601
          Height = 161
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Columns = <
            item
              Caption = 'd'#7919' li'#7879'u th'#432' m'#7909'c'
              Width = 275
            end
            item
              Caption = 'Sao l'#432'u th'#432' m'#7909'c'
              Width = 275
            end>
          GridLines = True
          Items.ItemData = {}
          ReadOnly = True
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
          OnClick = ListViewDataBackupClick
        end
      end
      object GroupBox6: TGroupBox
        Left = 10
        Top = 210
        Width = 621
        Height = 151
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'bi'#234'n t'#7853'p vi'#234'n'
        TabOrder = 1
        object Label5: TLabel
          Left = 10
          Top = 25
          Width = 112
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Th'#432' m'#7909'c d'#7919' li'#7879'u:'
        end
        object Label6: TLabel
          Left = 10
          Top = 55
          Width = 114
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Sao l'#432'u th'#432' m'#7909'c:'
        end
        object Label7: TLabel
          Left = 215
          Top = 85
          Width = 32
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #273'i'#7875'm'
        end
        object Label8: TLabel
          Left = 338
          Top = 83
          Width = 32
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #273'i'#7875'm'
        end
        object Label64: TLabel
          Left = 210
          Top = 115
          Width = 21
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'gi'#7901
        end
        object Label65: TLabel
          Left = 338
          Top = 113
          Width = 32
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #273'i'#7875'm'
        end
        object RadioButtonBackMode1: TRadioButton
          Left = 10
          Top = 80
          Width = 95
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'm'#7895'i ng'#224'y'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RadioButtonBackMode1Click
        end
        object RzButtonEditSource: TRzButtonEdit
          Left = 130
          Top = 20
          Width = 481
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 1
          AltBtnWidth = 21
          ButtonWidth = 21
          OnButtonClick = RzButtonEditSourceButtonClick
        end
        object RzButtonEditDest: TRzButtonEdit
          Left = 130
          Top = 50
          Width = 481
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 2
          AltBtnWidth = 21
          ButtonWidth = 21
          OnButtonClick = RzButtonEditDestButtonClick
        end
        object RadioButtonBackMode2: TRadioButton
          Left = 10
          Top = 110
          Width = 127
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #7903' kho'#7843'ng th'#7901'i gian'
          TabOrder = 3
          OnClick = RadioButtonBackMode2Click
        end
        object RzSpinEditHour1: TRzSpinEdit
          Left = 145
          Top = 80
          Width = 59
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Max = 23.000000000000000000
          TabOrder = 4
        end
        object RzSpinEditHour2: TRzSpinEdit
          Left = 145
          Top = 110
          Width = 59
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Max = 10000000000.000000000000000000
          TabOrder = 5
        end
        object RzSpinEditMin1: TRzSpinEdit
          Left = 268
          Top = 78
          Width = 59
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Max = 59.000000000000000000
          TabOrder = 6
        end
        object CheckBoxBackUp: TCheckBox
          Left = 384
          Top = 100
          Width = 72
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Sao l'#432'u'
          TabOrder = 7
        end
        object RzSpinEditMin2: TRzSpinEdit
          Left = 268
          Top = 108
          Width = 59
          Height = 25
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Max = 59.000000000000000000
          TabOrder = 8
        end
        object CheckBoxZip: TCheckBox
          Left = 464
          Top = 100
          Width = 61
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'n'#233'n'
          TabOrder = 9
        end
      end
      object ButtonBackChg: TButton
        Left = 10
        Top = 370
        Width = 81
        Height = 31
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 's'#432#777'a '#273#244#777'i(&C)'
        TabOrder = 2
        OnClick = ButtonBackChgClick
      end
      object ButtonBackDel: TButton
        Left = 100
        Top = 370
        Width = 81
        Height = 31
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'x'#243'a(&D)'
        TabOrder = 3
        OnClick = ButtonBackDelClick
      end
      object ButtonBackAdd: TButton
        Left = 190
        Top = 370
        Width = 81
        Height = 31
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 't'#259'ng l'#234'n(&A)'
        TabOrder = 4
        OnClick = ButtonBackAddClick
      end
      object ButtonBackStart: TButton
        Left = 370
        Top = 370
        Width = 94
        Height = 31
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'B'#7855't '#273#7847'u(&B)'
        TabOrder = 5
        OnClick = ButtonBackStartClick
      end
      object ButtonBackSave: TButton
        Left = 280
        Top = 370
        Width = 81
        Height = 31
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'l'#432'u(&S)'
        TabOrder = 6
        OnClick = ButtonBackSaveClick
      end
    end
    object TabSheet13: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'About'
      ImageIndex = 3
      object GroupBox41: TGroupBox
        Left = 10
        Top = 10
        Width = 621
        Height = 291
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'About'
        TabOrder = 0
        object LabelVersion: TLabel
          Left = 10
          Top = 20
          Width = 170
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Mir2: Heroes GameCenter'
        end
        object Label60: TLabel
          Left = 10
          Top = 40
          Width = 77
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Version: 1.0'
        end
        object Label63: TLabel
          Left = 10
          Top = 60
          Width = 142
          Height = 17
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Released: 20/01/2011'
        end
      end
    end
    object TabSheetDebug: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'ki'#7875'm tra'
      ImageIndex = 6
      object GroupBox29: TGroupBox
        Left = 10
        Top = 0
        Width = 621
        Height = 411
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'X'#7917' l'#253' th'#244'ng tin'
        TabOrder = 0
        object GroupBox30: TGroupBox
          Left = 10
          Top = 20
          Width = 331
          Height = 141
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'tr'#242' ch'#417'i '#273#7897'ng c'#417
          TabOrder = 0
          object Label45: TLabel
            Left = 10
            Top = 25
            Width = 46
            Height = 17
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = #273#7883'a ch'#7881':'
          end
          object Label46: TLabel
            Left = 10
            Top = 55
            Width = 84
            Height = 17
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'Ki'#7875'm tra m'#227':'
          end
          object Label58: TLabel
            Left = 10
            Top = 85
            Width = 126
            Height = 17
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'Ki'#7875'm tra c'#225'c chu'#7895'i:'
          end
          object EditM2CheckCodeAddr: TEdit
            Left = 105
            Top = 20
            Width = 121
            Height = 25
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            TabOrder = 0
          end
          object EditM2CheckCode: TEdit
            Left = 105
            Top = 50
            Width = 121
            Height = 25
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            TabOrder = 1
          end
          object ButtonM2Suspend: TButton
            Left = 250
            Top = 40
            Width = 71
            Height = 31
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'T'#7841'm d'#7915'ng'
            TabOrder = 2
            Visible = False
            OnClick = ButtonM2SuspendClick
          end
          object EditM2CheckStr: TEdit
            Left = 144
            Top = 80
            Width = 177
            Height = 25
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            TabOrder = 3
          end
        end
        object GroupBox31: TGroupBox
          Left = 10
          Top = 170
          Width = 331
          Height = 131
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'C'#417' s'#7903' d'#7919' li'#7879'u'
          TabOrder = 1
          object Label47: TLabel
            Left = 10
            Top = 25
            Width = 46
            Height = 17
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = #273#7883'a ch'#7881':'
          end
          object Label48: TLabel
            Left = 10
            Top = 55
            Width = 84
            Height = 17
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'Ki'#7875'm tra m'#227':'
          end
          object Label57: TLabel
            Left = 10
            Top = 85
            Width = 94
            Height = 17
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'Ki'#7875'm tra chu'#7895'i'
          end
          object EditDBCheckCodeAddr: TEdit
            Left = 97
            Top = 20
            Width = 121
            Height = 25
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            TabOrder = 0
          end
          object EditDBCheckCode: TEdit
            Left = 97
            Top = 50
            Width = 121
            Height = 25
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            TabOrder = 1
          end
          object Button3: TButton
            Left = 250
            Top = 40
            Width = 71
            Height = 31
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'T'#7841'm d'#7915'ng'
            TabOrder = 2
            Visible = False
            OnClick = ButtonM2SuspendClick
          end
          object EditDBCheckStr: TEdit
            Left = 112
            Top = 80
            Width = 209
            Height = 25
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            TabOrder = 3
          end
        end
      end
    end
  end
  object TimerStartGame: TTimer
    Enabled = False
    Interval = 200
    OnTimer = TimerStartGameTimer
    Left = 408
    Top = 24
  end
  object TimerStopGame: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimerStopGameTimer
    Left = 440
    Top = 24
  end
  object TimerCheckRun: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = TimerCheckRunTimer
    Left = 472
    Top = 24
  end
  object ServerSocket: TServerSocket
    Active = False
    Port = 6350
    ServerType = stNonBlocking
    OnClientConnect = ServerSocketClientConnect
    OnClientDisconnect = ServerSocketClientDisconnect
    OnClientRead = ServerSocketClientRead
    OnClientError = ServerSocketClientError
    Left = 504
    Top = 64
  end
  object Timer: TTimer
    Enabled = False
    Interval = 10
    OnTimer = TimerTimer
    Left = 504
    Top = 24
  end
  object TimerCheckDebug: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimerCheckDebugTimer
    Left = 544
    Top = 80
  end
  object TimerUpDate: TTimer
    Enabled = False
    OnTimer = TimerUpDateTimer
    Left = 412
    Top = 55
  end
  object TimerAutoStartServer: TTimer
    Enabled = False
    OnTimer = TimerAutoStartServerTimer
    Left = 452
    Top = 71
  end
end
