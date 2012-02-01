unit AccountManage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, RzListVw, RzButton, RzSplit, StdCtrls, Mask, RzEdit,
  RzCmboBx, Buttons, RzLabel, ExtCtrls, RzPanel, ObjBase, Grobal2, StrUtils;

type
  TfrmAccountManage = class(TFrame)
    RzSizePanel2: TRzSizePanel;
    RzGroupBox2: TRzGroupBox;
    PanelActSearchAccount: TPanel;
    ButtonPrecisionSearch: TRzToolbarButton;
    ButtonMistySearch: TRzToolbarButton;
    RzPanel16: TPanel;
    Label1: TLabel;
    ButtonOK: TButton;
    ButtonDelAccount: TButton;
    RzPanel4: TPanel;
    RzGroupBox1: TRzGroupBox;
    EditCreateDate: TEdit;
    EditPassword: TEdit;
    EditYourName: TEdit;
    EditSSNo: TEdit;
    EditQuiz1: TEdit;
    EditQuiz2: TEdit;
    EditPhone: TEdit;
    EditEMail: TEdit;
    EditUpdate: TEdit;
    EditConfirm: TEdit;
    EditBirthDay: TEdit;
    EditAnswer1: TEdit;
    EditAnswer2: TEdit;
    EditMobPhone: TEdit;
    EditAccount: TEdit;
    ComboBoxAccount: TComboBox;
    MemoHelp: TMemo;
    ListView: TListView;
    RzLabel9: TLabel;
    RzLabel10: TLabel;
    RzLabel11: TLabel;
    RzLabel13: TLabel;
    RzLabel14: TLabel;
    RzLabel15: TLabel;
    RzLabel16: TLabel;
    RzLabel17: TLabel;
    RzLabel18: TLabel;
    RzLabel19: TLabel;
    RzLabel20: TLabel;
    RzLabel21: TLabel;
    RzLabel22: TLabel;
    RzLabel23: TLabel;
    RzLabel7: TLabel;
    RzLabel8: TLabel;
    procedure ButtonOKClick(Sender: TObject);
    procedure EditEnter(Sender: TObject);
    procedure ListViewClick(Sender: TObject);
    procedure EditPasswordChange(Sender: TObject);
    procedure ButtonPrecisionSearchClick(Sender: TObject);
    procedure ComboBoxAccountSelect(Sender: TObject);
    procedure ButtonMistySearchClick(Sender: TObject);
    procedure ButtonDelAccountClick(Sender: TObject);
  private
    { Private declarations }
    function NewIdCheckBirthDay: Boolean;

    procedure AddAccountToListView(Account: pTAccountDBRecord);
    procedure AddAccountToEdit(Account: pTAccountDBRecord);
    function CheckUserEntrys: Boolean;
  public
    { Public declarations }
    procedure Init;
  end;

var
  frmAccountManage: TfrmAccountManage;
  AccountDBRecord: pTAccountDBRecord;
implementation
uses Share, HUtil32, HumDB, IDDB;
{$R *.dfm}

procedure RefAccountList;
var
  nItemIndex: Integer;
begin
  with frmAccountManage do begin
    nItemIndex := ComboBoxAccount.ItemIndex;
    ComboBoxAccount.Items.Clear;
    ComboBoxAccount.Items.AddStrings(g_FileIDDB.m_IDDBList);
    if nItemIndex >= 0 then begin
      if nItemIndex < ComboBoxAccount.Items.Count then
        ComboBoxAccount.ItemIndex := nItemIndex;
    end;
  end;
end;

procedure TfrmAccountManage.Init;
begin
{$IFDEF VCL70_OR_HIGHER}
  ParentBackground := False;
{$ENDIF}
  SetLength(g_StartProc, Length(g_StartProc) + 1);
  g_StartProc[Length(g_StartProc) - 1] := RefAccountList;
  RefAccountList;
  AccountDBRecord := nil;
  ButtonOK.Enabled := False;
  ButtonDelAccount.Enabled := False;
end;

function TfrmAccountManage.NewIdCheckBirthDay: Boolean;
var
  Str, t1, t2, t3, syear, smon, sday: string;
  ayear, amon, aday, sex: Integer;
  flag: Boolean;
