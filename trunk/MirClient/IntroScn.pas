unit IntroScn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, StdCtrls, Controls, Forms, Dialogs,
  ExtCtrls, Textures, DXClass, Grobal2, ClFunc, HUtil32;
const
  SELECTEDFRAME = 16;
  FREEZEFRAME = 13;
  EFFECTFRAME = 14;
type
  TLoginState = (lsLogin, lsNewid, lsNewidRetry, lsChgpw, lsCloseAll);
  TSceneType = (stIntro, stLogin, stSelectCountry, stSelectChr, stNewChr, stLoading,
    stLoginNotice, stPlayGame);
  TSelChar = record
    Valid: Boolean;
    UserChr: TUserCharacterInfo;
    Selected: Boolean;
    FreezeState: Boolean;
    Unfreezing: Boolean;
    Freezing: Boolean;
    AniIndex: Integer;
    DarkLevel: Integer;
    EffIndex: Integer;
    StartTime: LongWord;
    moretime: LongWord;
    startefftime: LongWord;
  end;

  TDelChar = record
    sChrName: string[14];
    wLevel: LongInt;
    btJob: Byte;
    btSex: Byte;
  end;
  pTDelChar = ^TDelChar;

  TScene = class
  private
  public
    scenetype: TSceneType;
    constructor Create(scenetype: TSceneType);
    procedure Initialize; dynamic;
    procedure Finalize; dynamic;
    procedure OpenScene; dynamic;
    procedure CloseScene; dynamic;
    procedure OpeningScene; dynamic;
    procedure KeyPress(var Key: Char); dynamic;
    procedure KeyDown(var Key: Word; Shift: TShiftState); dynamic;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); dynamic;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); dynamic;
    procedure PlayScene(MSurface: TTexture); dynamic;
  end;

  TIntroScene = class(TScene)
  private
  public
    constructor Create;
    destructor Destroy; override;
    procedure OpenScene; override;
    procedure CloseScene; override;
    procedure PlayScene(MSurface: TTexture); override;
  end;

  TLoginScene = class(TScene)
  private
   { m_EdId: TEdit;
    m_EdPasswd: TEdit;}
    m_EdNewId: TEdit;
    m_EdNewPasswd: TEdit;
    m_EdConfirm: TEdit;
    m_EdYourName: TEdit;
    m_EdSSNo: TEdit;
    m_EdBirthDay: TEdit;
    m_EdQuiz1: TEdit;
    m_EdAnswer1: TEdit;
    m_EdQuiz2: TEdit;
    m_EdAnswer2: TEdit;
    m_EdPhone: TEdit;
    m_EdMobPhone: TEdit;
    m_EdEMail: TEdit;
    m_EdChgId: TEdit;
    m_EdChgCurrentpw: TEdit;
    m_EdChgNewPw: TEdit;
    m_EdChgRepeat: TEdit;
    m_EditRandomCode: TEdit;

    m_nCurFrame: Integer;
    m_nMaxFrame: Integer;
    m_dwStartTime: LongWord;
    m_boNowOpening: Boolean;
    m_boOpenFirst: Boolean;
    m_NewIdRetryUE: TUserEntry;
    m_NewIdRetryAdd: TUserEntryAdd;
    procedure EdLoginIdKeyPress(Sender: TObject; var Key: Char);
    procedure EdLoginPasswdKeyPress(Sender: TObject; var Key: Char);
    procedure EdNewIdKeyPress(Sender: TObject; var Key: Char);
    procedure EdNewOnEnter(Sender: TObject);
    function CheckUserEntrys: Boolean;
    function NewIdCheckNewId: Boolean;
    function NewIdCheckSSno: Boolean;
    function NewIdCheckBirthDay: Boolean;
  public
    m_sLoginId: string;
    m_sLoginPasswd: string;
    m_boUpdateAccountMode: Boolean;
    constructor Create;
    destructor Destroy; override;
    procedure OpenScene; override;
    procedure CloseScene; override;
    procedure PlayScene(MSurface: TTexture); override;
    procedure ChangeLoginState(State: TLoginState);
    procedure NewClick;
    procedure NewIdRetry(boupdate: Boolean);
    procedure UpdateAccountInfos(ue: TUserEntry);
    procedure OkClick;
    procedure ChgPwClick;
    procedure NewAccountOk;
    procedure NewAccountClose;
    procedure ChgpwOk;
    procedure ChgpwCancel;
    procedure ShowLoginBox;
    procedure HideLoginBox;
    procedure OpenLoginDoor;
    procedure PassWdFail;
  end;

  TSelectChrScene = class(TScene)
  private
    SoundTimer: TTimer;
    CreateChrMode: Boolean;
    EdChrName: TEdit;
    m_sTipMsg: string;
    procedure SoundOnTimer(Sender: TObject);
    procedure MakeNewChar(Index: Integer);
    procedure EdChrnameKeyPress(Sender: TObject; var Key: Char);
  public
    NewIndex: Integer;
    ChrArr: array[0..1] of TSelChar;
    DelCharArray: array[0..10 - 1] of TDelChar;
    DelChrCount: Integer;
    SelDelChar: Integer;
    constructor Create;
    destructor Destroy; override;
    procedure OpenScene; override;
    procedure CloseScene; override;
    procedure PlayScene(MSurface: TTexture); override;
    procedure SelChrSelect1Click;
    procedure SelChrSelect2Click;
    procedure SelChrStartClick;
    procedure SelChrNewChrClick;
    procedure SelChrEraseChrClick;
    procedure SelChrCreditsClick;
    procedure SelChrRestoreChrClick;
    procedure SelChrQueryDelChrClick;

    procedure SelChrExitClick;
    procedure SelChrNewClose;
    procedure SelChrNewJob(job: Integer);
    procedure SelChrNewm_btSex(sex: Integer);
    procedure SelChrNewPrevHair;
    procedure SelChrNewNextHair;
    procedure SelChrNewOk;
    procedure ClearChrs;
    procedure AddChr(uname: string; job, hair, Level, sex: Integer);
    procedure SelectChr(Index: Integer);
  end;

  TLoginNotice = class(TScene)
  private
  public
    constructor Create;
    destructor Destroy; override;
  end;
implementation
uses
  ClMain, MShare, Share, SoundUtil, DXSounds, FState, PlugIn;

constructor TScene.Create(scenetype: TSceneType);
begin
  scenetype := scenetype;
end;

procedure TScene.Initialize;
begin
end;

procedure TScene.Finalize;
begin
end;

procedure TScene.OpenScene;
begin
  ;
end;

procedure TScene.CloseScene;
begin
  ;
end;

procedure TScene.OpeningScene;
begin
end;

procedure TScene.KeyPress(var Key: Char);
begin
end;

procedure TScene.KeyDown(var Key: Word; Shift: TShiftState);
begin
end;

procedure TScene.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
end;

procedure TScene.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
end;

procedure TScene.PlayScene(MSurface: TTexture);
begin
  ;
end;


{------------------- TIntroScene ----------------------}


constructor TIntroScene.Create;
begin
  inherited Create(stIntro);
end;

destructor TIntroScene.Destroy;
begin
  inherited Destroy;
end;

procedure TIntroScene.OpenScene;
begin

end;

procedure TIntroScene.CloseScene;
begin

end;

procedure TIntroScene.PlayScene(MSurface: TTexture);
var
  d: TTexture;
begin
  {if g_WCqFirImages.Initialized then begin
    d := g_WCqFirImages.Images[49];
    if d <> nil then begin
      MSurface.Draw((SCREENWIDTH - 800) div 2, (SCREENHEIGHT - 600) div 2, d.ClientRect, d, FALSE);
    end;
  end;}
end;


{--------------------- Login ----------------------}


constructor TLoginScene.Create;
var
  nX, nY: Integer;
