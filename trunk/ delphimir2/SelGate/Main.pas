unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JSocket, ExtCtrls, StdCtrls, Common, EncryptUnit, Grobal2,
  ComCtrls, RzListVw, ImgList, RzButton, Menus, RzPanel, RzStatus,
  HUtil32, GateShare, Share, Mudutil, Clipbrd, IniFiles;

type

  TfrmMain = class(TForm)
    TimerStart: TTimer;
    StatusBar: TRzStatusBar;
    RzToolbar1: TRzToolbar;
    MainMenu: TMainMenu;
    MENU_CONTROL: TMenuItem;
    MENU_CONTROL_CLEAELOG: TMenuItem;
    MENU_CONTROL_EXIT: TMenuItem;
    MENU_OPTION: TMenuItem;
    MENU_OPTION_GENERAL: TMenuItem;
    MENU_OPTION_IPFILTER: TMenuItem;
    H1: TMenuItem;
    MENU_OPTION_HELP: TMenuItem;
    ButtonStart: TRzToolButton;
    imlMain: TImageList;
    ButtonStop: TRzToolButton;
    StatusPane1: TRzStatusPane;
    StatusPane2: TRzStatusPane;
    StatusPane3: TRzStatusPane;
    MENU_START: TMenuItem;
    MENU_STOP: TMenuItem;
    PopupMenu: TPopupMenu;
    POPUPMENU_SAVE: TMenuItem;
    MENU_VIEW: TMenuItem;
    MENU_VIEW_LOGMSG: TMenuItem;
    MENU_LOADBLOCKIPLIST: TMenuItem;
    RzPanel: TRzPanel;
    ListViewLog: TRzListView;
    MENU_CONTROL_OPENATTACK: TMenuItem;
    Timer: TTimer;
    MENU_VIEW_SENDMSG: TMenuItem;
    ServerSocket: TServerSocket;
    POPUPMENU_COPY: TMenuItem;
    POPUPMENU_SELALL: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TimerStartTimer(Sender: TObject);
    procedure ButtonStartClick(Sender: TObject);
    procedure MENU_CONTROL_CLEAELOGClick(Sender: TObject);
    procedure MENU_CONTROL_EXITClick(Sender: TObject);
    procedure POPUPMENU_SAVEClick(Sender: TObject);
    procedure MENU_VIEW_LOGMSGClick(Sender: TObject);
    procedure MENU_OPTION_GENERALClick(Sender: TObject);
    procedure MENU_LOADBLOCKIPLISTClick(Sender: TObject);
    procedure MENU_OPTION_IPFILTERClick(Sender: TObject);
    procedure MENU_OPTION_HELPClick(Sender: TObject);
    procedure MENU_CONTROL_OPENATTACKClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure ListViewLogChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure ServerSocketClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocketClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocketClientError(Sender: TObject;
      Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
      var ErrorCode: Integer);
    procedure ServerSocketClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure POPUPMENU_COPYClick(Sender: TObject);
    procedure POPUPMENU_SELALLClick(Sender: TObject);
  private
    { Private declarations }
    procedure StopService;
    procedure StartService;
  public
    { Public declarations }

    procedure MyMessage(var MsgData: TWmCopyData); message WM_COPYDATA;
    procedure CloseConnect(sUserIpAddr: string);
    procedure OnProgramException(Sender: TObject; E: Exception);
  end;

var
  frmMain: TfrmMain;
implementation

uses GeneralConfig, Option;

{$R *.dfm}

procedure TfrmMain.OnProgramException(Sender: TObject; E: Exception);
begin
  MainOutMessage(E.Message, nil);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  nX, nY: Integer;
