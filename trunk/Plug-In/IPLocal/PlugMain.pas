//=============================================================================
//���ú���˵��:
//   �������ֵ����������̨��:
//     procedure MainOutMessasge(sMsg:String;nMode:integer)
//     sMsg ΪҪ���͵��ı�����
//     nMode Ϊ����ģʽ��0Ϊ�����ڿ���̨����ʾ��1Ϊ������ʾ���У��Ժ���ʾ
//
//   ȡ��0-255���������ɫ
//     function GetRGB(bt256:Byte):TColor;
//     bt256 Ҫ��ѯ����
//     ����ֵ Ϊ�������ɫ
//
//   ���͹㲥���֣�
//     procedure SendBroadCastMsg(sMsg:String;MsgType:TMsgType);
//     sMsg Ҫ���͵�����
//     MsgType ��������
//=============================================================================
unit PlugMain;

interface
uses
  Windows, Graphics, SysUtils, StrUtils, Classes, SDK;
procedure InitPlug(AppHandle: THandle);
procedure UnInitPlug();
function DeCodeText(sText: string): string;
function SearchIPLocal(sIPaddr: string): string;
function SearchIPLocalA(sIPaddr: string; List: TStrings): string;
implementation

uses Module, QQWry, Share;
var
  QQWry: TQQWry;
  IPData: TStringList;
//=============================================================================
//���ز��ģ��ʱ���õĳ�ʼ������
//������Apphandle Ϊ��������
//=============================================================================

procedure InitPlug(AppHandle: THandle);
begin
  IPData := TStringlist.Create;
  QQWry := TQQWry.Create(sIPFileName);
  MainOutMessage(sStartLoadPlug, 0);
end;
//=============================================================================
//�˳����ģ��ʱ���õĽ�������
//=============================================================================

procedure UnInitPlug();
begin
  {
    д����Ӧ�������;
  }
  QQWry.Free;
  IPData.Free;
  MainOutMessage(sUnLoadPlug, 0);
end;
//=============================================================================
//��Ϸ��־��Ϣ������
//����ֵ��True ��������Ĭ����Ϸ��־��������False ����Ĭ����Ϸ��־������
//=============================================================================

function GameDataLog(sLogMsg: string): Boolean;
begin
  {
    д����Ӧ������Ϸ��־����;
  }
  Result := False;
end;

//=============================================================================
//��Ϸ�ı�������Ϣ���뺯��(һ�����ڼӽ��ܽű�)
//������sText ΪҪ������ַ���
//����ֵ�����ؽ������ַ���(���ص��ַ������Ȳ��ܳ���1024�ֽڣ��������������)
//=============================================================================

function DeCodeText(sText: string): string;
begin

  Result:='����ֵ�����ؽ������ַ���';
end;

//=============================================================================
//IP���ڵز�ѯ����
//������sIPaddr ΪҪ��ѯ��IP��ַ
//����ֵ������IP���ڵ��ı���Ϣ(���ص��ַ������Ȳ��ܳ���255�ֽڣ������ᱻ�ض�)

function SearchIPLocal(sIPaddr: string): string;
var
  s02, s03: string;
  IPRecordID: int64;
  sLOCAL: string;
begin
  try
    IPRecordID := QQWry.GetIPDataID(sIPaddr);
    QQWry.GetIPDataByIPRecordID(IPRecordID, IPData);
    Result := Trim(IPData.Strings[2]) + Trim(IPData.Strings[3]);
  except
    Result := '';
  end;
end;

function SearchIPLocalA(sIPaddr: string; List: TStrings): string;
var
  IPRecordID: int64;
  sLOCAL: string;
begin
  Result := '';
  try
    IPRecordID := QQWry.GetIPDataID(sIPaddr);
    QQWry.GetIPDataByIPRecordID(IPRecordID, IPData);
    List.Add('==============================================================');
    List.Add('��¼ID: ' + IntToStr(IPRecordID));
    List.Add('IP��Χ: ' + IPData.Strings[0] + ' - ' + IPData.Strings[1]);
    List.Add('����: ' + IPData.Strings[2]);
    List.Add('����: ' + IPData.Strings[3]);
  except
    Result := '';
  end;
end;

end.