begin
  inherited Create(stLogin);
 { m_EdId := TEdit.Create(frmMain.Owner);
  with m_EdId do begin
    Parent := frmMain;
    Color := clblack;
    Font.Color := clWhite;
    Font.Size := 10;
    MaxLength := 10;
    BorderStyle := bsNone;
    OnKeyPress := EdLoginIdKeyPress;
    Visible := False;
    tag := 10;
  end;

  m_EdPasswd := TEdit.Create(frmMain.Owner);
  with m_EdPasswd do begin
    Parent := frmMain; Color := clblack; Font.Size := 10; MaxLength := 10; Font.Color := clWhite;
    BorderStyle := bsNone; PasswordChar := '*';
    OnKeyPress := EdLoginPasswdKeyPress; Visible := False;
    tag := 10;
  end;  }

  nX := SCREENWIDTH div 2 - 320 {192} {79};
  nY := SCREENHEIGHT div 2 - 238 {146} {64};

  m_EdNewId := TEdit.Create(frmMain.Owner);
  with m_EdNewId do begin
    Parent := frmMain;
    Height := 16;
    Width := 116;
    Left := nX + 161;
    Top := nY + 116;
    BorderStyle := bsNone; Color := clblack; Font.Color := clWhite; MaxLength := 30;
    Visible := False; OnKeyPress := EdNewIdKeyPress; OnEnter := EdNewOnEnter;
    tag := 11;
  end;

  m_EdNewPasswd := TEdit.Create(frmMain.Owner);
  with m_EdNewPasswd do begin
    Parent := frmMain;
    Height := 16;
    Width := 116;
    Left := nX + 161;
    Top := nY + 137;
    BorderStyle := bsNone; Color := clblack; Font.Color := clWhite; MaxLength := 16;
    PasswordChar := '*'; Visible := False; OnKeyPress := EdNewIdKeyPress; OnEnter := EdNewOnEnter;
    tag := 11;
  end;
  m_EdConfirm := TEdit.Create(frmMain.Owner);
  with m_EdConfirm do begin
    Parent := frmMain;
    Height := 16;
    Width := 116;
    Left := nX + 161;
    Top := nY + 158;
    BorderStyle := bsNone; Color := clblack; Font.Color := clWhite; MaxLength := 16;
    PasswordChar := '*'; Visible := False; OnKeyPress := EdNewIdKeyPress; OnEnter := EdNewOnEnter;
    tag := 11;
  end;
  m_EdYourName := TEdit.Create(frmMain.Owner);
  with m_EdYourName do begin
    Parent := frmMain; Height := 16; Width := 116; Left := nX + 161; Top := nY + 187;
    BorderStyle := bsNone; Color := clblack; Font.Color := clWhite; MaxLength := 20;
    Visible := False; OnKeyPress := EdNewIdKeyPress; OnEnter := EdNewOnEnter;
    tag := 11;
  end;

  m_EdSSNo := TEdit.Create(frmMain.Owner);
  with m_EdSSNo do begin
    Parent := frmMain; Height := 16; Width := 116; Left := nX + 161; Top := nY + 207;
    BorderStyle := bsNone; Color := clblack; Font.Color := clWhite; MaxLength := 14;
    Visible := False; OnKeyPress := EdNewIdKeyPress; OnEnter := EdNewOnEnter;
    tag := 11; Enabled := False; Text := '650101-1455111';
  end;

  m_EdBirthDay := TEdit.Create(frmMain.Owner);
  with m_EdBirthDay do begin
    Parent := frmMain; Height := 16; Width := 116; Left := nX + 161; Top := nY + 227;
    BorderStyle := bsNone; Color := clblack; Font.Color := clWhite; MaxLength := 10;
    Visible := False; OnKeyPress := EdNewIdKeyPress; OnEnter := EdNewOnEnter;
    tag := 11;
  end;
  m_EdQuiz1 := TEdit.Create(frmMain.Owner);
  with m_EdQuiz1 do begin
    Parent := frmMain; Height := 16; Width := 163; Left := nX + 161; Top := nY + 256;
    BorderStyle := bsNone; Color := clblack; Font.Color := clWhite; MaxLength := 20;
    Visible := False; OnKeyPress := EdNewIdKeyPress; OnEnter := EdNewOnEnter;
    tag := 11;
  end;
  m_EdAnswer1 := TEdit.Create(frmMain.Owner);
  with m_EdAnswer1 do begin
    Parent := frmMain; Height := 16; Width := 163; Left := nX + 161; Top := nY + 276;
    BorderStyle := bsNone; Color := clblack; Font.Color := clWhite; MaxLength := 12;
    Visible := False; OnKeyPress := EdNewIdKeyPress; OnEnter := EdNewOnEnter;
    tag := 11;
  end;
  m_EdQuiz2 := TEdit.Create(frmMain.Owner);
  with m_EdQuiz2 do begin
    Parent := frmMain; Height := 16; Width := 163; Left := nX + 161; Top := nY + 297;
    BorderStyle := bsNone; Color := clblack; Font.Color := clWhite; MaxLength := 20;
    Visible := False; OnKeyPress := EdNewIdKeyPress; OnEnter := EdNewOnEnter;
    tag := 11;
  end;
  m_EdAnswer2 := TEdit.Create(frmMain.Owner);
  with m_EdAnswer2 do begin
    Parent := frmMain; Height := 16; Width := 163; Left := nX + 161; Top := nY + 317;
    BorderStyle := bsNone; Color := clblack; Font.Color := clWhite; MaxLength := 12;
    Visible := False; OnKeyPress := EdNewIdKeyPress; OnEnter := EdNewOnEnter;
    tag := 11;
  end;
  m_EdPhone := TEdit.Create(frmMain.Owner);
  with m_EdPhone do begin
    Parent := frmMain;
    Height := 16;
    Width := 116;
    Left := nX + 161;
    Top := nY + 347;
    BorderStyle := bsNone;
    Color := clblack;
    Font.Color := clWhite;
    MaxLength := 14;
    Visible := False;
    OnKeyPress := EdNewIdKeyPress;
    OnEnter := EdNewOnEnter;
    tag := 11;
  end;
  m_EdMobPhone := TEdit.Create(frmMain.Owner);
  with m_EdMobPhone do begin
    Parent := frmMain;
    Height := 16;
    Width := 116;
    Left := nX + 161;
    Top := nY + 368;
    BorderStyle := bsNone;
    Color := clblack;
    Font.Color := clWhite;
    MaxLength := 13;
    Visible := False;
    OnKeyPress := EdNewIdKeyPress;
    OnEnter := EdNewOnEnter;
    tag := 11;
  end;
  m_EdEMail := TEdit.Create(frmMain.Owner);
  with m_EdEMail do begin
    Parent := frmMain;
    Height := 16;
    Width := 116;
    Left := nX + 161;
    Top := nY + 388;
    BorderStyle := bsNone;
    Color := clblack;
    Font.Color := clWhite;
    MaxLength := 40;
    Visible := False;
    OnKeyPress := EdNewIdKeyPress;
    OnEnter := EdNewOnEnter;
    tag := 11;
  end;

  nX := SCREENWIDTH div 2 - 210 {192} {192};
  nY := SCREENHEIGHT div 2 - 150 {146} {150};
  m_EdChgId := TEdit.Create(frmMain.Owner);
  with m_EdChgId do begin
    Parent := frmMain;
    Height := 16;
    Width := 137;
    Left := nX + 239;
    Top := nY + 117;
    BorderStyle := bsNone;
    Color := clblack;
    Font.Color := clWhite;
    MaxLength := 30;
    Visible := False;
    OnKeyPress := EdNewIdKeyPress;
    OnEnter := EdNewOnEnter;
    tag := 12;
  end;
  m_EdChgCurrentpw := TEdit.Create(frmMain.Owner);
  with m_EdChgCurrentpw do begin
    Parent := frmMain;
    Height := 16;
    Width := 137;
    Left := nX + 239;
    Top := nY + 149;
    BorderStyle := bsNone;
    Color := clblack;
    Font.Color := clWhite;
    MaxLength := 16;
    PasswordChar := '*';
    Visible := False;
    OnKeyPress := EdNewIdKeyPress;
    OnEnter := EdNewOnEnter;
    tag := 12;
  end;
  m_EdChgNewPw := TEdit.Create(frmMain.Owner);
  with m_EdChgNewPw do begin
    Parent := frmMain;
    Height := 16;
    Width := 137;
    Left := nX + 239;
    Top := nY + 176;
    BorderStyle := bsNone;
    Color := clblack;
    Font.Color := clWhite;
    MaxLength := 16;
    PasswordChar := '*';
    Visible := False;
    OnKeyPress := EdNewIdKeyPress;
    OnEnter := EdNewOnEnter;
    tag := 12;
  end;
  m_EdChgRepeat := TEdit.Create(frmMain.Owner);
  with m_EdChgRepeat do begin
    Parent := frmMain;
    Height := 16;
    Width := 137;
    Left := nX + 239;
    Top := nY + 208;
    BorderStyle := bsNone;
    Color := clblack;
    Font.Color := clWhite;
    MaxLength := 16;
    PasswordChar := '*';
    Visible := False;
    OnKeyPress := EdNewIdKeyPress;
    OnEnter := EdNewOnEnter;
    tag := 12;
  end;
