
{*******************************************************}
{                                                       }
{       MiTeC System Information Component              }
{               CPU Detection Part                      }
{           version 5.6 for Delphi 3,4,5                }
{                                                       }
{       Copyright ? 1997,2001 Michal Mutl               }
{                                                       }
{*******************************************************}

{$INCLUDE MITEC_DEF.INC}

unit MSI_CPU;
//{$mode delphi}
interface

uses
  SysUtils, Windows, Classes;

type
TULargeInteger  = record
                   case longint of
                     0 : ( LowPart  : DWORD;
                           HighPart : LONGINT );
                     1 : ( QuadPart : LONGLONG );
                 end;

  TCPUIDResult = packed record
    EAX: Cardinal;
    EBX: Cardinal;
    ECX: Cardinal;
    EDX: Cardinal;
  end;

  TIntelCache = record
    L2Cache: Cardinal;
    CacheDescriptors: array [0..15] of Byte;
  end;

  TAMDCache = record
    DataTLB: array [0..1] of Byte;
    InstructionTLB: array [0..1] of Byte;
    L1DataCache: array [0..3] of Byte;
    L1ICache: array [0..3] of Byte;
  end;

  TCyrixCache = record
    L1CacheInfo: array [0..3] of Byte;
    TLBInfo: array [0..3] of Byte;
  end;

  TFreqInfo = record
    RawFreq: Cardinal;
    NormFreq: Cardinal;
    InCycles: Cardinal;
    ExTicks: Cardinal;
  end;

const
{ CPUID EFLAGS Id bit }
  CPUIDID_BIT	=	$200000;

{ CPUID execution levels }
  CPUID_MAXLEVEL        : DWORD = $0;
  CPUID_VENDORSIGNATURE : DWORD = $0;
  CPUID_CPUSIGNATURE    : DWORD = $1;
  CPUID_CPUFEATURESET   : DWORD = $1;
  CPUID_CACHETLB        : DWORD = $2;
  CPUID_CPUSERIALNUMBER : DWORD = $3;
  CPUID_MAXLEVELEX      : DWORD = $80000000;
  CPUID_CPUSIGNATUREEX  : DWORD = $80000001;
  CPUID_CPUMARKETNAME1  : DWORD = $80000002;
  CPUID_CPUMARKETNAME2  : DWORD = $80000003;
  CPUID_CPUMARKETNAME3  : DWORD = $80000004;
  CPUID_LEVEL1CACHETLB  : DWORD = $80000005;
  CPUID_LEVEL2CACHETLB  : DWORD = $80000006;

{ CPU vendors }
  VENDOR_UNKNOWN    = 0;
  VENDOR_INTEL      = 1;
  VENDOR_AMD        = 2;
  VENDOR_CYRIX      = 3;
  VENDOR_IDT        = 4;
  VENDOR_NEXGEN     = 5;
  VENDOR_UMC        = 6;
  VENDOR_RISE       = 7;

{ Standard feature set flags }
  SFS_FPU    = 0;
  SFS_VME    = 1;
  SFS_DE     = 2;
  SFS_PSE    = 3;
  SFS_TSC    = 4;
  SFS_MSR    = 5;
  SFS_PAE    = 6;
  SFS_MCE    = 7;
  SFS_CX8    = 8;
  SFS_APIC   = 9;
  SFS_SEP    = 11;
  SFS_MTRR   = 12;
  SFS_PGE    = 13;
  SFS_MCA    = 14;
  SFS_CMOV   = 15;
  SFS_PAT    = 16;
  SFS_PSE36  = 17;
  SFS_SERIAL = 18;
  SFS_MMX    = 23;
  SFS_XSR    = 24;
  SFS_SIMD   = 25;

{ Extended feature set flags (duplicates removed) }
  EFS_EXMMXA  = 22; { AMD Specific }
  EFS_EXMMXC  = 24; { Cyrix Specific }
  EFS_3DNOW   = 31;
  EFS_EX3DNOW = 30;

