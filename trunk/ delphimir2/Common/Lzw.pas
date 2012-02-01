unit Lzw;

interface

uses
  Windows, SysUtils, Classes;

const
  NOCODE = -1; // �ձ���
  LZWBITS = 8; // �ֶԴ���λ
  LZWBUFFER = $FFFF; // ���봦�������������뻺����������ʵ������ֵ�ܴﵽ�Ϻõ�Ч�ʣ�
  LZWMAXBITS = 12; // ���ı���λ�����Ӹ�ֵ�����ӱ������ڴ�ռ䣩
  LZWSTACKBUFFERSIZE = $FFFF; // ջ����������Ҫ��֤���㹻��
  LZWEXPORTBLOCKSIZE = $FFFF; // �����������
  LZWMAXCODES = 1 shl LZWMAXBITS; // �����루4096��
  LZWTABLESIZE = 1 shl (LZWBITS + LZWMAXBITS); // �����������2MB�ռ䣩

type
  TLZWEncode = class(TObject)
  private
    EncodeTable: array[0..LZWTABLESIZE - 1] of Word; // �����
    EncodePointer: array[0..LZWMAXCODES - 1] of LongWord; // ��������Ļ���
    ExportBlock: Pointer; // ��ű���������ָ�루��������ָ�룩
    ExportBlockPtr: array of Byte; // ��ָ��ָ�� ExportBlock �����ڷ�������
    InitBits: Integer; // ѹ�����ݵ���ʼλ��
    ClearCode: Integer; // �����
    EofCode: Integer; // ������
    PrefixCode: Integer; // ��ͷ��
    SuffixCode: Integer; // ��β��
    Encode: Integer; // ѹ������
    RunBits: Integer; // ��ǰ����λ
    MaxCodeSize: Integer; // ��ǰ����������
    FBegin: Boolean; // ��ʼ�����־
    FExportSize: Integer; // ������ݿ��С
    FExportIndex: Integer; // ������ݿ�����
    FExportTotalSize: Integer; // ��¼���������С
    ShiftBits: Integer; // ����λ��������ʱλ
    ShiftCode: Integer; // ����λ��������ʱ����
  protected
    procedure ExportData(AData: Integer); virtual; // ������ݣ��鷽����
  public
    function GetExportPointer: Pointer; // �������ָ��
    function GetExportSize: Integer; // ���������С
    procedure GetBegin; // �ÿ�ʼ�����־
    procedure GetEnd; // �ý��������־
    procedure Execute(Data: array of Byte; DataSize: Integer); virtual; // ִ�б�����̣��鷽����
    constructor Create;
    destructor Destroy; override;
  end;

  TLZWUnEncode = class(TObject)
  private
    InitBits: Integer; // ѹ�����ݵ���ʼλ��
    ClearCode: Integer; // �����
    EofCode: Integer; // ������
    PrefixCode: Integer; // ��ͷ��
    SuffixCode: Integer; // ��β��
    Encode: Integer; // ѹ������
    RunBits: Integer; // ��ǰ����λ
    MaxCodeSize: Integer; // ��ǰ����������
    ExportBlock: Pointer; // ��ű���������ָ�루��������ָ�룩
    ExportBlockPtr: array of Byte; // ��ָ��ָ�� ExportBlock �����ڷ�������
    StackIndex: Integer; // ջ����
    StackTable: array[0..LZWSTACKBUFFERSIZE - 1] of Byte; // ջ��
    PrefixTable: array[0..LZWMAXCODES - 1] of Word; // ��ͷ��
    SuffixTable: array[0..LZWMAXCODES - 1] of Byte; // ��β��
    FExportSize: Integer; // ������ݿ��С
    FExportIndex: Integer; // ������ݿ�����
    FExportTotalSize: Integer; // ��¼���������С
    ShiftBits: Integer; // ����λ��������ʱλ
    ShiftCode: Integer; // ����λ��������ʱ����
  protected
    procedure ExportData(AData: Integer); virtual; // ������ݣ��鷽����
  public
    function GetExportPointer: Pointer; // �������ָ��
    function GetExportSize: Integer; // ���������С
    procedure GetBegin; // ��ʼ���루��������ڴ�ռ䣩
    procedure GetEnd; // �������루�ͷ�����ڴ�ռ䣩
    procedure Execute(Data: array of Byte; DataSize: Integer); virtual; // ִ�н�����̣��鷽����
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TLZWEncode }

