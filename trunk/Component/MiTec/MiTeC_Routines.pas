
{*******************************************************}
{                                                       }
{             MiTeC Common Routines                     }
{           version 1.3 for Delphi 3,4,5                }
{                                                       }
{       Copyright ? 1997,2001 Michal Mutl               }
{                                                       }
{*******************************************************}

{$INCLUDE MITEC_DEF.INC}

unit MiTeC_Routines;
//{$mode delphi}
interface

uses Windows, Classes, SysUtils, ShlObj;

type
  TOSVersion = (osUnknown, os95, os95OSR2, os98, os98SE, osNT3, osNT4, os2K, osME, osXP);

  TDiskSign = string[2];

  TMediaType = (dtUnknown, dtNotExists, dtRemovable, dtFixed, dtRemote, dtCDROM, dtRAMDisk);

  TFileFlag = (fsCaseIsPreserved, fsCaseSensitive, fsUnicodeStoredOnDisk,
               fsPersistentAcls, fsFileCompression, fsVolumeIsCompressed,
               fsLongFileNames,
               // following flags are valid only for Windows2000
               fsEncryptedFileSystemSupport, fsObjectIDsSupport, fsReparsePointsSupport,
               fsSparseFilesSupport, fsDiskQuotasSupport);
  TFileFlags = set of TFileFlag;

  TDiskInfo = record
    Sign: TDiskSign;
    MediaType: TMediaType;
    FileFlags: TFileFlags;
    SectorsPerCluster,
    BytesPerSector,
    FreeClusters,
    TotalClusters,
    Serial: DWORD;
    Capacity,
    FreeSpace: Int64;
    VolumeLabel,
    SerialNumber,
    FileSystem: string;
  end;

  PWindow = ^TWindow;
  TWindow = record
    ClassName,
    Text :string;
    Handle,
    Process,
    Thread :longword;
    ParentWin,
    WndProc,
    Instance,
    ID,
    UserData,
    Style,
    ExStyle :longint;
    Rect,
    ClientRect :TRect;
    Atom,
    ClassBytes,
    WinBytes,
    ClassWndProc,
    ClassInstance,
    Background,
    Cursor,
    Icon,
    ClassStyle :longword;
    Styles,
    ExStyles,
    ClassStyles :tstringlist;
    Visible :boolean;
  end;

  CharSet = set of char;

  TFileInfo = record
    Name: string;
    FileType: string;
    Size :DWORD;
    Created,
    Accessed,
    Modified :TDateTime;
    Attributes :DWORD;
    BinaryType: string;
    IconHandle: THandle;
  end;

const
  allFilter = 'All Files'#0'*.*'#0#0;
  ofnTitle = 'Select file';

function GetErrorMessage(ErrorCode: integer): string;
function GetUser :string;
function GetMachine :string;
function GetOS :TOSVersion;
function ReadRegInfo(ARoot :hkey; AKey, AValue :string) :string;
function ReadVerInfo(const fn :string; var Desc :string) :string;
function GetClassDevices(AStartKey,AClassName,AValueName :string; var AResult :TStrings) :string;
procedure GetEnvironment(var EnvList :tstrings);
function GetWinDir :string;
function GetSysDir :string;
function GetTempDir :string;
function GetWinSysDir: string;
function GetProfilePath: string;
function GetWindowInfo(wh: hwnd): PWindow;
{function DisplayPropDialog(const Handle: HWND; const FileName: string): Boolean;}
function ResolveLink(const LinkFile: TFileName; var FileName, Arguments: string): HRESULT;
function GetSpecialFolder(Handle: Hwnd; nFolder: Integer): string;
function KillProcess(APID: integer): Boolean;
function GetFontRes: DWORD;
function CreateDOSProcessRedirected(const CommandLine, InputFile, OutputFile,ErrMsg :string): Boolean;

function ExpandEnvVars(ASource: string): string;
procedure StringsToRep(sl: TStrings; CountKwd,ItemKwd: string; var Report: TStringlist);
function ReplaceStr(ASource,AFind,AReplace :string) :string;
function ReverseStr(S: string): string;
function FormatSeconds(TotalSeconds :comp; WholeSecondsOnly, DisplayAll, DTFormat :Boolean) :string;
function SubStr(ASource,AFind,AReplace :string) :string;
function GetStrFromBuf(var Buffer: PChar): string;
function TrimAll(ASource: string): string;
function BoolToStr(AValue, AVerbose: Boolean): string;
function StrToBool(ASource: string): Boolean;
procedure AddWord(var ADest :string; const AWord,ADelimiter: string);
function GetDelimitedText(AList: TStrings; ADelimiter: string): string;
procedure SetDelimitedText(ASource: string; ADelimiter: string; var AList: TStringList);
function FitStr(const ASource, AEllipsis :string; ALength :integer) :string;
function GetToken(s, adelimiter :string; index :integer) :string;
procedure SetToken(adelimiter, newvalue :string; index :integer; var s :string);
function  ExtractWord(N: Byte; S: String; WordDelims: CharSet): string;
function TestByMask(const S, Mask: string; MaskChar: Char): Boolean;
function UniPath(Path :string; RemoveBackslash :boolean) :string;

function UTCToDateTime(UTC: DWORD): TDateTime;
function FileTimeToDateTimeStr(FileTime: TFileTime): string;
function FiletimeToDateTime(FT: FILETIME): TDateTime;
function IsLeapYear(Year: Word): Boolean;
function DaysInMonth(const DT: TDateTime): Byte;
function DayOfMonth2Date(year,month,weekInMonth,dayInWeek: word): TDateTime;
function DSTDate2Date(dstDate: TSystemTime; year: word): TDateTime;

{procedure GetFileInfo(const AFilename: string; var AFileInfo: TFileInfo);}
function ExtractName(const AFilename: string): string;
function HasAttr(const AFileName: string; AAttr: Word): Boolean;
function DirExists(const ADir: string): Boolean;
function GetBinType(const AFilename :string) :string;
function ExtractUNCFilename(ASource :string) :string;
function FileCopy(const AFileName, ADestName: string): boolean;
function FileMove(const AFileName, ADestName: string): boolean;
function GetMediaPresent(Value: TDiskSign) :Boolean;
{function GetDiskInfo(Value: TDiskSign): TDiskInfo;}
function GetMediaTypeStr(dt: TMediaType) :string;
function GetAvailDisks :string;
procedure GetCDs(cds :tstrings);
{function GetOpenFileDlg(AHandle: THandle; var FileName: string;
                         AOpenDlg: Boolean;
                         AFilter,
                         ADir,
                         ATitle: string): Boolean;  }

function OpenMailSlot(Const Server, Slot : String): THandle;
function SendToMailSlot(Const Server, Slot, Mail : String) : Boolean;
function SendToWinpopup(Server, Reciever, Sender, Msg : String) : Boolean;

function IsBitOn(Value: Integer; Bit: Byte): Boolean;
function EncodeBase (I: Int64; Base: Byte): string;

var
  OSVersion, ClassKey: string;
  IsNT,Is95,Is98,Is2K,IsOSR2,IsSE,IsME,IsXP: Boolean;
  Profilepath, WindowsUser, MachineName: string;
  OS: TOSVersion;

const
  DescValue = 'DriverDesc';

  CSIDL_COMMON_ALTSTARTUP         = $001e;
  CSIDL_COMMON_FAVORITES          = $001f;
  CSIDL_INTERNET_CACHE            = $0020;
  CSIDL_COOKIES                   = $0021;
  CSIDL_HISTORY                   = $0022;
  CSIDL_INTERNET                  = $0001;

  FILE_SUPPORTS_ENCRYPTION = 32;
  FILE_SUPPORTS_OBJECT_IDS = 64;
  FILE_SUPPORTS_REPARSE_POINTS = 128;
  FILE_SUPPORTS_SPARSE_FILES = 256;
  FILE_VOLUME_QUOTAS = 512;

  MAXSIZE = 260;



implementation

uses
  Registry, ShellAPI, ActiveX, Messages, Math, CommDlg;

var
  ofn: TOpenFilename;
  buffer: array [0..MAXSIZE - 1] of Char;  

const
   wpSlot = 'messngr';

function GetErrorMessage(ErrorCode: integer): string;
const
  BUFFER_SIZE = 1024;
var
  lpMsgBuf: Pchar;
  LangID: DWORD;