begin
{$IF TESTMODE = 1}
  g_TestList := TStringList.Create;
{$IFEND}
  g_boClose := False;
  Application.OnException := OnProgramException;

  g_dwGameCenterHandle := Str_ToInt(ParamStr(1), 0);
  nX := Str_ToInt(ParamStr(2), -1);
  nY := Str_ToInt(ParamStr(3), -1);
  if (nX >= 0) or (nY >= 0) then begin
    Left := nX;
    Top := nY;
  end;
  SendGameCenterMsg(SG_FORMHANDLE, IntToStr(Self.Handle));
  MainOutMessage(g_sProductName, nil);
  MainOutMessage(g_sUpDateTime, nil);
  MainOutMessage(g_sProgram, nil);
  MainOutMessage(g_sWebSite, nil);
  MainOutMessage('Game Center Message...', nil);
  g_boShowLog := MENU_VIEW_LOGMSG.Checked;
  g_Config.boStarted := False;

  g_SessionList := TSessionList.Create;
  g_QuickList := TQuickList.Create;
  g_CCAttackIPList := TGStringList.Create;
  g_BlockIPList := TGStringList.Create;
  g_BlockIPArray := TStringList.Create;
  RzPanel.DoubleBuffered := True;
  SendGameCenterMsg(SG_STARTNOW, g_sNowStartGate);
  TimerStart.Enabled := True;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
{$IF TESTMODE = 1}
  g_TestList.SaveToFile('Test.txt');
  //g_TestList.Free;
{$IFEND}
  if g_Config.boStarted then begin
    if Application.MessageBox('Are you sure you want to close this gate?',
      'Exit',
      MB_YESNO + MB_ICONQUESTION) = IDYES then begin
      Caption := g_Config.TitleName + ' [���ڹرշ���...]';
      g_boClose := True;
      TimerStart.Enabled := True;
      CanClose := False;
    end else CanClose := False;
  end;
end;

procedure TfrmMain.StartService;
begin
  try
    LoadConfig;
    Caption := g_Config.GateName + ' - ' + g_Config.TitleName;
    g_SessionList.MaxCount := g_Config.nMaxCount;
    g_boServiceStart := False;
    g_boGateReady := False;

    g_nNewAccountCount := 0;
    g_dwNewAccountTick := GetTickCount();
    g_dwClearBlockIPListTick := GetTickCount();
    g_dwStartServiceTick := GetTickCount();
    g_boStartService := False;

    g_boOldCheckAttack := False;
    g_nAttackCount := 0;
    g_dwLastAttackTick := GetTickCount();

    g_nSessionCount := 0;
    g_boGateReady := False;
    g_boServerReady := False;
    MENU_CONTROL_OPENATTACK.Checked := g_boCheckAttack;
    g_ClientThread := TClientThread.Create(True);
    g_ClientThread.Resume;

    ServerSocket.Port := g_Config.GatePort; { Use telnet port   }
    ServerSocket.Address := g_Config.GateAddr; { Use any interface }
    ServerSocket.Active := True;
    g_boServiceStart := True;
    g_boServerReady := True;


   { ClientSocket.Port := g_Config.ServerPort;
    ClientSocket.Address := g_Config.ServerAddr;
    ClientSocket.Active := True;  }

    Timer.Enabled := True;
    MainOutMessage('Select Gate Running...', nil);

    g_Config.boStarted := True;
    g_boClose := False;
    ButtonStart.Enabled := False;
    ButtonStop.Enabled := True;
    MENU_START.Enabled := False;
    MENU_STOP.Enabled := True;
    SendGameCenterMsg(SG_STARTOK, g_sNowStartOK);

    if g_Config.boMinimize then begin
      Application.Minimize;
    end;
  except
    on E: Exception do begin
      ButtonStart.Enabled := True;
      ButtonStop.Enabled := False;
      MENU_START.Enabled := True;
      MENU_STOP.Enabled := False;
      MainOutMessage(E.Message, nil);
    end;
  end;
end;

procedure TfrmMain.StopService;
var
  I: Integer;
begin
  MainOutMessage('Stopping Connections...', nil);
  g_Config.boStarted := False;
  g_boServiceStart := False;
  //Initialize();
  ClearSession;

  ServerSocket.Active := False;

  g_ClientThread.Terminate;
  FreeAndNil(g_ClientThread);

  SaveBlockIPFile;
  SaveBlockIPArrayFile;

  ButtonStart.Enabled := True;
  ButtonStop.Enabled := False;
  MENU_START.Enabled := True;
  MENU_STOP.Enabled := False;
  MainOutMessage('Gate Stopped...', nil);
end;

procedure TfrmMain.TimerStartTimer(Sender: TObject);
begin
  TimerStart.Enabled := False;
  if not g_Config.boStarted then begin
    StartService;
  end else begin
    StopService;
    if g_boClose then begin

      UnLoadBlockIPFile();
      g_BlockIPList.Free;
      UnLoadBlockIPArrayFile;
      g_BlockIPArray.Free;

      g_QuickList.Free;
      g_CCAttackIPList.Free;
      g_SessionList.Free;
      Close;
    end;
  end;