type
  TCPUFeatures = class(TPersistent)
  private
    FSEP: boolean;
    FMTRR: boolean;
    FMSR: boolean;
    FPSE: boolean;
    FTSC: boolean;
    FMCE: boolean;
    FMMX: boolean;
    FPAT: boolean;
    FPAE: boolean;
    FXSR: boolean;
    FVME: boolean;
    FPGE: boolean;
    FCMOV: boolean;
    FFPU: boolean;
    FCX8: boolean;
    FSIMD: Boolean;
    FMCA: boolean;
    FAPIC: boolean;
    FDE: boolean;
    FPSE36: boolean;
    FSERIAL: Boolean;
    F3DNOW: boolean;
    FEX3DNOW: Boolean;
    FEXMMX: Boolean;
  public
    CPUID: TCPUIDResult;
    procedure GetInfo;
    procedure Report(var sl: TStringList);
  published
    property _3DNOW :Boolean read F3DNOW write F3DNOW stored False;
    property EX_3DNOW :Boolean read FEX3DNOW write FEX3DNOW stored False;
    property EX_MMX :Boolean read FEXMMX write FEXMMX stored False;
    property SIMD :Boolean read FSIMD write FSIMD stored False;
    property SERIAL :Boolean read FSERIAL write FSERIAL stored False;
    property XSR :Boolean read FXSR write FXSR stored false;
    property MMX :Boolean read FMMX write FMMX stored false;
    property PSE36 :Boolean read FPSE36 write FPSE36 stored false;
    property PAT :Boolean read FPAT write FPAT stored false;
    property CMOV :Boolean read FCMOV write FCMOV stored false;
    property MCA :Boolean read FMCA write FMCA stored false;
    property PGE :Boolean read FPGE write FPGE stored false;
    property MTRR :Boolean read FMTRR write FMTRR stored false;
    property SEP :Boolean read FSEP write FSEP stored false;
    property APIC :Boolean read FAPIC write FAPIC stored false;
    property CX8 :Boolean read FCX8 write FCX8 stored false;
    property MCE :Boolean read FMCE write FMCE stored false;
    property PAE :Boolean read FPAE write FPAE stored false;
    property MSR :Boolean read FMSR write FMSR stored false;
    property TSC :Boolean read FTSC write FTSC stored false;
    property PSE :Boolean read FPSE write FPSE stored false;
    property DE :Boolean read FDE write FDE stored false;
    property VME :Boolean read FVME write FVME stored false;
    property FPU :Boolean read FFPU write FFPU stored false;
  end;

  TCPUCache = class(TPersistent)
  private
    FLevel2: LongInt;
    FLevel1: LongInt;
    FLevel1Data: LongInt;
    FLevel1Code: LongInt;
  public
    IntelCache: TIntelCache;
    AMDCache: TAMDCache;
    CyrixCache: TCyrixCache;
    procedure GetInfo(AVendor: DWORD);
    procedure Report(var sl :TStringList);
  published
    property L1Data: LongInt read FLevel1Data write FLevel1Data stored FALSE;
    property L1Code: LongInt read FLevel1Code write FLevel1Code stored FALSE;
    property Level1: LongInt read FLevel1 write FLevel1 stored FALSE;
    property Level2: LongInt read FLevel2 write FLevel2 stored FALSE;
  end;

  TCPU = class(TPersistent)
  private
    FFreq :integer;
    FFeatures: TCPUFeatures;
    FVendorReg: string;
    FVendorIDReg: string;
    FCount: integer;
    FFamily: integer;
    FStepping: integer;
    FModel: integer;
    FVendorID: string;
    FVendor: string;
    FTyp: DWORD;
    FLevel: DWORD;
    FCache: TCPUCache;
    FSerial: string;
    FDIV: Boolean;
    FVendorCPUID: string;
    FVendorIDCPUID: string;
    FBrand: DWORD;
    FCPUVendor: DWORD;
    FCodeName: string;
    FTrans: integer;
    FVendorEx: string;
  public
    constructor Create;
    destructor Destroy; override;
    procedure GetInfo;
    procedure Report(var sl :TStringList);

    property Vendor_Reg :string read FVendorReg write FVendorReg stored false;
    property VendorID_Reg :string read FVendorIDReg write FVendorIDReg stored False;
    property Vendor_CPUID :string read FVendorCPUID write FVendorCPUID stored false;
    property VendorID_CPUID :string read FVendorIDCPUID write FVendorIDCPUID stored False;
    property Brand: DWORD read FBrand write FBrand stored False;
    property Typ: DWORD read FTyp write FTyp stored False;
    property Level: DWORD read FLevel write FLevel stored False;
    property CPUVendor: DWORD read FCPUVendor write FCPUVendor stored False;
    property Vendor :string read FVendor write FVendor stored False;
  published
    property Count :integer read FCount write FCount stored false;
    property VendorEx :string read FVendorEx write FVendorEx stored False;
    property VendorID :string read FVendorID write FVendorID stored false;
    property Frequency :integer read FFreq write FFreq stored false;
    property Family :integer read FFamily write FFamily stored false;
    property Stepping :integer read FStepping write FStepping stored false;
    property Model :integer read FModel write FModel stored false;
    property Features :TCPUFeatures read FFeatures write FFeatures;
    property Cache: TCPUCache read FCache write FCache;
    property SerialNumber: string read FSerial write FSerial;
    property FDIVBug: Boolean read FDIV write FDIV;
    property CodeName: string read FCodeName write FCodeName;
    property Transistors: integer read FTrans write FTrans;
  end;

var
  CPUID_Level: DWORD;

implementation

uses
  Registry, INIFiles, MiTeC_Routines;

const
  CPUVendorIDs :array[VENDOR_INTEL..VENDOR_RISE] of string =
                                        ('GenuineIntel',
                                         'AuthenticAMD',
                                         'CyrixInstead',
                                         'CentaurHauls',
                                         'NexGenDriven',
                                         'UMC UMC UMC',
                                         'RiseRiseRise'
                                         );

  CPUVendorsEx :array[VENDOR_INTEL..VENDOR_RISE] of string =
                                      ('Intel Corporation',
                                       'Advanced Micro Devices',
                                       'Cyrix Corporation',
                                       'IDT/Centaur',
                                       'NexGen Inc.',
                                       'United Microelectronics Corp',
                                       'Rise Technology');

  CPUVendors :array[VENDOR_INTEL..VENDOR_RISE] of string =
                                      ('Intel',
                                       'AMD',
                                       'Cyrix',
                                       'IDT',
                                       'NexGen',
                                       'UMC',
                                       'Rise');


function GetCPUVendorID(AVendor, AFamily, AModel, ABrand, ATyp, AL2Cache, AFreq: integer;
                        var Codename: string;
                        var TranCount: integer) :string;
