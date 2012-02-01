unit GateShare;

interface
uses
  Windows, Messages, SysUtils, Classes, WinSock, SyncObjs, IniFiles, Grobal2, Common,
  ScktComp;
resourcestring
  g_sVersion = 'Build: LOMCN Mir Heroes';
  g_sUpDateTime = 'Updated: 02/01/2011';
  g_sProgram = 'Program: LOMCN';
  g_sWebSite = 'Webse: www.lomcn.co.uk';
const
  tRunGate = 8;
  GATEMAXSESSION = 1000;
  MSGMAXLENGTH = 20000;
  SENDCHECKSIZE = 512;
  SENDCHECKSIZEMAX = 2048;

  sSTATUS_FAIL = '+FAIL/';
  sSTATUS_GOOD = '+GOOD/';
type
  TGList = class(TList)
  private
    GLock: TRTLCriticalSection;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Lock;
    procedure UnLock;
  end;

  TBlockIPMethod = (mDisconnect, mBlock, mBlockList);
  TSockaddr = record
    nIPaddr: Integer;
    dwStartAttackTick: LongWord;
    nAttackCount: Integer;
    nSocketHandle: Integer;
  end;
  pTSockaddr = ^TSockaddr;

  TConfig = record
    boHit: Boolean;
    boSpell: Boolean;
    boRun: Boolean;
    boWalk: Boolean;
    boTurn: Boolean;
    nHitTime: Integer;
    nSpellTime: Integer;
    nRunTime: Integer;
    nWalkTime: Integer;
    nTurnTime: Integer;
    nHitCount: Integer;
    nSpellCount: Integer;
    nRunCount: Integer;
    nWalkCount: Integer;
    nTurnCount: Integer;
    btSpeedControlMode: Byte;
    boSpeedShowMsg: Boolean;
    sSpeedShowMsg: string;
    btMsgColor: Byte;
  end;

  TGameSpeed = record
    dwHitTimeTick: LongWord;
    dwSpellTimeTick: LongWord;
    dwRunTimeTick: LongWord;
    dwWalkTimeTick: LongWord;
    dwTurnTimeTick: LongWord;
    nHitCount: Integer;
    nSpellCount: Integer;
    nRunCount: Integer;
    nWalkCount: Integer;
    nTurnCount: Integer;
  end;
  pTGameSpeed = ^TGameSpeed;

  TSessionInfo = record
    Socket: TCustomWinSocket;
    sSocData: string;
    sSendData: string;
    nUserListIndex: Integer;
    nPacketIdx: Integer;
    nPacketErrCount: Integer; //���ݰ�����ظ��������ͻ����÷���������ݼ�⣩
    boStartLogon: Boolean;
    boSendLock: Boolean;
    boOverNomSize: Boolean;
    nOverNomSizeCount: ShortInt;
    dwSendLatestTime: LongWord;
    nCheckSendLength: Integer;
    boSendAvailable: Boolean;
    boSendCheck: Boolean;
    dwTimeOutTime: LongWord;
    nReceiveLength: Integer;
    dwReceiveLengthTick: LongWord;
    dwReceiveTick: LongWord;
    nSckHandle: Integer;
    sRemoteAddr: string;
    dwSayMsgTick: LongWord; //���Լ������
    dwHitTick: LongWord; //����ʱ��
    dwSpeedingTick: LongWord;
    //GameSpeed: TGameSpeed;
  end;

  pTSessionInfo = ^TSessionInfo;
  TSendUserData = record
    nSocketIdx: Integer; //0x00
    nSocketHandle: Integer; //0x04
    sMsg: string; //0x08
  end;
  pTSendUserData = ^TSendUserData;