begin
  Result := True;
  flag := True;
  Str := EditBirthDay.Text;
  Str := GetValidStr3(Str, syear, ['/']);
  Str := GetValidStr3(Str, smon, ['/']);
  Str := GetValidStr3(Str, sday, ['/']);
  ayear := Str_ToInt(syear, 0);
  amon := Str_ToInt(smon, 0);
  aday := Str_ToInt(sday, 0);
  if (ayear <= 1890) or (ayear > 2101) then flag := False;
  if (amon <= 0) or (amon > 12) then flag := False;
  if (aday <= 0) or (aday > 31) then flag := False;
  if not flag then begin
    Beep;
    EditBirthDay.SetFocus;
    Result := False;
  end;
end;

function TfrmAccountManage.CheckUserEntrys: Boolean;
begin
  Result := False;
  EditAccount.Text := Trim(EditAccount.Text);
  EditQuiz1.Text := Trim(EditQuiz1.Text);
  EditYourName.Text := Trim(EditYourName.Text);
  {if Length(EditAccount.Text) < 3 then begin
    //Application.MessageBox('��¼�ʺŵĳ��ȱ������3λ��', '��ʾ��Ϣ', MB_OK + MB_ICONINFORMATION);
    SkinMessage.MessageDlg2('��¼�ʺŵĳ��ȱ������3λ��', '��ʾ��Ϣ', mtConfirmation, [mbOK], 0);
    Beep;
    EditAccount.SetFocus;
    Exit;
  end; }
  if not NewIdCheckBirthDay then Exit;
  if Length(EditPassword.Text) < 3 then begin
    EditPassword.SetFocus;
    Exit;
  end;
  if EditPassword.Text <> EditConfirm.Text then begin
    EditConfirm.SetFocus;
    Exit;
  end;
 { if not IsStringNumber(EditRandomCode.Text) then begin
    EditRandomCode.SetFocus;
    Exit;
  end;   }
  if Length(EditQuiz1.Text) < 1 then begin
    EditQuiz1.SetFocus;
    Exit;
  end;
  if Length(EditAnswer1.Text) < 1 then begin
    EditAnswer1.SetFocus;
    Exit;
  end;
  if Length(EditQuiz2.Text) < 1 then begin
    EditQuiz2.SetFocus;
    Exit;
  end;
  if Length(EditAnswer2.Text) < 1 then begin
    EditAnswer2.SetFocus;
    Exit;
  end;
  if Length(EditYourName.Text) < 1 then begin
    EditYourName.SetFocus;
    Exit;
  end;
  Result := True;
end;

