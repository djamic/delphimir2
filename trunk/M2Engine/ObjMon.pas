unit ObjMon;

interface
uses
  Windows, Classes, SysUtils, Grobal2, ObjBase, ObjActor;
type
  TMonster = class(TAnimalObject)
    m_dwThinkTick: LongWord;
    bo554: Boolean;
    m_boDupMode: Boolean;
  private
    function Think: Boolean;
    function MakeClone(sMonName: string; OldMon: TActorObject): TActorObject;
  public
    constructor Create(); override;
    destructor Destroy; override;
    function Operate(ProcessMsg: pTProcessMessage): Boolean; override;
    function AttackTarget(): Boolean; virtual;
    procedure Run; override;
  end;

  TCartMonster = class(TAnimalObject) //�ڳ�
    m_dwThinkTick: LongWord;
    bo554: Boolean;
    m_boDupMode: Boolean;
    m_boSendRefMsg: Boolean;
    m_dwSendRefMsgTick: LongWord;
    m_boEnterAnotherMap: Boolean;
    m_nGateX, m_nGateY: Integer;
  private
    function Think: Boolean;
  public
    constructor Create; override;
    function Operate(ProcessMsg: pTProcessMessage): Boolean; override;
    procedure Run; override;
    procedure Die(); override;
  end;
  TChickenDeer = class(TMonster)
  private

  public
    constructor Create(); override;
    destructor Destroy; override;
    procedure Run; override;
  end;
  TATMonster = class(TMonster)
  private
  public
    constructor Create(); override;
    destructor Destroy; override;
    procedure Run; override;
  end;
  TSlowATMonster = class(TATMonster)
  private
  public
    constructor Create(); override;
    destructor Destroy; override;
  end;
  TScorpion = class(TATMonster)
  private
  public
    constructor Create(); override;
    destructor Destroy; override;
  end;
  TSpitSpider = class(TATMonster)
    m_boUsePoison: Boolean;
  private
    procedure SpitAttack(btDir: Byte);
  public
    constructor Create(); override;
    destructor Destroy; override;
    function AttackTarget(): Boolean; {virtual;//} override; //FFEB
  end;
  THighRiskSpider = class(TSpitSpider)
  private

  public
    constructor Create(); override;
    destructor Destroy; override;
  end;
  TBigPoisionSpider = class(TSpitSpider)
  private

  public
    constructor Create(); override;
    destructor Destroy; override;
  end;
  TGasAttackMonster = class(TATMonster)
  private

  public
    constructor Create(); override;
    destructor Destroy; override;
    function AttackTarget: Boolean; override;
    function sub_4A9C78(bt05: Byte): TActorObject; virtual; //FFEA
  end;
  TCowMonster = class(TATMonster)
  private
  public
    constructor Create(); override;
    destructor Destroy; override;
  end;
  TMagCowMonster = class(TATMonster)
  private
    procedure sub_4A9F6C(btDir: Byte);
  public
    constructor Create(); override;
    destructor Destroy; override;
    function AttackTarget: Boolean; override;
  end;
  TCowKingMonster = class(TATMonster)
    dw558: LongWord;
    bo55C: Boolean;
    bo55D: Boolean;
    n560: Integer;
    dw564: LongWord;
    dw568: LongWord;
    dw56C: LongWord;
    dw570: LongWord;
  private

  public
    constructor Create(); override;
    destructor Destroy; override;
    procedure Run; override;
    procedure Attack(TargeTActorObject: TActorObject; nDir: Integer); override;
    procedure Initialize(); override;
  end;
  TElectronicScolpionMon = class(TMonster)
  private
    m_boUseMagic: Boolean;
    procedure LightingAttack(nDir: Integer);

  public
    constructor Create(); override;
    destructor Destroy; override;
    procedure Run; override;
  end;
  TLightingZombi = class(TMonster)
  private
    procedure LightingAttack(nDir: Integer);

  public
    constructor Create(); override;
    destructor Destroy; override;
    procedure Run; override;
  end;
  TDigOutZombi = class(TMonster)
  private
    procedure sub_4AA8DC;

  public
    constructor Create(); override;
    destructor Destroy; override;
    procedure Run; override;
  end;
  TZilKinZombi = class(TATMonster)
    dw558: LongWord;
    nZilKillCount: Integer;
    dw560: LongWord;
  private

  public
    constructor Create(); override;
    destructor Destroy; override;
    procedure Die; override;
    procedure Run; override;
  end;
  TWhiteSkeleton = class(TATMonster)
    m_boIsFirst: Boolean;
  private
    procedure sub_4AAD54;
  public
    constructor Create(); override;
    destructor Destroy; override;
    procedure RecalcAbilitys(); override;
    procedure Run; override;
  end;
  TScultureMonster = class(TMonster)
  private
    procedure MeltStone; //
    procedure MeltStoneAll;

  public
    constructor Create(); override;
    destructor Destroy; override;
    procedure Run; override;
  end;
  TScultureKingMonster = class(TMonster)
    m_nDangerLevel: Integer;
    m_SlaveObjectList: TList; //0x55C
  private
    procedure MeltStone;
    procedure CallSlave;
  public
    constructor Create(); override;
    destructor Destroy; override;
    procedure Attack(TargeTActorObject: TActorObject; nDir: Integer); override; //0FFED
    procedure Run; override;
  end;
  TGasMothMonster = class(TGasAttackMonster) //Ш��
  private
  public
    constructor Create(); override;
    destructor Destroy; override;
    procedure Run; override;
    function sub_4A9C78(bt05: Byte): TActorObject; override; //FFEA
  end;
  TGasDungMonster = class(TGasAttackMonster)
  private
  public
    constructor Create(); override;
    destructor Destroy; override;
  end;
  TElfMonster = class(TMonster)
    boIsFirst: Boolean; //0x558
  private
    procedure AppearNow;

  public
    constructor Create(); override;
    destructor Destroy; override;
    procedure ResetElfMon;
    procedure RecalcAbilitys(); override;
    procedure Run; override;
  end;
  TElfWarriorMonster = class(TSpitSpider)
    n55C: Integer;
    boIsFirst: Boolean; //0x560
    dwDigDownTick: LongWord; //0x564
  private
    procedure AppearNow;
    procedure ResetElfMon;
  public
    constructor Create(); override;
    destructor Destroy; override;
    procedure RecalcAbilitys(); override;
    procedure Run; override;
  end;
implementation

uses UsrEngn, M2Share, Event;
{ TMonster }

constructor TMonster.Create;
begin
  inherited;
  m_boDupMode := False;
  bo554 := False;
  m_dwThinkTick := GetTickCount();
  m_nViewRange := 5; //Set to OutTest Range, was 6 originally
  m_nRunTime := 250;
  m_dwSearchTime := 3000 + Random(2000);
  m_dwSearchTick := GetTickCount();
  m_btRaceServer := 80;
end;

destructor TMonster.Destroy;
begin
  inherited;
end;

function TMonster.MakeClone(sMonName: string; OldMon: TActorObject): TActorObject;
var
  ElfMon: TActorObject;
begin
  Result := nil;
  ElfMon := UserEngine.RegenMonsterByName(nil, m_PEnvir.sMapName, m_nCurrX, m_nCurrY, sMonName);
  if ElfMon <> nil then begin
    ElfMon.m_Master := OldMon.m_Master;
    ElfMon.m_dwMasterRoyaltyTick := OldMon.m_dwMasterRoyaltyTick;
    ElfMon.m_btSlaveMakeLevel := OldMon.m_btSlaveMakeLevel;
    ElfMon.m_btSlaveExpLevel := OldMon.m_btSlaveExpLevel;
    ElfMon.RecalcAbilitys;
    ElfMon.RefNameColor;
    if OldMon.m_Master <> nil then
      OldMon.m_Master.m_SlaveList.Add(ElfMon);
    ElfMon.m_WAbil := OldMon.m_WAbil;
    ElfMon.m_wStatusTimeArr := OldMon.m_wStatusTimeArr;
    ElfMon.m_TargetCret := OldMon.m_TargetCret;
    ElfMon.m_dwTargetFocusTick := OldMon.m_dwTargetFocusTick;
    ElfMon.m_LastHiter := OldMon.m_LastHiter;
    ElfMon.m_LastHiterTick := OldMon.m_LastHiterTick;
    ElfMon.m_btDirection := OldMon.m_btDirection;
    Result := ElfMon;
  end;
end;

function TMonster.Operate(ProcessMsg: pTProcessMessage): Boolean;
begin
  Result := inherited Operate(ProcessMsg);

end;

function TMonster.Think(): Boolean;
var
  nOldX, nOldY: Integer;
  nX, nY: Integer;
begin
  Result := False;
  if m_NewStatus <> sNone then begin
    m_TargetCret := nil;
    if (m_NewStatus = sConfusion) and (not m_boDeath) then begin //����״̬
      if GetTickCount - m_dwConfusionTick > 400 then begin
        m_dwConfusionTick := GetTickCount;
        if Random(10) = 0 then begin
          nX := m_nNewStatusX + Random(2);
        end else begin
          nX := m_nNewStatusX - Random(2);
        end;
        if Random(10) = 0 then begin
          nY := m_nNewStatusY + Random(2);
        end else begin
          nY := m_nNewStatusY - Random(2);
        end;
        if m_PEnvir.CanWalkEx(nX, nY, False) then begin
          m_nTargetX := nX;
          m_nTargetY := nY;
       {   if (abs(m_nNewStatusX - nX) <= 2) and (abs(m_nNewStatusY - nY) <= 2) then begin
            WalkTo(GetNextDirection(m_nCurrX, m_nCurrY, nX, nY), False);
          end;}
        end;
      end;
    end;
    //Result := True;
    Exit;
  end;
  if (GetTickCount - m_dwThinkTick) > 3 * 1000 then begin
    m_dwThinkTick := GetTickCount();
    if m_PEnvir.GetXYObjCount(m_nCurrX, m_nCurrY) >= 2 then m_boDupMode := True;
    if not IsProperTarget(m_TargetCret) then m_TargetCret := nil;
  end;
  if m_boDupMode then begin
    nOldX := m_nCurrX;
    nOldY := m_nCurrY;
    WalkTo(Random(8), False);
    if (nOldX <> m_nCurrX) or (nOldY <> m_nCurrY) then begin
      m_boDupMode := False;
      Result := True;
    end;
  end;
end;

function TMonster.AttackTarget(): Boolean;
var
  bt06: Byte;
begin
  Result := False;
  if m_TargetCret <> nil then begin
    if GetAttackDir(m_TargetCret, bt06) then begin
      if Integer(GetTickCount - m_dwHitTick) > m_nNextHitTime then begin
        m_dwHitTick := GetTickCount();
        m_dwTargetFocusTick := GetTickCount();
        Attack(m_TargetCret, bt06);
        BreakHolySeizeMode();
      end;
      Result := True;
    end else begin
      if m_TargetCret.m_PEnvir = m_PEnvir then begin
        SetTargetXY(m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
      end else begin
        DelTargetCreat();
      end;
    end;
  end;
end;

procedure TMonster.Run;
var
  nX, nY: Integer;
begin
  if not m_boGhost and
    not m_boDeath and
    not m_boFixedHideMode and
    not m_boStoneMode and
    (m_wStatusTimeArr[POISON_STONE {5 0x6A}] = 0) then begin
    if Think then begin
      inherited;
      Exit;
    end;
    if m_boWalkWaitLocked then begin
      if (GetTickCount - m_dwWalkWaitTick) > m_dwWalkWait then begin
        m_boWalkWaitLocked := False;
      end;
    end;
    if not m_boWalkWaitLocked and (Integer(GetTickCount - m_dwWalkTick) > m_nWalkSpeed) then begin
      m_dwWalkTick := GetTickCount();
      Inc(m_nWalkCount);
      if m_nWalkCount > m_nWalkStep then begin
        m_nWalkCount := 0;
        m_boWalkWaitLocked := True;
        m_dwWalkWaitTick := GetTickCount();
      end;
      if not m_boRunAwayMode then begin
        if not m_boNoAttackMode then begin
          if m_TargetCret <> nil then begin
            if AttackTarget {FFEB} then begin
              inherited;
              Exit;
            end;
          end else begin
            m_nTargetX := -1;
            if m_boMission then begin
              m_nTargetX := m_nMissionX;
              m_nTargetY := m_nMissionY;
            end;
          end;
        end; //004A91D3  if not bo2C0 then begin
        if m_Master <> nil then begin
          if m_TargetCret = nil then begin
            m_Master.GetBackPosition(nX, nY);
            if (abs(m_nTargetX - nX) > 1) or (abs(m_nTargetY - nY {nX}) > 1) then begin //004A922D
              m_nTargetX := nX;
              m_nTargetY := nY;
              if (abs(m_nCurrX - nX) <= 2) and (abs(m_nCurrY - nY) <= 2) then begin
                if m_PEnvir.GetMovingObject(nX, nY, True) <> nil then begin
                  m_nTargetX := m_nCurrX;
                  m_nTargetY := m_nCurrY;
                end
              end;
            end;
          end; //004A92A5 if m_TargetCret = nil then begin
          if (not m_Master.m_boSlaveRelax) and
            ((m_PEnvir <> m_Master.m_PEnvir) or
            (abs(m_nCurrX - m_Master.m_nCurrX) > 20) or
            (abs(m_nCurrY - m_Master.m_nCurrY) > 20)) then begin
            SpaceMove(m_Master.m_PEnvir.sMapName, m_nTargetX, m_nTargetY, 1);
          end; // 004A937E
        end; // 004A937E if m_Master <> nil then begin
      end else begin //004A9344
        if (m_dwRunAwayTime > 0) and ((GetTickCount - m_dwRunAwayStart) > m_dwRunAwayTime) then begin
          m_boRunAwayMode := False;
          m_dwRunAwayTime := 0;
        end;
      end; //004A937E
      if (m_Master <> nil) and m_Master.m_boSlaveRelax then begin
        inherited;
        Exit;
      end; //004A93A6
      if m_nTargetX <> -1 then begin
        GotoTargetXY(); //004A93B5 0FFEF
      end else begin
        if m_TargetCret = nil then Wondering(); // FFEE   //Jacky
      end; //004A93D8
    end; //004A93D8  if not bo510 and ((GetTickCount - m_dwWalkTick) > n4FC) then begin
  end; //004A93D8

  inherited;

end;

//{ TCartMonster }�ڳ�

constructor TCartMonster.Create;
begin
  inherited;
  m_boDupMode := False;
  bo554 := False;
  m_dwThinkTick := GetTickCount();
  m_nViewRange := 12; //6
  m_nRunTime := 250;
  m_btRaceServer := 122;
  m_boSendRefMsg := False;
  m_dwSendRefMsgTick := GetTickCount();
  m_boEnterAnotherMap := False;
  m_nGateX := -1;
  m_nGateY := -1;
end;

function TCartMonster.Think: Boolean;
var
  nOldX, nOldY: Integer;
  nX, nY: Integer;
begin
  Result := False;
  if m_NewStatus <> sNone then begin
    m_TargetCret := nil;
    if (m_NewStatus = sConfusion) and (not m_boDeath) then begin //����״̬
      if GetTickCount - m_dwConfusionTick > 400 then begin
        m_dwConfusionTick := GetTickCount;
        if Random(10) = 0 then begin
          nX := m_nNewStatusX + Random(2);
        end else begin
          nX := m_nNewStatusX - Random(2);
        end;
        if Random(10) = 0 then begin
          nY := m_nNewStatusY + Random(2);
        end else begin
          nY := m_nNewStatusY - Random(2);
        end;
        if m_PEnvir.CanWalkEx(nX, nY, False) then begin
          m_nTargetX := nX;
          m_nTargetY := nY;
       {   if (abs(m_nNewStatusX - nX) <= 2) and (abs(m_nNewStatusY - nY) <= 2) then begin
            WalkTo(GetNextDirection(m_nCurrX, m_nCurrY, nX, nY), False);
          end;}
        end;
      end;
    end;
    //Result := True;
    Exit;
  end;
  if (GetTickCount - m_dwThinkTick) > 3 * 1000 then begin
    m_dwThinkTick := GetTickCount();
    if m_PEnvir.GetXYObjCount(m_nCurrX, m_nCurrY) >= 2 then m_boDupMode := True;
  end;
  if m_boDupMode then begin
    nOldX := m_nCurrX;
    nOldY := m_nCurrY;
    WalkTo(Random(8), False);
    if (nOldX <> m_nCurrX) or (nOldY <> m_nCurrY) then begin
      m_boDupMode := False;
      Result := True;
    end;
  end;
end;

function TCartMonster.Operate(ProcessMsg: pTProcessMessage): Boolean;
begin
  Result := inherited Operate(ProcessMsg);
end;

procedure TCartMonster.Run;
var
  nX, nY: Integer;
begin
  if not m_boGhost and
    not m_boDeath and
    not m_boFixedHideMode and
    not m_boStoneMode and
    (m_wStatusTimeArr[POISON_STONE] = 0) then begin
    if Think then begin
      inherited;
      Exit;
    end;
    if m_boWalkWaitLocked then begin
      if (GetTickCount - m_dwWalkWaitTick) > m_dwWalkWait then begin
        m_boWalkWaitLocked := False;
      end;
    end;
    if not m_boWalkWaitLocked and (Integer(GetTickCount - m_dwWalkTick) > m_nWalkSpeed) then begin
      m_dwWalkTick := GetTickCount();
      Inc(m_nWalkCount);
      if m_nWalkCount > m_nWalkStep then begin
        m_nWalkCount := 0;
        m_boWalkWaitLocked := True;
        m_dwWalkWaitTick := GetTickCount();
      end;
      if not m_boRunAwayMode then begin
        if (m_Master <> nil) and (m_Master.m_PEnvir = m_PEnvir) and (abs(m_nCurrX - m_Master.m_nCurrX) <= 12) and (abs(m_nCurrY - m_Master.m_nCurrY) <= 12) then begin
          m_boEnterAnotherMap := False;
          m_boSendRefMsg := False;
          m_Master.GetBackPosition(nX, nY);
          if (abs(m_nTargetX - nX) > 1) or (abs(m_nTargetY - nY) > 1) then begin
            m_nTargetX := nX;
            m_nTargetY := nY;
            if (abs(m_nCurrX - nX) <= 2) and (abs(m_nCurrY - nY) <= 2) then begin
              if m_PEnvir.GetMovingObject(nX, nY, True) <> nil then begin
                m_nTargetX := m_nCurrX;
                m_nTargetY := m_nCurrY;
              end
            end;
          end;
        end else
          if (m_Master <> nil) and (m_Master.m_PEnvir <> m_PEnvir) then begin
          if m_boEnterAnotherMap then begin
            m_boSendRefMsg := False;
            nX := m_nGateX;
            nY := m_nGateY;
          //m_Master.GetBackPosition(nX, nY);
            if (abs(m_nTargetX - nX) > 1) or (abs(m_nTargetY - nY) > 1) then begin
              m_nTargetX := nX;
              m_nTargetY := nY;
              if (abs(m_nCurrX - nX) <= 2) and (abs(m_nCurrY - nY) <= 2) then begin
                if m_PEnvir.GetMovingObject(nX, nY, True) <> nil then begin
                  m_nTargetX := m_nCurrX;
                  m_nTargetY := m_nCurrY;
                end
              end;
            end;
          end else begin
            m_nTargetX := -1;
            m_nTargetY := -1;
            if (m_Master <> nil) then begin
              if (not m_boSendRefMsg) then begin
                m_boSendRefMsg := True;
                m_Master.SysMsg(Format(g_sCartMonsterNotCanMoveMsg, [m_nCurrX, m_nCurrY]), c_Green, t_Hint);
              end;
            end;
          end;
        end else begin
          m_nTargetX := -1;
          m_nTargetY := -1;
          m_boEnterAnotherMap := False;
          if (m_Master <> nil) and (m_Master.m_PEnvir = m_PEnvir) then begin
            if (not m_boSendRefMsg) then begin
              m_boSendRefMsg := True;
              m_Master.SysMsg(Format(g_sCartMonsterNotCanMoveMsg, [m_nCurrX, m_nCurrY]), c_Green, t_Hint);
            end;
          end;
          {if (m_Master <> nil) and (m_Master.m_PEnvir = m_PEnvir) then begin
            if (not m_boSendRefMsg) then begin
              m_boSendRefMsg := True;
              m_Master.SendMsg(Self, RM_SENDCARTINFO, 0, Integer(Self), m_nCurrX, m_nCurrY, ''); //�ڳ���Ϣ
  //m_boSendRefMsg := False;
  //m_dwSendRefMsgTick := GetTickCount();
            end;
          end;}
        end;
      end else begin
        if (m_dwRunAwayTime > 0) and ((GetTickCount - m_dwRunAwayStart) > m_dwRunAwayTime) then begin
          m_boRunAwayMode := False;
          m_dwRunAwayTime := 0;
        end;
      end;

      if m_nTargetX <> -1 then
        GotoTargetXY();
    end;
  end;
  inherited;
end;

procedure TCartMonster.Die();
begin
  //MainOutMessage('TCartMonster.Die();1');
  if (m_Master <> nil) then begin
    m_Master.SendMsg(Self, RM_DELCARTINFO, 0, Integer(Self), 0, 0, '');
    //MainOutMessage('TCartMonster.Die();2');
  end;
  inherited;
end;

{ TChickenDeer }

constructor TChickenDeer.Create;
begin
  inherited;
  m_nViewRange := 5;
end;

destructor TChickenDeer.Destroy;
begin
  inherited;
end;

procedure TChickenDeer.Run;
var
  I: Integer;
  nC, n10, n14, n1C: Integer;
  ActorObject1C, ActorObject: TActorObject;
begin
  n10 := 9999;
  ActorObject := nil;
  ActorObject1C := nil;
  if not m_boDeath and
    not bo554 and
    not m_boGhost and
    (m_wStatusTimeArr[POISON_STONE {5 0x6A}] = 0) then begin
    if Integer(GetTickCount - m_dwWalkTick) >= m_nWalkSpeed then begin
      for I := 0 to m_VisibleActors.Count - 1 do begin
        ActorObject := TActorObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
        if ActorObject.m_boDeath then Continue;
        if IsProperTarget(ActorObject) then begin
          if not ActorObject.m_boHideMode or m_boCoolEye then begin
            nC := abs(m_nCurrX - ActorObject.m_nCurrX) + abs(m_nCurrY - ActorObject.m_nCurrY);
            if nC < n10 then begin
              n10 := nC;
              ActorObject1C := ActorObject;
            end;
          end;
        end;
      end; // for
      if ActorObject1C <> nil then begin
        m_boRunAwayMode := True;
        m_TargetCret := ActorObject1C;
      end else begin
        m_boRunAwayMode := False;
        m_TargetCret := nil;
      end;
    end; //
    if m_boRunAwayMode and
      (m_TargetCret <> nil) and
      (Integer(GetTickCount - m_dwWalkTick) >= m_nWalkSpeed) then begin
      if (abs(m_nCurrX - ActorObject.m_nCurrX) <= 6) and (abs(m_nCurrX - ActorObject.m_nCurrX) <= 6) then begin
        n14 := GetNextDirection(m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
        m_PEnvir.GetNextPosition(m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY, n14, 5, m_nTargetX, m_nTargetY);
      end;
    end;
  end;
  inherited;

end;

{ TATMonster }

constructor TATMonster.Create; //004A9690
begin
  inherited;
  m_dwSearchTime := Random(1500) + 1500;
end;

destructor TATMonster.Destroy;
begin

  inherited;
end;

procedure TATMonster.Run; //004A9720
begin
  if not m_boDeath and
    not bo554 and
    not m_boGhost and
    (m_wStatusTimeArr[POISON_STONE {5 0x6A}] = 0) then begin

    if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
      (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
      m_dwSearchEnemyTick := GetTickCount();
      SearchTarget();
    end;
  end;
  inherited;
end;

{ TSlowATMonster }

constructor TSlowATMonster.Create; //004A97AC
begin
  inherited;
end;

destructor TSlowATMonster.Destroy;
begin

  inherited;
end;

{ TScorpion }

constructor TScorpion.Create; //004A97F0
begin
  inherited;
  m_boAnimal := True;
end;

destructor TScorpion.Destroy;
begin

  inherited;
end;

{ TSpitSpider }

constructor TSpitSpider.Create; //004A983C
begin
  inherited;
  m_dwSearchTime := Random(1500) + 1500;
  m_boAnimal := True;
  m_boUsePoison := True;
end;

destructor TSpitSpider.Destroy;
begin

  inherited;
end;

procedure TSpitSpider.SpitAttack(btDir: Byte); //004A98AC
var
  WAbil: pTAbility;
  nC, n10, n14, n18, n1C: Integer;
  ActorObject: TActorObject;
begin
  m_btDirection := btDir;
  WAbil := @m_WAbil;
  n1C := (Random(Integer(HiWord(WAbil.DC) - LoWord(WAbil.DC)) + 1) + LoWord(WAbil.DC));
  if n1C <= 0 then Exit;
  SendRefMsg(RM_HIT, m_btDirection, m_nCurrX, m_nCurrY, 0, '');
  nC := 0;

  while (nC < 5) do begin
    n10 := 0;
    while (n10 < 5) do begin
      if g_Config.SpitMap[btDir, nC, n10] = 1 then begin
        {
                       (0, 0, 0, 0, 0),
                       (0, 0, 0, 0, 0),
                       (0, 0, 1, 0, 0),
                       (0, 0, 1, 0, 0)),
        }
        n14 := m_nCurrX - 2 + n10;
        n18 := m_nCurrY - 2 + nC;
        ActorObject := TActorObject(m_PEnvir.GetMovingObject(n14, n18, True));
        if (ActorObject <> nil) and
          (ActorObject <> Self) and
          (IsProperTarget(ActorObject)) and
          (Random(ActorObject.m_btSpeedPoint) < m_btHitPoint) then begin
          n1C := ActorObject.GetMagStruckDamage(Self, n1C);
          ActorObject.StartNewShield();
          if n1C > 0 then begin
            ActorObject.StruckDamage(n1C);
            ActorObject.SendDelayMsg(TActorObject(RM_STRUCK), RM_10101, n1C, m_WAbil.HP, m_WAbil.MaxHP, Integer(Self), '', 300);
            if m_boUsePoison then begin
              if (Random(m_btAntiPoison + 20) = 0) then
                ActorObject.MakePosion(POISON_DECHEALTH, 30, 1);
              //if Random(2) = 0 then
              //  ActorObject.MakePosion(POISON_STONE,5,1);
            end;


            n1C := ActorObject.GetAddPowerPoint(4, n1C);// + ActorObject.GetAddPowerPoint(5, n1C); //�����˺�
            if n1C > 0 then begin
              //n1C := n1C + ActorObject.GetAddPowerPoint(5, n1C);
              StruckDamage(n1C);
              SendDelayMsg(TActorObject(RM_STRUCK), RM_10101, n1C, m_WAbil.HP, m_WAbil.MaxHP, Integer(ActorObject), '', 200);
            end;

          end;
        end;
      end;


      Inc(n10);
      {
      if n10 >= 5 then break;
      }
    end;
    Inc(nC);
    //if nC >= 5 then break;
  end; // while

end;

function TSpitSpider.AttackTarget: Boolean;
var
  btDir: Byte;
begin
  Result := False;
  if m_TargetCret = nil then Exit;
  if TargetInSpitRange(m_TargetCret, btDir) then begin
    if Integer(GetTickCount - m_dwHitTick) > m_nNextHitTime then begin
      m_dwHitTick := GetTickCount();
      m_dwTargetFocusTick := GetTickCount();
      SpitAttack(btDir);
      BreakHolySeizeMode();
    end;
    Result := True;
    Exit;
  end;
  if m_TargetCret.m_PEnvir = m_PEnvir then begin
    SetTargetXY(m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
  end else begin
    DelTargetCreat();
  end;
end;

{ THighRiskSpider }

constructor THighRiskSpider.Create; //004A9B64
begin
  inherited;
  m_boAnimal := False;
  m_boUsePoison := False;
end;

destructor THighRiskSpider.Destroy;
begin

  inherited;
end;

{ TBigPoisionSpider }

constructor TBigPoisionSpider.Create; //004A9BBC
begin
  inherited;
  m_boAnimal := False;
  m_boUsePoison := True;
end;

destructor TBigPoisionSpider.Destroy;
begin

  inherited;
end;

{ TGasAttackMonster }

constructor TGasAttackMonster.Create; //004A9C14
begin
  inherited;
  m_dwSearchTime := Random(1500) + 1500;
  m_boAnimal := True;
end;

destructor TGasAttackMonster.Destroy;
begin

  inherited;
end;

function TGasAttackMonster.sub_4A9C78(bt05: Byte): TActorObject;
var
  WAbil: pTAbility;
  n10: Integer;
  ActorObject: TActorObject;
begin
  Result := nil;
  m_btDirection := bt05;
  WAbil := @m_WAbil;
  n10 := Random(Integer(HiWord(WAbil.DC) - LoWord(WAbil.DC)) + 1) + LoWord(WAbil.DC);
  if n10 > 0 then begin
    SendRefMsg(RM_HIT, m_btDirection, m_nCurrX, m_nCurrY, 0, '');
    ActorObject := GetPoseCreate();
    if (ActorObject <> nil) and
      IsProperTarget(ActorObject) and
      (Random(ActorObject.m_btSpeedPoint) < m_btHitPoint) then begin
      n10 := ActorObject.GetMagStruckDamage(Self, n10);
      ActorObject.StartNewShield();
      if n10 > 0 then begin
        ActorObject.StruckDamage(n10);
        ActorObject.SendDelayMsg(TActorObject(RM_STRUCK), RM_10101, n10, ActorObject.m_WAbil.HP, ActorObject.m_WAbil.MaxHP, Integer(Self), '', 300);
        if Random(ActorObject.m_btAntiPoison + 20) = 0 then begin
          ActorObject.MakePosion(POISON_STONE, 5, 0)
        end;

        n10 := ActorObject.GetAddPowerPoint(4, n10);// + ActorObject.GetAddPowerPoint(5, n10); //�����˺�
        if n10 > 0 then begin
          //n10 := n10 + ActorObject.GetAddPowerPoint(5, n10);
          StruckDamage(n10);
          SendDelayMsg(TActorObject(RM_STRUCK), RM_10101, n10, m_WAbil.HP, m_WAbil.MaxHP, Integer(ActorObject), '', 300);
        end;

        Result := ActorObject;
      end;
    end;
  end;
end;

function TGasAttackMonster.AttackTarget(): Boolean; //004A9DD4
var
  btDir: Byte;
begin
  Result := False;
  if m_TargetCret = nil then Exit;
  if GetAttackDir(m_TargetCret, btDir) then begin
    if Integer(GetTickCount - m_dwHitTick) > m_nNextHitTime then begin
      m_dwHitTick := GetTickCount();
      m_dwTargetFocusTick := GetTickCount();
      sub_4A9C78(btDir);
      BreakHolySeizeMode();
    end;
    Result := True;
  end else begin
    if m_TargetCret.m_PEnvir = m_PEnvir then begin
      SetTargetXY(m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
    end else begin
      DelTargetCreat();
    end;
  end;
end;

{ TCowMonster }

constructor TCowMonster.Create; //004A9EB4
begin
  inherited;
  m_dwSearchTime := Random(1500) + 1500;
end;

destructor TCowMonster.Destroy;
begin

  inherited;
end;

{ TMagCowMonster }

constructor TMagCowMonster.Create; //004A9F10
begin
  inherited;
  m_dwSearchTime := Random(1500) + 1500;
end;

destructor TMagCowMonster.Destroy;
begin

  inherited;
end;

procedure TMagCowMonster.sub_4A9F6C(btDir: Byte);
var
  WAbil: pTAbility;
  n10: Integer;
  ActorObject: TActorObject;
begin
  m_btDirection := btDir;
  WAbil := @m_WAbil;
  n10 := Random(Integer(HiWord(WAbil.DC) - LoWord(WAbil.DC)) + 1) + LoWord(WAbil.DC);
  if n10 > 0 then begin
    SendRefMsg(RM_HIT, m_btDirection, m_nCurrX, m_nCurrY, 0, '');
    ActorObject := GetPoseCreate();
    if (ActorObject <> nil) and
      IsProperTarget(ActorObject) and
      (m_nAntiMagic >= 0) then begin
      n10 := ActorObject.GetMagStruckDamage(Self, n10);
      ActorObject.StartNewShield();
      if n10 > 0 then begin
        ActorObject.StruckDamage(n10);
        ActorObject.SendDelayMsg(TActorObject(RM_STRUCK), RM_10101, n10, ActorObject.m_WAbil.HP, ActorObject.m_WAbil.MaxHP, Integer(Self), '', 300);

        n10 := ActorObject.GetAddPowerPoint(4, n10);// + ActorObject.GetAddPowerPoint(5, n10); //�����˺�
        if n10 > 0 then begin
          //n10 := n10 + ActorObject.GetAddPowerPoint(5, n10);
          StruckDamage(n10);
          SendDelayMsg(TActorObject(RM_STRUCK), RM_10101, n10, m_WAbil.HP, m_WAbil.MaxHP, Integer(ActorObject), '', 300);
        end;

      end;
    end;
  end;
end;

function TMagCowMonster.AttackTarget: Boolean;
var
  btDir: Byte;
begin
  Result := False;
  if m_TargetCret = nil then Exit;
  if GetAttackDir(m_TargetCret, btDir) then begin
    if Integer(GetTickCount - m_dwHitTick) > m_nNextHitTime then begin
      m_dwHitTick := GetTickCount();
      m_dwTargetFocusTick := GetTickCount();
      sub_4A9F6C(btDir);
      BreakHolySeizeMode();
    end;
    Result := True;
  end else begin
    if m_TargetCret.m_PEnvir = m_PEnvir then begin
      SetTargetXY(m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
    end else begin
      DelTargetCreat();
    end;
  end;
end;

{ TCowKingMonster }



constructor TCowKingMonster.Create; //004AA160
begin
  inherited;
  m_dwSearchTime := Random(1500) + 500;
  dw558 := GetTickCount();
  bo2BF := True;
  n560 := 0;
  bo55C := False;
  bo55D := False;
end;

destructor TCowKingMonster.Destroy;
begin

  inherited;
end;

procedure TCowKingMonster.Attack(TargeTActorObject: TActorObject; nDir: Integer); //004AA1F0
var
  WAbil: pTAbility;
  nPower: Integer;
begin
  WAbil := @m_WAbil;
  nPower := GetAttackPower(LoWord(WAbil.DC), Integer(HiWord(WAbil.DC) - LoWord(WAbil.DC)));
  HitMagAttackTarget(TargeTActorObject, nPower div 2, nPower div 2, True);
  //  inherited;
end;

procedure TCowKingMonster.Initialize;
begin
  dw56C := m_nNextHitTime;
  dw570 := m_nWalkSpeed;
  inherited;
end;

procedure TCowKingMonster.Run; //004AA294
var
  I: Integer;
  n8, nC, n10: Integer;
  ActorObject: TActorObject;
begin
  if (not m_boDeath) and
    (not bo554) and
    (not m_boGhost) and
    ((GetTickCount - dw558) > 30 * 1000) then begin

    dw558 := GetTickCount();
    if (m_TargetCret <> nil) and (sub_4C3538 >= 5) then begin
      m_TargetCret.GetBackPosition(n8, nC);
      if m_PEnvir.CanWalk(n8, nC, False) and m_PEnvir.CanWalkOfEvent(Self, n8, nC) then begin
        SpaceMove(m_PEnvir.sMapName, n8, nC, 0);
        Exit;
      end;
      MapRandomMove(m_PEnvir.sMapName, 0);
      Exit;
    end;
    n10 := n560;
    n560 := 7 - m_WAbil.HP div (m_WAbil.MaxHP div 7);
    if (n560 >= 2) and (n560 <> n10) then begin
      bo55C := True;
      dw564 := GetTickCount();
    end;
    if bo55C then begin
      if (GetTickCount - dw564) < 8000 then begin
        m_nNextHitTime := 10000;
      end else begin
        bo55C := False;
        bo55D := True;
        dw568 := GetTickCount();
      end;
    end; //004AA43D
    if bo55D then begin
      if (GetTickCount - dw568) < 8000 then begin
        m_nNextHitTime := 500;
        m_nWalkSpeed := 400;
      end else begin
        bo55D := False;
        m_nNextHitTime := dw56C;
        m_nWalkSpeed := dw570;
      end;
    end;
  end;
  inherited;
end;

{ TLightingZombi }

constructor TLightingZombi.Create; //004AA4B4
begin
  inherited;
  m_dwSearchTime := Random(1500) + 1500;
end;

destructor TLightingZombi.Destroy;
begin

  inherited;
end;

procedure TLightingZombi.LightingAttack(nDir: Integer);
var
  nSX, nSY, nTX, nTY, nPwr: Integer;
  WAbil: pTAbility;
begin
  m_btDirection := nDir;
  SendRefMsg(RM_LIGHTING, 1, m_nCurrX, m_nCurrY, Integer(m_TargetCret), '');
  if m_PEnvir.GetNextPosition(m_nCurrX, m_nCurrY, nDir, 1, nSX, nSY) then begin
    m_PEnvir.GetNextPosition(m_nCurrX, m_nCurrY, nDir, 9, nTX, nTY);
    WAbil := @m_WAbil;
    nPwr := (Random(Integer(HiWord(WAbil.DC) - LoWord(WAbil.DC)) + 1) + LoWord(WAbil.DC));
    MagPassThroughMagic(nSX, nSY, nTX, nTY, nDir, nPwr, True, AT_LIGHT);
  end;
  BreakHolySeizeMode();
end;

procedure TLightingZombi.Run; //004AA604
var
  n08, nAttackDir: Integer;
begin
  n08 := 9999;
  if (not m_boDeath) and
    (not bo554) and
    (not m_boGhost) and
    (m_wStatusTimeArr[POISON_STONE {5 0x6A}] = 0) and
    ((GetTickCount - m_dwSearchEnemyTick) > 8000) then begin

    if ((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil) then begin
      m_dwSearchEnemyTick := GetTickCount();
      SearchTarget();
    end;
    if (Integer(GetTickCount - m_dwWalkTick) > m_nWalkSpeed) and
      (m_TargetCret <> nil) and
      (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 4) and
      (abs(m_nCurrY - m_TargetCret.m_nCurrY) <= 4) then begin
      if (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 2) and
        (abs(m_nCurrY - m_TargetCret.m_nCurrY) <= 2) and
        (Random(3) <> 0) then begin
        inherited;
        Exit;
      end;
      GetBackPosition(m_nTargetX, m_nTargetY);
    end;
    if (m_TargetCret <> nil) and
      (abs(m_nCurrX - m_TargetCret.m_nCurrX) < 6) and
      (abs(m_nCurrY - m_TargetCret.m_nCurrY) < 6) and
      (Integer(GetTickCount - m_dwHitTick) > m_nNextHitTime) then begin

      m_dwHitTick := GetTickCount();
      nAttackDir := GetNextDirection(m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
      LightingAttack(nAttackDir);
    end;
  end;
  inherited;
end;

{ TDigOutZombi }

constructor TDigOutZombi.Create; //004AA848
begin
  inherited;
  bo554 := False;
  m_nViewRange := 7;
  m_dwSearchTime := Random(1500) + 2500;
  m_dwSearchTick := GetTickCount();
  m_btRaceServer := 95;
  m_boFixedHideMode := True;
end;

destructor TDigOutZombi.Destroy;
begin

  inherited;
end;

procedure TDigOutZombi.sub_4AA8DC;
var
  Event: TEvent;
begin
  Event := TEvent.Create(m_PEnvir, m_nCurrX, m_nCurrY, 1, 5 * 60 * 1000, True);
  g_EventManager.AddEvent(Event);
  m_boFixedHideMode := False;
  SendRefMsg(RM_DIGUP, m_btDirection, m_nCurrX, m_nCurrY, Integer(Event), '');
end;

procedure TDigOutZombi.Run;
var
  I: Integer;
  n10: Integer;
  ActorObject: TActorObject;
begin
  if (not m_boGhost) and
    (not m_boDeath) and
    (m_wStatusTimeArr[POISON_STONE {5 0x6A}] = 0) and
    (Integer(GetTickCount - m_dwWalkTick) > m_nWalkSpeed) then begin
    n10 := 0;
    if m_boFixedHideMode then begin
      for I := 0 to m_VisibleActors.Count - 1 do begin
        ActorObject := TActorObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
        if ActorObject.m_boDeath then Continue;
        if IsProperTarget(ActorObject) then begin
          if not ActorObject.m_boHideMode or m_boCoolEye then begin
            if (abs(m_nCurrX - ActorObject.m_nCurrX) <= 3) and (abs(m_nCurrY - ActorObject.m_nCurrY) <= 3) then begin
              sub_4AA8DC();
              m_dwWalkTick := GetTickCount + 1000;
              Break;
            end;
          end;
        end;
      end; // for
    end else begin
      if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
        (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
        m_dwSearchEnemyTick := GetTickCount();
        SearchTarget();
      end;
    end;
  end;
  inherited;
end;

{ TZilKinZombi }

constructor TZilKinZombi.Create;
begin
  inherited;
  m_nViewRange := 6;
  m_dwSearchTime := Random(1500) + 2500;
  m_dwSearchTick := GetTickCount();
  m_btRaceServer := 96;
  nZilKillCount := 0;
  if Random(3) = 0 then begin
    nZilKillCount := Random(3) + 1;
  end;
end;

destructor TZilKinZombi.Destroy;
begin
  inherited;

end;

procedure TZilKinZombi.Die;
begin
  inherited;
  if nZilKillCount > 0 then begin
    dw558 := GetTickCount();
    dw560 := (Random(20) + 4) * 1000;
  end;
  Dec(nZilKillCount);
end;

procedure TZilKinZombi.Run;
begin
  if m_boDeath and
    (not m_boGhost) and
    (nZilKillCount >= 0) and
    (m_wStatusTimeArr[POISON_STONE {5 0x6A}] = 0) and
    (m_VisibleActors.Count > 0) and
    ((GetTickCount - dw558) >= dw560) then begin
    m_Abil.MaxHP := m_Abil.MaxHP shr 1;
    m_dwFightExp := m_dwFightExp div 2;
    m_Abil.HP := m_Abil.MaxHP;
    m_WAbil.HP := m_Abil.MaxHP;
    ReAlive();
    m_dwWalkTick := GetTickCount + 1000
  end;
  inherited;
end;

{ TWhiteSkeleton }

constructor TWhiteSkeleton.Create; //00004AACCC
begin
  inherited;
  m_boIsFirst := True;
  m_boFixedHideMode := True;
  m_btRaceServer := 100;
  m_nViewRange := 6;
end;

destructor TWhiteSkeleton.Destroy;
begin

  inherited;
end;

procedure TWhiteSkeleton.RecalcAbilitys; //004AAD38
begin
  inherited;
  sub_4AAD54();
end;

procedure TWhiteSkeleton.Run;
begin
  if m_boIsFirst then begin
    m_boIsFirst := False;
    m_btDirection := 5;
    m_boFixedHideMode := False;
    SendRefMsg(RM_DIGUP, m_btDirection, m_nCurrX, m_nCurrY, 0, '');
  end;
  inherited;
end;

procedure TWhiteSkeleton.sub_4AAD54; //004AAD54
begin
  m_nNextHitTime := 3000 - m_btSlaveMakeLevel * 600;
  m_nWalkSpeed := 1200 - m_btSlaveMakeLevel * 250;
  m_dwWalkTick := GetTickCount + 2000;
end;

{ TScultureMonster }

constructor TScultureMonster.Create; //004AAE20
begin
  inherited;
  m_dwSearchTime := Random(1500) + 1500;
  m_nViewRange := 7;
  m_boStoneMode := True;
  m_nCharStatusEx := STATE_STONE_MODE;
end;

destructor TScultureMonster.Destroy;
begin

  inherited;
end;

procedure TScultureMonster.MeltStone;
begin
  m_nCharStatusEx := 0;
  m_nCharStatus := GetCharStatus();
  SendRefMsg(RM_DIGUP, m_btDirection, m_nCurrX, m_nCurrY, 0, '');
  m_boStoneMode := False;
end;

procedure TScultureMonster.MeltStoneAll;
var
  I: Integer;
  List10: TList;
  ActorObject: TActorObject;
begin
  MeltStone();
  List10 := TList.Create;
  GetMapActorObjects(m_PEnvir, m_nCurrX, m_nCurrY, 7, List10);
  for I := 0 to List10.Count - 1 do begin
    ActorObject := TActorObject(List10.Items[I]);
    if ActorObject <> nil then begin
      if ActorObject.m_boStoneMode then begin
        if ActorObject is TScultureMonster then begin
          TScultureMonster(ActorObject).MeltStone
        end;
      end;
    end;
  end; // for
  List10.Free;
end;

procedure TScultureMonster.Run;
var
  I: Integer;
  n10: Integer;
  ActorObject: TActorObject;
begin
  if (not m_boGhost) and
    (not m_boDeath) and
    (m_wStatusTimeArr[POISON_STONE {5 0x6A}] = 0) and
    (Integer(GetTickCount - m_dwWalkTick) >= m_nWalkSpeed) then begin
    n10 := 0;
    if m_boStoneMode then begin
      for I := 0 to m_VisibleActors.Count - 1 do begin
        ActorObject := TActorObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
        if ActorObject.m_boDeath then Continue;
        if IsProperTarget(ActorObject) then begin
          if not ActorObject.m_boHideMode or m_boCoolEye then begin
            if (abs(m_nCurrX - ActorObject.m_nCurrX) <= 2) and (abs(m_nCurrY - ActorObject.m_nCurrY) <= 2) then begin
              MeltStoneAll();
              Break;
            end;
          end;
        end;
      end; // for
    end else begin
      if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
        (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
        m_dwSearchEnemyTick := GetTickCount();
        SearchTarget();
      end;
    end;
  end;
  inherited;
end;

{ TScultureKingMonster }

constructor TScultureKingMonster.Create; //004AB120
begin
  inherited;
  m_dwSearchTime := Random(1500) + 1500;
  m_nViewRange := 8;
  m_boStoneMode := True;
  m_nCharStatusEx := STATE_STONE_MODE;
  m_btDirection := 5;
  m_nDangerLevel := 5;
  m_SlaveObjectList := TList.Create;
end;

destructor TScultureKingMonster.Destroy;
begin
  m_SlaveObjectList.Free;
  inherited;
end;

procedure TScultureKingMonster.MeltStone;
var
  Event: TEvent;
begin
  m_nCharStatusEx := 0;
  m_nCharStatus := GetCharStatus();
  SendRefMsg(RM_DIGUP, m_btDirection, m_nCurrX, m_nCurrY, 0, '');
  m_boStoneMode := False;
  Event := TEvent.Create(m_PEnvir, m_nCurrX, m_nCurrY, 6, 5 * 60 * 1000, True);
  g_EventManager.AddEvent(Event);
end;

procedure TScultureKingMonster.CallSlave;
var
  I: Integer;
  nC: Integer;
  n10, n14: Integer;
  //sMonName:array[0..3] of String;
  ActorObject: TActorObject;
begin
  nC := Random(6) + 6;
  GetFrontPosition(n10, n14);
  {
  sMonName[0]:=sZuma1;
  sMonName[1]:=sZuma2;
  sMonName[2]:=sZuma3;
  sMonName[3]:=sZuma4;
  }
  for I := 1 to nC do begin
    if m_SlaveObjectList.Count >= 30 then Break;
    ActorObject := UserEngine.RegenMonsterByName(nil, m_sMapName, n10, n14, g_Config.sZuma[Random(4)]);
    if ActorObject <> nil then begin
      //ActorObject.m_Master:=Self;
      //ActorObject.m_dwMasterRoyaltyTick:=GetTickCount + 24 * 60 * 60 * 1000;
      m_SlaveObjectList.Add(ActorObject);
    end;
  end; // for
end;

procedure TScultureKingMonster.Attack(TargeTActorObject: TActorObject; nDir: Integer); //004AB3E8
var
  WAbil: pTAbility;
  nPower: Integer;
begin
  if TargeTActorObject <> nil then begin
    WAbil := @m_WAbil;
    nPower := GetAttackPower(LoWord(WAbil.DC), Integer(HiWord(WAbil.DC) - LoWord(WAbil.DC)));
    HitMagAttackTarget(TargeTActorObject, 0, nPower, True);
  end;
end;

procedure TScultureKingMonster.Run;
var
  I: Integer;
  n10: Integer;
  ActorObject: TActorObject;
begin
  if (not m_boGhost) and
    (not m_boDeath) and
    (m_wStatusTimeArr[POISON_STONE {5 0x6A}] = 0) and
    (Integer(GetTickCount - m_dwWalkTick) >= m_nWalkSpeed) then begin
    n10 := 0;
    if m_boStoneMode then begin
      //MeltStone();//������
      for I := 0 to m_VisibleActors.Count - 1 do begin
        ActorObject := TActorObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
        if ActorObject.m_boDeath then Continue;
        if IsProperTarget(ActorObject) then begin
          if not ActorObject.m_boHideMode or m_boCoolEye then begin
            if (abs(m_nCurrX - ActorObject.m_nCurrX) <= 2) and (abs(m_nCurrY - ActorObject.m_nCurrY) <= 2) then begin
              MeltStone();
              Break;
            end;
          end;
        end;
      end; // for
    end else begin
      if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
        (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
        m_dwSearchEnemyTick := GetTickCount();
        SearchTarget();
        //CallSlave(); //������
        if (m_nDangerLevel > m_WAbil.HP / m_WAbil.MaxHP * 5) and (m_nDangerLevel > 0) then begin
          Dec(m_nDangerLevel);
          CallSlave();
        end;
        if m_WAbil.HP = m_WAbil.MaxHP then
          m_nDangerLevel := 5;
      end;
    end;
    for I := m_SlaveObjectList.Count - 1 downto 0 do begin
      if m_SlaveObjectList.Count <= 0 then Break;
      ActorObject := TActorObject(m_SlaveObjectList.Items[I]);
      if ActorObject <> nil then begin
        if ActorObject.m_boDeath or ActorObject.m_boGhost then
          m_SlaveObjectList.Delete(I);
      end;
    end; // for
  end;
  inherited;
end;
{ TGasMothMonster }

constructor TGasMothMonster.Create; //004AB6B8
begin
  inherited;
  m_nViewRange := 7;
end;

destructor TGasMothMonster.Destroy;
begin

  inherited;
end;

function TGasMothMonster.sub_4A9C78(bt05: Byte): TActorObject; //004AB708
var
  ActorObject: TActorObject;
begin
  ActorObject := inherited sub_4A9C78(bt05);
  if (ActorObject <> nil) and (Random(3) = 0) and (ActorObject.m_boHideMode) then begin
    ActorObject.m_wStatusTimeArr[STATE_TRANSPARENT {8 0x70}] := 1;
  end;
  Result := ActorObject;
end;

procedure TGasMothMonster.Run; //004AB758
var
  n08, nC: Integer;
begin
  n08 := 9999;
  nC := 0;
  if (not m_boDeath) and
    (not bo554) and
    (not m_boGhost) and
    (m_wStatusTimeArr[POISON_STONE {5 0x6A}] = 0) and
    (Integer(GetTickCount - m_dwWalkTick) >= m_nWalkSpeed) then begin
    if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
      (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
      m_dwSearchEnemyTick := GetTickCount();
      SearchTarget2();
    end;
  end;
  inherited;
end;
{ TGasDungMonster }

constructor TGasDungMonster.Create; //004AB7F4
begin
  inherited;
  m_nViewRange := 7;
end;

destructor TGasDungMonster.Destroy;
begin

  inherited;
end;

{ TElfMonster }

procedure TElfMonster.AppearNow; //004AB908 ����
begin
  boIsFirst := False;
  m_boFixedHideMode := False;
  //SendRefMsg (RM_DIGUP, m_btDirection, m_nCurrX, m_nCurrY, 0, '');
//   Appear;
//   ResetElfMon;
  RecalcAbilitys;
  m_dwWalkTick := m_dwWalkTick + 800; //
end;

constructor TElfMonster.Create;
//004AB844
begin
  inherited;
  m_nViewRange := 6;
  m_boFixedHideMode := True;
  m_boNoAttackMode := True;
  boIsFirst := True;
end;

destructor TElfMonster.Destroy;
begin

  inherited;
end;

procedure TElfMonster.RecalcAbilitys; //004AB8B0
begin
  inherited;
  ResetElfMon();
end;

procedure TElfMonster.ResetElfMon(); //004AB8CC
begin
  m_nWalkSpeed := 500 - m_btSlaveMakeLevel * 50;
  m_dwWalkTick := GetTickCount - 2000; //2008-3-36����
end;

procedure TElfMonster.Run;
var
  boChangeFace: Boolean;
  ElfMon: TActorObject;
begin
  {if boIsFirst then begin
    boIsFirst := False;
    m_boFixedHideMode := False;
    SendRefMsg(RM_DIGUP, m_btDirection, m_nCurrX, m_nCurrY, 0, '');
    ResetElfMon();
  end;}
  if m_boDeath then begin
    if (GetTickCount - m_dwDeathTick > 2 * 1000) then begin
      MakeGhost();
    end;
  end else begin
    boChangeFace := False;
    if m_TargetCret <> nil then begin
      boChangeFace := True;
    end;
    if (m_Master <> nil) and ((m_Master.m_TargetCret <> nil) or (m_Master.m_LastHiter <> nil)) then begin
      boChangeFace := True;
    end;
    if boChangeFace then begin //�ı�Ϊ����״̬
      //ElfMon:=MakeClone(sDogz1,Self);
      ElfMon := MakeClone(m_sCharName + '1', Self);
      if ElfMon <> nil then begin
        ElfMon.m_boAutoChangeColor := m_boAutoChangeColor;
        if ElfMon is TElfWarriorMonster then TElfWarriorMonster(ElfMon).AppearNow;
        m_Master := nil;
        KickException();
      end;
    end;
  end;
  inherited;
end;
{ TElfWarriorMonster }

procedure TElfWarriorMonster.AppearNow;
begin
  boIsFirst := False;
  m_boFixedHideMode := False;
  SendRefMsg(RM_DIGUP, m_btDirection, m_nCurrX, m_nCurrY, 0, '');
  RecalcAbilitys;
  m_dwWalkTick := m_dwWalkTick + 800; //������ �ణ ������ ����
  dwDigDownTick := GetTickCount();
end;

constructor TElfWarriorMonster.Create;
begin
  inherited;
  m_nViewRange := 6;
  m_boFixedHideMode := True;
  boIsFirst := True;
  m_boUsePoison := False;
end;

destructor TElfWarriorMonster.Destroy;
begin

  inherited;
end;

procedure TElfWarriorMonster.RecalcAbilitys;
begin
  inherited;
  ResetElfMon();
end;

procedure TElfWarriorMonster.ResetElfMon();
begin
  m_nNextHitTime := 1500 - m_btSlaveMakeLevel * 100;
  m_nWalkSpeed := 500 - m_btSlaveMakeLevel * 50;
  m_dwWalkTick := GetTickCount + 2000;
end;

procedure TElfWarriorMonster.Run;
var
  boChangeFace: Boolean;
  ElfMon: TActorObject;
  ElfName: string;
begin
  ElfMon := nil;
  if boIsFirst then begin
    boIsFirst := False;
    m_boFixedHideMode := False;
    SendRefMsg(RM_DIGUP, m_btDirection, m_nCurrX, m_nCurrY, 0, '');
    ResetElfMon();
  end;
  if m_boDeath then begin
    if (GetTickCount - m_dwDeathTick > 2 * 1000) then begin
      MakeGhost();
    end;
  end else begin
    boChangeFace := True;
    if m_TargetCret <> nil then boChangeFace := False;
    if (m_Master <> nil) and ((m_Master.m_TargetCret <> nil) or (m_Master.m_LastHiter <> nil)) then
      boChangeFace := False;
    if boChangeFace then begin
      if (GetTickCount - dwDigDownTick) > 6 * 10 * 1000 then begin
        //if (GetTickCount - dwDigDownTick) > 10 * 1000 then begin
          //ElfMon:=MakeClone(sDogz,Self);
        ElfName := m_sCharName;
        if ElfName[Length(ElfName)] = '1' then begin
          ElfName := Copy(ElfName, 1, Length(ElfName) - 1);
          ElfMon := MakeClone(ElfName, Self);
        end;
        if ElfMon <> nil then begin
          SendRefMsg(RM_DIGDOWN, m_btDirection, m_nCurrX, m_nCurrY, 0, '');
          SendRefMsg(RM_CHANGEFACE, 0, Integer(Self), Integer(ElfMon), 0, '');
          ElfMon.m_boAutoChangeColor := m_boAutoChangeColor;
          if ElfMon is TElfMonster then
            TElfMonster(ElfMon).AppearNow;
          m_Master := nil;
          KickException();
        end;
      end;
    end else begin
      dwDigDownTick := GetTickCount();
    end;
  end;
  inherited;
end;

{ TElectronicScolpionMon }

constructor TElectronicScolpionMon.Create;
begin
  inherited;
  m_dwSearchTime := Random(1500) + 1500;
  m_boUseMagic := False;
end;

destructor TElectronicScolpionMon.Destroy;
begin

  inherited;
end;

procedure TElectronicScolpionMon.LightingAttack(nDir: Integer);
var
  WAbil: pTAbility;
  nPower, nDamage: Integer;
  btGetBackHP: Integer;
begin
  if m_TargetCret <> nil then begin
    m_btDirection := nDir;
    WAbil := @m_WAbil;
    nPower := GetAttackPower(LoWord(WAbil.MC), Integer(HiWord(WAbil.MC) - LoWord(WAbil.MC)));
    nDamage := m_TargetCret.GetMagStruckDamage(Self, nPower);
    m_TargetCret.StartNewShield();
    if nDamage > 0 then begin
      btGetBackHP := LoByte(m_WAbil.MP);
      if btGetBackHP <> 0 then Inc(m_WAbil.HP, nDamage div btGetBackHP);
      m_TargetCret.StruckDamage(nDamage);

      m_TargetCret.SendDelayMsg(TActorObject(RM_STRUCK), RM_10101, nDamage, m_TargetCret.m_WAbil.HP, m_TargetCret.m_WAbil.MaxHP, Integer(Self), '', 200);

      nDamage := m_TargetCret.GetAddPowerPoint(4, nDamage); //�����˺�
      if nDamage > 0 then begin
        //nDamage := nDamage + m_TargetCret.GetAddPowerPoint(5, nDamage);
        StruckDamage(nDamage);
        SendDelayMsg(TActorObject(RM_STRUCK), RM_10101, nDamage, m_WAbil.HP, m_WAbil.MaxHP, Integer(m_TargetCret), '', 200);
      end;


    end;
    SendRefMsg(RM_LIGHTING, 1, m_nCurrX, m_nCurrY, Integer(m_TargetCret), '');
  end;
end;

procedure TElectronicScolpionMon.Run;
var
  nAttackDir: Integer;
  nX, nY: Integer;
begin
  if (not m_boDeath) and
    (not bo554) and
    (not m_boGhost) and
    (m_wStatusTimeArr[POISON_STONE {5 0x6A}] = 0) then begin

    //Ѫ������һ��ʱ��ʼ��ħ������
    if m_WAbil.HP < m_WAbil.MaxHP div 2 then m_boUseMagic := True
    else m_boUseMagic := False;

    if ((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil) then begin
      m_dwSearchEnemyTick := GetTickCount();
      SearchTarget();
    end;
    if m_TargetCret = nil then Exit;

    nX := abs(m_nCurrX - m_TargetCret.m_nCurrX);
    nY := abs(m_nCurrY - m_TargetCret.m_nCurrY);

    if (nX <= 2) and (nY <= 2) then begin
      if m_boUseMagic or ((nX = 2) or (nY = 2)) then begin
        if (Integer(GetTickCount - m_dwHitTick) > m_nNextHitTime) then begin
          m_dwHitTick := GetTickCount();
          nAttackDir := GetNextDirection(m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
          LightingAttack(nAttackDir);
        end;
      end;
    end;
  end;
  inherited Run;
end;

end.

