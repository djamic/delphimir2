program MirClient;

uses
//  fastmm4 in '..\Component\fastmm\fastmm4.pas',
  Forms,
  Dialogs,
  IniFiles,
  Windows,
  SysUtils,
  Controls,
  ClMain in 'ClMain.pas' {frmMain},
  DrawScrn in 'DrawScrn.pas',
  IntroScn in 'IntroScn.pas',
  PlayScn in 'PlayScn.pas',
  MapUnit in 'MapUnit.pas',
  FState in 'FState.pas' {FrmDlg},
  ClFunc in 'ClFunc.pas',
  DWinCtl in 'DWinCtl.pas',
  magiceff in 'magiceff.pas',
  SoundUtil in 'SoundUtil.pas',
  Actor in 'Actor.pas',
  HerbActor in 'HerbActor.pas',
  AxeMon in 'AxeMon.pas',
  clEvent in 'clEvent.pas',
  HUtil32 in '..\Common\HUtil32.pas',
  MShare in 'MShare.pas',
  Mpeg in 'Mpeg.pas',
  wmUtil in 'wmUtil.pas',
  Share in 'Share.pas',
  Grobal2 in '..\Common\Grobal2.pas',
  SoundEngn in 'SoundEngn.pas',
  MD5EncodeStr in '..\Common\MD5EncodeStr.pas',
  EncryptUnit in '..\Common\EncryptUnit.pas',
  CompressUnit1 in '..\Common\CompressUnit1.pas',
  CompressUnit in '..\Common\CompressUnit.pas',
  PlugIn in 'PlugIn.pas',
  PathFind in 'PathFind.pas',
  Textures in 'Textures.pas',
  LoadMapThread in 'LoadMapThread.pas',
  GuaJi in 'GuaJi.pas',
  MapFiles in '..\Common\MapFiles.pas',
  GameImages in 'GameImages.pas',
  Uib in 'Uib.pas',
  Wil in 'Wil.pas',
  Wis in 'Wis.pas',
  Fir in 'Fir.pas',
  ZLibEx in '..\Common\ZLibEx.pas',
  ZLibx in '..\Common\ZLibx.pas',
  FastMM4Messages in '..\Component\fastmm\FastMM4Messages.pas';

{$R *.RES}
begin
  //if ProgressDlg = mrOk then begin
  Application.Initialize;
  Application.Title := 'Legend of mir';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TFrmDlg, FrmDlg);
  Application.Run;
  //end;
end.