procedure TfrmAccountManage.EditEnter(Sender: TObject);
begin
  if Sender = EditAccount then begin
    MemoHelp.Clear;
    MemoHelp.Lines.Add('�����ʺ����ƿ��԰�����');
    MemoHelp.Lines.Add('�ַ������ֵ���ϡ�');
    MemoHelp.Lines.Add('�ʺ����Ƴ��ȱ���Ϊ4�����ϡ�');
    MemoHelp.Lines.Add('��½�ʺŲ���Ϸ�е��������ơ�');
    MemoHelp.Lines.Add('����ϸ���봴���ʺ�������Ϣ��');
    MemoHelp.Lines.Add('���ĵ�½�ʺſ��Ե�½��Ϸ');
    MemoHelp.Lines.Add('��������վ����ȡ��һЩ�����Ϣ��');
    MemoHelp.Lines.Add('');
    MemoHelp.Lines.Add('�������ĵ�½�ʺŲ�Ҫ����Ϸ�еĽ�');
    MemoHelp.Lines.Add('ɫ����ͬ��');
    MemoHelp.Lines.Add('��ȷ��������벻�ᱻ�����ƽ⡣');
    Exit;
  end;
  if Sender = EditPassword then begin
    MemoHelp.Clear;
    MemoHelp.Lines.Add('��������������ַ������ֵ���ϣ�');
    MemoHelp.Lines.Add('�����볤�ȱ�������4λ��');
    MemoHelp.Lines.Add('���������������ݲ�Ҫ���ڼ򵥣�');
    MemoHelp.Lines.Add('�Է����˲µ���');
    MemoHelp.Lines.Add('���ס����������룬�����ʧ����');
    MemoHelp.Lines.Add('���޷���¼��Ϸ��');
  end;
  if Sender = EditConfirm then begin
    MemoHelp.Clear;
    MemoHelp.Lines.Add('�ٴ���������');
    MemoHelp.Lines.Add('��ȷ�ϡ�');
  end;
  if Sender = EditYourName then begin
    MemoHelp.Clear;
    MemoHelp.Lines.Add('����������ȫ��.');
  end;
  if Sender = EditSSNo then begin
    MemoHelp.Clear;
    MemoHelp.Lines.Add('������������֤��');
    MemoHelp.Lines.Add('���磺 720101-146720');
  end;
  if Sender = EditBirthDay then begin
    MemoHelp.Clear;
    MemoHelp.Lines.Add('��������������');
    MemoHelp.Lines.Add('���磺1977/10/15');
  end;
  if Sender = EditQuiz1 then begin
    MemoHelp.Clear;
    MemoHelp.Lines.Add('�������һ��������ʾ����');
    MemoHelp.Lines.Add('�����ʾ���������붪ʧ����');
    MemoHelp.Lines.Add('�������á�');
    MemoHelp.Lines.Add('');
  end;
  if Sender = EditAnswer1 then begin
    MemoHelp.Clear;
    MemoHelp.Lines.Add('���������������');
    MemoHelp.Lines.Add('�𰸡�');
    MemoHelp.Lines.Add('');
  end;
  if Sender = EditQuiz2 then begin
    MemoHelp.Clear;
    MemoHelp.Lines.Add('������ڶ���������ʾ����');
    MemoHelp.Lines.Add('�����ʾ���������붪ʧ����');
    MemoHelp.Lines.Add('�������á�');
    MemoHelp.Lines.Add('');
  end;
  if Sender = EditAnswer2 then begin
    MemoHelp.Clear;
    MemoHelp.Lines.Add('���������������');
    MemoHelp.Lines.Add('�𰸡�');
    MemoHelp.Lines.Add('');
  end;
  if Sender = EditPhone then begin
    MemoHelp.Clear;
    MemoHelp.Lines.Add('���������ĵ绰');
    MemoHelp.Lines.Add('���롣');
    MemoHelp.Lines.Add('');
  end;
  if Sender = EditMobPhone then begin
    MemoHelp.Clear;
    MemoHelp.Lines.Add('�����������ֻ����롣');
    MemoHelp.Lines.Add('');
  end;
  if Sender = EditEMail then begin
    MemoHelp.Clear;
    MemoHelp.Lines.Add('�����������ʼ���ַ�������ʼ�����');
    MemoHelp.Lines.Add('����������µ�һЩ��Ϣ');
    MemoHelp.Lines.Add('');
  end;
  {if Sender = EditRandomCode then begin
    MemoHelp.Clear;
    MemoHelp.Lines.Add('�������ұߵ���֤��');
    MemoHelp.Lines.Add('');
  end; }
end;

procedure TfrmAccountManage.ButtonOKClick(Sender: TObject);
begin
  if AccountDBRecord = nil then Exit;
  if CheckUserEntrys then begin
    AccountDBRecord.UserEntry.sPassword := EditPassword.Text;
    AccountDBRecord.UserEntry.sUserName := EditYourName.Text;
    AccountDBRecord.UserEntry.sSSNo := EditSSNo.Text;
    AccountDBRecord.UserEntry.sQuiz := EditQuiz1.Text;
    AccountDBRecord.UserEntry.sAnswer := Trim(EditAnswer1.Text);
    AccountDBRecord.UserEntry.sPhone := EditPhone.Text;
    AccountDBRecord.UserEntry.sEMail := Trim(EditEMail.Text);
    AccountDBRecord.UserEntryAdd.sQuiz2 := EditQuiz2.Text;
    AccountDBRecord.UserEntryAdd.sAnswer2 := Trim(EditAnswer2.Text);
    AccountDBRecord.UserEntryAdd.sBirthDay := EditBirthDay.Text;
    AccountDBRecord.UserEntryAdd.sMobilePhone := EditMobPhone.Text;
    ButtonOK.Enabled := False;
  end;
end;

procedure TfrmAccountManage.AddAccountToListView(Account: pTAccountDBRecord);
var
  ListItem: TListItem;