procedure AddMainLogMsg(Msg: string; nLevel: Integer);
procedure LoadAbuseFile();
procedure LoadBlockIPFile();
procedure SaveBlockIPList();
procedure SendGameCenterMsg(wIdent: Word; sSendMsg: string);
var
  g_Config: TConfig = (
    boHit: False;
    boSpell: False;
    boRun: False;
    boWalk: False;
    boTurn: False;
    nHitTime: 500;
    nSpellTime: 500;
    nRunTime: 300;
    nWalkTime: 300;
    nTurnTime: 200;
    nHitCount: 3;
    nSpellCount: 3;
    nRunCount: 3;
    nWalkCount: 3;
    nTurnCount: 3;
    btSpeedControlMode: 1;
    boSpeedShowMsg: True;
    sSpeedShowMsg: '����ʾ��: �밮����Ϸ����,��Ҫʹ�÷Ƿ����!';
    btMsgColor: 0;
    );

  CS_MainLog: TCriticalSection;
  CS_FilterMsg: TCriticalSection;
  MainLogMsgList: TStringList;
  nShowLogLevel: Integer = 3;
  GateClass: string = 'Server';
  GateName: string = 'Run Gate';
  TitleName: string = 'MakeGM';

  ServerAddr: string = '127.0.0.1';
  ServerPort: Integer = 5000;
  GateAddr: string = '0.0.0.0';
  GatePort: Integer = 7200;
  boStarted: Boolean = False;
  boClose: Boolean = False;
  boShowBite: Boolean = True; //��ʾB �� KB
  boServiceStart: Boolean = False;
  boGateReady: Boolean = False; //0045AA74 �����Ƿ����
  boCheckServerFail: Boolean = False; //���� <->��Ϸ������֮�����Ƿ�ʧ�ܣ���ʱ��
  //  dwCheckServerTimeOutTime    :LongWord = 60 * 1000 ;//���� <->��Ϸ������֮���ⳬʱʱ�䳤��
  dwCheckServerTimeOutTime: LongWord = 3 * 60 * 1000; //���� <->��Ϸ������֮���ⳬʱʱ�䳤��
  AbuseList: TStringList; //004694F4
  SessionArray: array[0..GATEMAXSESSION - 1] of TSessionInfo;
  SessionCount: Integer; //0x32C ���ӻỰ��
  boShowSckData: Boolean; //0x324 �Ƿ���ʾSOCKET���յ���Ϣ

  sReplaceWord: string = '*';
  ReviceMsgList: TList; //0x45AA64
  SendMsgList: TList; //0x45AA68
  nCurrConnCount: Integer;
  boSendHoldTimeOut: Boolean;
  dwSendHoldTick: LongWord;
  n45AA80: Integer;
  n45AA84: Integer;
  dwCheckRecviceTick: LongWord;
  dwCheckRecviceMin: LongWord;
  dwCheckRecviceMax: LongWord;

  dwCheckServerTick: LongWord;
  dwCheckServerTimeMin: LongWord;
  dwCheckServerTimeMax: LongWord;
  SocketBuffer: PChar; //45AA5C
  g_nBuffLen: Integer; //45AA60
  List_45AA58: TList;
  boDecodeMsgLock: Boolean;
  dwProcessReviceMsgTimeLimit: LongWord;
  dwProcessSendMsgTimeLimit: LongWord;

  BlockIPList: TGList; //��ֹ����IP�б�
  TempBlockIPList: TGList; //��ʱ��ֹ����IP�б�
  CurrIPaddrList: TGList;
  AttackIPaddrList: TGList; //����IP��ʱ�б�

  nMaxConnOfIPaddr: Integer = 50;
  nMaxClientPacketSize: Integer = 8000;
  nNomClientPacketSize: Integer = 200;
  dwClientCheckTimeOut: LongWord = 50; {3000}
  nMaxOverNomSizeCount: Integer = 2;
  nMaxClientMsgCount: Integer = 20;
  nCheckServerFail: Integer = 0;
  dwAttackTick: LongWord = 300;
  nAttackCount: Integer = 5;
  g_dwGameCenterHandle: THandle;

  BlockMethod: TBlockIPMethod = mDisconnect;
  bokickOverPacketSize: Boolean = True;

  //  nClientSendBlockSize        :Integer = 250; //���͸��ͻ������ݰ���С����
  nClientSendBlockSize: Integer = 1000; //���͸��ͻ������ݰ���С����
  dwClientTimeOutTime: LongWord = 5000; //�ͻ������ӻỰ��ʱ(ָ��ʱ����δ�����ݴ���)
  Conf: TIniFile;
  sConfigFileName: string = '.\RunGate.ini';
  nSayMsgMaxLen: Integer = 70; //�����ַ�����
  dwSayMsgTime: LongWord = 1000; //�������ʱ��
  dwHitTime: LongWord = 300; //�������ʱ��
  dwSessionTimeOutTime: LongWord = 60 * 60 * 1000;
  sHintMsgPreFix: string = '����ʾ��';


  g_nSpeedingDataManage: Integer = 2;
  g_boSpeedingControl: Boolean = False;
  g_nSpeedingTime: Integer = 400;
  g_boShowSpeedingMsg: Boolean = True;
  g_nShowSpeedingMsg: Integer = 0;
  g_sSpeedingMsg: string = '[��ʾ]: �밮����Ϸ�������رռ���������µ�½';

  g_btRedMsgFColor: Byte = $FF; //ǰ��
  g_btRedMsgBColor: Byte = $38; //����
  g_btGreenMsgFColor: Byte = $DB; //ǰ��
  g_btGreenMsgBColor: Byte = $FF; //����
  g_btBlueMsgFColor: Byte = $FF; //ǰ��
  g_btBlueMsgBColor: Byte = $FC; //����


  boMinimize: Boolean = True;