begin
  case AVendor of
    VENDOR_INTEL: begin
      case AFamily of
        4: case AModel of
             0,1 :begin
               Result:='i80486DX';
               CodeName:='P4';
               TranCount:=1250000;
             end;
             2 :begin
               Result:='i80486SX';
               CodeName:='P23';
               TranCount:=900000;
             end;
             3 :begin
               Result:='i80486DX2';
               CodeName:='P24';
               TranCount:=1250000;
             end;
             4 :begin
               Result:='i80486SL';
               CodeName:='P23';
               TranCount:=900000;
             end;
             5 :begin
               Result:='i80486SX2';
               CodeName:='P23';
               TranCount:=900000;
             end;
             7 :begin
               Result:='i80486DX2WB';
               CodeName:='P24';
               TranCount:=1250000;
             end;
             8 :begin
               Result:='i80486DX4';
               CodeName:='P24C';
               TranCount:=1600000;
             end;
	     9 :begin
               Result:='i80486DX4WB';
               CodeName:='P24C';
               TranCount:=1600000;
             end;
           end;
        5: case AModel of
             0 :begin
               Result:='Pentium';
               CodeName:='P5 (0,80µm)';
               TranCount:=3100000;
             end;
             1,2 :begin
               Result:='Pentium';
               CodeName:='P54C (0,50µm)';
               TranCount:=3100000;
             end;
             3 :begin
               Result:='Pentium';
               CodeName:='P24T';
               TranCount:=0;
             end;
             4 :begin
               Result:='Pentium MMX';
               CodeName:='P55C (0,28µm)';
               TranCount:=4500000;
             end;
             5 :begin
               Result:='DX4';
               CodeName:='';
               TranCount:=0;
             end;
             6 :begin
               Result:='Pentium';
               CodeName:='P5';
               TranCount:=0;
             end;
             7 :begin
               Result:='Pentium';
               CodeName:='P54C (0,35µm)';
               TranCount:=3100000;
             end;
             8 :begin
               Result:='Pentium MMX (mobile)';
               CodeName:='Tillamook (0,25µm)';
               TranCount:=4500000;
             end;
             else begin
               Result:='Pentium';
               CodeName:='';
               TranCount:=0;
             end;
           end;
        6: case AModel of
             0 :begin
               Result:='Pentium Pro';
               CodeName:='P6 (0.50 µm)';
               TranCount:=5500000;
             end;
             1 :begin
               Result:='Pentium Pro';
               CodeName:='P6 (0.35 µm)';
               TranCount:=5500000;
             end;
             3 :begin
                  Result:='Pentium II';
                  if AL2Cache=333 then
                    CodeName:='P6T (0.25 µm)'
                  else
                    CodeName:='Klamath (0.35 µm)';
                  TranCount:=7500000;
                  if ATyp=1 then
                    Result:=Result+' OverDrive';
                end;
             4 :begin
               Result:='Pentium II';
               Codename:='P55CT (P54 OverDrive)';
               TranCount:=3100000;
             end;
             5 :if (AL2Cache<=512) then begin
                  if (AL2Cache=0) then begin
                    Result:='Celeron';
                    Codename:='Covington (0,25µm)';
                    TranCount:=7500000;
                  end else begin
                    Result:='Pentium II';
                    Codename:='Deschutes (0,25µm)';
                    TranCount:=7500000;
                  end;
                end else begin
                  Result:='Pentium II Xeon';
                  Codename:='Deschutes (0.25 µm)';
                  TranCount:=7500000;
                end;
             6: if AL2Cache<256 then begin
                  Result:='Celeron A';
                  Codename:='Mendocino (0.25 µm)';
                  TranCount:=19000000;
                end else begin
                  Result:='Pentium II PE (mobile)';
                  Codename:='Dixon (0.25 µm)';
                  TranCount:=27400000;
                end;
             7: if AL2Cache<=512 then begin
                  Result:='Pentium III';
                  Codename:='Katmai (0.25 µm)';
                  TranCount:=9500000;
                end else begin
                  Result:='Pentium III Xeon';
                  Codename:='Tanner (0.25 µm)';
                  TranCount:=9500000;
                end;
             8: begin
               Result:='Pentium III E';
               Codename:='Coppermine (0.18 µm)';
               TranCount:=28100000;
              end;
             else begin
               Result:='Pentium II';
               Codename:='';
               TranCount:=0;
             end;
           end;
        7,8: case ABrand of
             1: begin
               Result:='Celeron';
               Codename:='';
               TranCount:=0;
             end;
             3: begin
               Result:='Pentium III Xeon';
               Codename:='';
               TranCount:=0;
             end;
             4: begin
               Result:='Pentium IV';
               Codename:='';
               TranCount:=0;
             end;
             else begin
               if (AL2Cache<1024) then
                  Result:='Pentium III'
                else
                  Result:='Pentium III Xeon';
               Codename:='';
               TranCount:=0;
             end;
        end;
        $A: begin
          Result:='Pentium III Xeon';
          Codename:='';
          TranCount:=0;
        end;
        $F: begin
          Result:='Pentium IV';
          Codename:='';
          TranCount:=0;
        end;

      end;
    end;

    VENDOR_AMD: begin
      case AFamily of
        4: case AModel of
            0:begin
              Result:='Am486DX';
              Codename:='P4';
              TranCount:=1250000;
            end;
            3,7 :begin
              Result:='Am486DX2';
              Codename:='P24';
              TranCount:=1250000;
            end;
            8,9 :begin
              Result:='Am486DX4';
              Codename:='P24C';
              TranCount:=1250000;
            end;
            14,15 :begin
              Result:='Am5x86';
              Codename:='X5';
              TranCount:=1600000;
            end;
           end;
        5: case AModel of
             0: begin
               Result:='K5';
               Codename:='SSA5 (0.50-0.35 µm)';
               TranCount:=4300000;
             end;
             1,2,3: begin
               Result:='K5-5k86 (PR120, PR133)';
               Codename:='5k86 (0.35 µm)';
               TranCount:=4300000;
             end;
             6: begin
               Result:='K6';
               Codename:='K6 (0.30 µm)';
               TranCount:=8800000;
              end;
             7: begin
               Result:='K6';
               Codename:='Little Foot (0.25 µm)';
               TranCount:=8800000;
             end;
             8: begin
               Result:='K6-II';
               Codename:='Chomper (0.25 µm)';
               TranCount:=9300000;
             end;
             9: begin
               Result:='K6-III';
               Codename:='Slarptooth (0.25 µm)';
               TranCount:=21300000;
             end;
             $D: begin
               Result:='K6-II+/K6-III+';
               Codename:='';
               TranCount:=0;
             end;
           end;
        6: begin
             Result:='K7';
             Codename:='Athlon (0.25-0.18 µm)';
             TranCount:=22000000;
           end;
      end;
    end;

    VENDOR_CYRIX: begin
      case AFamily of
        4: case AModel of
             0: begin
               if AFreq in [20,66] then begin
                 Result:='Cx486SLC/DLC';
                 Codename:='M0.5';
                 TranCount:=600000;
               end;
               if AFreq in [33,50] then begin
                 Result:='Cx486S';
                 Codename:='M0.6';
                 TranCount:=600000;
               end;
               if AFreq>66 then begin
                 Result:='Cx486DX/DX2/DX4';
                 Codename:='M0.7';
                 TranCount:=1100000;
               end;
             end;
             4: begin
               Result:='Media GX';
               Codename:='Gx86';
               TranCount:=24000000;
             end;
             9: begin
               Result:='5x86';
               Codename:='M0.9 or M1sc (0.65 µm)';
               TranCount:=20000000;
             end;
           end;
        5: case AModel of
             2 :begin
               Result:='6x86 and 6x86L';
               Codename:='M1 (0.65 µm) and M1L (0.35 µm)';
               TranCount:=30000000;
             end;
             4 :begin
               Result:='MediaGXm';
               Codename:='GXm';
               TranCount:=24000000;
             end;
           end;
        6: case AModel of
             0: if AFreq<225 then begin
                  Result:='6x86MX (PR166-266)';
                  Codename:='M2 (0.35 µm)';
                  TranCount:=65000000;
                end else begin
                  Result:='M-II (PR300-433)';
                  Codename:='M2 (0.35-0.25 µm)';
                  TranCount:=65000000;
                end;
             5: begin
               Result:='VIA Cyrix III';
               Codename:='';
               TranCount:=0;
             end;
           end;
      end;
    end;

    VENDOR_IDT: begin
      case AFamily of
        5: case AModel of
             4: begin
               Result:='WinChip';
               Codename:='C6 (0.35 µm)';
               TranCount:=54000000;
             end;
             8: begin
               Result:='WinChip 2x';
               Codename:='W2x (0.35-0.25 µm)';
               TranCount:=59000000;
             end;
             9: begin
               Result:='WinChip 3';
               Codename:='W3 (0.25 µm)';
               TranCount:=90000000;
             end;
           end;
      end;
    end;

    VENDOR_NEXGEN: begin
      case AFamily of
        5: case AModel of
             0: begin
               Result:='Nx586';
               Codename:='Nx5x86 (0.50-0.44 µm)';
               TranCount:=35000000;
             end;
             6: begin
               Result:='Nx686';
               Codename:='HA (0,50µm)';
               TranCount:=60000000;
             end;
           end;
      end;
    end;

    VENDOR_UMC: begin
      case AFamily of
        4: begin
          Codename:='U5D and U5S';
          TranCount:=12000000;
          case AModel of
            1: Result:='U5D';
            2: Result:='U5S';
            3: Result:='U486DX2';
            4: Result:='U486SX2';
          end;
        end;
      end;
    end;

    VENDOR_RISE: begin
      case AFamily of
        4: case AModel of
             0,2: begin
               Result:='mP6';
               Codename:='mP6 (0.25-0.18 µm)';
               TranCount:=36000000;
             end;
           end;
      end;
    end;
  end;