begin
  lpMsgBuf:=AllocMem(BUFFER_SIZE);
  LangID:=$409;//GetUserDefaultLangID;
  FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM or FORMAT_MESSAGE_IGNORE_INSERTS,
                nil,ErrorCode,LangID,lpMsgBuf,BUFFER_SIZE,nil);
  Result:=StrPas(lpMsgBuf);
  FreeMem(lpMsgBuf);
end;

function GetOS;
var
  OS :TOSVersionInfo;
begin
  ZeroMemory(@OS,SizeOf(OS));
  OS.dwOSVersionInfoSize:=SizeOf(OS);
  GetVersionEx(OS);
  Result:=osUnknown;
  if OS.dwPlatformId=VER_PLATFORM_WIN32_NT then begin
    case OS.dwMajorVersion of
      3: Result:=osNT3;
      4: Result:=osNT4;
      5: Result:=os2K;
    end;
    if (OS.dwMajorVersion=5) and (OS.dwMinorVersion=1) then
      Result:=osXP;
  end else begin
    if (OS.dwMajorVersion=4) and (OS.dwMinorVersion=0) then begin
      Result:=os95;
      if (Trim(OS.szCSDVersion)='B') then
        Result:=os95OSR2;
    end else
      if (OS.dwMajorVersion=4) and (OS.dwMinorVersion=10) then begin
        Result:=os98;
        if (Trim(OS.szCSDVersion)='A') then
          Result:=os98SE;
      end else
        if (OS.dwMajorVersion=4) and (OS.dwMinorVersion=90) then
          Result:=osME;
  end;
end;

function FormatSeconds(TotalSeconds :comp; WholeSecondsOnly, DisplayAll, DTFormat :Boolean) :String;
var
 lcenturies,lyears,lmonths,lminutes,lhours,ldays,lweeks :word;
 lSecs :double;
 s :array[1..8] of string;
 SecondsPerCentury :comp;
 FS :string;
begin
  if WholeSecondsOnly then
    FS:='%.0f'
  else
    FS:='%.2f';
  SecondsPerCentury:=36550 * 24;
  SecondsPerCentury:= SecondsPerCentury * 3600;
  lcenturies:=Trunc(TotalSeconds / SecondsPerCentury);
  TotalSeconds:=TotalSeconds-(lcenturies * SecondsPerCentury);
  lyears:=Trunc(TotalSeconds / (365.5 * 24 * 3600));
  TotalSeconds:=TotalSeconds-(lyears * (365.5 * 24 * 3600));
  lmonths:=Trunc(TotalSeconds / (31 * 24 * 3600));
  TotalSeconds:=TotalSeconds-(lmonths * (31 * 24 * 3600));
  lweeks:=Trunc(TotalSeconds / (7 * 24 * 3600));
  TotalSeconds:=TotalSeconds-(lweeks * (7 * 24 * 3600));
  ldays:=Trunc(TotalSeconds / (24 * 3600));
  TotalSeconds:=TotalSeconds-(ldays * (24 * 3600));
  lhours:=Trunc(TotalSeconds / 3600);
  TotalSeconds:=TotalSeconds-(lhours * 3600);
  lminutes:=Trunc(TotalSeconds / 60);
  TotalSeconds:=TotalSeconds-(lminutes * 60);
  If WholeSecondsOnly then
    lsecs:=Trunc(TotalSeconds)
  else
    lsecs:=TotalSeconds;
  if lCenturies=1 then
    s[1]:=' Century, '
  else
    s[1]:=' Centuries, ';
  if lyears=1 then
    s[2]:=' Year, '
  else
    s[2]:=' Years, ';
  if lmonths=1 then
    s[3]:=' Month, '
  else
    s[3]:=' Months, ';
  if lweeks=1 then
    s[4]:=' Week, '
  else
    s[4]:=' Weeks, ';
  if ldays=1 then
    s[5]:=' Day, '
  else
    s[5]:=' Days, ';
  if lhours=1 then
    s[6]:=' Hour, '
  else
    s[6]:=' Hours, ';
  if lminutes=1 then
    s[7]:=' Minute, '
  else
    s[7]:=' Minutes, ';
  if lsecs=1 then
    s[8]:=' Second.'
  else
    s[8]:=' Seconds.';
  If DisplayAll then begin
    if dtformat then
      result:=Format('%2.2d.%2.2d.%2.2d %2.2d:%2.2d:%2.2d',
                     [lyears,lmonths,ldays+lweeks*7,lhours,lminutes,round(lSecs)])
    else
      Result:= Format('%.0d%s%.0d%s%.0d%s%.0d%s%.0d%s%.0d%s%.0d%s' + FS + '%s',
                     [lcenturies,s[1],lyears,s[2],lmonths,s[3],lweeks,s[4],ldays,s[5],lhours,s[6],lminutes,s[7],lSecs,s[8]]);

  end else begin
    if dtformat then
      result:=Format('%2.2d:%2.2d:%2.2d',
                     [lhours,lminutes,round(lSecs)])
    else begin
      if lCenturies>=1 then
        Result:= Format('%.0d%s%.0d%s%.0d%s%.0d%s%.0d%s%.0d%s%.0d%s' + FS + '%s',
                        [lcenturies,s[1],lyears,s[2],lmonths,s[3],lweeks,s[4],ldays,s[5],lhours,s[6],lminutes,s[7],lsecs,s[8]])
      else
        if lyears>=1 then
          Result:= Format('%.0d%s%.0d%s%.0d%s%.0d%s%.0d%s%.0d%s' + FS + '%s',
                          [lyears,s[2],lmonths,s[3],lweeks,s[4],ldays,s[5],lhours,s[6],lminutes,s[7],lsecs,s[8]])
      else
       if lmonths>=1 then
         Result:= Format('%.0d%s%.0d%s%.0d%s%.0d%s%.0d%s' + FS + '%s',
                         [lmonths,s[3],lweeks,s[4],ldays,s[5],lhours,s[6],lminutes,s[7],lsecs,s[8]])
       else
         if lweeks>=1 then
           Result:= Format('%.0d%s%.0d%s%.0d%s%.0d%s' + FS + '%s',
                           [lweeks,s[4],ldays,s[5],lhours,s[6],lminutes,s[7],lsecs,s[8]])
         else
           if ldays>=1 then
             Result:= Format('%.0d%s%.0d%s%.0d%s' + FS + '%s',
                             [ldays,s[5],lhours,s[6],lminutes,s[7],lsecs,s[8]])
           else
             if lhours>=1 then
               Result:= Format('%.0d%s%.0d%s' + FS + '%s',
                               [lhours,s[6],lminutes,s[7],lsecs,s[8]])
             else
               if lminutes>=1 then
                 Result:= Format('%.0d%s' + FS + '%s',[lminutes,s[7],lsecs,s[8]])
               else
                 Result:= Format(FS + '%s',[lsecs,s[8]]);
    end;
  end;
end;

function ReadRegInfo(ARoot :hkey; AKey, AValue :string) :string;
begin
  with TRegistry.create do begin
    result:='';
    rootkey:=aroot;
    if keyexists(akey) then begin
      OpenKey(akey,false);
      if ValueExists(avalue) then begin
        case getdatatype(avalue) of
          rdstring: result:=ReadString(avalue);
          rdinteger: result:=inttostr(readinteger(avalue));
        end;
      end;
      closekey;
    end;
    free;
  end;
end;

function ReadVerInfo(const fn :string; var Desc :string) :string;
var
  VersionHandle,VersionSize :dword;
  PItem,PVersionInfo :pointer;
  FixedFileInfo :PVSFixedFileInfo;
  il :uint;
  version :string;
  p :array [0..MAX_PATH - 1] of char;
