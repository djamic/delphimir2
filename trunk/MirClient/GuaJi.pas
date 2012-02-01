unit GuaJi;

interface
uses
  Windows, Classes, SysUtils, Graphics, Controls, HUtil32, Grobal2, PathFind, Actor;
type
  TMapWalkXY = record
    boWalk: Boolean;
    nMonCount: Integer;
    nX: Integer;
    nY: Integer;
  end;
  pTMapWalkXY = ^TMapWalkXY;

  TGuaJi = class
    m_TargetCret: TActor;
    m_nTargetX: Integer; //Ŀ������
    m_nTargetY: Integer; //Ŀ������
  private
    FPath: TPath;
    FPathPoisonIndex: Integer;
    FStarted: Boolean;
    FRunTick: LongWord;
    FAttackTick: LongWord;
    function CanRunEx(sx, sY, ex, ey: Integer; Flag: Boolean): Boolean;
    function CanWalkEx(nTargetX, nTargetY: Integer; Flag: Boolean): Boolean;
    function CanWalk(nTargetX, nTargetY: Integer; Flag: Boolean): Boolean;
    procedure SetStarted(Value: Boolean);
    procedure Avoid;
    function UseMagic: Boolean;
    function GetNearTargetCount(): Integer;
    function GetRangeTargetCount(nX, nY, nRange: Integer): Integer;
    procedure SearchTarget;
    procedure GetAutoWalkXY(var nTargetX, nTargetY: Integer);
    function GetNextPosition(sX, sY, nDir, nFlag: Integer; var snx: Integer; var sny: Integer): Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Start;
    procedure Stop;
    procedure Run;
    property Started: Boolean read FStarted write SetStarted;
  end;
implementation
uses MShare, FState, ClMain, ClFunc;

constructor TGuaJi.Create;
begin
  inherited;
  FStarted := False;
  FPath := nil;
  m_TargetCret := nil;
  m_nTargetX := -1; //Ŀ������
  m_nTargetY := -1; //Ŀ������
  FRunTick := GetTickCount;
  FAttackTick := GetTickCount;
end;

destructor TGuaJi.Destroy;
begin
  inherited;
end;

procedure TGuaJi.Start;
begin

end;

procedure TGuaJi.Stop;
begin
  if FStarted then begin
    FStarted := False;
    FPath := nil;
    DScreen.AddChatBoardString('ֹͣ�һ� Ctrl + L', clYellow, clRed);
  end;
end;

procedure TGuaJi.SetStarted(Value: Boolean);
begin
  if FStarted <> Value then begin
    if FStarted then
      Stop
    else
      Start;
  end;
end;

function TGuaJi.GetNextPosition(sX, sY, nDir, nFlag: Integer; var snx: Integer; var sny: Integer): Boolean;
begin
  snx := sX;
  sny := sY;
  case nDir of
    DR_UP: if sny > nFlag - 1 then Dec(sny, nFlag);
    DR_DOWN: if sny < (Map.m_nHeight - nFlag) then Inc(sny, nFlag);
    DR_LEFT: if snx > nFlag - 1 then Dec(snx, nFlag);
    DR_RIGHT: if snx < (Map.m_nWidth - nFlag) then Inc(snx, nFlag);
    DR_UPLEFT: begin
        if (snx > nFlag - 1) and (sny > nFlag - 1) then begin
          Dec(snx, nFlag);
          Dec(sny, nFlag);
        end;
      end;
    DR_UPRIGHT: begin
        if (snx > nFlag - 1) and (sny < (Map.m_nHeight - nFlag)) then begin
          Inc(snx, nFlag);
          Dec(sny, nFlag);
        end;
      end;
    DR_DOWNLEFT: begin
        if (snx < (Map.m_nWidth - nFlag)) and (sny > nFlag - 1) then begin
          Dec(snx, nFlag);
          Inc(sny, nFlag);
        end;
      end;
    DR_DOWNRIGHT: begin
        if (snx < (Map.m_nWidth - nFlag)) and (sny < (Map.m_nHeight - nFlag)) then begin
          Inc(snx, nFlag);
          Inc(sny, nFlag);
        end;
      end;
  end;
  if (snx = sX) and (sny = sY) then Result := False
  else Result := True;
end;

function TGuaJi.CanWalkEx(nTargetX, nTargetY: Integer; Flag: Boolean): Boolean;
begin
  Result := Map.CanMove(nTargetX, nTargetY);
  if Flag then
    Result := not PlayScene.CrashManEx(nTargetX, nTargetY);