end;

function GetCPUIDSupport: Boolean;
asm
    PUSHFD
    POP     EAX
    MOV     EDX, EAX
    XOR     EAX, CPUIDID_BIT
    PUSH    EAX
    POPFD
    PUSHFD
    POP     EAX
    XOR     EAX, EDX
    JZ      @exit
    MOV     AL, TRUE
  @exit:
end;

function ExecuteCPUID: TCPUIDResult; assembler;
asm
    PUSH    EBX
    PUSH    EDI
    MOV     EDI, EAX
    MOV     EAX, CPUID_LEVEL
    DW      $A20F
    STOSD
    MOV     EAX, EBX
    STOSD
    MOV     EAX, ECX
    STOSD
    MOV     EAX, EDX
    STOSD
    POP     EDI
    POP     EBX
end;

function ExecuteIntelCache: TIntelCache;
var
  Cache: TIntelCache;
  i: DWORD;
  TimesToExecute, CurrentLoop: Byte;
begin
  asm
    PUSH    EAX
    PUSH    EBP
    PUSH    EBX
    PUSH    ECX
    PUSH    EDI
    PUSH    EDX
    PUSH    ESI

    MOV     CurrentLoop, 0
    PUSH    ECX
  @@RepeatCacheQuery:
    POP     ECX
    MOV     EAX, CPUID_CACHETLB
    DB      0FH
    DB      0A2H
    INC     CurrentLoop
    CMP     CurrentLoop, 1
    JNE     @@DoneCacheQuery
    MOV     TimesToExecute, AL
    CMP     AL, 0
    JE      @@Done
  @@DoneCacheQuery:
    PUSH    ECX
    MOV     CL, CurrentLoop
    SUB     CL, TimesToExecute
    JNZ     @@RepeatCacheQuery
    POP     ECX
    MOV     DWORD PTR [Cache.CacheDescriptors], EAX
    MOV     DWORD PTR [Cache.CacheDescriptors + 4], EBX
    MOV     DWORD PTR [Cache.CacheDescriptors + 8], ECX
    MOV     DWORD PTR [Cache.CacheDescriptors + 12], EDX
    JMP     @@Done
   @@Done:

    POP     ESI
    POP     EDX
    POP     EDI
    POP     ECX
    POP     EBX
    POP     EBP
    POP     EAX
  end;
  Cache.L2Cache:=0;
  for i:=1 to 15 do
   case Cache.CacheDescriptors[i] of
     $40: Cache.L2Cache:=0;
     $41: Cache.L2Cache:=128;
     $42,$82: Cache.L2Cache:=256;
     $43,$83: Cache.L2Cache:=512;
     $44,$84: Cache.L2Cache:=1024;
     $45,$85: Cache.L2Cache:=2048;
   end;
  Result:=Cache;