begin
  {try
    ListView.Items.BeginUpdate;}
  ListItem := ListView.Items.Add;
  ListItem.Caption := Account.UserEntry.sAccount;
  ListItem.SubItems.AddObject(Account.UserEntry.sPassword, TObject(Account));
  ListItem.SubItems.Add(Account.UserEntry.sUserName);
  ListItem.SubItems.Add(Account.UserEntry.sSSNo);
  ListItem.SubItems.Add(Account.UserEntryAdd.sBirthDay);
  ListItem.SubItems.Add(Account.UserEntry.sQuiz);
  ListItem.SubItems.Add(Account.UserEntry.sAnswer);
  ListItem.SubItems.Add(Account.UserEntryAdd.sQuiz2);
  ListItem.SubItems.Add(Account.UserEntryAdd.sAnswer2);
  ListItem.SubItems.Add(Account.UserEntry.sPhone);
  ListItem.SubItems.Add(Account.UserEntryAdd.sMobilePhone);
  ListItem.SubItems.Add(Account.UserEntry.sEMail);
  ListItem.SubItems.Add(Account.UserEntryAdd.sMemo);
  ListItem.SubItems.Add(Account.UserEntryAdd.sMemo2);
  try
    ListItem.SubItems.Add(DateTimeToStr(Account.Header.CreateDate));
  except
    ListItem.SubItems.Add('');
  end;
  try
    ListItem.SubItems.Add(DateTimeToStr(Account.Header.UpdateDate));
  except
    ListItem.SubItems.Add('');
  end;
  {finally
    ListView.Items.EndUpdate;
  end; }
end;

procedure TfrmAccountManage.AddAccountToEdit(Account: pTAccountDBRecord);
begin
  EditAccount.Text := Account.UserEntry.sAccount;
  EditPassword.Text := Account.UserEntry.sPassword;
  EditConfirm.Text := Account.UserEntry.sPassword;
  EditYourName.Text := Account.UserEntry.sUserName;
  EditBirthDay.Text := Account.UserEntryAdd.sBirthDay;
  EditSSNo.Text := Account.UserEntry.sSSNo;
  EditQuiz1.Text := Account.UserEntry.sQuiz;
  EditAnswer1.Text := Account.UserEntry.sAnswer;

  EditQuiz2.Text := Account.UserEntryAdd.sQuiz2;
  EditAnswer2.Text := Account.UserEntryAdd.sAnswer2;
  EditEMail.Text := Account.UserEntry.sEMail;
  EditPhone.Text := Account.UserEntry.sPhone;
  EditMobPhone.Text := Account.UserEntryAdd.sMobilePhone;

  try
    EditUpdate.Text := DateTimeToStr(Account.Header.UpdateDate);
  except

  end;

  try
    EditCreateDate.Text := DateTimeToStr(Account.Header.CreateDate);
  except

  end;
end;

procedure TfrmAccountManage.ComboBoxAccountSelect(Sender: TObject);
var
  nItemIndex: Integer;
begin
  AccountDBRecord := nil;
  nItemIndex := ComboBoxAccount.ItemIndex;
  if nItemIndex >= 0 then begin
    AccountDBRecord := pTAccountDBRecord(ComboBoxAccount.Items.Objects[nItemIndex]);
    try
      ListView.Items.BeginUpdate;
      ListView.Clear;
    finally
      ListView.Items.EndUpdate;
    end;
    AddAccountToListView(AccountDBRecord);
    AddAccountToEdit(AccountDBRecord);
  end;
end;

procedure TfrmAccountManage.ListViewClick(Sender: TObject);
var
  ListItem: TListItem;
begin
  ListItem := ListView.Selected;
  if ListItem <> nil then begin
    AccountDBRecord := pTAccountDBRecord(ListItem.SubItems.Objects[0]);
    AddAccountToEdit(AccountDBRecord);
    ButtonDelAccount.Enabled := True;
  end;
end;

procedure TfrmAccountManage.EditPasswordChange(Sender: TObject);
begin
  ButtonOK.Enabled := True;
end;

procedure TfrmAccountManage.ButtonPrecisionSearchClick(Sender: TObject);
var
  sAccount: string;
  I: Integer;
begin
  sAccount := Trim(EditAccount.Text);
  if Length(sAccount) < 4 then Exit;
  PanelActSearchAccount.Enabled := False;

  if Assigned(g_FileIDDB.OnStart) then g_FileIDDB.OnStart(Self,
      g_FileIDDB.m_IDDBList.Count, '���ڲ��ң����Ժ�...');
  for I := 0 to g_FileIDDB.m_IDDBList.Count - 1 do begin
    if g_boSoftClose then Break;
    if Assigned(g_FileIDDB.OnProgress) then g_FileIDDB.OnProgress(Self, I + 1, '');
    Application.ProcessMessages;
    if CompareText(g_FileIDDB.m_IDDBList.Strings[I], sAccount) = 0 then begin
      ComboBoxAccount.ItemIndex := I;
      Break;
    end;
  end;
  ComboBoxAccountSelect(ComboBoxAccount);
  PanelActSearchAccount.Enabled := True;
  if Assigned(g_FileIDDB.OnStop) then g_FileIDDB.OnStop(Self, 0,
      '�������');