implementation

procedure AddMainLogMsg(Msg: string; nLevel: Integer);
var
  tMsg: string;
begin
  try
    CS_MainLog.Enter;
    if nLevel <= nShowLogLevel then begin
      tMsg := '[' + TimeToStr(Now) + '] ' + Msg;
      MainLogMsgList.Add(tMsg);
    end;
  finally
    CS_MainLog.Leave;
  end;
end;
procedure LoadAbuseFile();
var
  sFileName: string;
begin
  AddMainLogMsg('���ڼ������ֹ���������Ϣ...', 4);
  sFileName := '.\WordFilter.txt';
  if FileExists(sFileName) then begin
    try
      CS_FilterMsg.Enter;
      AbuseList.LoadFromFile(sFileName);
    finally
      CS_FilterMsg.Leave;
    end;
  end;
  AddMainLogMsg('���ֹ�����Ϣ�������...', 4);
end;

procedure LoadBlockIPFile();
var
  I: Integer;
  sFileName: string;
  LoadList: TStringList;
  sIPaddr: string;
  nIPaddr: Integer;
  IPaddr: pTSockaddr;
begin
  AddMainLogMsg('���ڼ���IP����������Ϣ...', 4);
  sFileName := '.\BlockIPList.txt';
  if FileExists(sFileName) then begin
    LoadList := TStringList.Create;
    LoadList.LoadFromFile(sFileName);
    for I := 0 to LoadList.Count - 1 do begin
      sIPaddr := Trim(LoadList.Strings[I]);
      if sIPaddr = '' then Continue;
      nIPaddr := inet_addr(PAnsiChar(sIPaddr));
      if nIPaddr = INADDR_NONE then Continue;
      New(IPaddr);
      FillChar(IPaddr^, SizeOf(TSockaddr), 0);
      IPaddr.nIPaddr := nIPaddr;
      BlockIPList.Add(IPaddr);
    end;
    LoadList.Free;
  end;
  AddMainLogMsg('IP����������Ϣ�������...', 4);
end;

procedure SaveBlockIPList();
var
  I: Integer;
  SaveList: TStringList;
begin
  SaveList := TStringList.Create;
  for I := 0 to BlockIPList.Count - 1 do begin
    SaveList.Add(StrPas(inet_ntoa(TInAddr(pTSockaddr(BlockIPList.Items[I]).nIPaddr))));
  end;
  SaveList.SaveToFile('.\BlockIPList.txt');
  SaveList.Free;
end;

procedure SendGameCenterMsg(wIdent: Word; sSendMsg: string);
var
  SendData: TCopyDataStruct;
  nParam: Integer;
begin
  nParam := MakeLong(Word(tRunGate), wIdent);
  SendData.cbData := Length(sSendMsg) + 1;
  GetMem(SendData.lpData, SendData.cbData);
  StrCopy(SendData.lpData, PChar(sSendMsg));
  SendMessage(g_dwGameCenterHandle, WM_COPYDATA, nParam, Cardinal(@SendData));
  FreeMem(SendData.lpData);
end;

constructor TGList.Create;
begin
  inherited Create;
  InitializeCriticalSection(GLock);
end;

destructor TGList.Destroy;
begin
  DeleteCriticalSection(GLock);
  inherited;
end;

procedure TGList.Lock;
begin
  EnterCriticalSection(GLock);
end;

procedure TGList.UnLock;
begin
  LeaveCriticalSection(GLock);
end;

initialization
  begin
    Conf := TIniFile.Create(sConfigFileName);
    nShowLogLevel := Conf.ReadInteger(GateClass, 'ShowLogLevel', nShowLogLevel);
    CS_MainLog := TCriticalSection.Create;
    CS_FilterMsg := TCriticalSection.Create;
    MainLogMsgList := TStringList.Create;
    AbuseList := TStringList.Create;
    ReviceMsgList := TList.Create;
    SendMsgList := TList.Create;
    List_45AA58 := TList.Create;
    //TestList := TStringList.Create;
    boShowSckData := False;
  end;

finalization
  begin
    List_45AA58.Free;
    ReviceMsgList.Free;
    SendMsgList.Free;
    AbuseList.Free;
    MainLogMsgList.Free;
    CS_MainLog.Free;
    CS_FilterMsg.Free;
    Conf.Free;
  end;

end.

