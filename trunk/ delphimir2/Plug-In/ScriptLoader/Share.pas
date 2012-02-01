unit Share;

interface
uses
  Windows, SysUtils, Classes, EngineInterface;
type
  TPlugConfig = record
    sPlugName: string[50]; // '�ɶ�����ű���չ���';
    sLoadPlugSucced: string[50]; // '���طɶ�����ű���չ����ɹ�...';
    sLoadPlugFail: string[50]; // '���طɶ�����ű���չ���ʧ��...';
    sUnLoadPlug: string[50]; // 'ж�طɶ�������չ��չ����ɹ�...';
    sLabelMsg: string[255];
    sPassWord: string[100];
  end;
  pTPlugConfig = ^TPlugConfig;
var
  g_PlugEngine: TPlugEngine;
procedure MainOutMessage(Msg: string; nMode: Integer);
implementation

procedure MainOutMessage(Msg: string; nMode: Integer);
begin
  if Assigned(g_PlugEngine.MsgProc) then begin
    g_PlugEngine.MsgProc(PChar(Msg), Length(Msg), nMode);
  end;
end;

end.