end;

procedure TfrmAccountManage.ButtonMistySearchClick(Sender: TObject);
var
  sAccount: string;
  I: Integer;
  DBRecord: pTAccountDBRecord;
begin
  sAccount := Trim(EditAccount.Text);
  if Length(sAccount) < 1 then Exit;
  PanelActSearchAccount.Enabled := False;
  if Assigned(g_FileIDDB.OnStart) then g_FileIDDB.OnStart(Self,
      g_FileIDDB.m_IDDBList.Count, '���ڲ��ң����Ժ�...');
  try
    ListView.Items.BeginUpdate;
    ListView.Clear;
  finally
    ListView.Items.EndUpdate;
  end;
  for I := 0 to g_FileIDDB.m_IDDBList.Count - 1 do begin
    if g_boSoftClose then Break;
    if Assigned(g_FileIDDB.OnProgress) then g_FileIDDB.OnProgress(Self, I + 1, '');
    Application.ProcessMessages;
    if AnsiContainsText(g_FileIDDB.m_IDDBList.Strings[I], sAccount) or AnsiContainsText(sAccount, g_FileIDDB.m_IDDBList.Strings[I]) then begin
      AddAccountToListView(pTAccountDBRecord(g_FileIDDB.m_IDDBList.Objects[I]));
    end;
  end;
  PanelActSearchAccount.Enabled := True;
  if Assigned(g_FileIDDB.OnStop) then g_FileIDDB.OnStop(Self, 0,
      '�������');
end;

procedure TfrmAccountManage.ButtonDelAccountClick(Sender: TObject);
var
  I, II, III: Integer;
  ListItem: TListItem;
  sAccount: string;
  HumInfo: pTHumInfo;
  HumData: pTHumDataInfo;
begin
  ListItem := ListView.Selected;
  if ListItem <> nil then begin
    sAccount := pTAccountDBRecord(ListItem.SubItems.Objects[0]).UserEntry.sAccount;
    if Application.MessageBox(PChar('�Ƿ�ȷ��Ҫɾ���˺ţ� ' + sAccount + ' ��'),
      '��ʾ��Ϣ',
      MB_YESNO + MB_ICONQUESTION) <> IDYES then Exit;

    for I := g_FileIDDB.m_IDDBList.Count - 1 downto 0 do begin
      if g_FileIDDB.m_IDDBList.Objects[I] = ListItem.SubItems.Objects[0] then begin
        Dispose(pTAccountDBRecord(g_FileIDDB.m_IDDBList.Objects[I]));
        g_FileIDDB.m_IDDBList.Delete(I);
        ListView.DeleteSelected;
        for II := 0 to Length(g_StartProc) - 1 do begin
          TStartProc(g_StartProc[II])();
        end;

        for II := g_FileHumDB.m_HumCharNameList.Count - 1 downto 0 do begin
          HumInfo := pTHumInfo(g_FileHumDB.m_HumCharNameList.Objects[II]);
          if CompareText(HumInfo.sAccount, sAccount) = 0 then begin
            g_FileHumDB.Delete(HumInfo);
            Dispose(HumInfo);
          end;
        end;

        for II := g_FileDB.m_MirCharNameList.Count - 1 downto 0 do begin
          HumData := pTHumDataInfo(g_FileDB.m_MirCharNameList.Objects[II]);
          if CompareText(HumData.Data.sAccount, sAccount) = 0 then begin
            g_FileDB.Delete(HumData);
            Dispose(HumData);
          end;
        end;

        Break;
      end;
    end;
  end;
  g_FileIDDB.m_IDDBList.SortString(0, g_FileIDDB.m_IDDBList.Count - 1);
  g_FileHumDB.m_HumDBList.SortString(0, g_FileHumDB.m_HumDBList.Count - 1);
  g_FileHumDB.m_HumCharNameList.SortString(0, g_FileHumDB.m_HumCharNameList.Count - 1);
  g_FileDB.m_MirDBList.SortString(0, g_FileDB.m_MirDBList.Count - 1);
  g_FileDB.m_MirCharNameList.SortString(0, g_FileDB.m_MirCharNameList.Count - 1);
  ButtonDelAccount.Enabled := False;
end;

end.