end;

destructor TLoginScene.Destroy;
begin
  inherited Destroy;
end;

procedure TLoginScene.OpenScene;
var
  I: Integer;
  d: TTexture;
begin
  m_nCurFrame := 0;
  m_nMaxFrame := 10;
  m_sLoginId := '';
  m_sLoginPasswd := '';

 (* with m_EdId do begin
    Left := SCREENWIDTH div 2 - 68 + 18 {350};
    Top := SCREENHEIGHT div 2 - 8 - 34 {259};
    Height := 16;
    Width := 137;
    Visible := False;
  end;
  with m_EdPasswd do begin
    Left := SCREENWIDTH div 2 - 68 + 18 {350};
    Top := SCREENHEIGHT div 2 - 8 - 2 {291};
    Height := 16;
    Width := 137;
    Visible := False;
  end;  *)
  m_boOpenFirst := True;

  FrmDlg.DLogin.Visible := False; //True;
  FrmDlg.EdId.Visible := False;
  FrmDlg.EdPasswd.Visible := False;

  FrmDlg.DNewAccount.Visible := False;
  m_boNowOpening := False;
  HideLoginBox;
  PlayBGM(bmg_intro);
end;

procedure TLoginScene.CloseScene;
begin
  {m_EdId.Visible := False;
  m_EdPasswd.Visible := False; }

  FrmDlg.DLogin.Visible := False;
  SilenceSound;
end;

procedure TLoginScene.EdLoginIdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    Key := #0;
    //m_sLoginId := LowerCase(m_EdId.Text);
    m_sLoginId := LowerCase(FrmDlg.EdId.Text);
    if m_sLoginId <> '' then begin
      //m_EdPasswd.SetFocus;
      FrmDlg.EdPasswd.SetFocus;
    end;
  end;
end;

procedure TLoginScene.EdLoginPasswdKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = '~') or (Key = '''') then Key := '_';
  if Key = #13 then begin
    Key := #0;
    m_sLoginId := LowerCase(FrmDlg.EdId.Text);
    m_sLoginPasswd := FrmDlg.EdPasswd.Text;
    if (m_sLoginId <> '') and (m_sLoginPasswd <> '') then begin
      frmMain.SendLogin(m_sLoginId, m_sLoginPasswd);
      FrmDlg.EdId.Text := '';
      FrmDlg.EdPasswd.Text := '';

     { m_EdId.Visible := False;
      m_EdPasswd.Visible := False;}
    end else
      if (FrmDlg.EdId.Visible) and (FrmDlg.EdId.Text = '') then FrmDlg.EdId.SetFocus;
  end;
 { if (Key = '~') or (Key = '''') then Key := '_';
  if Key = #13 then begin
    Key := #0;
    m_sLoginId := LowerCase(m_EdId.Text);
    m_sLoginPasswd := m_EdPasswd.Text;
    if (m_sLoginId <> '') and (m_sLoginPasswd <> '') then begin
      frmMain.SendLogin(m_sLoginId, m_sLoginPasswd);
      m_EdId.Text := '';
      m_EdPasswd.Text := '';
      m_EdId.Visible := False;
      m_EdPasswd.Visible := False;
    end else
      if (m_EdId.Visible) and (m_EdId.Text = '') then m_EdId.SetFocus;
  end; }
end;

procedure TLoginScene.PassWdFail;
begin
  {m_EdId.Visible := True;
  m_EdPasswd.Visible := True;
  m_EdId.SetFocus; }
  FrmDlg.EdId.SetFocus;
end;

function TLoginScene.NewIdCheckNewId: Boolean;
begin
  Result := True;
  m_EdNewId.Text := Trim(m_EdNewId.Text);
  if Length(m_EdNewId.Text) < 3 then begin
    FrmDlg.DMessageDlg('ID in use, please enter a new ID', [mbOk]);
    Beep;
    m_EdNewId.SetFocus;
    Result := False;
  end;
end;

function TLoginScene.NewIdCheckSSno: Boolean;
var
  Str, t1, t2, t3, syear, smon, sday: string;
  ayear, amon, aday, sex: Integer;
  flag: Boolean;
begin
  Result := True;
  Str := m_EdSSNo.Text;
  Str := GetValidStr3(Str, t1, ['-']);
  GetValidStr3(Str, t2, ['-']);
  flag := True;
  if (Length(t1) = 6) and (Length(t2) = 7) then begin
    smon := Copy(t1, 3, 2);
    sday := Copy(t1, 5, 2);
    amon := Str_ToInt(smon, 0);
    aday := Str_ToInt(sday, 0);
    if (amon <= 0) or (amon > 12) then flag := False;
    if (aday <= 0) or (aday > 31) then flag := False;
    sex := Str_ToInt(Copy(t2, 1, 1), 0);
    if (sex <= 0) or (sex > 2) then flag := False;
  end else flag := False;
  if not flag then begin
    Beep;
    m_EdSSNo.SetFocus;
    Result := False;
  end;
end;

function TLoginScene.NewIdCheckBirthDay: Boolean;
var
  Str, t1, t2, t3, syear, smon, sday: string;
  ayear, amon, aday, sex: Integer;
  flag: Boolean;
begin
  Result := True;
  flag := True;
  Str := m_EdBirthDay.Text;
  Str := GetValidStr3(Str, syear, ['/']);
  Str := GetValidStr3(Str, smon, ['/']);
  Str := GetValidStr3(Str, sday, ['/']);
  ayear := Str_ToInt(syear, 0);
  amon := Str_ToInt(smon, 0);
  aday := Str_ToInt(sday, 0);
  if (ayear <= 1890) or (ayear > 2101) then flag := False;
  if (amon <= 0) or (amon > 12) then flag := False;
  if (aday <= 0) or (aday > 31) then flag := False;
  if not flag then begin
    Beep;
    m_EdBirthDay.SetFocus;
    Result := False;
  end;
end;

procedure TLoginScene.EdNewIdKeyPress(Sender: TObject; var Key: Char);
var
  Str, t1, t2, t3, syear, smon, sday: string;
  ayear, amon, aday, sex: Integer;
  flag: Boolean;
