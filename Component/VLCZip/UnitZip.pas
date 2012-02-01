unit UnitZip;

interface

uses
  SysUtils, Classes;

type
  EZipException = class( Exception );

  TZipFileInfo = record
    LastModified:                      TDateTime;
    Crc32:                             Longword;
    CompressedSize:                    Longword;
    UncompressedSize:                  Longword;
  end;

  TZipFileReader = class
  private
    // Information about the memory mapped file
    FFileHandle:                       THandle;
    FFileMapping:                      THandle;
    FMappedAddress:                    Pointer;
    // Location of the ZIPfile in memory. Currently we only support memory mapped ZIPfiles without disk spanning.
    FStart:                            Pointer;
    FSize:                             Longword;
    // ZIP file contents
    FFilenames:                        TStrings;
    function    GetZipFileInfo         ( const FileName: AnsiString ): TZipFileInfo;
  public
    constructor Create                 ( const FileName: string; ZipStartOffset: Int64 = 0; Size: Longword = 0 ); overload;
    constructor Create                 ( const ResourceName, ResourceType: string; Instance: HMODULE = 0 ); overload;
    constructor Create                 ( Buffer: Pointer; Size: Longword ); overload;
    destructor  Destroy;               override;
    function    GetFile                ( const FileName: string ): TBytes; overload;
    function    GetFile                ( FileID: Integer ): TBytes; overload;
    property    FileNames:             TStrings read FFileNames;
    property    FileInfo               [ const FileName: AnsiString ]: TZipFileInfo read GetZipFileInfo;
  end;

implementation

uses
  ZLib, Windows;

const
  cResourceNotFound   = 'Resource not found: %s.%s.';
  cResourceNotLoaded  = 'Resource not loaded: %s.%s.';
  cCannotOpenFile     = 'Cannot open file %s: OS error: %d.';
  cCannotGetFileSize  = 'Cannot get file size of file %s: OS error: %d.';
  cCannotMapFile      = 'Cannot create file mapping of file %s: OS error: %d.';
  cZipFileTooSmall    = 'ZIP file is too small.';
  cZipFileFormatError = 'ZIP file is invalid.';
  cZipBufferInvalid   = 'ZIP memory buffer is invalid.';
  cUnsupportedMethod  = 'ZIP unsupported compression method: %d.';
  cFileNotFoundInZip  = 'File not found in ZIP content: %s';

// ZIP file format records.
// The generic zip file format is ( TLocalFileHeader; Name; Extra; compressed data )* ( TFileHeader; Name; Extra; Remark )* TLastHeader

type
  TFileInfo = packed record
    NeededVersion:                     Word;            // 20
    Flags:                             Word;            // 1=Text,4=extra present
    ZipMethod:                         Word;            // 0=stored 8=deflate
    LastModified:                      Longword;        // time in dos format or Unix Timestamp
    Crc32:                             Longword;
    CompressedSize:                    Longword;
    UncompressedSize:                  Longword;
    NameSize:                          Word;
    ExtraSize:                         Word;
  end;

  TFileHeader = packed record
    Signature:                         Longword;        // $02014b50 PK#1#2
    MadeBy:                            Word;            // Version number, 20
    FileInfo:                          TFileInfo;
    CommentSize:                       Word;            // 0
    FirstDiskNumber:                   Word;            // 0
    IntFileAttr:                       Word;            // 0 = binary; 1 = text
    ExtFileAttr:                       Longword;        // DOS file attributes (Archived=32)
    LocalFileHeaderHeadOff:            Longword;        // @TLocalFileHeader
  end;
  PFileHeader = ^TFileHeader;

  TLocalFileHeader = packed record
    Signature:                         Longword;        // $02014b50 PK#3#4
    FileInfo:                          TFileInfo;
  end;
  PLocalFileHeader = ^TLocalFileHeader;

  TLastHeader = packed record
    Signature:                         Longword;        // $02014b50 PK#5#6
    ThisDiskNumber:                    Word;
    CentralDirDisk:                    Word;
    ThisDiskFileCount:                 Word;
    TotalFileCount:                    Word;
    FileHeaderSize:                    Longword;
    FileHeaderOffset:                  Longword;
    CommentSize:                       Word;
  end;
  PLastHeader = ^TLastHeader;

const
  MagicLastHeader  = $06054b50;
  MagicLocalHeader = $04034b50;
  MagicFileHeader  = $02014b50;

type
  IntPtr = Longword; // NativeInt on Delphi2007 is an Int64 ??

{$if CompilerVersion < 19}
procedure SetAnsiString( var S: AnsiString; P: PAnsiChar; L: Integer ); inline;
begin
  SetString( S, P, L );
end;
{$ifend}

{ TZipFileReader }

