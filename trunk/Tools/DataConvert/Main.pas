unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, HUtil32, RzEdit, RzBtnEdt, ComCtrls, zlibx, DIB;

type
  TDataHeader = record //�¶����Data�ļ�ͷ
    Title: string[40];
    Size: DWORD;
    ImageCount: DWORD;
    Planes: LongWord;
    BitCount: Word;
    Compression: Word;
  end;
  pTDataHeader = ^TDataHeader;

  TDataImageInfo = record //�¶���DataͼƬ��Ϣ
    nWidth: Smallint;
    nHeight: Smallint;
    Px: Smallint;
    Py: SmallInt;
    nSize: Integer; //���ݴ�С
  end;
  pTDataImageInfo = ^TDataImageInfo;

  TFrmMain = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ButtonOK: TButton;
    EditOldFile: TRzButtonEdit;
    EditNewFile: TRzButtonEdit;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    ProgressBar: TProgressBar;
    procedure EditOldFileButtonClick(Sender: TObject);
    procedure EditNewFileButtonClick(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}
const
  g_sTitle = '�ɶ��������ͼƬ��Դ�ļ� 2009/01/01 http://www.941yx.com';

function WidthBytes(w: Integer): Integer;
begin
  Result := (((w * 8) + 31) div 32) * 4;
end;

function UnComp(dbuf, sbuf: PByte; sbuflen: Integer; Zip: Boolean): Integer;
var
  I, J, K, a: integer;
  wsbuf, wdbuf: PWordArray;
  OutBuf: Pointer;
  OutBytes: integer;
begin
  OutBuf := nil;

  if Zip and (sbuflen > 8) then begin
    DecompressBuf(sbuf, sbuflen, 0, OutBuf, OutBytes);
    sbuflen := OutBytes;
    wsbuf := PWordArray(OutBuf);
    wdbuf := PWordArray(dbuf);
  end else begin
    wsbuf := PWordArray(sbuf);
    wdbuf := PWordArray(dbuf);
  end;

  //if (sbuflen > 8) then begin
  J := 0;
  I := 0;
  while I < sbuflen div 2 do begin
    if (wsbuf[I] = $AAAA) then begin
      for K := 0 to wsbuf[I + 2] - 1 do begin
        wdbuf[J] := wsbuf[I + 1];
        Inc(J);
      end;
      Inc(I, 2);
      //I += 2 �ȼ���I = I + 2
    end else begin
      wdbuf[J] := wsbuf[I];
      Inc(J);
    end;
    Inc(I);
  end;
  //end else J := sbuflen div 2;
  if OutBuf <> nil then FreeMem(OutBuf);
  Result := J * 2;
end;

procedure TFrmMain.EditOldFileButtonClick(Sender: TObject);
begin
  if OpenDialog.Execute then begin
    EditOldFile.Text := OpenDialog.FileName;
  end;
end;

procedure TFrmMain.EditNewFileButtonClick(Sender: TObject);
begin
  if SaveDialog.Execute then begin
    if ExtractFileExt(SaveDialog.FileName) <> '.Data' then
      SaveDialog.FileName := ExtractFilePath(SaveDialog.FileName) + ExtractFileNameOnly(SaveDialog.FileName) + '.Data';
    EditNewFile.Text := SaveDialog.FileName;
  end;
end;

procedure ReverseDIB(Source: TDIB);
var
  I: Integer;
  lsDIB: TDIB;
  pSrc: Pointer;
  pDest: Pointer;
begin
  lsDIB := TDIB.Create;
  lsDIB.Assign(Source);
  pDest := Source.PBits;
  for I := lsDIB.Height - 1 downto 0 do begin
    pSrc := Pointer(Integer(lsDIB.PBits) + I * lsDIB.WidthBytes);
    Move(pSrc^, pDest^, Source.WidthBytes);
    Inc(Integer(pDest), Source.WidthBytes);
  end;
  lsDIB.Free;
end;

procedure TFrmMain.ButtonOKClick(Sender: TObject);
var
  I: Integer;
  sOldFileName: string;
  sNewFileName: string;
  OldFileStream: TFileStream;
  NewFileStream: TFileStream;
  DataHeader: TDataHeader;
  NewDataHeader: TDataHeader;
  DataImageInfo: TDataImageInfo;
  InData: Pointer;
  OutData: Pointer;

  Index, nDataLen, nError: Integer;
  IndexArray: PInteger;
  IndexList: TList;
  DIB: TDIB;
  lsDIB: TDIB;