begin
  if (Sender = m_EdNewPasswd) or (Sender = m_EdChgNewPw) or (Sender = m_EdChgRepeat) then
    if (Key = '~') or (Key = '''') or (Key = ' ') then Key := #0;
  if Key = #13 then begin
    Key := #0;
    if Sender = m_EdNewId then begin
      if not NewIdCheckNewId then
        Exit;
    end;
    if Sender = m_EdNewPasswd then begin
      if Length(m_EdNewPasswd.Text) < 4 then begin
        FrmDlg.DMessageDlg('New Password', [mbOk]);
        Beep;
        m_EdNewPasswd.SetFocus;
        Exit;
      end;
    end;
    if Sender = m_EdConfirm then begin
      if m_EdNewPasswd.Text <> m_EdConfirm.Text then begin
        FrmDlg.DMessageDlg('Confirm new password', [mbOk]);
        Beep;
        m_EdConfirm.SetFocus;
        Exit;
      end;
    end;
    if (Sender = m_EdYourName) or (Sender = m_EdQuiz1) or (Sender = m_EdAnswer1) or
      (Sender = m_EdQuiz2) or (Sender = m_EdAnswer2) or (Sender = m_EdPhone) or
      (Sender = m_EdMobPhone) or (Sender = m_EdEMail)
      then begin
      TEdit(Sender).Text := Trim(TEdit(Sender).Text);
      if TEdit(Sender).Text = '' then begin
        Beep;
        TEdit(Sender).SetFocus;
        Exit;
      end;
    end;
   { if (Sender = m_EdSSNo) and (not EnglishVersion) then begin //�ѱ��� ���.. �ֹε�Ϲ�ȣ ���� äũ
      if not NewIdCheckSSno then
        Exit;
    end;   }
    if Sender = m_EdBirthDay then begin
      if not NewIdCheckBirthDay then
        Exit;
    end;
    if TEdit(Sender).Text <> '' then begin
      if Sender = m_EdNewId then m_EdNewPasswd.SetFocus;
      if Sender = m_EdNewPasswd then m_EdConfirm.SetFocus;
      if Sender = m_EdConfirm then m_EdYourName.SetFocus;
      if Sender = m_EdYourName then m_EdSSNo.SetFocus;
      if Sender = m_EdSSNo then m_EdBirthDay.SetFocus;
      if Sender = m_EdBirthDay then m_EdQuiz1.SetFocus;
      if Sender = m_EdQuiz1 then m_EdAnswer1.SetFocus;
      if Sender = m_EdAnswer1 then m_EdQuiz2.SetFocus;
      if Sender = m_EdQuiz2 then m_EdAnswer2.SetFocus;
      if Sender = m_EdAnswer2 then m_EdPhone.SetFocus;
      if Sender = m_EdPhone then m_EdMobPhone.SetFocus;
      if Sender = m_EdMobPhone then m_EdEMail.SetFocus;
      if Sender = m_EdEMail then begin
        if m_EdNewId.Enabled then m_EdNewId.SetFocus
        else if m_EdNewPasswd.Enabled then m_EdNewPasswd.SetFocus;
      end;
      if Sender = m_EdChgId then m_EdChgCurrentpw.SetFocus;
      if Sender = m_EdChgCurrentpw then m_EdChgNewPw.SetFocus;
      if Sender = m_EdChgNewPw then m_EdChgRepeat.SetFocus;
      if Sender = m_EdChgRepeat then m_EdChgId.SetFocus;
    end;
  end;
end;

procedure TLoginScene.EdNewOnEnter(Sender: TObject);
var
  hx, hy: Integer;
begin
  FrmDlg.NAHelps.Clear;
  hx := TEdit(Sender).Left + TEdit(Sender).Width + 10;
  hy := TEdit(Sender).Top + TEdit(Sender).Height - 18;
  if Sender = m_EdNewId then begin
    FrmDlg.NAHelps.Add('Your ID can be a combination of');
    FrmDlg.NAHelps.Add('Your ID can be a combination of');
    FrmDlg.NAHelps.Add('it must be a minimum of 4 letters.');
    FrmDlg.NAHelps.Add('Your ID is not your character');
    FrmDlg.NAHelps.Add('name in the game, Choose your ID');
    FrmDlg.NAHelps.Add('carefully, because it is essential');
    FrmDlg.NAHelps.Add('to use all our services.');
    FrmDlg.NAHelps.Add('');
    FrmDlg.NAHelps.Add('We suggest you use a different');
    FrmDlg.NAHelps.Add('name from the one you would like');
    FrmDlg.NAHelps.Add('to use for your character.');
  end;
  if Sender = m_EdNewPasswd then begin
    FrmDlg.NAHelps.Add('Your password can be a');
    FrmDlg.NAHelps.Add('combination of characters');
    FrmDlg.NAHelps.Add('and numbers and it must be a');
    FrmDlg.NAHelps.Add('minimum of 4 letters.');
    FrmDlg.NAHelps.Add('');
    FrmDlg.NAHelps.Add('Remember that your password is');
    FrmDlg.NAHelps.Add('essential to play our game,');
    FrmDlg.NAHelps.Add('so be sure to make a note of it.');
    FrmDlg.NAHelps.Add('');
    FrmDlg.NAHelps.Add('We advise you to not use a simple password');
    FrmDlg.NAHelps.Add('to avoid the risk of account hacking.');
  end;
  if Sender = m_EdConfirm then begin
    FrmDlg.NAHelps.Add('Type password again');
    FrmDlg.NAHelps.Add('for confirmation.');
    FrmDlg.NAHelps.Add('');
  end;
  if Sender = m_EdYourName then begin
    FrmDlg.NAHelps.Add('Type your full name.');
    FrmDlg.NAHelps.Add('');
  end;
  if Sender = m_EdSSNo then begin
   { FrmDlg.NAHelps.Add('�������ұߵ���֤��');
    FrmDlg.NAHelps.Add('');
    FrmDlg.NAHelps.Add('�����֤����ʾΪ0������');
    FrmDlg.NAHelps.Add('��ȡ��֤��ʧ�ܣ���ر�');
    FrmDlg.NAHelps.Add('���������´�');  }
    FrmDlg.NAHelps.Add('������������֤��');
    FrmDlg.NAHelps.Add('���磺 720101-146720');
    FrmDlg.NAHelps.Add('');
  end;
  if Sender = m_EdBirthDay then begin
    FrmDlg.NAHelps.Add('Please type your birth date, month,');
    FrmDlg.NAHelps.Add('years. ex(1975/08/21)');
    FrmDlg.NAHelps.Add('Year , Month and Day');
  end;
  if Sender = m_EdQuiz1 then begin
    FrmDlg.NAHelps.Add('Please type a question only');
    FrmDlg.NAHelps.Add('you know the answer to.');
    FrmDlg.NAHelps.Add('');
    FrmDlg.NAHelps.Add('');
  end;
  if Sender = m_EdAnswer1 then begin
    FrmDlg.NAHelps.Add('please type an answer to the');
    FrmDlg.NAHelps.Add('above question.');
    FrmDlg.NAHelps.Add('');
  end;
  if Sender = m_EdQuiz2 then begin
    FrmDlg.NAHelps.Add('Please type a question only');
    FrmDlg.NAHelps.Add('you know the answer to.');
    FrmDlg.NAHelps.Add('');
    FrmDlg.NAHelps.Add('');
  end;
  if Sender = m_EdAnswer2 then begin
    FrmDlg.NAHelps.Add('please type an answer to the');
    FrmDlg.NAHelps.Add('above question.');
    FrmDlg.NAHelps.Add('');
  end;
  if (Sender = m_EdYourName) or (Sender = m_EdQuiz1) or (Sender = m_EdQuiz2) or (Sender = m_EdAnswer1) or (Sender = m_EdAnswer2) then begin
    FrmDlg.NAHelps.Add('You are solely responsible');
    FrmDlg.NAHelps.Add('for the information you give us');
    FrmDlg.NAHelps.Add('if you use false information,');
    FrmDlg.NAHelps.Add('You will not be able to use');
    FrmDlg.NAHelps.Add('all our services.');
    FrmDlg.NAHelps.Add('Your account may be removed');
    FrmDlg.NAHelps.Add('if you provide');
    FrmDlg.NAHelps.Add('false information.');
    FrmDlg.NAHelps.Add('');
  end;
  if Sender = m_EdPhone then begin
    FrmDlg.NAHelps.Add('Please type in your telephone');
    FrmDlg.NAHelps.Add('number(compulsory).');
    FrmDlg.NAHelps.Add('');
  end;
  if Sender = m_EdMobPhone then begin
    FrmDlg.NAHelps.Add('Your mobile telephone number');
    FrmDlg.NAHelps.Add('');
  end;
  if Sender = m_EdEMail then begin
    FrmDlg.NAHelps.Add('Please type your E-mail address.');
    FrmDlg.NAHelps.Add('Your E-mail will be used to access');
    FrmDlg.NAHelps.Add('some of our services. You can');
    FrmDlg.NAHelps.Add('receive latest update information.');
    FrmDlg.NAHelps.Add('');
  end;
end;

procedure TLoginScene.HideLoginBox;
begin
  //EdId.Visible := FALSE;
  //EdPasswd.Visible := FALSE;
  //FrmDlg.DLogin.Visible := FALSE;
  ChangeLoginState(lsCloseAll);
end;

procedure TLoginScene.ShowLoginBox;
begin
  ChangeLoginState(lsLogin);
end;

procedure TLoginScene.OpenLoginDoor;
begin
  if Assigned(g_PlugInfo.HookOpenLoginDoor) then begin
    if g_PlugInfo.HookOpenLoginDoor then begin
      HideLoginBox;
      DScreen.ChangeScene(stSelectChr);
      Exit;
    end;
  end;
  m_boNowOpening := True;
  m_dwStartTime := GetTickCount;
  HideLoginBox;
  PlaySound(s_rock_door_open);
end;

procedure TLoginScene.PlayScene(MSurface: TTexture);
var
  d: TTexture;
begin
  if m_boOpenFirst then begin
    m_boOpenFirst := False;
   { m_EdId.Visible := True;
    m_EdPasswd.Visible := True;
    m_EdId.SetFocus; }
    FrmDlg.EdId.SetFocus;
  end;
  if Assigned(g_PlugInfo.HookLoginScene) then begin
    if g_PlugInfo.HookLoginScene(MSurface) then Exit;
  end;

{$IF CUSTOMLIBFILE = 1}
  d := g_WMainImages.Images[83 {102-80}];
{$ELSE}
  d := g_WChrSelImages.Images[102 - 80];
{$IFEND}
  //Exit;
  if d <> nil then begin
    MSurface.Draw((SCREENWIDTH - 800) div 2, (SCREENHEIGHT - 600) div 2, d.ClientRect, d, False);
  end;

  if m_boNowOpening then begin
    //      if GetTickCount - StartTime > 230 then begin
    //�����ٶ�
    Inc(m_nCurFrame);
    {if GetTickCount - m_dwStartTime > 20 then begin
      m_dwStartTime := GetTickCount;
      Inc(m_nCurFrame);
    end;  }
    if m_nCurFrame >= m_nMaxFrame - 1 then begin
      m_nCurFrame := m_nMaxFrame - 1;
      if not g_boDoFadeOut and not g_boDoFadeIn then begin
        g_boDoFadeOut := True;
        g_boDoFadeIn := True;
        g_nFadeIndex := 29;
      end;
    end;
{$IF CUSTOMLIBFILE = 1}
    d := g_WMainImages.Images[m_nCurFrame + 84 {103 + CurFrame-80}];
{$ELSE}
    d := g_WChrSelImages.Images[103 + m_nCurFrame - 80];
{$IFEND}
    if d <> nil then
      MSurface.Draw((SCREENWIDTH - 800) div 2 + 152 {152}, (SCREENHEIGHT - 600) div 2 + 96 {96}, d.ClientRect, d, True);
    if g_boDoFadeOut then begin
      if g_nFadeIndex <= 1 then begin
        g_WMainImages.ClearCache;
        g_WChrSelImages.ClearCache;
        DScreen.ChangeScene(stSelectChr);

      end;
    end;
  end;
end;

procedure TLoginScene.ChangeLoginState(State: TLoginState);
var
  I, focus: Integer;
  c: TControl;
begin
  focus := -1;
  case State of
    lsLogin: focus := 10;
    lsNewidRetry, lsNewid: focus := 11;
    lsChgpw: focus := 12;
    lsCloseAll: focus := -1;
  end;
  with frmMain do begin //login
    for I := 0 to ControlCount - 1 do begin
      c := Controls[I];
      if c is TEdit then begin
        if c.tag in [10..12] then begin
          if c.tag = focus then begin
            c.Visible := True;
            TEdit(c).Text := '';
          end else begin
            c.Visible := False;
            TEdit(c).Text := '';
          end;
        end;
      end;
    end;
    //if EnglishVersion then //���������� �ֹε�Ϲ�ȣ �Է��� ���Ѵ�.
      //m_EdSSNo.Visible := FALSE;
    case State of
      lsLogin: begin
          FrmDlg.DNewAccount.Visible := False;
          FrmDlg.DChgPw.Visible := False;
          FrmDlg.DLogin.Visible := True;
          FrmDlg.EdId.Visible := True;
          FrmDlg.EdPasswd.Visible := True;
          //if m_EdId.Visible then m_EdId.SetFocus;
          if FrmDlg.EdId.Visible then
            FrmDlg.EdId.SetFocus;
        end;
      lsNewidRetry,
        lsNewid: begin
          FrmDlg.EdId.Visible := False;
          FrmDlg.EdPasswd.Visible := False;

          if m_boUpdateAccountMode then
            m_EdNewId.Enabled := False
          else
            m_EdNewId.Enabled := True;
          FrmDlg.DNewAccount.Visible := True;
          FrmDlg.DChgPw.Visible := False;
          FrmDlg.DLogin.Visible := False;
          if m_EdNewId.Visible and m_EdNewId.Enabled then begin
            m_EdNewId.SetFocus;
          end else begin
            if m_EdConfirm.Visible and m_EdConfirm.Enabled then
              m_EdConfirm.SetFocus;
          end;
        end;
      lsChgpw: begin
          FrmDlg.DNewAccount.Visible := False;
          FrmDlg.DChgPw.Visible := True;
          FrmDlg.DLogin.Visible := False;
          if m_EdChgId.Visible then m_EdChgId.SetFocus;
        end;
      lsCloseAll: begin
          FrmDlg.DNewAccount.Visible := False;
          FrmDlg.DChgPw.Visible := False;
          FrmDlg.DLogin.Visible := False;
          FrmDlg.EdId.Visible := False;
          FrmDlg.EdPasswd.Visible := False;
        end;
    end;
  end;
end;

procedure TLoginScene.NewClick;
begin
  m_boUpdateAccountMode := False;
  FrmDlg.NewAccountTitle := '';
  ChangeLoginState(lsNewid);
end;

procedure TLoginScene.NewIdRetry(boupdate: Boolean);
begin
  m_boUpdateAccountMode := boupdate;
  ChangeLoginState(lsNewidRetry);
  m_EdNewId.Text := m_NewIdRetryUE.sAccount;
  m_EdNewPasswd.Text := m_NewIdRetryUE.sPassword;
  m_EdYourName.Text := m_NewIdRetryUE.sUserName;
  m_EdSSNo.Text := '0'; //m_NewIdRetryUE.sSSNo;
  m_EdQuiz1.Text := m_NewIdRetryUE.sQuiz;
  m_EdAnswer1.Text := m_NewIdRetryUE.sAnswer;
  m_EdPhone.Text := m_NewIdRetryUE.sPhone;
  m_EdEMail.Text := m_NewIdRetryUE.sEMail;
  m_EdQuiz2.Text := m_NewIdRetryAdd.sQuiz2;
  m_EdAnswer2.Text := m_NewIdRetryAdd.sAnswer2;
  m_EdMobPhone.Text := m_NewIdRetryAdd.sMobilePhone;
  m_EdBirthDay.Text := m_NewIdRetryAdd.sBirthDay;
end;

procedure TLoginScene.UpdateAccountInfos(ue: TUserEntry);
begin
  m_NewIdRetryUE := ue;
  SafeFillChar(m_NewIdRetryAdd, SizeOf(TUserEntryAdd), #0);
  m_boUpdateAccountMode := True;
  NewIdRetry(True);
  FrmDlg.NewAccountTitle := '(Please complete all the required fields of the account information)';
end;

procedure TLoginScene.OkClick;
var
  Key: Char;
begin
  Key := #13;
  EdLoginPasswdKeyPress(Self, Key);
end;

procedure TLoginScene.ChgPwClick;
begin
  ChangeLoginState(lsChgpw);
end;

function TLoginScene.CheckUserEntrys: Boolean;
begin
  Result := False;
  m_EdNewId.Text := Trim(m_EdNewId.Text);
  m_EdQuiz1.Text := Trim(m_EdQuiz1.Text);
  m_EdYourName.Text := Trim(m_EdYourName.Text);
  if not NewIdCheckNewId then Exit;

 { if not EnglishVersion then begin
    if not NewIdCheckSSno then
      Exit;
  end;  }

  if not NewIdCheckBirthDay then Exit;
  if Length(m_EdNewId.Text) < 3 then begin
    m_EdNewId.SetFocus;
    Exit;
  end;
  if Length(m_EdNewPasswd.Text) < 3 then begin
    m_EdNewPasswd.SetFocus;
    Exit;
  end;
  if m_EdNewPasswd.Text <> m_EdConfirm.Text then begin
    m_EdConfirm.SetFocus;
    Exit;
  end;
  if Length(m_EdQuiz1.Text) < 1 then begin
    m_EdQuiz1.SetFocus;
    Exit;
  end;
  if Length(m_EdAnswer1.Text) < 1 then begin
    m_EdAnswer1.SetFocus;
    Exit;
  end;
  if Length(m_EdQuiz2.Text) < 1 then begin
    m_EdQuiz2.SetFocus;
    Exit;
  end;
  if Length(m_EdAnswer2.Text) < 1 then begin
    m_EdAnswer2.SetFocus;
    Exit;
  end;
  if Length(m_EdYourName.Text) < 1 then begin
    m_EdYourName.SetFocus;
    Exit;
  end;
 { if not EnglishVersion then begin
  if Length(m_EdSSNo.Text) < 1 then begin
    m_EdSSNo.SetFocus;
    Exit;
  end;
  end;   }
  Result := True;
end;

procedure TLoginScene.NewAccountOk;
var
  ue: TUserEntry;
  ua: TUserEntryAdd;
  sRandomCode: string;
begin
  if CheckUserEntrys then begin
    FillChar(ue, SizeOf(TUserEntry), #0);
    FillChar(ua, SizeOf(TUserEntryAdd), #0);
    ue.sAccount := LowerCase(m_EdNewId.Text);
    ue.sPassword := m_EdNewPasswd.Text;
    ue.sUserName := m_EdYourName.Text;
    //sRandomCode := Trim(m_EdSSNo.Text);
    if not EnglishVersion then
      ue.sSSNo := m_EdSSNo.Text
    else
      ue.sSSNo := '650101-1455111';

    ue.sQuiz := m_EdQuiz1.Text;
    ue.sAnswer := Trim(m_EdAnswer1.Text);
    ue.sPhone := m_EdPhone.Text;
    ue.sEMail := Trim(m_EdEMail.Text);

    ua.sQuiz2 := m_EdQuiz2.Text;
    ua.sAnswer2 := Trim(m_EdAnswer2.Text);
    ua.sBirthDay := m_EdBirthDay.Text;
    ua.sMobilePhone := m_EdMobPhone.Text;

    m_NewIdRetryUE := ue;
    m_NewIdRetryUE.sAccount := '';
    m_NewIdRetryUE.sPassword := '';
    m_NewIdRetryAdd := ua;
    //g_nRandomCode := Str_ToInt(sRandomCode, 0);
    if not m_boUpdateAccountMode then
      frmMain.SendNewAccount(ue, ua)
    else
      frmMain.SendUpdateAccount(ue, ua);
    m_boUpdateAccountMode := False;
    NewAccountClose;
  end;
end;

procedure TLoginScene.NewAccountClose;
begin
  if not m_boUpdateAccountMode then
    ChangeLoginState(lsLogin);
end;

procedure TLoginScene.ChgpwOk;
var
  uid, passwd, newpasswd: string;
begin
  if m_EdChgNewPw.Text = m_EdChgRepeat.Text then begin
    uid := m_EdChgId.Text;
    passwd := m_EdChgCurrentpw.Text;
    newpasswd := m_EdChgNewPw.Text;
    frmMain.SendChgPw(uid, passwd, newpasswd);
    ChgpwCancel;
  end else begin
    FrmDlg.DMessageDlg('Password confirmation is not correct.', [mbOk]);
    m_EdChgNewPw.SetFocus;
  end;
end;

procedure TLoginScene.ChgpwCancel;
begin
  ChangeLoginState(lsLogin);
end;


{-------------------- TSelectChrScene ------------------------}

constructor TSelectChrScene.Create;
var
  I: Integer;
begin
  m_sTipMsg := '';
  CreateChrMode := False;
  SafeFillChar(ChrArr, SizeOf(TSelChar) * 2, #0);
  ChrArr[0].FreezeState := True;
  ChrArr[1].FreezeState := True;
  NewIndex := 0;
  EdChrName := TEdit.Create(frmMain.Owner);
  with EdChrName do begin
    Parent := frmMain;
    Height := 16;
    Width := 137;
    BorderStyle := bsNone;
    Color := clblack;
    Font.Color := clWhite;
    ImeMode := LocalLanguage;
    MaxLength := 14;
    Visible := False;
    OnKeyPress := EdChrnameKeyPress;
  end;
  SoundTimer := TTimer.Create(frmMain.Owner);
  with SoundTimer do begin
    OnTimer := SoundOnTimer;
    Interval := 1;
    Enabled := False;
  end;
  SelDelChar := -1;
  FillChar(DelCharArray, SizeOf(TDelChar) * 10, #0);
  {for I := Low(DelCharArray) to High(DelCharArray) do begin
    DelCharArray[I].sChrName := '����' + IntToStr(I);
    DelCharArray[I].wLevel := Random(1000);
    DelCharArray[I].btJob := Random(1);
    DelCharArray[I].btSex := Random(1);
  end;
  }
  inherited Create(stSelectChr);
end;

destructor TSelectChrScene.Destroy;
begin
  inherited Destroy;
end;

procedure TSelectChrScene.OpenScene;
var
  nIndex: Integer;
  sFileName: string;
  LoadList: TStringList;
begin
  FrmDlg.DSelectChr.Visible := True;
  if g_boGetRandomBuffer then begin //����֤�봰��
    g_boGetRandomBuffer := False;
    //FrmDlg.ShowRandomDlg;
    //Showmessage('FrmDlg.ShowRandomDlg');
  end;

  sFileName := ExtractFilePath(Application.ExeName) + 'Data\Tips.dat';
  if FileExists(sFileName) then begin
    LoadList := TStringList.Create;
    try
      LoadList.LoadFromFile(sFileName);
      for nIndex := LoadList.Count - 1 downto 0 do begin
        if Trim(LoadList[nIndex]) = '' then LoadList.Delete(nIndex);
      end;
    except

    end;

    nIndex := Random(LoadList.Count - 1);
    if (nIndex >= 0) and (nIndex < LoadList.Count) then begin
      m_sTipMsg := LoadList[nIndex];
      //LabelMsg.Caption := LoadList[nIndex];
    end;
    //LabelMsg.Left := (Width - LabelMsg.Width) div 2;
    LoadList.Free;
  end;

  SoundTimer.Enabled := True;
  SoundTimer.Interval := 1;
end;

procedure TSelectChrScene.CloseScene;
begin
  SilenceSound;
  FrmDlg.DSelectChr.Visible := False;
  SoundTimer.Enabled := False;
end;

procedure TSelectChrScene.SoundOnTimer(Sender: TObject);
begin
  PlayBGM(bmg_select);
  SoundTimer.Enabled := False;
  //SoundTimer.Interval := 38 * 1000;
end;

procedure TSelectChrScene.SelChrSelect1Click;
begin
  if (not ChrArr[0].Selected) and (ChrArr[0].Valid) then begin
    frmMain.SelectChr(ChrArr[0].UserChr.Name); //2004/05/17
    ChrArr[0].Selected := True;
    ChrArr[1].Selected := False;
    ChrArr[0].Unfreezing := True;
    ChrArr[0].AniIndex := 0;
    ChrArr[0].DarkLevel := 0;
    ChrArr[0].EffIndex := 0;
    ChrArr[0].StartTime := GetTickCount;
    ChrArr[0].moretime := GetTickCount;
    ChrArr[0].startefftime := GetTickCount;
    PlaySound(s_meltstone);
  end;
end;

procedure TSelectChrScene.SelChrSelect2Click;
begin
  if (not ChrArr[1].Selected) and (ChrArr[1].Valid) then begin
    frmMain.SelectChr(ChrArr[1].UserChr.Name); //2004/05/17
    ChrArr[1].Selected := True;
    ChrArr[0].Selected := False;
    ChrArr[1].Unfreezing := True;
    ChrArr[1].AniIndex := 0;
    ChrArr[1].DarkLevel := 0;
    ChrArr[1].EffIndex := 0;
    ChrArr[1].StartTime := GetTickCount;
    ChrArr[1].moretime := GetTickCount;
    ChrArr[1].startefftime := GetTickCount;
    PlaySound(s_meltstone);
  end;
end;

procedure TSelectChrScene.SelChrStartClick;
var
  chrname: string;
begin
  chrname := '';
  if ChrArr[0].Valid and ChrArr[0].Selected then chrname := ChrArr[0].UserChr.Name;
  if ChrArr[1].Valid and ChrArr[1].Selected then chrname := ChrArr[1].UserChr.Name;
  if chrname <> '' then begin
    if not g_boDoFadeOut and not g_boDoFadeIn then begin
      g_boDoFastFadeOut := True;
      g_nFadeIndex := 29;
    end;
    g_sSelChrName := chrname;
    frmMain.SendSelChr(chrname);
  end else FrmDlg.DMessageDlg('At first you should make new character.\If you select <NEW CHARACTER> you can make a new character.', [mbOk]);
end;

procedure TSelectChrScene.SelChrNewChrClick;
begin
  if not ChrArr[0].Valid or not ChrArr[1].Valid then begin
    if not ChrArr[0].Valid then MakeNewChar(0)
    else MakeNewChar(1);
    FrmDlg.DFindChr.Visible := False;
  end else
    FrmDlg.DMessageDlg('You can have up to 2 characters per server for every single account.', [mbOk]);
end;

procedure TSelectChrScene.SelChrEraseChrClick;
var
  n: Integer;
begin
  n := 0;
  if ChrArr[0].Valid and ChrArr[0].Selected then n := 0;
  if ChrArr[1].Valid and ChrArr[1].Selected then n := 1;
  if (ChrArr[n].Valid) and (not ChrArr[n].FreezeState) and (ChrArr[n].UserChr.Name <> '') then begin
    if mrYes = FrmDlg.DMessageDlg('"' + ChrArr[n].UserChr.Name + '" Are you sure you want to delete character?', [mbYes, mbNo, mbCancel]) then
      frmMain.SendDelChr(ChrArr[n].UserChr.Name);
  end;
end;

procedure TSelectChrScene.SelChrCreditsClick;
begin
  if CreateChrMode then SelChrNewClose;
  FrmDlg.DFindChr.Visible := True;
  FrmDlg.DFindChr.Left := 75;
  FrmDlg.DFindChr.Top := 15;
end;

procedure TSelectChrScene.SelChrRestoreChrClick;
begin
  if SelDelChar in [Low(DelCharArray)..High(DelCharArray)] then begin
    if DelCharArray[SelDelChar].sChrName <> '' then begin
      frmMain.SendRestoreSelChr(frmMain.LoginID, DelCharArray[SelDelChar].sChrName);
    end;
  end;
end;

procedure TSelectChrScene.SelChrQueryDelChrClick;
begin
  frmMain.SendQueryDelChr(frmMain.LoginID);
end;

procedure TSelectChrScene.SelChrExitClick;
begin
  frmMain.Close;
end;

procedure TSelectChrScene.ClearChrs;
begin
  SafeFillChar(ChrArr, SizeOf(TSelChar) * 2, #0);
  ChrArr[0].FreezeState := False;
  ChrArr[1].FreezeState := True;
  ChrArr[0].Selected := True;
  ChrArr[1].Selected := False;
  ChrArr[0].UserChr.Name := '';
  ChrArr[1].UserChr.Name := '';
  FrmDlg.DFindChr.Visible := False;
end;

procedure TSelectChrScene.AddChr(uname: string; job, hair, Level, sex: Integer);
var
  n: Integer;
begin
  if not ChrArr[0].Valid then n := 0
  else if not ChrArr[1].Valid then n := 1
  else Exit;
  ChrArr[n].UserChr.Name := uname;
  ChrArr[n].UserChr.job := job;
  ChrArr[n].UserChr.hair := hair;
  ChrArr[n].UserChr.Level := Level;
  ChrArr[n].UserChr.sex := sex;
  ChrArr[n].Valid := True;
end;

procedure TSelectChrScene.MakeNewChar(Index: Integer);
begin
  CreateChrMode := True;
  NewIndex := Index;
  if Index = 0 then begin
    FrmDlg.DCreateChr.Left := 415;
    FrmDlg.DCreateChr.Top := 15;
  end else begin
    FrmDlg.DCreateChr.Left := 75;
    FrmDlg.DCreateChr.Top := 15;
  end;
  FrmDlg.DCreateChr.Visible := True;
  ChrArr[NewIndex].Valid := True;
  ChrArr[NewIndex].FreezeState := False;
  EdChrName.Left := FrmDlg.DCreateChr.Left + 71;
  EdChrName.Top := FrmDlg.DCreateChr.Top + 107;
  EdChrName.Visible := True;
  EdChrName.SetFocus;
  SelectChr(NewIndex);
  SafeFillChar(ChrArr[NewIndex].UserChr, SizeOf(TUserCharacterInfo), #0);
end;

procedure TSelectChrScene.EdChrnameKeyPress(Sender: TObject; var Key: Char);
begin

end;

procedure TSelectChrScene.SelectChr(Index: Integer);
begin
  ChrArr[Index].Selected := True;
  ChrArr[Index].DarkLevel := 30;
  ChrArr[Index].StartTime := GetTickCount;
  ChrArr[Index].moretime := GetTickCount;
  if Index = 0 then ChrArr[1].Selected := False
  else ChrArr[0].Selected := False;
end;

procedure TSelectChrScene.SelChrNewClose;
begin
  ChrArr[NewIndex].Valid := False;
  CreateChrMode := False;
  FrmDlg.DCreateChr.Visible := False;
  EdChrName.Visible := False;
  if NewIndex = 1 then begin
    ChrArr[0].Selected := True;
    ChrArr[0].FreezeState := False;
  end;
end;

procedure TSelectChrScene.SelChrNewOk;
var
  chrname, shair, sjob, ssex: string;
begin
  chrname := Trim(EdChrName.Text);
  if chrname <> '' then begin
    ChrArr[NewIndex].Valid := False;
    CreateChrMode := False;
    FrmDlg.DCreateChr.Visible := False;
    EdChrName.Visible := False;
    if NewIndex = 1 then begin
      ChrArr[0].Selected := True;
      ChrArr[0].FreezeState := False;
    end;
    case ChrArr[NewIndex].UserChr.sex of
      0: begin
          shair := '2';
        end;
      1: begin
          Randomize;
          case Random(2) of
            1: shair := '1';
            2: shair := '3';
          else shair := '1';
          end;
        end;
    end;
    //shair := IntToStr(Random(5) + 1); //////****IntToStr(ChrArr[NewIndex].UserChr.Hair);
    sjob := IntToStr(ChrArr[NewIndex].UserChr.job);
    ssex := IntToStr(ChrArr[NewIndex].UserChr.sex);
    frmMain.SendNewChr(frmMain.LoginID, chrname, shair, sjob, ssex);
  end;
end;

procedure TSelectChrScene.SelChrNewJob(job: Integer);
begin
  if (job in [0..2]) and (ChrArr[NewIndex].UserChr.job <> job) then begin
    ChrArr[NewIndex].UserChr.job := job;
    SelectChr(NewIndex);
  end;
end;

procedure TSelectChrScene.SelChrNewm_btSex(sex: Integer);
begin
  if sex <> ChrArr[NewIndex].UserChr.sex then begin
    ChrArr[NewIndex].UserChr.sex := sex;
    SelectChr(NewIndex);
  end;
end;

procedure TSelectChrScene.SelChrNewPrevHair;
begin
end;

procedure TSelectChrScene.SelChrNewNextHair;
begin
end;

procedure TSelectChrScene.PlayScene(MSurface: TTexture);
var
  I, n, bx, by, fx, fy, img: Integer;
  ex, ey: Integer; //ѡ������ʱ��ʾ��Ч����λ��
  d, E, dd: TTexture;
  svname: string;
begin
  if Assigned(g_PlugInfo.HookSelectChrScene) then begin
    if g_PlugInfo.HookSelectChrScene(MSurface) then Exit;
  end;
  bx := 0;
  by := 0;
  fx := 0;
  fy := 0; //Jacky
//{$IF SWH = SWH800}
  d := g_WMain2Images.Images[480];
 // d := g_WMainImages.Images[65];
//{$ELSEIF SWH = SWH1024}
//  d := g_WMain2Images.Images[480];
  //   d := g_WMainImages.Images[82];
  //d := g_WMainImages.Images[65];
//{$IFEND}
  //��ʾѡ�����ﱳ������
  if d <> nil then begin
    //      MSurface.Draw (0, 0, d.ClientRect, d, FALSE);
    MSurface.Draw((SCREENWIDTH - d.Width) div 2, (SCREENHEIGHT - d.Height) div 2, d.ClientRect, d, False);
  end;
  for n := 0 to 1 do begin
    if ChrArr[n].Valid then begin
      ex := (SCREENWIDTH - 800) div 2 + 90 {90};
      ey := (SCREENHEIGHT - 600) div 2 + 60 - 2 {60-2};
      case ChrArr[n].UserChr.job of
        0: begin
            if ChrArr[n].UserChr.sex = 0 then begin
              bx := (SCREENWIDTH - 800) div 2 + 71 {71};
              by := (SCREENHEIGHT - 600) div 2 + 75 - 23 {75-23};
              fx := bx;
              fy := by;
            end else begin
              bx := (SCREENWIDTH - 800) div 2 + 65 {65};
              by := (SCREENHEIGHT - 600) div 2 + 75 - 2 - 18 {75-2-18};
              fx := bx - 28 + 28;
              fy := by - 16 + 16;
            end;
          end;
        1: begin
            if ChrArr[n].UserChr.sex = 0 then begin
              bx := (SCREENWIDTH - 800) div 2 + 77 {77};
              by := (SCREENHEIGHT - 600) div 2 + 75 - 29 {75-29};
              fx := bx;
              fy := by;
            end else begin
              bx := (SCREENWIDTH - 800) div 2 + 141 + 30 {141+30};
              by := (SCREENHEIGHT - 600) div 2 + 85 + 14 - 2 {85+14-2};
              fx := bx - 30;
              fy := by - 14;
            end;
          end;
        2: begin
            if ChrArr[n].UserChr.sex = 0 then begin
              bx := (SCREENWIDTH - 800) div 2 + 85 {85};
              by := (SCREENHEIGHT - 600) div 2 + 75 - 12 {75-12};
              fx := bx;
              fy := by;
            end else begin
              bx := (SCREENWIDTH - 800) div 2 + 141 + 23 {141+23};
              by := (SCREENHEIGHT - 600) div 2 + 85 + 20 - 2 {85+20-2};
              fx := bx - 23;
              fy := by - 20;
            end;
          end;
      end;
      if n = 1 then begin
        ex := (SCREENWIDTH - 800) div 2 + 430 {430};
        ey := (SCREENHEIGHT - 600) div 2 + 60 {60};
        bx := bx + 340;
        by := by + 2;
        fx := fx + 340;
        fy := fy + 2;
      end;
      if ChrArr[n].Unfreezing then begin
        img := 140 - 80 + ChrArr[n].UserChr.job * 40 + ChrArr[n].UserChr.sex * 120;
        d := g_WChrSelImages.Images[img + ChrArr[n].AniIndex];
        E := g_WChrSelImages.Images[4 + ChrArr[n].EffIndex];
        if d <> nil then MSurface.Draw(bx, by, d.ClientRect, d, True);
        if E <> nil then DrawBlend(MSurface, ex, ey, E);
        if GetTickCount - ChrArr[n].StartTime > 50 {120} then begin
          ChrArr[n].StartTime := GetTickCount;
          ChrArr[n].AniIndex := ChrArr[n].AniIndex + 1;
        end;
        if GetTickCount - ChrArr[n].startefftime > 50 { 110} then begin
          ChrArr[n].startefftime := GetTickCount;
          ChrArr[n].EffIndex := ChrArr[n].EffIndex + 1;
          //if ChrArr[n].effIndex > EFFECTFRAME-1 then
          //   ChrArr[n].effIndex := EFFECTFRAME-1;
        end;
        if ChrArr[n].AniIndex > FREEZEFRAME - 1 then begin
          ChrArr[n].Unfreezing := False;
          ChrArr[n].FreezeState := False;
          ChrArr[n].AniIndex := 0;
        end;
      end else
        if not ChrArr[n].Selected and (not ChrArr[n].FreezeState and not ChrArr[n].Freezing) then begin
        ChrArr[n].Freezing := True;
        ChrArr[n].AniIndex := 0;
        ChrArr[n].StartTime := GetTickCount;
      end;
      if ChrArr[n].Freezing then begin
        img := 140 - 80 + ChrArr[n].UserChr.job * 40 + ChrArr[n].UserChr.sex * 120;
        d := g_WChrSelImages.Images[img + FREEZEFRAME - ChrArr[n].AniIndex - 1];
        if d <> nil then MSurface.Draw(bx, by, d.ClientRect, d, True);
        if GetTickCount - ChrArr[n].StartTime > 50 then begin
          ChrArr[n].StartTime := GetTickCount;
          ChrArr[n].AniIndex := ChrArr[n].AniIndex + 1;
        end;
        if ChrArr[n].AniIndex > FREEZEFRAME - 1 then begin
          ChrArr[n].Freezing := False;
          ChrArr[n].FreezeState := True;
          ChrArr[n].AniIndex := 0;
        end;
      end;
      if not ChrArr[n].Unfreezing and not ChrArr[n].Freezing then begin
        if not ChrArr[n].FreezeState then begin
          img := 120 - 80 + ChrArr[n].UserChr.job * 40 + ChrArr[n].AniIndex + ChrArr[n].UserChr.sex * 120;
          d := g_WChrSelImages.Images[img];
          if d <> nil then begin
            if ChrArr[n].DarkLevel > 0 then begin
              dd := TTexture.Create;
              dd.SetSize(d.Width, d.Height);
              dd.Draw(0, 0, d.ClientRect, d, False);
              //MakeDark(dd, 30 - ChrArr[n].DarkLevel);
              MSurface.Draw(fx, fy, dd.ClientRect, dd, True);
              dd.Free;
            end else
              MSurface.Draw(fx, fy, d.ClientRect, d, True);

          end;
        end else begin
          img := 140 - 80 + ChrArr[n].UserChr.job * 40 + ChrArr[n].UserChr.sex * 120;
          d := g_WChrSelImages.Images[img];
          if d <> nil then
            MSurface.Draw(bx, by, d.ClientRect, d, True);
        end;
        if ChrArr[n].Selected then begin
          if GetTickCount - ChrArr[n].StartTime > 300 then begin
            ChrArr[n].StartTime := GetTickCount;
            ChrArr[n].AniIndex := ChrArr[n].AniIndex + 1;
            if ChrArr[n].AniIndex > SELECTEDFRAME - 1 then
              ChrArr[n].AniIndex := 0;
          end;
          if GetTickCount - ChrArr[n].moretime > 25 then begin
            ChrArr[n].moretime := GetTickCount;
            if ChrArr[n].DarkLevel > 0 then
              ChrArr[n].DarkLevel := ChrArr[n].DarkLevel - 1;
          end;
        end;
      end;
      //��ʾѡ���ɫʱ�������Ƶȼ�
      if n = 0 then begin
        if ChrArr[n].UserChr.Name <> '' then begin
          with MSurface do begin
            BoldTextOut((SCREENWIDTH - 800) div 2 + 117 {117}, (SCREENHEIGHT - 600) div 2 + 492 + 2 {492+2}, ChrArr[n].UserChr.Name);
            BoldTextOut((SCREENWIDTH - 800) div 2 + 117 {117}, (SCREENHEIGHT - 600) div 2 + 523 {523}, IntToStr(ChrArr[n].UserChr.Level));
            BoldTextOut((SCREENWIDTH - 800) div 2 + 117 {117}, (SCREENHEIGHT - 600) div 2 + 553 {553}, GetJobName(ChrArr[n].UserChr.job));
          end;
        end;
      end else begin
        if ChrArr[n].UserChr.Name <> '' then begin
          with MSurface do begin
            BoldTextOut((SCREENWIDTH - 800) div 2 + 671 {671}, (SCREENHEIGHT - 600) div 2 + 492 + 2 {492+4}, ChrArr[n].UserChr.Name);
            BoldTextOut((SCREENWIDTH - 800) div 2 + 671 {671}, (SCREENHEIGHT - 600) div 2 + 525 + 2 {525}, IntToStr(ChrArr[n].UserChr.Level));
            BoldTextOut((SCREENWIDTH - 800) div 2 + 671 {671}, (SCREENHEIGHT - 600) div 2 + 555 + 2 {555}, GetJobName(ChrArr[n].UserChr.job));
          end;
        end;
      end;


      with MSurface do begin
        if m_sTipMsg <> '' then begin
          BoldTextOut(SCREENWIDTH div 2 - TextWidth(m_sTipMsg) div 2, (SCREENHEIGHT - 600) div 2 + 400, m_sTipMsg, clYellow);
        end;

        if BO_FOR_TEST then svname := 'MakeGM'
        else svname := g_sServerName;
        BoldTextOut(SCREENWIDTH div 2 {405} - TextWidth(svname) div 2, (SCREENHEIGHT - 600) div 2 + 8 {8}, svname);
      end;
    end;
  end;
end;

{--------------------------- TLoginNotice ----------------------------}

constructor TLoginNotice.Create;
begin
  inherited Create(stLoginNotice);
end;

destructor TLoginNotice.Destroy;
begin
  inherited Destroy;
end;


end.