end;

function TGuaJi.CanRunEx(sx, sY, ex, ey: Integer; Flag: Boolean): Boolean;
var
  ndir, rx, ry: Integer;
begin
  ndir := GetNextDirection(sx, sY, ex, ey);
  rx := sx;
  ry := sY;
  GetNextPosXY(ndir, rx, ry);

  if Map.CanMove(rx, ry) and Map.CanMove(ex, ey) then
    Result := True
  else Result := False;

  if Flag then begin
    if CanWalkEx(rx, ry, Flag) and CanWalkEx(ex, ey, Flag) then
      Result := True
    else Result := False;
  end;
end;

function TGuaJi.CanWalk(nTargetX, nTargetY: Integer; Flag: Boolean): Boolean;
var
  nDir: Integer;
  nX, nY: Integer;
  nX1, nY1: Integer;
begin
  Result := True;
  nDir := GetNextDirection(g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, nTargetX, nTargetY);
  nX := g_MySelf.m_nCurrX;
  nY := g_MySelf.m_nCurrY;
  nX1 := nTargetX;
  nY1 := nTargetY;
  if (abs(nX - nX1) >= 2) or (abs(nY - nY1) >= 2) then begin
    while True do begin
      if nDir <> GetNextDirection(nX, nY, nTargetX, nTargetY) then break;
      if (abs(nX - nX1) >= 2) or (abs(nY - nY1) >= 2) then begin
        if GetNextPosition(nX, nY, nDir, 2, nX1, nY1) then begin
          if CanRunEx(nX, nY, nX1, nY1, Flag) then begin
            nX := nX1;
            nY := nY1;
            nX1 := nTargetX;
            nY1 := nTargetY;
          end else begin
            Result := False;
            break;
          end;
        end else begin
          Result := False;
          break;
        end;
      end else begin
        if GetNextPosition(nX, nY, nDir, 1, nX1, nY1) then begin
          if CanWalkEx(nX1, nY1, Flag) then begin
            nX := nX1;
            nY := nY1;
            nX1 := nTargetX;
            nY1 := nTargetY;
          end else begin
            Result := False;
            break;
          end;
        end else begin
          Result := False;
          break;
        end;
      end;
    end;
  end else begin
    Result := CanWalkEx(nX1, nY1, Flag);
  end;
end;

procedure TGuaJi.GetAutoWalkXY(var nTargetX, nTargetY: Integer);
  function GetRandXY(var nX: Integer; var nY: Integer): Boolean;
  begin
    Result := False;
    if (abs(g_MySelf.m_nCurrX - nX) >= 2) or (abs(g_MySelf.m_nCurrY - nY) >= 2) then begin
      if PlayScene.CanRun(g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, nX, nY) then
        Result := (nX <> g_MySelf.m_nCurrX) or (nY <> g_MySelf.m_nCurrY);
    end else begin
      if PlayScene.CanWalkEx(nX, nY) then
        Result := (nX <> g_MySelf.m_nCurrX) or (nY <> g_MySelf.m_nCurrY);
    end;
  end;

  function GetNextDir(btDir: Byte): Byte;
  begin
    case btDir of
      DR_UP: Result := DR_UPRIGHT;
      DR_UPRIGHT: Result := DR_RIGHT;
      DR_RIGHT: Result := DR_DOWNRIGHT;
      DR_DOWNRIGHT: Result := DR_DOWN;
      DR_DOWN: Result := DR_DOWNLEFT;
      DR_DOWNLEFT: Result := DR_LEFT;
      DR_LEFT: Result := DR_UPLEFT;
      DR_UPLEFT: Result := DR_UP;
    end;
  end;
var
  nStep: Integer;
  btDir: Byte;
  nCount: Integer;
begin
  nTargetX := g_MySelf.m_nCurrX;
  nTargetY := g_MySelf.m_nCurrY;

  for nStep := 2 downto 1 do begin
    if GetNextPosition(g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, g_MySelf.m_btDir, nStep, nTargetX, nTargetY) then begin
      if GetRandXY(nTargetX, nTargetY) then begin
       { DScreen.AddChatBoardString('GetAutoWalkXY:' + IntToStr(nStep) + ' nX' + IntToStr(g_MySelf.m_nCurrX) + ' nY' + IntToStr(g_MySelf.m_nCurrY) +
          ' nTargetX' + IntToStr(nTargetX) + ' nTargetY' + IntToStr(nTargetY), clYellow, clRed); }
        Exit;
      end;
    end;
  end;

  nCount := 0;
  btDir := g_MySelf.m_btDir;
  while True do begin
    Inc(nCount);
    btDir := GetNextDir(btDir);
    for nStep := 2 downto 1 do begin
      if GetNextPosition(g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, btDir, nStep, nTargetX, nTargetY) then begin
        if GetRandXY(nTargetX, nTargetY) then begin
          Exit;
        end;
      end;
    end;
    if (nCount >= 8) then Break;
  end;