end;

function ExecuteAMDCache: TAMDCache;
var
  Cache: TAMDCache;
begin
  asm
    PUSH    EAX
    PUSH    EBP
    PUSH    EBX
    PUSH    ECX
    PUSH    EDI
    PUSH    EDX
    PUSH    ESI

    MOV     EAX, CPUID_LEVEL1CACHETLB
    DB      0Fh
    DB      0A2h
    MOV     WORD PTR [Cache.InstructionTLB], BX
    SHR     EBX, 16
    MOV     WORD PTR [Cache.DataTLB], BX
    MOV     DWORD PTR [Cache.L1DataCache], ECX
    MOV     DWORD PTR [Cache.L1ICache], EDX

    POP     ESI
    POP     EDX
    POP     EDI
    POP     ECX
    POP     EBX
    POP     EBP
    POP     EAX
  end;
  Result:=Cache;
end;

function ExecuteCyrixCache: TCyrixCache;
var
  Cache: TCyrixCache;
begin
  asm
    PUSH    EAX
    PUSH    EBP
    PUSH    EBX
    PUSH    ECX
    PUSH    EDI
    PUSH    EDX
    PUSH    ESI

    MOV     EAX, CPUID_LEVEL1CACHETLB
    DB      0Fh
    DB      0A2h
    MOV     DWORD PTR [Cache.TLBInfo], EBX
    MOV     DWORD PTR [Cache.L1CacheInfo], ECX

    POP     ESI
    POP     EDX
    POP     EDI
    POP     ECX
    POP     EBX
    POP     EBP
    POP     EAX
  end;
  Result:=Cache;
end;

function GetCPUSerialNumber: String;

  function SplitToNibble(ANumber: String): String;
  begin
    Result:=Copy(ANumber,0,4)+'-'+Copy(ANumber,5,4);
  end;

var
  SerialNumber: TCPUIDResult;
begin
  Result:='';
  CPUID_Level:=CPUID_CPUSIGNATURE;
  SerialNumber:=ExecuteCPUID;
  Result:=SplitToNibble(IntToHex(SerialNumber.EAX,8))+'-';
  CPUID_Level:=CPUID_CPUSIGNATURE;
  SerialNumber:=ExecuteCPUID;
  Result:=Result+SplitToNibble(IntToHex(SerialNumber.EDX,8))+'-';
  Result:=Result+SplitToNibble(IntToHex(SerialNumber.ECX,8));
end;

function RoundFrequency(const Frequency: Integer): Integer;
const
  NF: array [0..8] of Integer = (0, 20, 33, 50, 60, 66, 80, 90, 100);
var
  Freq, RF: Integer;
  i: Byte;
  Hi, Lo: Byte;
begin
  RF:=0;
  Freq:=Frequency mod 100;
  for i:=0 to 8 do begin
    if Freq<NF[i] then begin
      Hi:=i;
      Lo:=i-1;
      if (NF[Hi]-Freq)>(Freq-NF[Lo]) then
        RF:=NF[Lo]-Freq
      else
        RF:=NF[Hi]-Freq;
      Break;
    end;
  end;
  Result:=Frequency+RF;
end;

function GetCPUSpeed: TFreqInfo;
var
(*  {$IFNDEF D4PLUS}
  T0, T1: TLargeInteger;
  CountFreq: TLargeInteger;
  {$ELSE}*)
  T0, T1: TULargeInteger;
  CountFreq: TULargeInteger;
(*  {$ENDIF}*)
  CpuSpeed: TFreqInfo;
  Freq, Freq2, Freq3, Total: Integer;
  TotalCycles, Cycles: Cardinal;
  Stamp0, Stamp1: Cardinal;
  TotalTicks, Ticks: Cardinal;
  Tries, IPriority: Integer;
  hThread: THandle;
begin
  Freq:=0;
  Freq2:=0;
  Freq3:=0;
  Tries:=0;
  TotalCycles:=0;
  TotalTicks:=0;
  Total:=0;

  hThread:=GetCurrentThread;
(*  {$IFNDEF D4PLUS}
  if not QueryPerformanceFrequency(CountFreq) then
  {$ELSE}*)
  if not QueryPerformanceFrequency(Int64(CountFreq)) then
