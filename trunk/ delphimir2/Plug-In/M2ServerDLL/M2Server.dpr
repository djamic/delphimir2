library M2Server;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }


uses
  Windows,
  SysUtils,
  Classes,
  ShellApi,
  Forms,
  EngineInterface in '..\PlugInCommon\EngineInterface.pas',
  PlugShare in 'PlugShare.pas',
  PlugMain in 'PlugMain.pas',
  Common in '..\..\Common\Common.pas',
  MD5EncodeStr in '..\..\Common\MD5EncodeStr.pas',
  HUtil32 in '..\..\Common\HUtil32.pas',
  EncryptUnit in '..\..\Common\EncryptUnit.pas',
  AboutUnit in 'AboutUnit.pas' {FrmAbout};

{$R *.res}
const
  PlugName = 'ϵͳģ��(2010/09/01)';
  LoadPlus = '����ϵͳģ��ɹ�...';
  UnLoadPlus = 'ж��ϵͳģ��ɹ�...';

procedure Config(); stdcall;
begin
  FrmAbout := TFrmAbout.Create(nil);
  FrmAbout.ShowModal;
  FrmAbout.Free;
end;

function Start(): Boolean; stdcall;
begin
  Result := StartPlug;
end;

procedure UnInit(); stdcall;
begin
 { g_UserManage.Free;
  g_CharObject.Free; }
  UnInitPlug();
  MainOutMessage(UnLoadPlus, 0);
end;

function Init(PlugEngine: pTPlugEngine): PChar; stdcall;
var
  sBuff: string;
begin
  g_PlugEngine := PlugEngine^;
  {
  g_UserManage := TUserManage.Create();
  g_CharObject := TCharObject.Create();
  g_CharObject.EngineOut := g_PlugEngine.EngineOut;
  g_UserManage.EngineOut := g_PlugEngine.EngineOut;
  g_UserManage.UserEngine := g_PlugEngine.UserEngine;
  }

  sBuff := EncryptString(IntToStr(g_PlugEngine.Module));
  Move(sBuff[1], g_PlugEngine.Buffer^, Length(sBuff));
  InitPlug();
  MainOutMessage(LoadPlus, 0);
  Result := PChar(PlugName);
end;

exports
  Init, UnInit, Start, Config;
begin

end.