constructor TZipFileReader.Create( const FileName: string; ZipStartOffset: Int64; Size: Longword );
begin
  // Open the file in question.
  FFileHandle := CreateFile( PChar( FileName ), GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, 0, 0 );
  if FFileHandle = INVALID_HANDLE_VALUE then raise EZipException.CreateFmt( cCannotOpenFile, [ Filename, GetLastError() ] );
  if Size = 0 then Size := GetFileSize( FFileHandle, nil );
  if Size = INVALID_FILE_SIZE then raise EZipException.CreateFmt( cCannotGetFileSize, [ Filename, GetLastError() ] );

  try
    // Create a file mapping of the file in question
    FFileMapping := CreateFileMapping( FFileHandle, nil, PAGE_READONLY, 0, 0, nil);
    if FFileMapping = 0 then raise EZipException.CreateFmt( cCannotMapFile, [ Filename, GetLastError() ] );

    try
      // Get the file mapped in memory (NOTE: The offset needs to be on the  memory allocation granularity of the system)
      // Hence we assign it it's own pointer -> todo rounding etc.
      FMappedAddress := MapViewOfFile( FFileMapping, FILE_MAP_READ, Int64Rec( ZipStartOffset ).Hi, Int64Rec( ZipStartOffset ).Lo, Size );
      if not Assigned( FMappedAddress ) then EZipException.CreateFmt( cCannotMapFile, [ Filename, GetLastError() ] );
      Create( FMappedAddress, Size );
    except
      CloseHandle( FFileMapping );
      FFileMapping := 0;
      raise;
    end;
  except
    CloseHandle( FFileHandle );
    FFileHandle := 0;
    raise;
  end;
end;

constructor TZipFileReader.Create( const ResourceName, ResourceType: string; Instance: HMODULE );
var
  Resource: HRSRC;
  Global:   HGLOBAL;
begin
  Resource := FindResource( Instance, PChar( ResourceName ), PChar( ResourceType ) );
  if Resource = 0 then raise EZipException.CreateFmt( cResourceNotFound, [ ResourceName, ResourceType ] );
  Global := LoadResource( Instance, Resource );
  if Global = 0 then raise EZipException.CreateFmt( cResourceNotLoaded, [ ResourceName, ResourceType ] );
  Create( LockResource( Global ), SizeofResource( HInstance, Resource ) );
  // Note: kb57808: SizeofResource() returns the resource size rounded up to the alignment size.
end;

constructor TZipFileReader.Create( Buffer: Pointer; Size: Longword );
var
  LastHeader: PLastHeader;
  FileHeader: PFileHeader;
  i, Off:     Longword;
  Name:       AnsiString;
begin
  // Note the location.
  FStart := Buffer;
  FSize  := Size;

  // Some sanity checks.
  if FSize < sizeof( TLocalFileHeader ) + sizeof( TFileHeader ) + sizeof( TLastHeader ) then raise EZipException.Create( cZipFileTooSmall );
  if IsBadReadPtr( Buffer, Size ) then raise EZipException.Create( cZipBufferInvalid );
  if PLongword( Buffer )^ <> MagicLocalHeader then raise EZipException.Create( cZipFileFormatError );

  // Find the last header. Due to the alignment of SizeofResource, we need o search for it.
  LastHeader := Pointer( IntPtr( Buffer ) + Size - sizeof( TLastHeader ) );
  for i := 0 to 31 do begin
    if LastHeader^.Signature = MagicLastHeader then Break;
    Dec( IntPtr( LastHeader ) );
  end;
  if LastHeader^.Signature <> MagicLastHeader then raise EZipException.Create( cZipFileFormatError );

  FFilenames := TStringList.Create();

  Off := LastHeader^.FileHeaderOffset;
  for i := 0 to LastHeader^.TotalFileCount - 1 do begin
    // Get header
    if Off + sizeof( TFileHeader ) >= Size then raise EZipException.Create( cZipFileFormatError );
    FileHeader := Pointer( IntPtr( Buffer ) + Off );
    Inc( Off, sizeof( TFileHeader ) );
    if FileHeader^.Signature <> MagicFileHeader then raise EZipException.Create( cZipFileFormatError );

    // Get filename
    if Off + FileHeader^.FileInfo.NameSize + FileHeader^.FileInfo.ExtraSize >= Size then raise EZipException.Create( cZipFileFormatError );
    SetAnsiString( @Name, Pointer( IntPtr( Buffer ) + Off ), FileHeader^.FileInfo.NameSize, 0 );
    Inc( Off, FileHeader^.FileInfo.NameSize + FileHeader^.FileInfo.ExtraSize );

    // Save filename and offset into ZIPfile where it can be found.
    FFileNames.AddObject( Name, Pointer( FileHeader^.LocalFileHeaderHeadOff ) );
  end;
  // For quick access.
  TStringList( FFilenames ).Sorted := True;

end;

destructor TZipFileReader.Destroy;
begin
  if Assigned( FMappedAddress ) then UnmapViewOfFile( FMappedAddress );
  if FFileMapping <> 0 then CloseHandle( FFileMapping );
  if FFileHandle  <> 0 then CloseHandle( FFileHandle  );
  inherited Destroy;
end;