(*  {$ENDIF}*)
  begin
    Result:=CpuSpeed;
  end else begin
    while ((Tries<3) or ((Tries<20) and ((Abs(3*Freq-Total)>3) or
          (Abs(3*Freq2-Total)>3) or (Abs(3*Freq3-Total)>3)))) do begin
      Inc(Tries);
      Freq3:=Freq2;
      Freq2:=Freq;
(*      {$IFNDEF D4PLUS}
      QueryPerformanceCounter(T0);
      {$ELSE}*)
      QueryPerformanceCounter(Int64(T0));
(*      {$ENDIF}*)
      T1.LowPart:=T0.LowPart;
      T1.HighPart:=T0.HighPart;

      iPriority:=GetThreadPriority(hThread);
      if iPriority<>THREAD_PRIORITY_ERROR_RETURN then
        SetThreadPriority(hThread, THREAD_PRIORITY_TIME_CRITICAL);
      while (T1.LowPart-T0.LowPart)<50 do begin
(*        {$IFNDEF D4PLUS}
        QueryPerformanceCounter(T1);
        {$ELSE}*)
        QueryPerformanceCounter(Int64(T1));
(*        {$ENDIF}*)
        asm
          PUSH    EAX
          PUSH    EDX
          DB      0Fh             // Read Time
          DB      31h             // Stamp Counter
          MOV     Stamp0, EAX
          POP     EDX
          POP     EAX
        end;
      end;
      T0.LowPart:=T1.LowPart;
      T0.HighPart:=T1.HighPart;

      while (T1.LowPart-T0.LowPart)<1000 do begin
(*        {$IFNDEF D4PLUS}
        QueryPerformanceCounter(T1);
        {$ELSE}*)
        QueryPerformanceCounter(Int64(T1));
(*        {$ENDIF}*)
        asm
          PUSH    EAX
          PUSH    EDX
          DB      0Fh             // Read Time
          DB      31h             // Stamp Counter
          MOV     Stamp1, EAX
          POP     EDX
          POP     EAX
        end;
      end;

      if iPriority<>THREAD_PRIORITY_ERROR_RETURN then
        SetThreadPriority(hThread, iPriority);

      Cycles:=Stamp1-Stamp0;
      Ticks:=T1.LowPart-T0.LowPart;
      Ticks:=Ticks*100000;
      Ticks:=Round(Ticks/(CountFreq.LowPart/10));
      TotalTicks:=TotalTicks+Ticks;
      TotalCycles:=TotalCycles+Cycles;

      Freq:=Round(Cycles/Ticks);

      Total:=Freq+Freq2+Freq3;
    end;
    Freq3:=Round((TotalCycles*10)/TotalTicks);
    Freq2:=Round((TotalCycles*100)/TotalTicks);

    if Freq2-(Freq3*10)>=6 then
      Inc(Freq3);

    CpuSpeed.RawFreq:=Round(TotalCycles/TotalTicks);
    CpuSpeed.NormFreq:=CpuSpeed.RawFreq;

    Freq:=CpuSpeed.RawFreq*10;
    if (Freq3-Freq)>=6 then
      Inc(CpuSpeed.NormFreq);

    CpuSpeed.ExTicks:=TotalTicks;
    CpuSpeed.InCycles:=TotalCycles;

    CpuSpeed.NormFreq:=RoundFrequency(CpuSpeed.NormFreq);
    Result:=CpuSpeed;
  end;
end;

function GetVendor: string;
var
  CPUName: array [0..11] of Char;
begin
  asm
        PUSH    EAX
        PUSH    EBP
        PUSH    EBX
        PUSH    ECX
        PUSH    EDI
        PUSH    EDX
        PUSH    ESI

        MOV     EAX, CPUID_VENDORSIGNATURE
        DB      0FH
        DB      0A2H

        MOV     DWORD PTR [CPUName], EBX
        MOV     DWORD PTR [CPUName + 4], EDX
        MOV     DWORD PTR [CPUName + 8], ECX

        POP     ESI
        POP     EDX
        POP     EDI
        POP     ECX
        POP     EBX
        POP     EBP
        POP     EAX

  end;
  Result:=CPUName;
end;

function GetVendorID: string;
var
  CPUName: array [0..47] of Char;
begin
  asm
        PUSH    EAX
        PUSH    EBP
        PUSH    EBX
        PUSH    ECX
        PUSH    EDI
        PUSH    EDX
        PUSH    ESI

        MOV     EAX, CPUID_CPUMARKETNAME1
        DW      $A20F

        MOV     DWORD PTR [CPUName], EAX
        MOV     DWORD PTR [CPUName + 4], EBX
        MOV     DWORD PTR [CPUName + 8], ECX
        MOV     DWORD PTR [CPUName + 12], EDX

        MOV     EAX, CPUID_CPUMARKETNAME2
        DW      $A20F

        MOV     DWORD PTR [CPUName + 16], EAX
        MOV     DWORD PTR [CPUName + 20], EBX
        MOV     DWORD PTR [CPUName + 24], ECX
        MOV     DWORD PTR [CPUName + 28], EDX

        MOV     EAX, CPUID_CPUMARKETNAME3
        DW      $A20F

        MOV     DWORD PTR [CPUName + 32], EAX
        MOV     DWORD PTR [CPUName + 36], EBX
        MOV     DWORD PTR [CPUName + 40], ECX
        MOV     DWORD PTR [CPUName + 44], EDX

        POP     ESI
        POP     EDX
        POP     EDI
        POP     ECX
        POP     EBX
        POP     EBP
        POP     EAX

  end;
  Result:=CPUName;
