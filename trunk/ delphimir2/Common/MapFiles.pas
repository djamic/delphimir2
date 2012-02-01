unit MapFiles;

interface
uses Windows, Classes, SysUtils;
type
  TMapStream = class
  private
    FFileName: string; // WIL �ļ���
    FFileHandle: THandle; // �ļ����
    FFileMapping: THandle; // �ļ�ӳ����
    FMemory: Pointer; // �ļ�����ָ��(ʹ���ļ�ӳ��)
    FSize: Int64;
    FPosition: Int64;
    FInitialized: Boolean;
    procedure SetPosition(Pos: Int64);
    procedure SetSize(NewSize: Int64);
  public
    constructor Create();
    destructor Destroy; override;
    function LoadFromFile(const FileName: string): Boolean;
    function Read(var Buffer; Count: Longint): Longint;
    function Seek(Offset: Longint; Origin: Word): Longint;
    function Write(const Buffer; Count: Longint): Longint;
    property FileName: string read FFileName write FFileName;
    property Position: Int64 read FPosition write SetPosition;
    property Size: Int64 read FSize write SetSize;
    property Memory: Pointer read FMemory;
  end;
implementation

constructor TMapStream.Create();
begin
  FFileName := ''; //�ļ���
  FFileHandle := 0; //�ļ����
  FFileMapping := 0; //�ļ�ӳ����
  FMemory := nil; //�ļ�����ָ��(ʹ���ļ�ӳ��)
  FSize := 0;
  FPosition := 0;
  FInitialized := False;
end;

destructor TMapStream.Destroy;
begin
  if FMemory <> nil then UnmapViewOfFile(FMemory);
  if FFileMapping <> 0 then CloseHandle(FFileMapping);
  if FFileHandle <> INVALID_HANDLE_VALUE then CloseHandle(FFileHandle);
  inherited;
end;

function TMapStream.LoadFromFile(const FileName: string): Boolean;
var
  H, L: DWord;
begin
  Result := False;
  if FMemory <> nil then UnmapViewOfFile(FMemory);
  if FFileMapping <> 0 then CloseHandle(FFileMapping);
  if FFileHandle <> INVALID_HANDLE_VALUE then CloseHandle(FFileHandle);

  FFileName := ''; //�ļ���
  FFileHandle := 0; //�ļ����
  FFileMapping := 0; //�ļ�ӳ����
  FMemory := nil; //�ļ�����ָ��(ʹ���ļ�ӳ��)
  FSize := 0;
  FPosition := 0;
  FInitialized := False;
  FFileName := FileName;

  FFileHandle := CreateFile(PChar(FFileName), GENERIC_READ,
    FILE_SHARE_READ or FILE_SHARE_WRITE, nil,
    OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL or FILE_FLAG_RANDOM_ACCESS, 0);
  if (FFileHandle = INVALID_HANDLE_VALUE) then Exit;

  FFileMapping := CreateFileMapping(FFileHandle, nil, PAGE_READONLY, 0, 0, nil);

  if FFileMapping = 0 then begin
    CloseHandle(FFileHandle);
    Exit;
  end;

  // ӳ���ļ����ڴ�
  FMemory := MapViewOfFile(FFileMapping, FILE_MAP_READ, 0, 0, 0);
  if FMemory = nil then begin
    CloseHandle(FFileMapping);
    CloseHandle(FFileHandle);
    Exit;
  end;

  L := GetFileSize(FFileHandle, @H);
  FSize := H;
  FSize := (FSize shl 32) or L;
  //PInteger(@FSize)^ := GetFileSize(FileHandle, Pointer(Integer(@FSize)+4);
  FInitialized := True;
  Result := True;
end;

function TMapStream.Read(var Buffer; Count: Longint): Longint;
begin
  if (Count > 0) and FInitialized then begin
    Result := Size - Position;
    if (Result >= Count) then begin
      Result := Count;
      System.Move(Pointer(Integer(Memory) + Position)^, Buffer, Count);
      FPosition := Position + Count;
    end;
    //else raise EMMEndOfFile.Create(SEOFError);
  end
  else Result := 0;
end;

function TMapStream.Seek(Offset: Longint; Origin: Word): Longint;
begin
  case Origin of
    soFromBeginning: Position := Offset;
    soFromCurrent: Position := Position + Offset;
    soFromEnd: Position := Size + Offset;
  end;
  Result := Position;
end;

function TMapStream.Write(const Buffer; Count: Longint): Longint;
begin

end;

procedure TMapStream.SetPosition(Pos: Int64);
begin
  if (Pos <= Size) then
    FPosition := Pos;
  //else raise EMMEndOfFile.Create(SEOFError);
end;

procedure TMapStream.SetSize(NewSize: Int64);
begin

end;

end.