end;

function TGuaJi.GetNearTargetCount(): Integer;
var
  nC, n10, I: Integer;
  nX, nY: Integer;
  Actor: TActor;
begin
  Result := 0;
  for n10 := 0 to 7 do begin
    if GetNextPosition(g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, n10, 1, nX, nY) then begin
      Actor := PlayScene.FindActorXY(nX, nY);
      if (Actor <> nil) and
        (not Actor.m_boDeath) and
        (Actor <> g_MySelf) and
        (Actor <> g_MyHero) and
        (Actor.m_btRace > RCC_USERHUMAN) and
        (Actor.m_btRace <> RCC_GUARD) and
        (Actor.m_btRace <> RC_ARCHERGUARD) and
        (Actor.m_btRace <> 52) and
        (Actor.m_btRace <> 81) and
        (Actor.m_btRace <> 12) and
        //(Actor.m_btRace <> 19) and
        //(Actor.m_btRace <> 45) and
      (Actor.m_btRace <> RCC_MERCHANT) and
        (Pos('(', Actor.m_sUserName) = 0) then begin


        Inc(Result);
      end;
    end;
  end;
end;

function TGuaJi.GetRangeTargetCount(nX, nY, nRange: Integer): Integer;
begin
  Result := PlayScene.FindTargetXYCount(nX, nY, nRange);
end;

procedure TGuaJi.SearchTarget;
var
  Actor, Actor18: TActor;
  I, nC, n10: Integer;
  tdir, dx, dy: Integer;
begin
  //if IsMasterRange(m_nCurrX, m_nCurrY, 8) and (m_TargetCret = nil) then begin //������ͬһ��Ļ�������Զ��ѹ�
  Actor18 := nil;
  n10 := 9999;
  with PlayScene do begin
    for I := 0 to m_ActorList.Count - 1 do begin
      Actor := TActor(m_ActorList[I]);
      //nC := abs(g_MySelf.m_nCurrX - Actor.m_nCurrX) + abs(g_MySelf.m_nCurrY - Actor.m_nCurrY);
      if Actor.m_boDeath or (Actor.m_Abil.HP = 0) or (abs(Actor.m_nCurrX - g_MySelf.m_nCurrX) > 7) or (abs(Actor.m_nCurrY - g_MySelf.m_nCurrY) > 7) then Continue;
        //if ((Actor.m_btRace > RCC_USERHUMAN) and (Actor.m_btRace <> RCC_MERCHANT)) then begin
        //if IsProperTarget(ActorObject) and
          //(not ActorObject.m_boHideMode or m_boCoolEye) then begin
          {
          if (m_btRaceServer = RC_HEROOBJECT) and m_boAutoAttack then begin
            if (ActorObject.m_TargetCret <> nil) and (ActorObject.m_TargetCret <> Self) then Continue; //������
          end;
          }
      tdir := GetNextDirection(g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, Actor.m_nCurrX, Actor.m_nCurrY);
      GetBackPosition(Actor.m_nCurrX, Actor.m_nCurrY, tdir, dx, dy);
      if (not Actor.m_boDeath) and
        (Actor <> g_MySelf) and
        (Actor <> g_MyHero) and
        (Actor.m_btRace > RCC_USERHUMAN) and
        (Actor.m_btRace <> RCC_GUARD) and
        (Actor.m_btRace <> RC_ARCHERGUARD) and
        (Actor.m_btRace <> 52) and
        (Actor.m_btRace <> 81) and
        (Actor.m_btRace <> 12) and
        //(Actor.m_btRace <> 19) and
        //(Actor.m_btRace <> 45) and
      (Actor.m_btRace <> RCC_MERCHANT) and
        (Pos('(', Actor.m_sUserName) = 0) and
        Self.CanWalk(dx, dy, not UseMagic) then begin

        nC := abs(g_MySelf.m_nCurrX - Actor.m_nCurrX) + abs(g_MySelf.m_nCurrY - Actor.m_nCurrY);
        if nC < n10 then begin
          n10 := nC;
          Actor18 := Actor;
        end;
      end;
    end;
  end;
  if Actor18 <> nil then
    m_TargetCret := Actor18;
