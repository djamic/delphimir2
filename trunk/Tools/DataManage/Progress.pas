unit Progress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls;

type
  TfrmProgress = class(TForm)
    Timer: TTimer;
    Label1: TLabel;
    ProgressBar: TProgressBar;
    LabelMsg: TLabel;
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
    procedure OnStart(Sender: TObject; const Number: Integer; const S:
      string);
    procedure OnStop(Sender: TObject; const Number: Integer; const S:
      string);
    procedure OnProgress(Sender: TObject; const Number: Integer; const
      S: string);
  public
    { Public declarations }
    procedure Open();

  end;

var
  frmProgress: TfrmProgress;

implementation
uses Share;
{$R *.dfm}

procedure TfrmProgress.Open();
begin
  Timer.Enabled := True;
  ShowModal;
end;

procedure TfrmProgress.OnStart(Sender: TObject; const Number: Integer; const S: string);
var
  sMsg: string;
begin
  sMsg := s;
  if sMsg <> '' then LabelMsg.Caption := sMsg;
  ProgressBar.Max := Number;
  ProgressBar.Position := 0;
end;

procedure TfrmProgress.OnStop(Sender: TObject; const Number: Integer; const S: string);
var
  sMsg: string;
begin
  sMsg := s;
  if sMsg <> '' then LabelMsg.Caption := sMsg;
  {ProgressBar.Max:=Number;
  ProgressBar.Position:=0;}
end;

procedure TfrmProgress.OnProgress(Sender: TObject; const Number: Integer; const S: string);
begin
  ProgressBar.Position := ProgressBar.Position + 1;
end;

procedure TfrmProgress.TimerTimer(Sender: TObject);
var
  I: INTEGER;
begin
  Timer.Enabled := False;
  if not g_boLoadOK then begin
    Caption := '���ڶ�ȡ����...';
    g_LocalDB.LoadDB;
    for I := 0 to 5 do begin
      g_DataManage[I].OnStart := OnStart;
      g_DataManage[I].OnStop := OnStop;
      g_DataManage[I].OnProgress := OnProgress;
      if g_DataManage[I].m_boLoad then

        g_DataManage[I].Load;
    end;
    {LabelMsg.Caption := '���ڶ�ȡ ID.DB�����Ժ�......';
    g_FileIDDB.m_ProgressStatus := ProgressStatus;
    g_FileIDDB.LoadQuickList;

    LabelMsg.Caption := '���ڶ�ȡ Hum.DB�����Ժ�......';
    g_FileHumDB.m_ProgressStatus := ProgressStatus;
    g_FileHumDB.LoadQuickList;

    LabelMsg.Caption := '���ڶ�ȡ Mir.DB�����Ժ�......';
    g_FileDB.m_ProgressStatus := ProgressStatus;
    g_FileDB.LoadQuickList;

    LabelMsg.Caption := '���ڶ�ȡ UserStorage.DB�����Ժ�......';
    g_Storage.m_ProgressStatus := ProgressStatus;
    g_Storage.LoadQuickList;

    LabelMsg.Caption := '���ڶ�ȡ UserSellOff.sell�����Ժ�......';
    g_SellOff.m_ProgressStatus := ProgressStatus;
    g_SellOff.LoadQuickList; }

    g_boLoadOK := True;
    {g_SellGold.m_ProgressStatus := ProgressStatus;
    g_SellGold.LoadQuickList;   }
  end else begin
    Caption := '���ڱ�������...';
    for I := 0 to 5 do begin
      g_DataManage[I].OnStart := OnStart;
      g_DataManage[I].OnStop := OnStop;
      g_DataManage[I].OnProgress := OnProgress;
      if g_DataManage[I].m_boLoad then
        g_DataManage[I].SaveToFile;
    end;
    {LabelMsg.Caption := '���ڱ��� ID.DB�����Ժ�......';
    g_FileIDDB.m_ProgressStatus := ProgressStatus;
    g_FileIDDB.SaveToFile;

    LabelMsg.Caption := '���ڱ��� Hum.DB�����Ժ�......';
    g_FileHumDB.m_ProgressStatus := ProgressStatus;
    g_FileHumDB.SaveToFile;

    LabelMsg.Caption := '���ڱ��� Mir.DB�����Ժ�......';
    g_FileDB.m_ProgressStatus := ProgressStatus;
    g_FileDB.SaveToFile;

    LabelMsg.Caption := '���ڱ���UserStorage.DB�����Ժ�......';
    g_Storage.m_ProgressStatus := ProgressStatus;
    g_Storage.SaveToFile;

    LabelMsg.Caption := '���ڱ��� UserSellOff.sell�����Ժ�......';
    g_SellOff.m_ProgressStatus := ProgressStatus;
    g_SellOff.SaveToFile; }

    g_boLoadOK := False;
    {g_SellGold.m_ProgressStatus := ProgressStatus;
    g_SellGold.LoadQuickList; }
  end;
  Close;
end;

end.