end;

procedure TfrmMain.MyMessage(var MsgData: TWmCopyData);
var
  sData: string;
  wIdent: Word;
begin
  wIdent := HiWord(MsgData.From);
  sData := StrPas(MsgData.CopyDataStruct^.lpData);
  case wIdent of
    GS_QUIT: begin
        Caption := g_Config.TitleName + ' [���ڹرշ���...]';
        //if boServiceStart then begin
        g_boClose := True;
        TimerStart.Enabled := True;
        //end else begin
          //Close();
      end;
    1: ;
    2: ;
    3: ;
  end;
end;

procedure TfrmMain.CloseConnect(sUserIpAddr: string);
var
  I: Integer;
  boCheck: Boolean;
begin
  if ServerSocket.Active then
    while (True) do begin
      boCheck := False;
      for I := 0 to ServerSocket.Socket.ActiveConnections - 1 do begin
        if sUserIpAddr = ServerSocket.Socket.Connections[I].RemoteAddress then begin
          ServerSocket.Socket.Connections[I].Close;
          boCheck := True;
          Break;
        end;
      end;
      if not boCheck then Break;
    end;
end;

procedure TfrmMain.ButtonStartClick(Sender: TObject);
begin
  TimerStart.Enabled := True;
end;

procedure TfrmMain.MENU_CONTROL_CLEAELOGClick(Sender: TObject);
begin
  ClearMessage;
  ListViewLog.Items.Clear;
end;

procedure TfrmMain.MENU_CONTROL_EXITClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.POPUPMENU_SAVEClick(Sender: TObject);
var
  I: Integer;
  ListItem: TListItem;
  SaveList: TStringList;
  MsgLog: pTMsgLog;