end;

function GetFDIVBugPresent: Boolean;
const
  N1: Real = 4195835.0;
  N2: Real = 3145727.0;
begin
  Result:=((((N1/N2)*N2)-N1)<>0.0);
end;

{ TCPUFeatures }

procedure TCPUFeatures.GetInfo;
begin
  try

  CPUID_Level:=CPUID_CPUSIGNATUREEX;
  CPUID:=ExecuteCPUID;
  EX_MMX:=((CPUID.EDX and (1 shl EFS_EXMMXA))<>0) or ((CPUID.EDX and (1 shl EFS_EXMMXC))<>0);
  EX_3DNOW:=((CPUID.EDX and (1 shl EFS_EX3DNOW))<>0);
  _3DNOW:=((CPUID.EDX and (1 shl EFS_3DNOW))<>0);

  CPUID_Level:=CPUID_CPUFEATURESET;
  CPUID:=ExecuteCPUID;
  SIMD:=((CPUID.EDX and (1 shl SFS_SIMD))<>0);
  XSR:=((CPUID.EDX and (1 shl SFS_XSR))<>0);
  MMX:=((CPUID.EDX and (1 shl SFS_MMX))<>0);
  SERIAL:=((CPUID.EDX and (1 shl SFS_SERIAL))<>0);
  PSE36:=((CPUID.EDX and (1 shl SFS_PSE36))<>0);
  PAT:=((CPUID.EDX and (1 shl SFS_PAT))<>0);
  CMOV:=((CPUID.EDX and (1 shl SFS_CMOV))<>0);
  MCA:=((CPUID.EDX and (1 shl SFS_MCA))<>0);
  PGE:=((CPUID.EDX and (1 shl SFS_PGE))<>0);
  MTRR:=((CPUID.EDX and (1 shl SFS_MTRR))<>0);
  SEP:=((CPUID.EDX and (1 shl SFS_SEP))<>0);
  APIC:=((CPUID.EDX and (1 shl SFS_APIC))<>0);
  CX8:=((CPUID.EDX and (1 shl SFS_CX8))<>0);
  MCE:=((CPUID.EDX and (1 shl SFS_MCE))<>0);
  PAE:=((CPUID.EDX and (1 shl SFS_PAE))<>0);
  MSR:=((CPUID.EDX and (1 shl SFS_MSR))<>0);
  TSC:=((CPUID.EDX and (1 shl SFS_TSC))<>0);
  PSE:=((CPUID.EDX and (1 shl SFS_PSE))<>0);
  DE:=((CPUID.EDX and (1 shl SFS_DE))<>0);
  VME:=((CPUID.EDX and (1 shl SFS_VME))<>0);
  FPU:=((CPUID.EDX and (1 shl SFS_FPU))<>0);

  except
    on e:Exception do begin
      MessageBox(0,PChar(e.message),'TCPUFeatures.GetInfo',MB_OK or MB_ICONERROR);
    end;
  end;
end;

procedure TCPUFeatures.Report(var sl: TStringList);
begin
  with sl do begin
    Add('[CPU Features]');
    Add(Format('3D Now! extensions=%d',[integer(_3DNOW)]));
    Add(Format('Enhanced 3D Now! extensions=%d',[integer(EX_3DNOW)]));
    Add(Format('Enhanced MMX extensions=%d',[integer(EX_MMX)]));
    Add(Format('SIMD instructions=%d',[integer(SIMD)]));
    Add(Format('FXSAVE/FXRSTOR instruction=%d',[integer(XSR)]));
    Add(Format('MMX extensions=%d',[integer(MMX)]));
    Add(Format('Serial number=%d',[integer(SERIAL)]));
    Add(Format('36bit Page Size Extension=%d',[integer(PSE36)]));
    Add(Format('Page Attribute Table=%d',[integer(PAT)]));
    Add(Format('CMOVcc (+FCMOVcc/F(U)COMI(P) opcodes=%d',[integer(CMOV)]));
    Add(Format('Machine Check Architecture=%d',[integer(MCA)]));
    Add(Format('Page Global Extension=%d',[integer(PGE)]));
    Add(Format('Memory Type Range Registers=%d',[integer(MTRR)]));
    Add(Format('SYSENTER/SYSEXIT extension=%d',[integer(SEP)]));
    Add(Format('Processor contains an enabled APIC=%d',[integer(APIC)]));
    Add(Format('CMPXCHG8B instruction=%d',[integer(CX8)]));
    Add(Format('Machine Check Exception=%d',[integer(MCE)]));
    Add(Format('Physical Address Extension=%d',[integer(PAE)]));
    Add(Format('Model Specific Registers=%d',[integer(MSR)]));
    Add(Format('Time Stamp Counter=%d',[integer(TSC)]));
    Add(Format('Page Size Extension=%d',[integer(PSE)]));
    Add(Format('Debugging Extension=%d',[integer(DE)]));
    Add(Format('Virtual Mode Extension=%d',[integer(VME)]));
    Add(Format('Built-In FPU=%d',[integer(FPU)]));
  end;
end;

{ TCPU }

constructor TCPU.Create;
begin
  inherited;
  FFeatures:=TCPUFeatures.Create;
  FCache:=TCPUCache.Create;
end;

destructor TCPU.Destroy;
begin
  FFeatures.Free;
  FCache.Free;
  inherited;
end;

procedure TCPU.GetInfo;
var
  SI :TSystemInfo;
  CPUID: TCPUIDResult;
  i,t: integer;
  cn: string;