begin
  version:='';
  desc:='';
  result:='';
  if fn<>'' then begin
    strpcopy(p,fn);
    versionsize:=getfileversioninfosize(p,versionhandle);
    if versionsize=0 then
      exit;
    getMem(pversioninfo,versionsize);
    try
      if getfileversioninfo(p,versionhandle,versionsize,pversioninfo) then begin
        if verqueryvalue(pversioninfo,'\',pointer(fixedfileinfo),il) then
          version:=inttostr(hiword(fixedfileinfo^.dwfileversionms))+
                   '.'+inttostr(loword(fixedfileinfo^.dwfileversionms))+
                   '.'+inttostr(hiword(fixedfileinfo^.dwfileversionls))+
                   '.'+inttostr(loword(fixedfileinfo^.dwfileversionls));
          if verqueryvalue(pversioninfo,pchar('\StringFileInfo\040904E4\FileDescription'),pitem,il) then
            desc:=pchar(pitem);
      end;
    finally
      freeMem(pversioninfo,versionsize);
      result:=version;
    end;
  end;
end;

function GetMachine :string;
var
  n :dword;
  buf :pchar;
const
  rkMachine = {HKEY_LOCAL_MACHINE\}'SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName';
    rvMachine = 'ComputerName';
begin
  n:=255;
  buf:=stralloc(n);
  GetComputerName(buf,n);
  result:=strpas(buf);
  strdispose(buf);
  with TRegistry.Create do begin
    rootkey:=HKEY_LOCAL_MACHINE;
    if OpenKey(rkMachine,false) then begin
      if ValueExists(rvMachine) then
        result:=ReadString(rvMachine);
      closekey;
    end;
    free;
  end;
end;

function GetUser :string;
var
  n :dword;
  buf :pchar;
begin
  n:=255;
  buf:=stralloc(n);
  GetUserName(buf,n);
  result:=strpas(buf);
  strdispose(buf);
end;

function GetClassDevices(AStartKey,AClassName,AValueName :string; var AResult :TStrings) :string;
var
  i,j :integer;
  sl :TStringList;
  s,v,rclass :string;
const
  rvGUID = 'ClassGUID';
  rvClass = 'Class';
  rvLink = 'Link';
begin
  Result:='';
  AResult.Clear;
  with TRegistry.Create do begin
    RootKey:=HKEY_LOCAL_MACHINE;
    if OpenKey(AStartKey,false) then begin
      sl:=TStringList.Create;
      GetKeyNames(sl);
      CloseKey;
      for i:=0 to sl.Count-1 do
        if OpenKey(AStartKey+'\'+sl[i],false) then begin
          if ValueExists(rvClass) then begin
            rclass:=UpperCase(ReadString(rvClass));
            if rclass=UpperCase(AClassName) then begin
              if not IsNT then begin
                s:=UpperCase(ReadString(rvLink));
                CloseKey;
                if not OpenKey(AStartKey+'\'+s,False) then
                  Exit;
              end else
                s:=sl[i];
              Result:=s;
              GetKeyNames(sl);
              CloseKey;
              for j:=0 to sl.count-1 do
                if OpenKey(AStartKey+'\'+s+'\'+sl[j],false) then begin
                  if ValueExists(AValueName) then begin
                    v:=ReadString(AValueName);
                    if AResult.IndexOf(v)=-1 then
                      AResult.Add(v);
                  end;
                  CloseKey;
                end;
                Break;
            end;
          end;
          CloseKey;
        end;
      sl.free;
    end;
    free;
  end;
end;

procedure GetEnvironment(var EnvList :tstrings);
var
  c,i :dword;
  b :pchar;
  s :string;
begin
  EnvList.Clear;
  c:=4096;
  b:=GetEnvironmentStrings;
  i:=0;
  s:='';
  while i<c do begin
    if b[i]<>#0 then
      s:=s+b[i]
    else begin
      if s='' then
        break;
      EnvList.Add(s);
      s:='';
    end;
    inc(i);
  end;
  FreeEnvironmentStrings(b);
end;

function GetWinSysDir: string;
var
  n: integer;
  p: PChar;
begin
  n:=MAX_PATH;
  p:=stralloc(n);
  getwindowsdirectory(p,n);
  result:=strpas(p)+';';
  getsystemdirectory(p,n);
  Result:=Result+strpas(p)+';';
end;

function GetStrFromBuf;
var
  i,j :integer;
begin
  result:='';
  j:=0;
  i:=0;
  repeat
    if buffer[i]<>#0 then begin
      result:=result+buffer[i];
      j:=0;
    end else
      inc(j);
    inc(i);
  until j>1;
end;

function GetWindowInfo(wh: hwnd): PWindow;
var
  cn,wn :pchar;
  n, wpid,tid :longword;
begin
  n:=255;
  wn:=stralloc(n);
  cn:=stralloc(n);
  tid:=GetWindowThreadProcessId(wh,@wpid);
  getclassname(wh,cn,n);
  getwindowtext(wh,wn,n);
  new(result);
  result^.ClassName:=strpas(cn);
  result^.Text:=strpas(wn);
  result^.Handle:=wh;
  result^.Process:=wpid;
  result^.Thread:=tid;
  result^.ParentWin:=getwindowlong(wh,GWL_HWNDPARENT);
  result^.WndProc:=getwindowlong(wh,GWL_WNDPROC);
  result^.Instance:=getwindowlong(wh,GWL_HINSTANCE);
  result^.ID:=getwindowlong(wh,GWL_ID);
  result^.UserData:=getwindowlong(wh,GWL_USERDATA);
  result^.Style:=getwindowlong(wh,GWL_STYLE);
  result^.ExStyle:=getwindowlong(wh,GWL_EXSTYLE);
  getwindowrect(wh,result^.Rect);
  getclientrect(wh,result^.ClientRect);
  result^.Atom:=getclasslong(wh,GCW_ATOM);
  result^.ClassBytes:=getclasslong(wh,GCL_CBCLSEXTRA);
  result^.WinBytes:=getclasslong(wh,GCL_CBWNDEXTRA);
  result^.ClassWndProc:=getclasslong(wh,GCL_WNDPROC);
  result^.ClassInstance:=getclasslong(wh,GCL_HMODULE);
  result^.Background:=getclasslong(wh,GCL_HBRBACKGROUND);
  result^.Cursor:=getclasslong(wh,GCL_HCURSOR);
  result^.Icon:=getclasslong(wh,GCL_HICON);
  result^.ClassStyle:=getclasslong(wh,GCL_STYLE);
  result^.Styles:=tstringlist.create;
  result^.visible:=iswindowvisible(wh);
  if not(result^.ExStyle and WS_BORDER=0) then
    result^.Styles.add('WS_BORDER');
  if not(result^.Style and WS_CHILD=0) then
    result^.Styles.add('WS_CHILD');
  if not(result^.Style and WS_CLIPCHILDREN=0) then
    result^.Styles.add('WS_CLIPCHILDREN');
  if not(result^.Style and WS_CLIPSIBLINGS=0) then
    result^.Styles.add('WS_CLIPSIBLINGS');
  if not(result^.Style and WS_DISABLED=0) then
    result^.Styles.add('WS_DISABLED');
  if not(result^.Style and WS_DLGFRAME=0) then
    result^.Styles.add('WS_DLGFRAME');
  if not(result^.Style and WS_GROUP=0) then
    result^.Styles.add('WS_GROUP');
  if not(result^.Style and WS_HSCROLL=0) then
    result^.Styles.add('WS_HSCROLL');
  if not(result^.Style and WS_MAXIMIZE=0) then
    result^.Styles.add('WS_MAXIMIZE');
  if not(result^.Style and WS_MAXIMIZEBOX=0) then
    result^.Styles.add('WS_MAXIMIZEBOX');
  if not(result^.Style and WS_MINIMIZE=0) then
    result^.Styles.add('WS_MINIMIZE');
  if not(result^.Style and WS_MINIMIZEBOX=0) then
    result^.Styles.add('WS_MINIMIZEBOX');
  if not(result^.Style and WS_OVERLAPPED=0) then
    result^.Styles.add('WS_OVERLAPPED');
  if not(result^.Style and WS_POPUP=0) then
    result^.Styles.add('WS_POPUP');
  if not(result^.Style and WS_SYSMENU=0) then
    result^.Styles.add('WS_SYSMENU');
  if not(result^.Style and WS_TABSTOP=0) then
    result^.Styles.add('WS_TABSTOP');
  if not(result^.Style and WS_THICKFRAME=0) then
    result^.Styles.add('WS_THICKFRAME');
  if not(result^.Style and WS_VISIBLE=0) then
    result^.Styles.add('WS_VISIBLE');
  if not(result^.Style and WS_VSCROLL=0) then
    result^.Styles.add('WS_VSCROLL');
  result^.ExStyles:=tstringlist.create;
  if not(result^.ExStyle and WS_EX_ACCEPTFILES=0) then
    result^.ExStyles.add('WS_EX_ACCEPTFILES');
  if not(result^.ExStyle and WS_EX_DLGMODALFRAME=0) then
    result^.ExStyles.add('WS_EX_DLGMODALFRAME');
  if not(result^.ExStyle and WS_EX_NOPARENTNOTIFY=0) then
    result^.ExStyles.add('WS_EX_NOPARENTNOTIFY');
  if not(result^.ExStyle and WS_EX_TOPMOST=0) then
    result^.ExStyles.add('WS_EX_TOPMOST');
  if not(result^.ExStyle and WS_EX_TRANSPARENT=0) then
    result^.ExStyles.add('WS_EX_TRANSPARENT');
  if not(result^.ExStyle and WS_EX_MDICHILD=0) then
    result^.ExStyles.add('WS_EX_MDICHILD');
  if not(result^.ExStyle and WS_EX_TOOLWINDOW=0) then
    result^.ExStyles.add('WS_EX_TOOLWINDOW');
  if not(result^.ExStyle and WS_EX_WINDOWEDGE=0) then
    result^.ExStyles.add('WS_EX_WINDOWEDGE');
  if not(result^.ExStyle and WS_EX_CLIENTEDGE =0) then
    result^.ExStyles.add('WS_EX_CLIENTEDGE');
  if not(result^.ExStyle and WS_EX_CONTEXTHELP=0) then
    result^.ExStyles.add('WS_EX_CONTEXTHELP');
  if not(result^.ExStyle and WS_EX_RIGHT=0) then
    result^.ExStyles.add('WS_EX_RIGHT')
  else
    result^.ExStyles.add('WS_EX_LEFT');
  if not(result^.ExStyle and WS_EX_RTLREADING=0) then
    result^.ExStyles.add('WS_EX_RTLREADING')
  else
    result^.ExStyles.add('WS_EX_LTRREADING');
  if not(result^.ExStyle and WS_EX_LEFTSCROLLBAR=0) then
    result^.ExStyles.add('WS_EX_LEFTSCROLLBAR')
  else
    result^.ExStyles.add('WS_EX_RIGHTSCROLLBAR');
  if not(result^.ExStyle and WS_EX_CONTROLPARENT=0) then
    result^.ExStyles.add('WS_EX_CONTROLPARENT');
  if not(result^.ExStyle and WS_EX_STATICEDGE =0) then
    result^.ExStyles.add('WS_EX_STATICEDGE');
  if not(result^.ExStyle and WS_EX_APPWINDOW=0) then
    result^.ExStyles.add('WS_EX_APPWINDOW');
  result^.ClassStyles:=tstringlist.create;
  if not(result^.ClassStyle and CS_BYTEALIGNCLIENT=0) then
    result^.ClassStyles.add('CS_BYTEALIGNCLIENT');
  if not(result^.ClassStyle and CS_VREDRAW=0) then
    result^.ClassStyles.add('CS_VREDRAW');
  if not(result^.ClassStyle and CS_HREDRAW=0) then
    result^.ClassStyles.add('CS_HREDRAW');
  if not(result^.ClassStyle and CS_KEYCVTWINDOW=0) then
    result^.ClassStyles.add('CS_KEYCVTWINDOW');
  if not(result^.ClassStyle and CS_DBLCLKS=0) then
    result^.ClassStyles.add('CS_DBLCLKS');
  if not(result^.ClassStyle and CS_OWNDC=0) then
    result^.ClassStyles.add('CS_OWNDC');
  if not(result^.ClassStyle and CS_CLASSDC=0) then
    result^.ClassStyles.add('CS_CLASSDC');
  if not(result^.ClassStyle and CS_PARENTDC=0) then
    result^.ClassStyles.add('CS_PARENTDC');
  if not(result^.ClassStyle and CS_NOKEYCVT=0) then
    result^.ClassStyles.add('CS_NOKEYCVT');
  if not(result^.ClassStyle and CS_NOCLOSE=0) then
    result^.ClassStyles.add('CS_NOCLOSE');
  if not(result^.ClassStyle and CS_SAVEBITS=0) then
    result^.ClassStyles.add('CS_SAVEBITS');
  if not(result^.ClassStyle and CS_BYTEALIGNWINDOW=0) then
    result^.ClassStyles.add('CS_BYTEALIGNWINDOW');
  if not(result^.ClassStyle and CS_GLOBALCLASS=0) then
    result^.ClassStyles.add('CS_GLOBALCLASS');
  strdispose(wn);
  strdispose(cn);
end;

function ReplaceStr;
var
  p :integer;
begin
  result:='';
  p:=pos(uppercase(AFind),uppercase(ASource));
  while p>0 do begin
    result:=result+Copy(ASource,1,p-1)+AReplace;
    Delete(ASource,1,p+Length(AFind)-1);
    p:=pos(uppercase(AFind),uppercase(ASource));
  end;
  Result:=Result+ASource;
end;

(*function DisplayPropDialog(const Handle: HWND; const FileName: string): Boolean;
var
  Info: TShellExecuteInfo;
begin
  FillChar(Info,SizeOf(Info),#0);
  with Info do begin
    cbSize:=SizeOf(Info);
    lpFile:=PChar(FileName);
    nShow:=SW_SHOW;
    fMask:=SEE_MASK_INVOKEIDLIST;
    Wnd:=Handle;
    lpVerb:=PChar('properties');
  end;
  Result:=ShellExecuteEx(@Info);
end; *)

procedure StringsToRep(sl: TStrings; CountKwd,ItemKwd: string; var Report: TStringlist);
var
  i: integer;
begin
  with Report do begin
    Add(Format('%s=%d',[CountKwd,sl.Count]));
    for i:=0 to sl.Count-1 do
      Add(Format('%s%d=%s',[ItemKwd,i+1,sl[i]]));
  end;
end;

function ResolveLink(const LinkFile: TFileName; var FileName,Arguments: string): HRESULT;
var
  psl: IShellLink;
  WLinkFile: array [0..MAX_PATH] of WideChar;
  wfd: TWIN32FINDDATA;
  ppf: IPersistFile;
begin
  pointer(psl):=nil;
  pointer(ppf):=nil;
  Result:=CoInitialize(nil);
  if Succeeded(Result) then begin
    Result:=CoCreateInstance(CLSID_ShellLink,nil,CLSCTX_INPROC_SERVER,IShellLink,psl);
    if Succeeded(Result) then begin
      Result:=psl.QueryInterface(IPersistFile,ppf);
      if Succeeded(Result) then begin
        StringToWideChar(LinkFile,WLinkFile,SizeOf(WLinkFile)-1);
        Result:=ppf.Load(WLinkFile,STGM_READ);
        if Succeeded(Result) then begin
          Result:=psl.Resolve(0,SLR_NO_UI);
          if Succeeded(Result) then begin
            SetLength(FileName,MAX_PATH);
            SetLength(Arguments,255);
            Result:=psl.GetPath(PChar(FileName),MAX_PATH,wfd,SLGP_UNCPRIORITY);
            if Succeeded(Result) then begin
              SetLength(FileName,Length(PChar(FileName)));
              Result:=psl.GetArguments(PChar(Arguments),255);
              if Succeeded(Result) then
                SetLength(Arguments,Length(PChar(Arguments)));
            end;
          end;
        end;
        ppf._Release;
      end;
      psl._Release;
    end;
    CoUnInitialize;
  end;
  pointer(psl):=nil;
  pointer(ppf):=nil;
end;

function GetSpecialFolder(Handle: Hwnd; nFolder: Integer): string;
var
  PIDL: PItemIDList;
  Path: LPSTR;
begin
  Result:='';
  Path:=PAnsiChar(StrAlloc(MAX_PATH));
  SHGetSpecialFolderLocation(Handle, nFolder, PIDL);
  if SHGetPathFromIDList(PIDL, PChar(Path)) then
    Result:=StrPas(Path);
  StrDispose(Path);
end;

function ReverseStr(S: string): string;
var
  l,i: integer;
begin
  l:=Length(s);
  Result:='';
  for i:=0 to l-1 do
    Result:=Result+s[l-i];
end;

function GetMediaPresent(Value: TDiskSign) :Boolean;
var
  ErrorMode: Word;
  bufRoot :pchar;
  a,b,c,d :dword;
begin
  bufRoot:=stralloc(255);
  strpcopy(bufRoot,Value+'\');
  ErrorMode:=SetErrorMode(SEM_FailCriticalErrors);
  try
    try
      result:=GetDiskFreeSpace(bufRoot,a,b,c,d);
    except
      result:=False;
    end;
  finally
    strdispose(bufroot);
    SetErrorMode(ErrorMode);
  end;
end;

(*function GetDiskInfo(Value: TDiskSign): TDiskInfo;
var
  BPS,TC,FC,SPC :integer;
  T,F :TLargeInteger;
  TF :PLargeInteger;
  bufRoot, bufVolumeLabel, bufFileSystem :pchar;
  MCL,Size,Flags :DWORD;
  s :string;
  {$IFNDEF D4PLUS}
  h :THandle;
  GetDiskFreeSpaceEx :function (lpDirectoryName: PChar;
                                var lpFreeBytesAvailableToCaller,
                                    lpTotalNumberOfBytes;
                                lpTotalNumberOfFreeBytes: PLargeInteger): BOOL; stdcall;
  {$ENDIF}

begin
  with Result do begin
    Sign:=Value;
    Size:=255;
    bufRoot:=AllocMem(Size);
    strpcopy(bufRoot,Value+'\');
    case GetDriveType(bufRoot) of
      DRIVE_UNKNOWN     :MediaType:=dtUnknown;
      DRIVE_NO_ROOT_DIR :MediaType:=dtNotExists;
      DRIVE_REMOVABLE   :MediaType:=dtRemovable;
      DRIVE_FIXED       :MediaType:=dtFixed;
      DRIVE_REMOTE      :MediaType:=dtRemote;
      DRIVE_CDROM       :MediaType:=dtCDROM;
      DRIVE_RAMDISK     :MediaType:=dtRAMDisk;
    end;
    FileFlags:=[];
    if GetMediaPresent(Value) then begin
      GetDiskFreeSpace(bufRoot,SectorsPerCluster,BytesPerSector,FreeClusters,TotalClusters);
      try
        new(TF);
        {$IFDEF D4PLUS}
        SysUtils.GetDiskFreeSpaceEx(bufRoot,F,T,TF);
        Capacity:=T;
        FreeSpace:=F;
        {$ELSE}
        GetDiskFreeSpaceEx:=nil;
        h:=LoadLibrary('KERNEL32.DLL');
        if h>0 then
          GetDiskFreeSpaceEx:=GetProcAddress(h,'GetDiskFreeSpaceExA');
        if assigned(GetDiskFreeSpaceEx) then
          GetDiskFreeSpaceEx(bufRoot,F,T,TF);
        Capacity:=T;
        FreeSpace:=F;
        FreeLibrary(h);
        {$ENDIF}
        dispose(TF);
      except
        BPS:=BytesPerSector;
        TC:=TotalClusters;
        FC:=FreeClusters;
        SPC:=SectorsPerCluster;
        {$IFDEF D4PLUS}
        Capacity:=TC*SPC*BPS;
        FreeSpace:=FC*SPC*BPS;
        {$ELSE}
        Capacity.QuadPart:=TC*SPC*BPS;
        FreeSpace.QuadPart:=FC*SPC*BPS;
        {$ENDIF}
      end;
      bufVolumeLabel:=AllocMem(Size);
      bufFileSystem:=AllocMem(Size);
      if GetVolumeInformation(bufRoot,bufVolumeLabel,Size,@Serial,MCL,Flags,bufFileSystem,Size) then begin;
        VolumeLabel:=strpas(bufVolumeLabel);
        FileSystem:=strpas(bufFileSystem);
        s:=IntToHex(Serial,8);
        SerialNumber:=copy(s,1,4)+'-'+copy(s,5,4);
        FreeMem(bufVolumeLabel);
        FreeMem(bufFileSystem);
        FreeMem(bufRoot);
        if Flags and FS_CASE_SENSITIVE=FS_CASE_SENSITIVE then
          FileFlags:=FileFlags+[fsCaseSensitive];
        if Flags and FS_CASE_IS_PRESERVED=FS_CASE_IS_PRESERVED then
          FileFlags:=FileFlags+[fsCaseIsPreserved];
        if Flags and FS_UNICODE_STORED_ON_DISK=FS_UNICODE_STORED_ON_DISK then
          FileFlags:=FileFlags+[fsUnicodeStoredOnDisk];
        if Flags and FS_PERSISTENT_ACLS=FS_PERSISTENT_ACLS then
          FileFlags:=FileFlags+[fsPersistentAcls];
        if Flags and FS_VOL_IS_COMPRESSED=FS_VOL_IS_COMPRESSED then
          FileFlags:=FileFlags+[fsVolumeIsCompressed];
        if Flags and FS_FILE_COMPRESSION=FS_FILE_COMPRESSION then
          FileFlags:=FileFlags+[fsFileCompression];
        if MCL=255 then
          FileFlags:=FileFlags+[fsLongFileNames];
        if Flags and FILE_SUPPORTS_ENCRYPTION=FILE_SUPPORTS_ENCRYPTION then
          FileFlags:=FileFlags+[fsEncryptedFileSystemSupport];
        if Flags and FILE_SUPPORTS_OBJECT_IDS=FILE_SUPPORTS_OBJECT_IDS then
          FileFlags:=FileFlags+[fsObjectIDsSupport];
        if Flags and FILE_SUPPORTS_REPARSE_POINTS=FILE_SUPPORTS_REPARSE_POINTS then
          FileFlags:=FileFlags+[fsReparsePointsSupport];
        if Flags and FILE_SUPPORTS_SPARSE_FILES=FILE_SUPPORTS_SPARSE_FILES then
          FileFlags:=FileFlags+[fsSparseFilesSupport];
        if Flags and FILE_VOLUME_QUOTAS=FILE_VOLUME_QUOTAS then
          FileFlags:=FileFlags+[fsDiskQuotasSupport];
      end;
    end else begin
      SectorsPerCluster:=0;
      BytesPerSector:=0;
      FreeClusters:=0;
      TotalClusters:=0;
      {$IFDEF D4PLUS}
      Capacity:=0;
      FreeSpace:=0;
      {$ELSE}
      Capacity.QuadPart:=0;
      FreeSpace.QuadPart:=0;
      {$ENDIF}
      VolumeLabel:='';
      SerialNumber:='';
      FileSystem:='';
      Serial:=0;
    end;
  end;
end;    *)

function GetMediaTypeStr(dt: TMediaType) :string;
begin
  case dt of
    dtUnknown     :result:='Unknown';
    dtNotExists   :result:='Not Exists';
    dtRemovable   :result:='Removable';
    dtFixed       :result:='Fixed';
    dtRemote      :result:='Remote';
    dtCDROM       :result:='CDROM';
    dtRAMDisk     :result:='RAMDisk';
  end;
end;

function FileTimeToDateTimeStr(FileTime: TFileTime): string;
var
  LocFTime: TFileTime;
  SysFTime: TSystemTime;
  DateStr: string;
  TimeStr: string;
  FDateTimeStr: string;
  Dt, Tm: TDateTime;
begin
  FileTimeToLocalFileTime(FileTime, LocFTime);
  FileTimeToSystemTime(LocFTime, SysFTime);
  try
    with SysFTime do begin
      Dt := EncodeDate(wYear, wMonth, wDay);
      DateStr := DateToStr(Dt);
      Tm := EncodeTime(wHour, wMinute, wSecond, wMilliseconds);
      Timestr := TimeToStr(Tm);
      FDateTimeStr := DateStr + '   ' + TimeStr;
    end;
    Result := DateTimeToStr(StrToDateTime(FDateTimeStr));
  except
    Result := '';
  end;
end;

function FiletimeToDateTime(FT: FILETIME): TDateTime;
var
  st: SYSTEMTIME;
  dt1,dt2: TDateTime;
begin
  FileTimeToSystemTime(FT,st);
  dt1:=EncodeTime(st.whour,st.wminute,st.wsecond,st.wMilliseconds);
  try
    dt2:=EncodeDate(st.wyear,st.wmonth,st.wday);
  except
    dt2:=0;
  end;
  Result:=dt1+dt2;
end;

function UTCToDateTime(UTC: DWORD): TDateTime;
var
  d: LARGE_INTEGER;
  ft: FILETIME;
begin
  d.QuadPart:=365*24*60*60;
  d.QuadPart:=((1970-1601)*d.QuadPart+UTC+89*24*60*60+3600)*10000000;
  ft.dwLowDateTime:=d.LowPart;
  ft.dwHighDateTime:=d.HighPart;
  Result:=FiletimeToDateTime(ft);
end;

function GetWinDir :string;
var
  n :dword;
  p :pchar;
begin
  n:=MAX_PATH;
  p:=stralloc(n);
  getwindowsdirectory(p,n);
  result:=strpas(p);
  strdispose(p);
end;

function GetSysDir :string;
var
  n :dword;
  p :pchar;
begin
  n:=MAX_PATH;
  p:=stralloc(n);
  getsystemdirectory(p,n);
  result:=strpas(p);
  strdispose(p);
end;

function GetTempDir :string;
var
  n :dword;
  p :pchar;
begin
  n:=MAX_PATH;
  p:=stralloc(n);
  gettemppath(n,p);
  result:=strpas(p);
  strdispose(p);
end;

function ExpandEnvVars;
var
  i,p: integer;
  sl: TStrings;
  s: string;
begin
  sl:=TStringList.Create;
  GetEnvironment(sl);
  for i:=0 to sl.Count-1 do begin
    s:='%'+sl.Names[i]+'%';
    p:=Pos(s,ASource);
    if p>0 then
      ASource:=Copy(ASource,1,p-1)+sl.Values[sl.names[i]]+Copy(ASource,p+Length(s),1024)
    else begin
      s:='\'+sl.Names[i];
      p:=Pos(s,ASource);
      if p>0 then
        ASource:=Copy(ASource,1,p-1)+sl.Values[sl.names[i]]+Copy(ASource,p+Length(s),1024);
    end;
  end;
  Result:=ASource;
  sl.Free;
end;

function GetProfilePath;
var
  s: string;
begin
  s:=GetSpecialFolder(GetDesktopWindow,CSIDL_DESKTOP);
  s:=ReverseStr(s);
  Result:=ReverseStr(Copy(s,Pos('\',s)+1,255));
end;

function GetAvailDisks :string;
var
  i,n :integer;
  buf :pchar;
begin
  buf:=stralloc(255);
  n:=GetLogicalDriveStrings(255,buf);
  result:='';
  for i:=0 to n do
    if buf[i]<>#0 then begin
      if (ord(buf[i]) in [$41..$5a]) or (ord(buf[i]) in [$61..$7a]) then
        result:=result+upcase(buf[i])
    end else
      if buf[i+1]=#0 then
        break;
  strdispose(buf);
end;

procedure GetCDs(cds :tstrings);
var
  i :integer;
  root :pchar;
  s :string;
begin
  root:=stralloc(255);
  s:=getavaildisks;
  cds.clear;
  for i:=1 to length(s) do begin
    strpcopy(root,copy(s,i,1)+':\');
    if getdrivetype(root)=drive_cdrom then
      cds.add(copy(root,1,length(root)-1));
  end;
  strdispose(root);
end;

function KillProcess;
var
  ph: THandle;
begin
  ph:=OpenProcess(PROCESS_TERMINATE,False,APID);
  Result:=ph<>0;
  if Result then
    TerminateProcess(ph,0);
end;

Function SubStr;
var
  p,l :integer;
begin
  p:=pos(uppercase(AFind),uppercase(ASource));
  if p>0 then begin
    l:=Length(AFind);
    Delete(ASource,p,l);
    Insert(AReplace,ASource,p);
  end;
  result:=ASource;
end;

function UniPath;
begin
  if (Path<>'') and (Copy(path,length(path),1)<>'\') then begin
    if not removebackslash then
      path:=path+'\'
  end else
    if removebackslash then
      delete(path,length(path),1);
  result:=path;
end;

(*procedure GetFileInfo;
var
  FI :TBYHANDLEFILEINFORMATION;
  shinfo :TSHFileInfo;
  h :THandle;
  ii :word;
  q :array [0..MAX_PATH - 1] of char;
begin
  h:=FileOpen(AFilename,fmOpenRead or fmShareDenyNone);
  if h<>0 then
    with AFileInfo do begin
      ii:=0;
      strpcopy(q,AFilename);
      if extracticon(hinstance,q,word(-1))>0 then
        iconhandle:=extracticon(hinstance,PChar(AFilename),ii)
      else
        iconhandle:=ExtractAssociatedIcon(hInstance,q,ii);
      if ShGetFileInfo(q,0,ShInfo,SizeOf(ShInfo),SHGFI_TYPENAME)<>0 then
        FileType:=ShInfo.szTypeName
      else
        FileType:='';
      GetFileInformationByHandle(h,FI);
      FileClose(h);
      Size:=FI.nFileSizelow+256*FI.nFileSizehigh;
      Attributes:=FI.dwFileAttributes;
      Created:=FileTimeToDateTime(FI.ftCreationTime);
      Accessed:=FileTimeToDateTime(FI.ftLastAccessTime);
      Modified:=FileTimeToDateTime(FI.ftLastWriteTime);
      BinaryType:=GetBinType(Afilename);
    end;
end;   *)

function ExtractName;
var
  p :integer;
begin
  result:=extractfilename(AFilename);
  p:=pos('.',result);
  if p>0 then
    result:=copy(result,1,p-1);
end;

function HasAttr;
begin
  Result:=(FileGetAttr(AFileName) and AAttr)=AAttr;
end;

function DirExists;
  function StripTrailingBackslash(const Dir: string): string;
  begin
    Result := Dir;
    if (Result <> '') and (Result[Length(Result)] = '\') then
      SetLength(Result, Length(Result)-1);
  end;
var
  Tmp: string;
  DriveBits: set of 0..25;
  SR: TSearchRec;
begin
  if (Length(ADir) = 3) and (ADir[2] = ':') and (ADir[3] = '\') then begin
    Integer(DriveBits) := GetLogicalDrives;
    Tmp := UpperCase(ADir[1]);
    Result := (ord(Tmp[1]) - ord('A')) in DriveBits;
  end else begin
    Result := (FindFirst(StripTrailingBackslash(ADir), faDirectory, SR) = 0) and (ADir <> '');
    if Result then
      Result := (SR.Attr and faDirectory) = faDirectory;
    sysutils.FindClose(SR);
  end;
end;

function GetBinType;
var
  BinaryType: DWORD;
  fi :TSHFileInfo;
const
  IMAGE_DOS_SIGNATURE    = $5A4D; // MZ
  IMAGE_OS2_SIGNATURE    = $454E; // NE
  IMAGE_VXD_SIGNATURE    = $454C; // LE
  IMAGE_NT_SIGNATURE     = $0000; // PE
  IMAGE_32_SIGNATURE     = $4550;
begin
  binarytype:=SHGetFileInfo(PChar(AFilename),0,fi,sizeof(fi),SHGFI_EXETYPE);
  result:='';
  if binarytype<>0 then
    case loword(binarytype) of
      IMAGE_DOS_SIGNATURE: result:='DOS Executable';
      IMAGE_VXD_SIGNATURE: result:='Virtual Device Driver';
      IMAGE_OS2_SIGNATURE,IMAGE_NT_SIGNATURE, IMAGE_32_SIGNATURE:
      case hiword(binarytype) of
        $400: result:='Win32 Executable';
        $30A,$300: result:='Win16 Executable';
        $0 :result:='Win32 Console Executable';
      end;
    end;
  if Result='' then
    if GetBinaryType(Pchar(AFilename),Binarytype) then
      case BinaryType of
        SCS_32BIT_BINARY: result:= 'Win32 Executable';
        SCS_DOS_BINARY  : result:= 'DOS Executable';
        SCS_WOW_BINARY  : result:= 'Win16 Executable';
        SCS_PIF_BINARY  : result:= 'PIF File';
        SCS_POSIX_BINARY: result:= 'POSIX Executable';
        SCS_OS216_BINARY: result:= 'OS/2 16 bit Executable'
      end;
end;

function ExtractUNCFilename;
var
  p,l :integer;
begin
  p:=pos(':',ASource);
  if p>0 then begin
    l:=Length(ASource);
    result:=Copy(ASource,p-1,l-p+2);
  end else
    result:=ASource;
end;

function FileCopy;
var
  CopyBuffer: Pointer;
  BytesCopied: Longint;
  Source, Dest: Integer;
  Destination: TFileName;
const
  ChunkSize: Longint = 8192;
begin
  Result:=False;
  Destination := ExpandFileName(ADestName);
{  if HasAttr(Destination, faDirectory) then
    Destination := UniPath(Destination,true) + ExtractFileName(AFileName);}
  GetMem(CopyBuffer, ChunkSize);
  try
    Source:=FileOpen(AFileName, fmShareDenyNone);
    if not(Source<0) then
      try
        Dest:=FileCreate(Destination);
        if not(Dest<0) then
          try
            repeat
              BytesCopied:=FileRead(Source, CopyBuffer^, ChunkSize);
              if BytesCopied>0 then
                 FileWrite(Dest, CopyBuffer^, BytesCopied);
             until BytesCopied<ChunkSize;
             Result:=True;
          finally
            FileClose(Dest);
          end;
        finally
          FileClose(Source);
        end;
  finally
    FreeMem(CopyBuffer, ChunkSize);
  end;
end;

function FileMove;
var
  Destination: string;
begin
  Result:=True;
  Destination := ExpandFileName(ADestName);
  if not RenameFile(AFileName, Destination) then begin
    if HasAttr(AFileName, faReadOnly) then begin
      Result:=False;
      Exit;
    end;
    FileCopy(AFileName, Destination);
    DeleteFile(AFilename);
  end;
end;

function IsBitOn (Value: Integer; Bit: Byte): Boolean;
begin
  Result:=(Value and (1 shl Bit))<>0;
end;


function CreateDOSProcessRedirected(const CommandLine, InputFile, OutputFile,
   ErrMsg :string): boolean;
const
  ROUTINE_ID = '[function: CreateDOSProcessRedirected]';
var
  pCommandLine: array[0..MAX_PATH] of char;
  pInputFile,
  pOutPutFile: array[0..MAX_PATH] of char;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  SecAtrrs: TSecurityAttributes;
  hAppProcess,
  hAppThread,
  hInputFile,
  hOutputFile   : THandle;
begin
  Result := FALSE;
  if (InputFile<>'') and (not FileExists(InputFile)) then
    raise Exception.CreateFmt(ROUTINE_ID + #10 + #10 +
       'Input file * %s *' + #10 +
       'does not exist' + #10 + #10 +
       ErrMsg, [InputFile]);
  hAppProcess:=0;
  hAppThread:=0;
  hInputFile:=0;
  hOutputFile:=0;
  try
    StrPCopy(pCommandLine, CommandLine);
    StrPCopy(pInputFile, InputFile);
    StrPCopy(pOutPutFile, OutputFile);
    { prepare SecAtrrs structure for the CreateFile calls.  This SecAttrs
      structure is needed in this case because we want the returned handle to
      be inherited by child process. This is true when running under WinNT.
      As for Win95, the parameter is ignored. }
    FillChar(SecAtrrs,SizeOf(SecAtrrs),#0);
    SecAtrrs.nLength:=SizeOf(SecAtrrs);
    SecAtrrs.lpSecurityDescriptor:=nil;
    SecAtrrs.bInheritHandle:=TRUE;
    if InputFile<>'' then begin
      hInputFile:=CreateFile(
         pInputFile,                          { pointer to name of the file }
         GENERIC_READ or GENERIC_WRITE,       { access (read-write) mode }
         FILE_SHARE_READ or FILE_SHARE_WRITE, { share mode }
         @SecAtrrs,                           { pointer to security attributes }
         OPEN_ALWAYS,                         { how to create }
         FILE_ATTRIBUTE_NORMAL
         or FILE_FLAG_WRITE_THROUGH,          { file attributes }
         0);                                 { handle to file with attrs to copy }
      if hInputFile = INVALID_HANDLE_VALUE then
        raise Exception.CreateFmt(ROUTINE_ID + #10 +  #10 +
           'WinApi function CreateFile returned an invalid handle value' + #10 +
           'for the input file * %s *' + #10 + #10 +
            ErrMsg, [InputFile]);
    end else
      hInputFile:=0;

    hOutputFile:=CreateFile(
       pOutPutFile,                         { pointer to name of the file }
       GENERIC_READ or GENERIC_WRITE,       { access (read-write) mode }
       FILE_SHARE_READ or FILE_SHARE_WRITE, { share mode }
       @SecAtrrs,                           { pointer to security attributes }
       CREATE_ALWAYS,                       { how to create }
       FILE_ATTRIBUTE_NORMAL
       or FILE_FLAG_WRITE_THROUGH,          { file attributes }
       0 );                                 { handle to file with attrs to copy }
    if hOutputFile=INVALID_HANDLE_VALUE then
      raise Exception.CreateFmt(ROUTINE_ID + #10 +  #10 +
         'WinApi function CreateFile returned an invalid handle value'  + #10 +
         'for the output file * %s *' + #10 + #10 +
         ErrMsg, [OutputFile]);

    FillChar(StartupInfo, SizeOf(StartupInfo), #0);
    StartupInfo.cb:=SizeOf(StartupInfo);
    StartupInfo.dwFlags:=STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
    StartupInfo.wShowWindow:=SW_HIDE;
    StartupInfo.hStdOutput:=hOutputFile;
    StartupInfo.hStdInput:=hInputFile;

    Result:=CreateProcess(
       NIL,                           { pointer to name of executable module }
       pCommandLine,                  { pointer to command line string }
       NIL,                           { pointer to process security attributes }
       NIL,                           { pointer to thread security attributes }
       TRUE,                          { handle inheritance flag }
       HIGH_PRIORITY_CLASS,           { creation flags }
       NIL,                           { pointer to new environment block }
       NIL,                           { pointer to current directory name }
       StartupInfo,                   { pointer to STARTUPINFO }
       ProcessInfo);                  { pointer to PROCESS_INF }

    if Result then begin
      WaitforSingleObject(ProcessInfo.hProcess,INFINITE);
      hAppProcess:=ProcessInfo.hProcess;
      hAppThread:=ProcessInfo.hThread;
    end else
      raise Exception.Create(ROUTINE_ID + #10 +  #10 +
         'Function failure'  + #10 +  #10 + ErrMsg);
  finally
    if hOutputFile <> 0 then
      CloseHandle(hOutputFile);
    if hInputFile <> 0 then
      CloseHandle(hInputFile);
    if hAppThread <> 0 then
      CloseHandle(hAppThread);
    if hAppProcess <> 0 then
      CloseHandle(hAppProcess);
  end;
end;

function OpenMailSlot(Const Server, Slot : String): THandle;
var
  FullSlot : String;
begin
  FullSlot := '\\'+Server+'\mailslot\'+Slot;
  Result := CreateFile(
    PChar(FullSlot),
    GENERIC_WRITE,
    FILE_SHARE_READ,
    NIL,
    OPEN_EXISTING,
    FILE_ATTRIBUTE_NORMAL,
    0                    );
end;

function SendToMailSlot(Const Server, Slot, Mail : String) : Boolean;
var
  hToSlot : THandle;
  BytesWritten : DWord;
begin
  Result := False;
  hToSlot := OpenMailSlot(Server,Slot);
  If hToSlot = INVALID_HANDLE_VALUE Then
    Exit;
  try
    BytesWritten := 0;
    if (NOT WriteFile(hToSlot,
                      Pointer(Mail)^,
                      Length(Mail),
                      BytesWritten,
                      NIL))         OR
        (BytesWritten <> Length(Mail)) Then
      Exit;
    Result := True;
  finally
    CloseHandle(hToSlot);
  end;
end;

function SendToWinpopup(Server, Reciever, Sender, Msg : String) : Boolean;
var
  szserver,szsender,szreciever,szmsg :pchar;
begin
  szserver:=stralloc(255);
  szsender:=stralloc(255);
  szreciever:=stralloc(255);
  szmsg:=stralloc(255);
  CharToOEM(PChar(Server),PAnsiChar(szServer));
  CharToOEM(PChar(Sender),PAnsiChar(szServer));
  CharToOEM(PChar(Reciever),PAnsiChar(szReciever));
  CharToOEM(PChar(Msg),PAnsiChar(szMsg));
  Result := SendToMailSlot(Server, wpslot, szSender+#0+szReciever+#0+szMsg);
  strdispose(szserver);
  strdispose(szsender);
  strdispose(szreciever);
  strdispose(szmsg);
end;

function EncodeBase (I: Int64; Base: Byte): String;
var
  D,J: Int64;
  N: Byte;
const ConversionAlphabeth : String [36] = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
begin
  if I = 0 then begin
     Result := '0';
     exit;
  end;
  D := Round (Power (Base, Trunc (Log10 (I) / Log10 (Base)) + 1));            // +1 to fix occasional real "fuzz"
  J := I;
  Result := '';
  While D > 0 do begin
    N := J div D;
    if (N <> 0) or (Result <> '') then                                      // "fuzz" bug
      Result := Result + ConversionAlphabeth [N + 1];
    J := J mod D;
    D := D div Base;
  end;
end;

function GetFontRes: DWORD;
var
  tm: TTextMetric;
  hwnd,hdc: THandle;
  MapMode: DWORD;
begin
  hwnd:=GetDesktopWindow;
  hdc:=GetWindowDC(hwnd);
  if hdc>0 then begin
    MapMode:=SetMapMode(hdc,MM_TEXT);
    GetTextMetrics(hdc,tm);
    MapMode:=SetMapMode(hdc,MapMode);
    ReleaseDC(hwnd,hdc);
    Result:=tm.tmHeight;
  end;
end;

function TrimAll;
var
  p :integer;
begin
  ASource:=trim(ASource);
  p:=pos(' ',ASource);
  while p>0 do begin
    Delete(ASource,p,1);
    p:=pos(' ',ASource);
  end;
  p:=Pos(#13#10,ASource);
  while p>0 do begin
    Delete(ASource,p,2);
    p:=Pos(#13#10,ASource);
  end;
  result:=ASource;
end;

function booltostr;
begin
  if AValue then begin
    if AVerbose then
      result:='True'
    else
      result:='1';
  end else begin
    if AVerbose then
      result:='False'
    else
      result:='0';
  end;
end;

function StrtoBool;
begin
  Result:=false;
  ASource:=UpperCase(ASource);
  if (ASource='TRUE') or (ASource='1') then
    Result:=true;
end;

procedure AddWord;
begin
  if Length(ADest)>0 then
    ADest:=ADest+ADelimiter+AWord
  else
    ADest:=ADest+AWord;
end;

function GetDelimitedText;
var
  i :integer;
begin
  result:='';
  for i:=0 to AList.Count-1 do
    Result:=Result+AList[i]+ADelimiter;
    if Result<>'' then
      Delete(Result,Length(Result)-Length(ADelimiter)+1,Length(ADelimiter));
end;

procedure SetDelimitedText;
var
  p: integer;
begin
  AList.Clear;
  p:=Pos(ADelimiter,ASource);
  while p>0 do begin
    AList.Add(Copy(ASource,1,p-1));
    Delete(ASource,1,p+Length(Adelimiter)-1);
    p:=Pos(ADelimiter,ASource);
  end;
  AList.Add(ASource);
end;

function FitStr;
var
  lf :integer;
  s :string;
begin
  lf:=Length(ASource);
  if lf>ALength then begin
    result:=Copy(ASource,1,3);
    s:=Copy(ASource,lf-ALength+7,lf);
    result:=Result+AEllipsis+s;
  end else
    result:=ASource;
end;

function GetToken;
var
  i,p :integer;
begin
  p:=pos(adelimiter,s);
  i:=1;
  while (p>0) and (i<index) do begin
    inc(i);
    delete(s,1,p);
    p:=pos(adelimiter,s);
  end;
  result:=copy(s,1,p-1);
end;

procedure SetToken;
var
  i,p,sx,ex :integer;
  s1 :string;
begin
  s1:=s;
  p:=pos(adelimiter,s1);
  sx:=0;
  i:=0;
  while (p>0) and (i<index) do begin
    inc(sx,p);
    inc(i);
    delete(s1,1,p);
    p:=pos(adelimiter,s1);
  end;
  ex:=sx+p;
  s:=copy(s,1,sx)+newvalue+copy(s,ex,255);
end;

function ExtractWord;
Var
  I,J:Word;
  Count:Byte;
  SLen:Integer;
Begin
  Count := 0;
  I := 1;
  Result := '';
  SLen := Length(S);
  While I <= SLen Do Begin
    While (I <= SLen) And (S[I] In WordDelims) Do Inc(I);
    If I <= SLen Then Inc(Count);
    J := I;
    While (J <= SLen) And Not(S[J] In WordDelims) Do Inc(J);
    If Count = N Then Begin
      Result := Copy(S,I,J-I);
      Exit
    End;
    I := J;
  End;
end;

function TestByMask(const S, Mask: string; MaskChar: Char): Boolean;
asm
        TEST    EAX,EAX
        JE      @@qt2
        PUSH    EBX
        TEST    EDX,EDX
        JE      @@qt1
        MOV     EBX,[EAX-4]
        CMP     EBX,[EDX-4]
        JE      @@01
@@qt1:  XOR     EAX,EAX
        POP     EBX
@@qt2:  RET
@@01:   DEC     EBX
        JS      @@07
@@lp:   MOV     CH,BYTE PTR [EDX+EBX]
        CMP     CL,CH
        JNE     @@cm
        DEC     EBX
        JS      @@eq
        MOV     CH,BYTE PTR [EDX+EBX]
        CMP     CL,CH
        JNE     @@cm
        DEC     EBX
        JS      @@eq
        MOV     CH,BYTE PTR [EDX+EBX]
        CMP     CL,CH
        JNE     @@cm
        DEC     EBX
        JS      @@eq
        MOV     CH,BYTE PTR [EDX+EBX]
        CMP     CL,CH
        JNE     @@cm
        DEC     EBX
        JNS     @@lp
        JMP     @@eq
@@cm:   CMP     CH,BYTE PTR [EAX+EBX]
        JNE     @@07
        DEC     EBX
        JNS     @@lp
@@eq:   MOV     EAX,1
        POP     EBX
        RET
@@07:   XOR     EAX,EAX
        POP     EBX
end;

function IsLeapYear(Year: Word): Boolean;
begin
  Result:=((Year and 3)=0) and ((Year mod 100>0) or (Year mod 400=0));
end;

function DaysInMonth(const DT: TDateTime): Byte;
var
  y,m,d: Word;
begin
  DecodeDate(DT,y,m,d);
  case m of
    2: if IsLeapYear(y) then
         Result:=29
       else
         Result:=28;
    4, 6, 9, 11: Result:=30;
    else
      Result := 31;
  end;
end;

function DayOfMonth2Date(year,month,weekInMonth,dayInWeek: word): TDateTime;
var
  days: integer;
  day : integer;
begin
  if (weekInMonth>=1) and (weekInMonth<=4) then begin
    day:=DayOfWeek(EncodeDate(year,month,1));
    day:=1+dayInWeek-day;
    if day<=0 then
      Inc(day,7);
    day:=day+7*(weekInMonth-1);
    Result:=EncodeDate(year,month,day);
  end else
    if weekInMonth=5 then begin
      days:=DaysInMonth(EncodeDate(year,month,1));
      day:=DayOfWeek(EncodeDate(year,month,days));
      day:=days+(dayInWeek-day);
      if day>days then
        Dec(day,7);
      Result:=EncodeDate(year,month,day);
    end else
      Result:=0;
end;

function DSTDate2Date(dstDate: TSystemTime; year: word): TDateTime;
begin
  if dstDate.wMonth=0 then
    Result:=0
  else
    if dstDate.wYear=0 then
      Result:=DayOfMonth2Date(year,dstDate.wMonth,dstDate.wDay,dstDate.wDayOfWeek+1)+
              EncodeTime(dstDate.wHour,dstDate.wMinute,dstDate.wSecond,dstDate.wMilliseconds)
    else
      Result:=SystemTimeToDateTime(dstDate);
end;

(*function GetOpenFileDlg;
begin
  if ADir='' then
    ADir:=ExtractFilePath(ParamStr(0));
  StrPCopy(PChar(@buffer),FileName);
  ofn.lStructSize:=SizeOf(TOpenFilename);
  ofn.hWndOwner:=AHandle;
  ofn.hInstance:=HInstance;
  ofn.lpstrFilter:=PChar(AFilter);
  ofn.lpstrFile:=buffer;
  ofn.nMaxFile:=MAXSIZE;
  ofn.lpstrTitle:=PChar(ATitle);
  ofn.lpstrInitialDir:=PChar(ADir);
  if AOpenDlg then begin
    ofn.Flags:=OFN_FILEMUSTEXIST or OFN_PATHMUSTEXIST or
               OFN_LONGNAMES or OFN_EXPLORER or OFN_HIDEREADONLY;
    Result:=GetOpenFileName(ofn);
  end else begin
    ofn.Flags:=OFN_PATHMUSTEXIST or OFN_OVERWRITEPROMPT or
               OFN_LONGNAMES or OFN_EXPLORER or OFN_HIDEREADONLY;
    Result:=GetSaveFileName(ofn);
  end;
  Filename:=buffer;
end;  *)

initialization
  Os:=GetOS;
  IsNT:=OS in [osNT3,osNT4,os2K];
  IS95:=OS=os95;
  Is98:=OS=os98;
  Is2K:=OS=os2K;
  IsOSR2:=OS=os95OSR2;
  IsSE:=OS=os98SE;
  IsME:=OS=osME;
  IsXP:=OS=osXP;
  WindowsUser:=GetUser;
  MachineName:=GetMachine;
  ProfilePath:=GetProfilePath;
  case OS of
    os95, os95OSR2: OSVersion:='Windows 95';
    os98, os98SE: OSVersion:='Windows 98';
    osME: OSVersion:='Windows Millenium Edition';
    osNT3, osNT4: OSVersion:='Windows NT';
    os2K: OSVersion:='Windows 2000';
    osXP: OSVersion:='Windows XP';
  end;
  if IsNT then
    ClassKey:='SYSTEM\CurrentControlSet\Control\Class'
  else
    ClassKey:='SYSTEM\CurrentControlSet\Services\Class';
end.