begin
  SaveList := TStringList.Create;
  MainLogMsgList.Lock;
  try
    for I := 0 to MainLogMsgList.Count - 1 do begin
      MsgLog := pTMsgLog(MainLogMsgList.Objects[I]);
      if MsgLog.APointer = nil then begin
        SaveList.Add(DateTimeToStr(MsgLog.dAddTime) + #9 + MainLogMsgList.Strings[I]);
      end else begin
        SaveList.Add(DateTimeToStr(MsgLog.dAddTime) + #9 + MainLogMsgList.Strings[I] + #9 + IntToStr(pTBlockIP(MsgLog.APointer).nAttackCount));
      end;
    end;
  finally
    MainLogMsgList.UnLock;
  end;
  SaveList.SaveToFile('.\Log.txt');
  SaveList.Free;
end;

procedure TfrmMain.MENU_VIEW_LOGMSGClick(Sender: TObject);
begin
  MENU_VIEW_LOGMSG.Checked := not MENU_VIEW_LOGMSG.Checked;
  g_boShowLog := MENU_VIEW_LOGMSG.Checked;
  if not g_boShowLog then begin
    ClearMessage;
    ListViewLog.Items.Clear;
  end;
end;

procedure TfrmMain.MENU_OPTION_GENERALClick(Sender: TObject);
begin
  frmGeneralConfig := TfrmGeneralConfig.Create(Owner);
  frmGeneralConfig.Top := Self.Top + 28;
  frmGeneralConfig.Left := Self.Left;
  frmGeneralConfig.Open();
  frmGeneralConfig.Free;
end;

procedure TfrmMain.MENU_OPTION_IPFILTERClick(Sender: TObject);
begin
  frmOption := TfrmOption.Create(Owner);
  frmOption.Top := Self.Top + 28;
  frmOption.Left := Self.Left;
  frmOption.Open();
  frmOption.Free;
end;

procedure TfrmMain.MENU_LOADBLOCKIPLISTClick(Sender: TObject);
begin
  LoadBlockIPFile();
  LoadBlockIPArrayFile;
  MainOutMessage('Block IP List Reloaded...', nil);
end;

procedure TfrmMain.MENU_OPTION_HELPClick(Sender: TObject);
begin
  MainOutMessage(g_sProductName, nil);
  MainOutMessage(g_sUpDateTime, nil);
  MainOutMessage(g_sProgram, nil);
  MainOutMessage(g_sWebSite, nil);
end;

procedure TfrmMain.MENU_CONTROL_OPENATTACKClick(Sender: TObject);
var
  Conf: TIniFile;
  sConfigFileName: string;
begin
  MENU_CONTROL_OPENATTACK.Checked := not MENU_CONTROL_OPENATTACK.Checked;
  if MENU_CONTROL_OPENATTACK.Checked then begin
    g_boCheckAttack := True;
    MainOutMessage('Check Attack On...', nil);
  end else begin
    g_boCheckAttack := False;
    MainOutMessage('Check Attack Off...', nil);
  end;
  sConfigFileName := '.\Config.ini';
  Conf := TIniFile.Create(sConfigFileName);
  Conf.WriteBool(GateClass, 'CheckAttack', g_boCheckAttack);
  Conf.Free;
end;

procedure TfrmMain.TimerTimer(Sender: TObject);
  procedure UpDate(BlockIP: pTBlockIP);
  var
    I: Integer;
    ListItem: TListItem;
  begin
    for I := 0 to ListViewLog.Items.Count - 1 do begin
      ListItem := ListViewLog.Items.Item[I];
      if pTBlockIP(ListItem.SubItems.Objects[0]) = BlockIP then begin
        if IntToStr(BlockIP.nAttackCount) <> ListItem.SubItems.Strings[1] then
          ListItem.SubItems.Strings[1] := IntToStr(BlockIP.nAttackCount);
        Break;
      end;
    end;
  end;
var
  I: Integer;
  nIndex: Integer;
  ListItem: TListItem;
  MsgLog: pTMsgLog;
  Session: pTSession;
begin
  if GetTickCount - g_dwUpdateListViewTick > 1000 then begin
    g_dwUpdateListViewTick := GetTickCount;
    MainLogMsgList.Lock;
    try
      try
        for I := 0 to MainLogMsgList.Count - 1 do begin
          MsgLog := pTMsgLog(MainLogMsgList.Objects[I]);
          if MsgLog.boAdd then begin
            MsgLog.boAdd := False;
            ListViewLog.Items.BeginUpdate;
            try
              ListItem := ListViewLog.Items.Add;
              if MsgLog.APointer <> nil then begin
                ListItem.Caption := DateTimeToStr(MsgLog.dAddTime);
                ListItem.SubItems.Add(MainLogMsgList.Strings[I]);
                ListItem.SubItems.Add(IntToStr(pTBlockIP(MsgLog.APointer).nAttackCount));
              end else begin
                ListItem.Caption := DateTimeToStr(MsgLog.dAddTime);
                ListItem.SubItems.Add(MainLogMsgList.Strings[I]);
              end;
            finally
              ListViewLog.Items.EndUpdate;
            end;
          end else
            if MsgLog.boUpDate and (MsgLog.APointer <> nil) then begin
            MsgLog.boUpDate := False;
            UpDate(pTBlockIP(MsgLog.APointer));
          end;
        end;
      except

      end;
    finally
      MainLogMsgList.UnLock;
    end;
  end;

  if GetTickCount - g_dwConnectDBTick > 1000 then begin
    g_dwConnectDBTick := GetTickCount;
    if ServerSocket.Active then begin
      if not g_boGateReady then begin
        StatusPane1.Caption := IntToStr(g_Config.GatePort);
        StatusPane2.Caption := '---]    [---';
        StatusPane3.Caption := Format('Conn:%d/%d/%d', [ServerSocket.Socket.ActiveConnections, g_SessionList.Count, g_SessionList.MaxCount]);
        //StatusPane4.Caption := Format('ע���˺�:%d', [g_nNewAccountCount]);
        //StatusPane5.Caption := Format('�����߳�:%d', [g_dwDecodeMsgTime]);
       { ClientSocket.Port := g_Config.ServerPort;
        ClientSocket.Address := g_Config.ServerAddr;
        ClientSocket.Active := True; }
      end else begin

        StatusPane1.Caption := IntToStr(g_Config.GatePort);
        StatusPane2.Caption := '-----][-----';
        StatusPane3.Caption := Format('Conn:%d/%d/%d', [ServerSocket.Socket.ActiveConnections, g_SessionList.Count, g_SessionList.MaxCount]);
        //StatusPane4.Caption := Format('ע���˺�:%d', [g_nNewAccountCount]);
        //StatusPane5.Caption := Format('�����߳�:%d', [g_dwDecodeMsgTime]);

      end;
    end else begin
      StatusPane1.Caption := '???';
      StatusPane2.Caption := '---]    [---';
      StatusPane3.Caption := 'Conn:?/?/?';
      //StatusPane4.Caption := 'ע���˺�:?';
      //StatusPane5.Caption := '�����߳�:?';
    end;
  end;
end;

procedure TfrmMain.ListViewLogChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  if ListViewLog.Items.Count >= 200 then ListViewLog.Items.Clear;
end;

procedure TfrmMain.ServerSocketClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
var
  nIdx: Integer;
  BlockIP: pTBlockIP;
  AObject: TObject;
  nCount: Integer;
  Session: pTSession;
  sRemoteIPaddr: string;
begin
  Socket.nIndex := -1;
  if g_boGateReady then begin
    sRemoteIPaddr := Socket.RemoteAddress;

    if ServerSocket.Socket.ActiveConnections >= g_Config.nMaxOnlineCount then begin
      for nIdx := ServerSocket.Socket.ActiveConnections - 1 downto 0 do begin
        sRemoteIPaddr := ServerSocket.Socket.Connections[nIdx].RemoteAddress;
        AddBlockIP(sRemoteIPaddr);
        ServerSocket.Socket.Connections[nIdx].Close;
        //CloseConnect(sRemoteIPaddr);
      end;
      MainOutMessage('��������������ȫ���������ù����б�', nil);
      Exit;
    end;

    BlockIP := IsBlockIP(sRemoteIPaddr);
    if BlockIP <> nil then begin
      Inc(BlockIP.nAttackCount);
      MainOutMessage('��������: ' + sRemoteIPaddr, TObject(BlockIP));
      Socket.Close;
      Exit;
    end;

    if IsArrayIP(sRemoteIPaddr) then begin
      MainOutMessage('��������: ' + sRemoteIPaddr, nil);
      Socket.Close;
      Exit;
    end;

    nIdx := g_QuickList.GetIndex(sRemoteIPaddr);
    if (nIdx >= 0) then begin
      nCount := Integer(g_QuickList.Objects[nIdx]);
      if nCount >= g_Config.nMaxConnOfIPaddr then begin //��IP��������
        MainOutMessage('���ӳ���: ' + sRemoteIPaddr, nil);
        Socket.Close;
        Exit;
      end;
    end;

    if g_boCheckAttack then begin
      AObject := UpdateCCAttackIPList(sRemoteIPaddr); {CC�������}
      BlockIP := pTBlockIP(AObject);
      if BlockIP <> nil then begin
        if (BlockIP.dwUpDateTick <> 0) {and (m_dwConnctCheckTick > BlockIP.dwUpDateTick)} and (GetTickCount - BlockIP.dwUpDateTick < g_Config.nConnctCheckTime) then begin //CC����
          BlockIP.dwUpDateTick := GetTickCount;
          Inc(BlockIP.nAttackCount);
          MainOutMessage('CC����: ' + sRemoteIPaddr, TObject(BlockIP));
          if BlockIP.nAttackCount > 5 then AddBlockIP(sRemoteIPaddr);
          Socket.Close;
          Exit;
        end;
        BlockIP.dwUpDateTick := GetTickCount;
      end;
    end;

    Socket.nIndex := g_SessionList.Add(Session);
    if Socket.nIndex < 0 then begin
      MainOutMessage('Kick: ' + sRemoteIPaddr, nil);
      Socket.Close;
    end else begin
      Session.Socket := Socket;
      Session.sRemoteIPaddr := sRemoteIPaddr;
      Session.dwConnctCheckTick := GetTickCount;

      Session.boReviceMsg := False;
      Session.sReviceMsg := '';

      Session.dwConnctCheckTick := GetTickCount;
      Session.dwReviceMsgTick := GetTickCount;
      Session.dwSendServerTick := GetTickCount;
      Session.nReviceMsgLen := 0;
      Session.nSendMsgLen := 0;
      Session.btAttackType := 0;
      Session.dwLastTick := GetTickCount;
      Session.boCheckAttacked := False;
      Session.dwUserTimeOutTick := GetTickCount();

      if nIdx >= 0 then begin
        nCount := Integer(g_QuickList.Objects[nIdx]);
        Inc(nCount);
        g_QuickList.Objects[nIdx] := TObject(nCount);
      end else begin
        g_QuickList.AddRecord(sRemoteIPaddr, 1);
      end;
      g_ClientThread.SendText('%N' + IntToStr(Socket.nIndex) + '/' + sRemoteIPaddr + '/' + sRemoteIPaddr + '$');
    end;
  end else Socket.Close;
end;

procedure TfrmMain.ServerSocketClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
var
  nIdx: Integer;
  nCount: Integer;
  Session: pTSession;
begin
  Session := g_SessionList.Items[Socket.nIndex];
  if Session <> nil then begin
    nIdx := g_QuickList.GetIndex(Session.sRemoteIPaddr);
    if nIdx >= 0 then begin
      nCount := Integer(g_QuickList.Objects[nIdx]);
      Dec(nCount);
      if nCount > 0 then begin
        g_QuickList.Objects[nIdx] := TObject(nCount);
      end else begin
        g_QuickList.Delete(nIdx);
      end;
    end;
    g_ClientThread.SendText('%C' + IntToStr(Integer(Socket.nIndex)) + '$');
    g_SessionList.Delete(Socket.nIndex);
  end;
end;

procedure TfrmMain.ServerSocketClientError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  ErrorCode := 0;
  Socket.Close;
end;

procedure TfrmMain.ServerSocketClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  sDefMsg: string;
  sData: string;
  sMsg: string;
  DefMsg: TDefaultMessage;
  sReviceMsg: string;
  s10, s1C: string;
  nPos: Integer;
  Session: pTSession;
begin
  Session := g_SessionList.Items[Socket.nIndex];
  if Session <> nil then begin
    sReviceMsg := Socket.ReceiveText;
    if g_boCheckAttack then begin
      if Length(sReviceMsg) > 200 then begin
        MainOutMessage('���ݳ���: ' + Session.sRemoteIPaddr, nil);
        Socket.Close;
        Exit;
      end;
    end;
    nPos := Pos('*', sReviceMsg);
    if nPos > 0 then begin
      s10 := Copy(sReviceMsg, 1, nPos - 1);
      s1C := Copy(sReviceMsg, nPos + 1, Length(sReviceMsg) - nPos);
      sReviceMsg := s10 + s1C;
    end;
    Session.sReviceMsg := Session.sReviceMsg + sReviceMsg;
    Inc(Session.nReviceMsgLen, Length(sReviceMsg));
    {
    if (Pos('!', Session.sReviceMsg) > 0) and (Length(Session.sReviceMsg) >= 2) then begin
      Session.sReviceMsg := ArrestStringEx(Session.sReviceMsg, '#', '!', sMsg);
      if sMsg <> '' then begin
        if Length(sMsg) >= DEFBLOCKSIZE + 1 then begin
          sMsg := Copy(sMsg, 2, Length(sMsg) - 1);
          sDefMsg := Copy(sMsg, 1, DEFBLOCKSIZE);
          sData := Copy(sMsg, DEFBLOCKSIZE + 1, Length(sMsg) - DEFBLOCKSIZE);
          DefMsg := DecodeMessage(sDefMsg);
          if DefMsg.ident = CM_ADDNEWUSER then begin
            Inc(Session.nNewAccountCount);
            Inc(g_nNewAccountCount);
          end;
        end;
      end;
    end;}
    if MENU_VIEW_SENDMSG.Checked then MainOutMessage(sReviceMsg, nil);
    g_ClientThread.SendText('%D' + IntToStr(Integer(Socket.nIndex)) + '/' + sReviceMsg + '$');
  end else Socket.Close;
end;

procedure TfrmMain.POPUPMENU_COPYClick(Sender: TObject);
var
  I: Integer;
  ListItem: TListItem;
  SaveList: TStringList;
  Clipboard: TClipboard;
begin
  SaveList := TStringList.Create;
  ListViewLog.Items.BeginUpdate;
  try
    for I := 0 to ListViewLog.Items.Count - 1 do begin
      ListItem := ListViewLog.Items.Item[I];
      if ListItem.Selected then begin
        if ListItem.SubItems.Count >= 2 then begin
          SaveList.Add(ListItem.Caption + #9 + ListItem.SubItems.Strings[0] + #9 + ListItem.SubItems.Strings[1]);
        end else begin
          SaveList.Add(ListItem.Caption + #9 + ListItem.SubItems.Strings[0]);
        end;
      end;
    end;
  finally
    ListViewLog.Items.EndUpdate;
  end;
  Clipboard := TClipboard.Create();
  Clipboard.AsText := SaveList.Text;
  Clipboard.Free();
  SaveList.Free;
end;

procedure TfrmMain.POPUPMENU_SELALLClick(Sender: TObject);
begin
  ListViewLog.SelectAll;
end;

end.