begin
  sOldFileName := Trim(EditOldFile.Text);
  sNewFileName := Trim(EditNewFile.Text);
  if not FileExists(sOldFileName) then begin
    Application.MessageBox(PChar(Format('%s û�з��� ������', [sOldFileName])), '��ʾ��Ϣ', MB_ICONQUESTION);
    EditOldFile.SetFocus;
    Exit;
  end;
  if CompareText(sOldFileName, sNewFileName) = 0 then begin
    Application.MessageBox('���ļ������ļ�·�����ò�����ͬһ��·��������', '��ʾ��Ϣ', MB_ICONQUESTION);
    EditNewFile.SetFocus;
    Exit;
  end;
  FileSetAttr(sOldFileName, 0);
  OldFileStream := TFileStream.Create(sOldFileName, fmOpenReadWrite or fmShareDenyNone);
  OldFileStream.Read(DataHeader, SizeOf(TDataHeader));
  if (DataHeader.BitCount <> 16) or (Pos('2009', DataHeader.Title) > 0) then begin
    Application.MessageBox('��ѡ����ȷ�ľ�Data�ļ� ������', '��ʾ��Ϣ', MB_ICONQUESTION);
    OldFileStream.Free;
    EditOldFile.SetFocus;
    Exit;
  end;

  ButtonOK.Enabled := False;

  ProgressBar.Max := DataHeader.ImageCount;
  ProgressBar.Position := 0;
  IndexList := TList.Create;
  //DataHeader.ImageCount := 100;

  GetMem(IndexArray, DataHeader.ImageCount * SizeOf(Integer));
  OldFileStream.Read(IndexArray^, DataHeader.ImageCount * SizeOf(Integer));
  for I := 0 to DataHeader.ImageCount - 1 do begin
    Index := PInteger(Integer(IndexArray) + SizeOf(Integer) * I)^;
    IndexList.Add(Pointer(Index));
  end;
  FreeMem(IndexArray);

  if FileExists(sNewFileName) then begin
    FileSetAttr(sNewFileName, 0);
    NewFileStream := TFileStream.Create(sNewFileName, fmOpenReadWrite or fmShareDenyNone);
  end else begin
    NewFileStream := TFileStream.Create(sNewFileName, fmOpenReadWrite or fmShareDenyNone or fmCreate);
  end;

  NewDataHeader := DataHeader;
  NewDataHeader.Compression := 0;
  DataHeader.ImageCount := IndexList.Count;

  NewDataHeader.Title := g_sTitle;
  NewFileStream.Write(NewDataHeader, SizeOf(TDataHeader));

  nDataLen := SizeOf(TDataHeader) + SizeOf(Integer) * DataHeader.ImageCount;
  GetMem(IndexArray, DataHeader.ImageCount * SizeOf(Integer));
  NewFileStream.Write(IndexArray^, DataHeader.ImageCount * SizeOf(Integer));
  NewFileStream.Size := NewFileStream.Position;
  try
    for I := 0 to IndexList.Count - 1 do begin
      if I mod 100 = 0 then Application.ProcessMessages;
      ProgressBar.Position := ProgressBar.Position + 1;
      OldFileStream.Position := Integer(IndexList.Items[I]);
      OldFileStream.Read(DataImageInfo, SizeOf(TDataImageInfo));

      {if (DataImageInfo.nSize <= 0) or (DataImageInfo.nWidth <= 4) or (DataImageInfo.nHeight <= 0) then begin
        DataImageInfo.nSize := 0;
        NewFileStream.Write(DataImageInfo, SizeOf(TDataImageInfo));
        nDataLen := nDataLen + SizeOf(TDataImageInfo);
      end else begin  }
      nError := 0;
      GetMem(InData, DataImageInfo.nSize);

      lsDIB := TDIB.Create;
      lsDIB.PixelFormat := MakeDIBPixelFormat(5, 5, 5);
      lsDIB.BitCount := 16;
      lsDIB.Width := DataImageInfo.nWidth;
      lsDIB.Height := DataImageInfo.nHeight;
      OutData := lsDIB.PBits;

      nError := 1;
      OldFileStream.Read(InData^, DataImageInfo.nSize);
      nError := 2;
      DataImageInfo.nSize := UnComp(OutData, InData, DataImageInfo.nSize, DataHeader.Compression > 0);

      DIB := TDIB.Create;
      DIB.PixelFormat := MakeDIBPixelFormat(5, 6, 5);
      DIB.BitCount := 16;
      DIB.Width := DataImageInfo.nWidth;
      DIB.Height := DataImageInfo.nHeight;
      DIB.Canvas.Draw(0, 0, lsDIB);
      ReverseDIB(DIB);
      OutData := DIB.PBits;


      nError := 3;
      PInteger(Integer(IndexArray) + SizeOf(Integer) * I)^ := nDataLen;
      nDataLen := nDataLen + SizeOf(TDataImageInfo) + DataImageInfo.nSize;
      nError := 4;
      NewFileStream.Write(DataImageInfo, SizeOf(TDataImageInfo));
      nError := 5;
      NewFileStream.Write(OutData^, DataImageInfo.nSize);
      nError := 6;
      FreeMem(InData);
      nError := 7;
      lsDIB.Free;
      DIB.Free;
    end;
    //end;
  except
    Showmessage(Format('Index:%d Size:%d Width:%d Height:%d Error:%d', [I, DataImageInfo.nSize, DataImageInfo.nWidth, DataImageInfo.nHeight, nError]));
  end;

  NewFileStream.Seek(SizeOf(TDataHeader), soBeginning);
  NewFileStream.Write(IndexArray^, DataHeader.ImageCount * SizeOf(Integer));

  NewFileStream.Free;
  OldFileStream.Free;
  FreeMem(IndexArray);
  IndexList.Free;
  Application.MessageBox('ת����ɣ�����', '��ʾ��Ϣ', MB_ICONQUESTION);
  ButtonOK.Enabled := True;
end;

end.

