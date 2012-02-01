program RCDemo;

uses
  Forms,
  MainForm in 'MainForm.pas' {frmMain};

{$R *.res}

begin
  Application.Title := 'Raize Components 5 Demo';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