end;

procedure TGuaJi.Avoid;
var
  nC, n10, I: Integer;
  nX, nY: Integer;
  RunCount: array[0..7] of TMapWalkXY;
  WalkCount: array[0..7] of TMapWalkXY;
  MapWalkXY: pTMapWalkXY;
  Actor: TActor;
begin
  FillChar(RunCount, SizeOf(RunCount), 0);
  for n10 := 0 to 7 do begin
    RunCount[n10].boWalk := False;
    RunCount[n10].nMonCount := 0;
  end;
  for n10 := 0 to 7 do begin
    if GetNextPosition(g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, n10, 2, nX, nY) then begin
      if PlayScene.CanRun(g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, nX, nY) then begin
        RunCount[n10].boWalk := True;
        RunCount[n10].nMonCount := GetRangeTargetCount(nX, nY, 2);
        RunCount[n10].nX := nX;
        RunCount[n10].nY := nY;
      end;
    end;
  end;

  MapWalkXY := nil;
  n10 := 9999;
  for I := 0 to 7 do begin
    if RunCount[I].boWalk then begin
      if RunCount[I].nMonCount < n10 then begin
        n10 := RunCount[I].nMonCount;
        MapWalkXY := @RunCount[I];
      end;
    end;
  end;

  if MapWalkXY <> nil then begin
    g_ChrAction := caRun;
    g_nTargetX := MapWalkXY.nX;
    g_nTargetY := MapWalkXY.nY;
    Exit;
  end;

//==============================================================================

  FillChar(WalkCount, SizeOf(WalkCount), 0);

  for n10 := 0 to 7 do begin
    RunCount[n10].boWalk := False;
    RunCount[n10].nMonCount := 0;
  end;

  for n10 := 0 to 7 do begin
    if GetNextPosition(g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, n10, 1, nX, nY) then begin
      if PlayScene.CanWalkEx(nX, nY) then begin
        WalkCount[n10].boWalk := True;
        WalkCount[n10].nMonCount := GetRangeTargetCount(nX, nY, 2);
        WalkCount[n10].nX := nX;
        WalkCount[n10].nY := nY;
      end;
    end;
  end;

  MapWalkXY := nil;
  n10 := 9999;
  for I := 0 to 7 do begin
    if WalkCount[I].boWalk then begin
      if WalkCount[I].nMonCount < n10 then begin
        n10 := WalkCount[I].nMonCount;
        MapWalkXY := @WalkCount[I];
      end;
    end;
  end;

  if MapWalkXY <> nil then begin
    g_ChrAction := caWalk;
    g_nTargetX := MapWalkXY.nX;
    g_nTargetY := MapWalkXY.nY;
  end;
end;

function TGuaJi.UseMagic: Boolean;
var
  pm: PTClientMagic;
begin
  Result := False;
  pm := nil;
  if g_MySelf.m_btJob > 0 then begin
    if {(GetRangeTargetCount(m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY, 2) > 1) and }(FrmDlg.DComboboxGuajiQunti.ItemIndex >= 0) and (FrmDlg.DComboboxGuajiQunti.ItemIndex < FrmDlg.DComboboxGuajiQunti.Items.Count) then
      pm := PTClientMagic(FrmDlg.DComboboxGuajiQunti.Items.Objects[FrmDlg.DComboboxGuajiQunti.ItemIndex]);

    if (pm = nil) and (FrmDlg.DComboboxGuajiGeti.ItemIndex >= 0) and (FrmDlg.DComboboxGuajiGeti.ItemIndex < FrmDlg.DComboboxGuajiGeti.Items.Count) then
      pm := PTClientMagic(FrmDlg.DComboboxGuajiGeti.Items.Objects[FrmDlg.DComboboxGuajiGeti.ItemIndex]);

    Result := pm <> nil;
  end;
end;

procedure TGuaJi.Run;
var
  pm: PTClientMagic;
  nTargetX, nTargetY, tdir, dx, dy: Integer;
begin
  if FStarted then begin
    if g_MySelf = nil then
      Stop;

    if (g_MySelf <> nil) and g_MySelf.m_boDeath then
      Stop;
  end;

      //end;
  //end;
end;

end.