constructor TLZWEncode.Create;
begin
  InitBits := LZWBITS;
  ClearCode := 1 shl InitBits;
  EofCode := ClearCode + 1;
  Encode := EofCode + 1;
  RunBits := InitBits + 1;
  MaxCodeSize := 1 shl RunBits;
  FBegin := False;
  FExportSize := 0;
  FExportIndex := 0;
  FExportTotalSize := 0;
  ShiftBits := 0;
  ShiftCode := 0;
end;

destructor TLZWEncode.Destroy;
begin
  FreeMem(ExportBlock);
  inherited;
end;

procedure TLZWEncode.Execute(Data: array of Byte; DataSize: Integer);
var
  AIndex: Integer;
  ArrayIndex: Integer;
  Vi: Integer;
begin
  AIndex := 0;
  FExportIndex := 0;
  FExportTotalSize := LZWEXPORTBLOCKSIZE;
  { �����ļ����ֽڣ���ֵ����ͷ�� }
  if FBegin then
  begin
    FBegin := False;
    ExportData(ClearCode);
    PrefixCode := Data[AIndex];
    Inc(AIndex);
  end;
  { ������� }
  while AIndex < DataSize do
  begin
    { ȡ�����ݣ���ֵ����β�� }
    SuffixCode := Data[AIndex];
    Inc(AIndex);
    { �����ַ }
    ArrayIndex := (PrefixCode shl LZWBITS) + SuffixCode;
    { �޿ɱ����ֶԵ���� }
    if EncodeTable[ArrayIndex] = 0 then
    begin
      ExportData(PrefixCode); // �����ͷ
      { ��ǰ�������������ֵ�����������ʼ������ }
      if Encode = LZWMAXCODES then
      begin
        ExportData(ClearCode); // ��������
        Encode := EofCode + 1;
        RunBits := InitBits + 1;
        MaxCodeSize := 1 shl RunBits;
        { ֻ���ʼ����������ڴ��� }
        for Vi := Encode to LZWMAXCODES - 1 do
          EncodeTable[EncodePointer[Vi]] := 0;
      end
      else begin
        { ��ǰ������������������� }
        if Encode = MaxCodeSize then
        begin
          Inc(RunBits); // ��ǰ����λ����
          MaxCodeSize := 1 shl RunBits; // ��Ӧ����������
        end;
        EncodeTable[ArrayIndex] := Encode; // ��������
        EncodePointer[Encode] := ArrayIndex;
        Inc(Encode);
      end;
      PrefixCode := SuffixCode;
    end
    { �����ƥ������ }
    else begin
      PrefixCode := EncodeTable[ArrayIndex];
    end;
  end;
end;

procedure TLZWEncode.ExportData(AData: Integer);
{ ������� }
  procedure ExportProcedure;
  begin
    while ShiftBits >= LZWBITS do
    begin
      ExportBlockPtr[FExportIndex] := ShiftCode and $00FF;
      Inc(FExportIndex);
      if FExportIndex = FExportTotalSize then
      begin
        { ���·����ڴ���׵�ַ���ܸı� }
        ReAllocMem(ExportBlock, FExportIndex + LZWEXPORTBLOCKSIZE);
        Pointer(ExportBlockPtr) := ExportBlock;
        Inc(FExportTotalSize, LZWEXPORTBLOCKSIZE);
      end;
      ShiftCode := ShiftCode shr LZWBITS;
      Dec(ShiftBits, LZWBITS);
    end;
  end;
begin
  { ���λ���Ǵ��� LZWBITS �� }
  ShiftCode := AData shl ShiftBits + ShiftCode;
  Inc(ShiftBits, RunBits);
  ExportProcedure;
end;

function TLZWEncode.GetExportPointer: Pointer;
begin
  Result := ExportBlock;
end;

function TLZWEncode.GetExportSize: Integer;
begin
  FExportSize := FExportIndex;
  Result := FExportSize;
end;

procedure TLZWEncode.GetBegin;
begin
  FBegin := True;
  { �п����������������뻺�棬�����������ʱ�����·����ڴ� }
  ExportBlock := AllocMem(LZWEXPORTBLOCKSIZE);
  Pointer(ExportBlockPtr) := ExportBlock;
end;

procedure TLZWEncode.GetEnd;
begin
  ExportData(PrefixCode);
  ExportData(EofCode);
  { ���Ĵ����ǿ�����û��û�����λ }
  while ShiftBits > 0 do
  begin
    ExportBlockPtr[FExportIndex] := ShiftCode and $00FF;
    Inc(FExportIndex);
    if FExportIndex = FExportTotalSize then
    begin
      ReAllocMem(ExportBlock, FExportIndex + LZWEXPORTBLOCKSIZE);
      Pointer(ExportBlockPtr) := ExportBlock;
      Inc(FExportTotalSize, LZWEXPORTBLOCKSIZE);
    end;
    ShiftCode := ShiftCode shr LZWBITS;
    Dec(ShiftBits, LZWBITS);
  end;
