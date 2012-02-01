unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, RzEdit, RzBtnEdt, ExtCtrls, RzPanel;

type
  TfrmLogin = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzLabel1: TLabel;
    EditMirServer: TRzButtonEdit;
    EditIDDBFileName: TRzButtonEdit;
    EditHumDBFileName: TRzButtonEdit;
    EditMirDBFileName: TRzButtonEdit;
    EditUserStorage: TRzButtonEdit;
    EditUserSell: TRzButtonEdit;
    EditUserGold: TRzButtonEdit;
    RzGroupBox2: TGroupBox;
    RzLabel5: TLabel;
    EditDBName: TEdit;
    BitBtnStart: TBitBtn;
    BitBtnClose: TBitBtn;
    CheckBoxID: TCheckBox;
    CheckBoxHumDB: TCheckBox;
    CheckBoxMirDB: TCheckBox;
    CheckBoxUserStorageDB: TCheckBox;
    CheckBoxUserSellOff: TCheckBox;
    CheckBoxUserSellGold: TCheckBox;
    procedure BitBtnStartClick(Sender: TObject);
    procedure BitBtnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation
uses Share;
{$R *.dfm}

procedure TfrmLogin.BitBtnStartClick(Sender: TObject);
begin
  if Application.MessageBox('��Ҫ�ڷ�����Ѿ��رյ��������ʹ�ã���ȷ����ķ�����Ѿ��ر�����',
    '��ʾ��Ϣ',
    MB_YESNO + MB_ICONQUESTION) <> IDYES then Exit;

  g_sIDDBFileName := Trim(EditIDDBFileName.Text);
  g_sHumDBFileName := Trim(EditHumDBFileName.Text);
  g_sMirDBFileName := Trim(EditMirDBFileName.Text);
  g_sBigStorageFileName := Trim(EditUserStorage.Text);
  g_sSellOffSellFileName := Trim(EditUserSell.Text);
  g_sSellOffGoldFileName := Trim(EditUserGold.Text);

  g_boIDDBFileName := CheckBoxID.Checked;
  g_boHumDBFileName := CheckBoxHumDB.Checked;
  g_boMirDBFileName := CheckBoxMirDB.Checked;

  g_boBigStorageFileName := CheckBoxUserStorageDB.Checked;
  g_boSellOffSellFileName := CheckBoxUserSellOff.Checked;
  g_boSellOffGoldFileName := CheckBoxUserSellGold.Checked;


  g_sHeroDBName := Trim(EditDBName.Text);

  if g_boIDDBFileName and  not FileExists(g_sIDDBFileName) then begin
    Application.MessageBox('û�з���: ID.DB ������', '��ʾ��Ϣ', MB_ICONQUESTION);
    Exit;
  end;
  if g_boHumDBFileName and not FileExists(g_sHumDBFileName) then begin
    Application.MessageBox('û�з���: Hum.DB ������', '��ʾ��Ϣ', MB_ICONQUESTION);
    Exit;
  end;
  if g_boMirDBFileName and not FileExists(g_sMirDBFileName) then begin
    Application.MessageBox('û�з���: Mir.DB ������', '��ʾ��Ϣ', MB_ICONQUESTION);
    Exit;
  end;

  if g_boBigStorageFileName and not FileExists(g_sBigStorageFileName) then begin
    Application.MessageBox('û�з���: UserStorage.DB ������', '��ʾ��Ϣ', MB_ICONQUESTION);
    Exit;
  end;
  if g_boSellOffSellFileName and not FileExists(g_sSellOffSellFileName) then begin
    Application.MessageBox('û�з���: UserSellOff.sell ������', '��ʾ��Ϣ', MB_ICONQUESTION);
    Exit;
  end;
  {if not FileExists(g_sSellOffGoldFileName) then begin
    Application.MessageBox('û�з���: UserSellOff.Gold ������', '��ʾ��Ϣ', MB_ICONQUESTION);
    Exit;
  end;  }
  g_boLoginOK := True;
  Close;
end;

procedure TfrmLogin.BitBtnCloseClick(Sender: TObject);
begin
  Close;

end;

end.