function TZipFileReader.GetFile( const FileName: string ): TBytes;
var
  ID: Integer;
begin
  // Convert filename in FileID and access by ID.
  ID := FFilenames.IndexOf( FileName );
  if ID < 0 then raise EZipException.CreateFmt( cFileNotFoundInZip, [ FileName ] );
  Result := GetFile( ID );
end;

function TZipFileReader.GetFile( FileID: Integer ): TBytes;
var
  Off:   Longword;
  Local: PLocalFileHeader;
  ZRec:  TZStreamRec;
const
  ZLibHeader: array [ 0..1 ] of Byte = ( $78, $01 ); // Deflate 32KB window size no preset dictionary.
begin
  // Sanity check
  if ( FileID < 0 ) or ( FileID >= FFilenames.Count ) then raise EZipException.CreateFmt( 'Invalid File ID: %d', [ FileID ] );

  // Get the file header and perform sanity check
  Off := Longword( FFilenames.Objects[ FileID ] );
  if Off + sizeof( TLocalFileHeader ) >= FSize then raise EZipException.Create( cZipFileFormatError );
  Local := Pointer( IntPtr( FStart ) + Off );
  if Local^.Signature <> MagicLocalHeader then raise EZipException.Create( cZipFileFormatError );
  Inc( Off, sizeof( TLocalFileHeader ) + Local^.FileInfo.NameSize + Local^.FileInfo.ExtraSize );
  if Off + Local^.FileInfo.CompressedSize >= FSize then raise EZipException.Create( cZipFileFormatError );
  // note: should we check the name again?

  SetLength( Result, Local^.FileInfo.UncompressedSize );
  if Length( Result ) > 0 then case Local^.FileInfo.ZipMethod of
    0:   begin // STORED
           if Local^.FileInfo.CompressedSize <> Local^.FileInfo.UncompressedSize then raise EZipException.Create( cZipFileFormatError );
           Move( Pointer( IntPtr( FStart ) + Off )^, Result[ 0 ], Local^.FileInfo.UncompressedSize );
         end;
    8:   begin // DEFLATE
           ZeroMemory( @ZRec, sizeof( ZRec ) );
           ZRec.next_in   := @ZLibHeader;
           ZRec.avail_in  := sizeof( ZLibHeader );
           ZRec.total_in  := sizeof( ZLibHeader ) + Local^.FileInfo.CompressedSize;
           ZRec.next_out  := @Result[ 0 ];
           ZRec.avail_out := Local^.FileInfo.UncompressedSize;
           ZRec.total_out := Local^.FileInfo.UncompressedSize;
           ZRec.zalloc    := zlibAllocMem;
           ZRec.zfree     := zlibFreeMem;
           if inflateInit_( ZRec, zlib_Version, sizeof( ZRec ) ) <> 0 then raise EZipException.Create( cZipFileFormatError );
           try
             if not( inflate( ZRec, Z_FULL_FLUSH ) in [ Z_OK, Z_STREAM_END ] ) then raise EZipException.Create( cZipFileFormatError );
             ZRec.next_in   := Pointer( IntPtr( FStart ) + Off );
             ZRec.avail_in  := Local^.FileInfo.CompressedSize;
             if not( inflate( ZRec, Z_FINISH ) in [ Z_OK, Z_STREAM_END ] ) then raise EZipException.Create( cZipFileFormatError );
           finally
             inflateEnd( ZRec );
           end;
         end;
    else raise EZipException.CreateFmt( cUnsupportedMethod, [ Local^.FileInfo.ZipMethod ] );
  end;

  // todo: CRC32 sanity check if requested.
end;

function TZipFileReader.GetZipFileInfo( const FileName: AnsiString ): TZipFileInfo;
var
  FileID: Integer;
  Off:    Longword;
  Local:  PLocalFileHeader;
begin
  // Get the correct file ID
  FileID := FFilenames.IndexOf( FileName );
  if FileID < 0 then raise EZipException.CreateFmt( cFileNotFoundInZip, [ FileName ] );

  // Get the file header and perform sanity check
  Off := Longword( FFilenames.Objects[ FileID ] );
  if Off + sizeof( TLocalFileHeader ) >= FSize then raise EZipException.Create( cZipFileFormatError );
  Local := Pointer( IntPtr( FStart ) + Off );
  if Local^.Signature <> MagicLocalHeader then raise EZipException.Create( cZipFileFormatError );
  Inc( Off, sizeof( TLocalFileHeader ) + Local^.FileInfo.NameSize + Local^.FileInfo.ExtraSize );
  if Off + Local^.FileInfo.CompressedSize >= FSize then raise EZipException.Create( cZipFileFormatError );

  // Return requested data.
  Result.LastModified     := Local^.FileInfo.LastModified;
  Result.Crc32            := Local^.FileInfo.Crc32;
  Result.CompressedSize   := Local^.FileInfo.CompressedSize;
  Result.UncompressedSize := Local^.FileInfo.UncompressedSize;
end;

end.