end;

{ TLZWUnencode }

constructor TLZWUnEncode.Create;
begin
  InitBits := LZWBITS;
  ClearCode := 1 shl InitBits;
  EofCode := ClearCode + 1;
  Encode := EofCode + 1;
  RunBits := InitBits + 1;
  MaxCodeSize := 1 shl RunBits;
  ShiftBits := 0;
  ShiftCode := 0;
  FExportSize := 0;
  FExportIndex := 0;
  FExportTotalSize := 0;
end;

destructor TLZWUnEncode.Destroy;
begin
  inherited;
end;

procedure TLZWUnEncode.Execute(Data: array of Byte; DataSize: Integer);
const
  MaskCode: array[0..LZWMAXBITS] of Word = (
    $0000, $0001, $0003, $0007,
    $000F, $001F, $003F, $007F,
    $00FF, $01FF, $03FF, $07FF,
    $0FFF);
var
  AIndex: Integer;
  CurrentCode, ACode: Integer;
begin
  AIndex := 0;
  FExportIndex := 0;
  FExportTotalSize := LZWSTACKBUFFERSIZE;
  { ������� }
  while AIndex < DataSize do
  begin
    { ȡ������ }
    while (ShiftBits < RunBits) and (AIndex < DataSize) do
    begin
      ShiftCode := Data[AIndex] shl ShiftBits + ShiftCode;
      Inc(AIndex);
      Inc(ShiftBits, LZWBITS);
    end;

    if AIndex >= DataSize then
      Exit;
    CurrentCode := ShiftCode and MaskCode[RunBits];
    ShiftCode := ShiftCode shr RunBits;
    Dec(ShiftBits, RunBits);
    { �������������˳� }
    if CurrentCode = EofCode then
      Exit;
    { ������������ʼ�� }
    if CurrentCode = ClearCode then
    begin
      RunBits := InitBits + 1;
      Encode := EofCode + 1;
      MaxCodeSize := 1 shl RunBits;
      PrefixCode := NOCODE;
      SuffixCode := NOCODE;
    end
    else
    begin
      ACode := CurrentCode;
      StackIndex := 0;
      { ��ǰ���������뵱ǰ����ֵ��ȵ���� }
      if ACode = Encode then
      begin
        StackTable[StackIndex] := SuffixCode;
        Inc(StackIndex);
        ACode := PrefixCode;
      end;
      { ��ǰ������ڵ�ǰ����ֵ��������ݹ�ȡֵ }
      while ACode > EofCode do
      begin
        StackTable[StackIndex] := SuffixTable[ACode];
        Inc(StackIndex);
        ACode := PrefixTable[ACode];
      end;
      SuffixCode := ACode;
      { ������� }
      ExportData(ACode);
      while StackIndex > 0 do
      begin
        Dec(StackIndex);
        ExportData(StackTable[StackIndex]);
      end;
      { �����ֵ� }
      if (Encode < LZWMAXCODES) and (PrefixCode <> NOCODE) then
      begin
        PrefixTable[Encode] := PrefixCode;
        SuffixTable[Encode] := SuffixCode;
        Inc(Encode);
        if (Encode >= MaxCodeSize) and (RunBits < LZWMAXBITS) then
        begin
          MaxCodeSize := MaxCodeSize shl 1;
          Inc(RunBits);
        end;
      end;
      PrefixCode := CurrentCode;
    end;
  end;
end;

procedure TLZWUnEncode.ExportData(AData: Integer);
begin
  ExportBlockPtr[FExportIndex] := AData;
  Inc(FExportIndex);
  if FExportIndex = FExportTotalSize then
  begin
    ReAllocMem(ExportBlock, FExportIndex + LZWSTACKBUFFERSIZE);
    Pointer(ExportBlockPtr) := ExportBlock;
    Inc(FExportTotalSize, LZWSTACKBUFFERSIZE);
  end;
end;

procedure TLZWUnEncode.GetBegin;
begin
  ExportBlock := AllocMem(LZWSTACKBUFFERSIZE);
  Pointer(ExportBlockPtr) := ExportBlock;
end;

procedure TLZWUnEncode.GetEnd;
begin
  FreeMem(ExportBlock);
end;

function TLZWUnEncode.GetExportPointer: Pointer;
begin
  Result := ExportBlock;
end;

function TLZWUnEncode.GetExportSize: Integer;
begin
  FExportSize := FExportIndex;
  Result := FExportSize;
end;

end.

