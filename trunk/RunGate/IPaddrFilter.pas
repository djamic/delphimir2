unit IPaddrFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, WinSock, Menus, Spin, IniFiles, ComCtrls;

type
  TfrmIPaddrFilter = class(TForm)
    BlockListPopupMenu: TPopupMenu;
    TempBlockListPopupMenu: TPopupMenu;
    TPOPMENU_SORT: TMenuItem;
    TPOPMENU_BLOCKLIST: TMenuItem;
    TPOPMENU_DELETE: TMenuItem;
    BPOPMENU_ADDTEMPLIST: TMenuItem;
    BPOPMENU_SORT: TMenuItem;
    BPOPMENU_DELETE: TMenuItem;
    TPOPMENU_REFLIST: TMenuItem;
    BPOPMENU_REFLIST: TMenuItem;
    TPOPMENU_ADD: TMenuItem;
    BPOPMENU_ADD: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    LabelTempList: TLabel;
    ListBoxTempList: TListBox;
    Label1: TLabel;
    ListBoxBlockList: TListBox;
    Label2: TLabel;
    EditMaxConnect: TSpinEdit;
    Label9: TLabel;
    EditClientTimeOutTime: TSpinEdit;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    Label8: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    EditMaxSize: TSpinEdit;
    EditMaxClientMsgCount: TSpinEdit;
    CheckBoxLostLine: TCheckBox;
    EditNomSize: TSpinEdit;
    SpinEditAttackTick: TSpinEdit;
    SpinEditAttackCount: TSpinEdit;
    GroupBox3: TGroupBox;
    RadioAddBlockList: TRadioButton;
    RadioAddTempList: TRadioButton;
    RadioDisConnect: TRadioButton;
    Label7: TLabel;
    ButtonOK: TButton;
    procedure FormCreate(Sender: TObject);
    procedure TPOPMENU_SORTClick(Sender: TObject);
    procedure TPOPMENU_BLOCKLISTClick(Sender: TObject);
    procedure TPOPMENU_DELETEClick(Sender: TObject);
    procedure BPOPMENU_SORTClick(Sender: TObject);
    procedure BPOPMENU_ADDTEMPLISTClick(Sender: TObject);
    procedure BPOPMENU_DELETEClick(Sender: TObject);
    procedure TempBlockListPopupMenuPopup(Sender: TObject);
    procedure BlockListPopupMenuPopup(Sender: TObject);
    procedure EditMaxConnectChange(Sender: TObject);
    procedure RadioDisConnectClick(Sender: TObject);
    procedure RadioAddBlockListClick(Sender: TObject);
    procedure RadioAddTempListClick(Sender: TObject);
    procedure TPOPMENU_REFLISTClick(Sender: TObject);
    procedure BPOPMENU_REFLISTClick(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure EditMaxSizeChange(Sender: TObject);
    procedure TPOPMENU_ADDClick(Sender: TObject);
    procedure BPOPMENU_ADDClick(Sender: TObject);
    procedure EditMaxClientMsgCountChange(Sender: TObject);
    procedure CheckBoxLostLineClick(Sender: TObject);
    procedure EditClientTimeOutTimeChange(Sender: TObject);
    procedure EditNomSizeChange(Sender: TObject);
    procedure SpinEditAttackTickChange(Sender: TObject);
    procedure SpinEditAttackCountChange(Sender: TObject);
    procedure ListBoxTempListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListBoxBlockListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIPaddrFilter: TfrmIPaddrFilter;

implementation

uses Main, GateShare, HUtil32;

{$R *.dfm}

procedure TfrmIPaddrFilter.FormCreate(Sender: TObject);
begin
  ListBoxTempList.Clear;
  ListBoxBlockList.Clear;
end;

procedure TfrmIPaddrFilter.ListBoxBlockListKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  I: Integer;
  sIPaddr: string;
begin
  case Key of
    Word('F'): begin
        if ssCtrl in Shift then begin
          Key := 0;
          sIPaddr := '';
          if not InputQuery('IP��ѯ', '����IP��ַ:', sIPaddr) then Exit;
          if not IsIPaddr(sIPaddr) then begin
            Application.MessageBox('�����IP��ַ��ʽ����ȷ������', '������Ϣ', MB_OK + MB_ICONERROR);
            Exit;
          end;
          for I := 0 to ListBoxBlockList.Items.Count - 1 do begin
            if ListBoxBlockList.Items.Strings[I] = sIPaddr then begin
              ListBoxBlockList.ItemIndex := I;
              break;
            end;
          end;
        end;
      end;
  end;
end;

procedure TfrmIPaddrFilter.ListBoxTempListKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  I: Integer;
  sIPaddr: string;
begin
  case Key of
    Word('F'): begin
        if ssCtrl in Shift then begin
          Key := 0;
          sIPaddr := '';
          if not InputQuery('IP��ѯ', '����IP��ַ:', sIPaddr) then Exit;
          if not IsIPaddr(sIPaddr) then begin
            Application.MessageBox('�����IP��ַ��ʽ����ȷ������', '������Ϣ', MB_OK + MB_ICONERROR);
            Exit;
          end;
          for I := 0 to ListBoxTempList.Items.Count - 1 do begin
            if ListBoxTempList.Items.Strings[I] = sIPaddr then begin
              ListBoxTempList.ItemIndex := I;
              break;
            end;
          end;
        end;
      end;
  end;
end;

procedure TfrmIPaddrFilter.TPOPMENU_SORTClick(Sender: TObject);
begin
  ListBoxTempList.Sorted := True;
end;

procedure TfrmIPaddrFilter.TPOPMENU_BLOCKLISTClick(Sender: TObject);
var
  sIPaddr: string;
  i: Integer;
  nIPaddr: Integer;
begin
  if (ListBoxTempList.ItemIndex >= 0) and (ListBoxTempList.ItemIndex < ListBoxTempList.Items.Count) then begin
    sIPaddr := ListBoxTempList.Items.Strings[ListBoxTempList.ItemIndex];
    ListBoxTempList.Items.Delete(ListBoxTempList.ItemIndex);
    nIPaddr := inet_addr(PAnsiChar(sIPaddr));
    for i := 0 to TempBlockIPList.Count - 1 do begin
      if pTSockaddr(TempBlockIPList.Items[i]).nIPaddr = nIPaddr then begin
        TempBlockIPList.Delete(i);
        break;
      end;
    end;
    ListBoxBlockList.Items.Add(sIPaddr);
    FrmMain.AddBlockIP(sIPaddr);
  end;
end;

procedure TfrmIPaddrFilter.TPOPMENU_DELETEClick(Sender: TObject);
var
  sIPaddr: string;
  I,II: Integer;
  nIPaddr: Integer;
begin
  for I := 0 to ListBoxTempList.Items.Count - 1 do begin
    if ListBoxTempList.Selected[I] then begin
      sIPaddr := ListBoxTempList.Items.Strings[I];
      nIPaddr := inet_addr(PAnsiChar(sIPaddr));
      for II := TempBlockIPList.Count - 1 downto 0 do begin
        if pTSockaddr(TempBlockIPList.Items[II]).nIPaddr = nIPaddr then begin
          Dispose(pTSockaddr(TempBlockIPList.Items[II]));
          TempBlockIPList.Delete(II);
        //break;
        end;
      end;
    end;
  end;
  ListBoxTempList.Items.Clear;
  for I := 0 to TempBlockIPList.Count - 1 do begin
    ListBoxTempList.Items.Add(StrPas(inet_ntoa(TInAddr(pTSockaddr(TempBlockIPList.Items[I]).nIPaddr))));
  end;
  {if (ListBoxTempList.ItemIndex >= 0) and (ListBoxTempList.ItemIndex < ListBoxTempList.Items.Count) then begin
    sIPaddr := ListBoxTempList.Items.Strings[ListBoxTempList.ItemIndex];
    ListBoxTempList.Items.Delete(ListBoxTempList.ItemIndex);
    nIPaddr := inet_addr(PChar(sIPaddr));
    for i := TempBlockIPList.Count - 1 downto 0 do begin
      if pTSockaddr(TempBlockIPList.Items[i]).nIPaddr = nIPaddr then begin
        TempBlockIPList.Delete(i);
        //break;
      end;
    end;
  end;}
end;

procedure TfrmIPaddrFilter.BPOPMENU_SORTClick(Sender: TObject);
begin
  ListBoxBlockList.Sorted := True;
end;

procedure TfrmIPaddrFilter.BPOPMENU_ADDTEMPLISTClick(Sender: TObject);
var
  sIPaddr: string;
  i: Integer;
  nIPaddr: Integer;
begin
  if (ListBoxBlockList.ItemIndex >= 0) and (ListBoxBlockList.ItemIndex < ListBoxBlockList.Items.Count) then begin
    sIPaddr := ListBoxBlockList.Items.Strings[ListBoxBlockList.ItemIndex];
    ListBoxBlockList.Items.Delete(ListBoxBlockList.ItemIndex);
    nIPaddr := inet_addr(PAnsiChar(sIPaddr));
    for i := 0 to BlockIPList.Count - 1 do begin
      if pTSockaddr(BlockIPList.Items[i]).nIPaddr = nIPaddr then begin
        BlockIPList.Delete(i);
        break;
      end;
    end;
    ListBoxTempList.Items.Add(sIPaddr);
    FrmMain.AddTempBlockIP(sIPaddr);
  end;
end;

procedure TfrmIPaddrFilter.BPOPMENU_DELETEClick(Sender: TObject);
var
  sIPaddr: string;
  I,II: Integer;
  nIPaddr: Integer;
begin
  for I := 0 to ListBoxBlockList.Items.Count - 1 do begin
    if ListBoxBlockList.Selected[I] then begin
      sIPaddr := ListBoxBlockList.Items.Strings[I];
      nIPaddr := inet_addr(PAnsiChar(sIPaddr));
      for II := BlockIPList.Count - 1 downto 0 do begin
        if pTSockaddr(BlockIPList.Items[II]).nIPaddr = nIPaddr then begin
          Dispose(pTSockaddr(BlockIPList.Items[II]));
          BlockIPList.Delete(II);

        //break;
        end;
      end;
    end;
  end;
  ListBoxBlockList.Items.Clear;
  for I := 0 to BlockIPList.Count - 1 do begin
    ListBoxBlockList.Items.Add(StrPas(inet_ntoa(TInAddr(pTSockaddr(BlockIPList.Items[I]).nIPaddr))));
  end;
  {if (ListBoxBlockList.ItemIndex >= 0) and (ListBoxBlockList.ItemIndex < ListBoxBlockList.Items.Count) then begin
    sIPaddr := ListBoxBlockList.Items.Strings[ListBoxBlockList.ItemIndex];
    ListBoxBlockList.Items.Delete(ListBoxBlockList.ItemIndex);
    nIPaddr := inet_addr(PChar(sIPaddr));
    for i := BlockIPList.Count - 1 downto 0 do begin
      if pTSockaddr(BlockIPList.Items[i]).nIPaddr = nIPaddr then begin
        BlockIPList.Delete(i);
        //break;
      end;
    end;
  end;}
end;
{var
  sIPaddr: string;
  i: Integer;
  IPaddr: pTSockaddr;
  nIPaddr: Integer;
begin
  if (ListBoxBlockList.ItemIndex >= 0) and (ListBoxBlockList.ItemIndex < ListBoxBlockList.Items.Count) then begin
    sIPaddr := ListBoxBlockList.Items.Strings[ListBoxBlockList.ItemIndex];
    nIPaddr := inet_addr(PChar(sIPaddr));
    ListBoxBlockList.Items.Delete(ListBoxBlockList.ItemIndex);
    for i := 0 to BlockIPList.Count - 1 do begin
      if pTSockaddr(BlockIPList.Items[i]).nIPaddr = nIPaddr then begin
        BlockIPList.Delete(i);
        break;
      end;
    end;
  end;
end;}

procedure TfrmIPaddrFilter.TempBlockListPopupMenuPopup(Sender: TObject);
var
  boCheck: Boolean;
begin
  TPOPMENU_SORT.Enabled := ListBoxTempList.Items.Count > 0;

  boCheck := (ListBoxTempList.ItemIndex >= 0) and (ListBoxTempList.ItemIndex < ListBoxTempList.Items.Count);

  TPOPMENU_BLOCKLIST.Enabled := boCheck;
  TPOPMENU_DELETE.Enabled := boCheck;
end;

procedure TfrmIPaddrFilter.BlockListPopupMenuPopup(Sender: TObject);
var
  boCheck: Boolean;
begin
  BPOPMENU_SORT.Enabled := ListBoxBlockList.Items.Count > 0;

  boCheck := (ListBoxBlockList.ItemIndex >= 0) and (ListBoxBlockList.ItemIndex < ListBoxBlockList.Items.Count);

  BPOPMENU_ADDTEMPLIST.Enabled := boCheck;
  BPOPMENU_DELETE.Enabled := boCheck;
end;

procedure TfrmIPaddrFilter.EditMaxConnectChange(Sender: TObject);
begin
  nMaxConnOfIPaddr := EditMaxConnect.Value;
end;

procedure TfrmIPaddrFilter.RadioDisConnectClick(Sender: TObject);
begin
  if RadioDisConnect.Checked then BlockMethod := mDisconnect;
end;

procedure TfrmIPaddrFilter.RadioAddBlockListClick(Sender: TObject);
begin
  if RadioAddBlockList.Checked then BlockMethod := mBlockList;
end;

procedure TfrmIPaddrFilter.RadioAddTempListClick(Sender: TObject);
begin
  if RadioAddTempList.Checked then BlockMethod := mBlock;
end;

procedure TfrmIPaddrFilter.TPOPMENU_REFLISTClick(Sender: TObject);
var
  i: Integer;
begin
  ListBoxTempList.Clear;
  for i := 0 to TempBlockIPList.Count - 1 do begin
    frmIPaddrFilter.ListBoxTempList.Items.Add(StrPas(inet_ntoa(TInAddr(pTSockaddr(TempBlockIPList.Items[i]).nIPaddr))));
  end;
end;

procedure TfrmIPaddrFilter.BPOPMENU_REFLISTClick(Sender: TObject);
var
  i: Integer;
  IPaddr: pTSockaddr;
begin
  ListBoxBlockList.Clear;
  for i := 0 to BlockIPList.Count - 1 do begin
    frmIPaddrFilter.ListBoxTempList.Items.Add(StrPas(inet_ntoa(TInAddr(pTSockaddr(BlockIPList.Items[i]).nIPaddr))));
  end;
end;

procedure TfrmIPaddrFilter.ButtonOKClick(Sender: TObject);
begin
  Conf.WriteInteger(GateClass, 'AttackTick', dwAttackTick);
  Conf.WriteInteger(GateClass, 'AttackCount', nAttackCount);
  Conf.WriteInteger(GateClass, 'MaxConnOfIPaddr', nMaxConnOfIPaddr);
  Conf.WriteInteger(GateClass, 'BlockMethod', Integer(BlockMethod));
  Conf.WriteInteger(GateClass, 'MaxClientPacketSize', nMaxClientPacketSize);
  Conf.WriteInteger(GateClass, 'NomClientPacketSize', nNomClientPacketSize);
  Conf.WriteInteger(GateClass, 'MaxClientMsgCount', nMaxClientMsgCount);
  Conf.WriteBool(GateClass, 'kickOverPacket', bokickOverPacketSize);
  Conf.WriteInteger(GateClass, 'ClientTimeOutTime', dwClientTimeOutTime);
  Close;
end;

procedure TfrmIPaddrFilter.EditMaxSizeChange(Sender: TObject);
begin
  nMaxClientPacketSize := EditMaxSize.Value;
end;

procedure TfrmIPaddrFilter.TPOPMENU_ADDClick(Sender: TObject);
var
  sIPaddress: string;
begin
  sIPaddress := '';
  if not InputQuery('����IP����', '������һ���µ�IP��ַ: ', sIPaddress) then Exit;
  if not IsIPaddr(sIPaddress) then begin
    Application.MessageBox('����ĵ�ַ��ʽ���󣡣���', '������Ϣ', MB_OK + MB_ICONERROR);
    Exit;
  end;
  ListBoxTempList.Items.Add(sIPaddress);
  FrmMain.AddTempBlockIP(sIPaddress);
end;

procedure TfrmIPaddrFilter.BPOPMENU_ADDClick(Sender: TObject);
var
  sIPaddress: string;
begin
  sIPaddress := '';
  if not InputQuery('����IP����', '������һ���µ�IP��ַ: ', sIPaddress) then Exit;
  if not IsIPaddr(sIPaddress) then begin
    if Application.MessageBox('����ĵ�ַ��ʽ���������Ƿ���ӣ�',
      '������Ϣ',
      MB_YESNO + MB_ICONQUESTION) <> ID_YES then
      Exit;
  end;
  ListBoxBlockList.Items.Add(sIPaddress);
  FrmMain.AddBlockIP(sIPaddress);
  SaveBlockIPList();
end;

procedure TfrmIPaddrFilter.EditMaxClientMsgCountChange(Sender: TObject);
begin
  nMaxClientMsgCount := EditMaxClientMsgCount.Value;
end;

procedure TfrmIPaddrFilter.CheckBoxLostLineClick(Sender: TObject);
begin
  bokickOverPacketSize := CheckBoxLostLine.Checked;
end;

procedure TfrmIPaddrFilter.EditClientTimeOutTimeChange(Sender: TObject);
begin
  dwClientTimeOutTime := EditClientTimeOutTime.Value * 1000;
end;

procedure TfrmIPaddrFilter.EditNomSizeChange(Sender: TObject);
begin
  nNomClientPacketSize := EditNomSize.Value;
end;

procedure TfrmIPaddrFilter.SpinEditAttackTickChange(Sender: TObject);
begin
  dwAttackTick := SpinEditAttackTick.Value;
end;

procedure TfrmIPaddrFilter.SpinEditAttackCountChange(Sender: TObject);
begin
  nAttackCount := SpinEditAttackCount.Value;
end;

end.