const
  rkCPU = {HKEY_LOCAL_MACHINE\}'HARDWARE\DESCRIPTION\System\CentralProcessor\0';
  rvVendorID = 'VendorIdentifier';
  rvID = 'Identifier';
begin
  try

  ZeroMemory(@SI,SizeOf(SI));
  GetSystemInfo(SI);
  Count:=SI.dwNumberOfProcessors;

  with TRegistry.Create do begin
    Rootkey:=HKEY_LOCAL_MACHINE;
    if OpenKey(rkCPU,False) then begin
      Vendor_Reg:=ReadString(rvVendorID);
      VendorID_Reg:=ReadString(rvID);
      CloseKey;
    end;
    Free;
  end;

  Frequency:=GetCPUSpeed.NormFreq;

  CPUID_Level:=CPUID_CPUSIGNATURE;
  CPUID:=ExecuteCPUID;
  Family:=CPUID.EAX shr 8 and $F;
  Typ:=CPUID.EAX shr 12 and 3;
  Model:=CPUID.EAX shr 4 and $F;
  Stepping:=CPUID.EAX and $F;
  Brand:=LoByte(LoWord(CPUID.EBX));

  CPUID_Level:=CPUID_MAXLEVEL;
  CPUID:=ExecuteCPUID;
  Level:=CPUID.EAX;

  Vendor_CPUID:=GetVendor;

  CPUVendor:=VENDOR_UNKNOWN;
  Vendor:='';
  for i:=VENDOR_INTEL to VENDOR_RISE do
    if CPUVendorIDs[i]=Vendor_CPUID then begin
      CPUVendor:=i;
      Vendor:=CPUVendors[i];
      VendorEx:=CPUVendorsEx[i];
      Break;
    end;

  Features.GetInfo;

  if Features.SERIAL then
    SerialNumber:=GetCPUSerialNumber;

  VendorID_CPUID:=GetVendorID;

  FDIVBug:=GetFDIVBugPresent;

  Cache.GetInfo(CPUVendor);

  VendorID:=GetCPUVendorID(CPUVendor,Family,Model,Brand,Typ,Cache.Level2,Frequency,cn,t);
  CodeName:=cn;
  Transistors:=t;

  except
    on e:Exception do begin
      MessageBox(0,PChar(e.message),'TCPU.GetInfo',MB_OK or MB_ICONERROR);
    end;
  end;
end;

procedure TCPU.Report(var sl: TStringList);
begin
  with sl do begin
    Add('[CPU]');
    Add(Format('Count=%d',[Self.Count]));
    Add(Format('Frequency=%d',[Frequency]));
    Add(Format('VendorID=%s',[VendorID]));
    Add(Format('Vendor=%s',[Vendor]));
    Add(Format('Family=%d',[Family]));
    Add(Format('Model=%d',[Model]));
    Add(Format('Stepping=%d',[Stepping]));
    Add(Format('CodeName=%s',[CodeName]));
    Add(Format('Transistors=%d',[Transistors]));
    Add(Format('SerialNumber=%s',[SerialNumber]));
    Add(Format('FDIVBug=%d',[Integer(FDIVBug)]));

    Features.Report(sl);

    Cache.Report(sl);
  end;
end;

{ TCPUCache }

procedure TCPUCache.GetInfo;
var
  i: integer;
begin
  try

  L1Data:=0;
  L1Code:=0;
  Level1:=0;
  Level2:=0;
  case AVendor of
    VENDOR_INTEL: begin
      IntelCache:=ExecuteIntelCache;
      Level2:=IntelCache.L2Cache;
      L1Data:=0;
      for i:=0 to 15 do
        if (IntelCache.CacheDescriptors[i] in [$0A, $0C]) then begin
          if (IntelCache.CacheDescriptors[i]=$0A) then
            L1Data:=8
          else
            L1Data:=16;
        end;
      L1Code:=0;
      for i:= 0 to 15 do
        if (IntelCache.CacheDescriptors[i] in [$6, $8]) then begin
          if (IntelCache.CacheDescriptors[i]=$06) then
            L1Code:=8
          else
            L1Code:=16;
        end;
      Level1:=0;
      for i:=0 to 15 do
        if (IntelCache.CacheDescriptors[i]=$80) then
          Level1:=16;
    end;
    VENDOR_AMD: begin
      AMDCache:=ExecuteAMDCache;
      L1Data:=AMDCache.L1DataCache[3];
      L1Code:=AMDCache.L1ICache[3];
      Level1:=L1Data+L1Code;
    end;
    VENDOR_CYRIX: begin
      CyrixCache:=ExecuteCyrixCache;
      if $80 in [CyrixCache.L1CacheInfo[0],CyrixCache.L1CacheInfo[1],CyrixCache.L1CacheInfo[2],CyrixCache.L1CacheInfo[3]] then
        Level1:=16;
    end;
    VENDOR_IDT: ;
    VENDOR_NEXGEN: ;
    VENDOR_UMC: ;
    VENDOR_RISE: ;
  end;

  except
    on e:Exception do begin
      MessageBox(0,PChar(e.message),'TCPUCache.GetInfo',MB_OK or MB_ICONERROR);
    end;
  end;
end;

procedure TCPUCache.Report(var sl: TStringList);
begin
  with sl do begin
    Add('[CPU Cache]');
    Add(Format('Level 1 Data Cache=%d',[L1Data]));
    Add(Format('Level 1 Instruction Cache=%d',[L1Code]));
    Add(Format('Level 1 Unified Cache=%d',[Level1]));
    Add(Format('Level 2 Unified Cache=%d',[Level2]));
  end;
end;

end.

