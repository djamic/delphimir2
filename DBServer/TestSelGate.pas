unit TestSelGate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmTestSelGate = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EditSelGate: TEdit;
    Label2: TLabel;
    EditGameGate: TEdit;
    ButtonTest: TButton;
    Button1: TButton;
    procedure ButtonTestClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTestSelGate: TfrmTestSelGate;

implementation

uses RouteManage, DBShare;
{$R *.dfm}

procedure TfrmTestSelGate.ButtonTestClick(Sender: TObject);
var
  sSelGateIPaddr: string;
  sGameGateIPaddr: string;
  nGameGatePort: Integer;
begin
  sSelGateIPaddr := Trim(EditSelGate.Text);
  sGameGateIPaddr := GateRouteIP(sSelGateIPaddr, nGameGatePort);
  if sGameGateIPaddr = '' then
  begin
    EditGameGate.Text := 'IP không đúng';
    Exit;
  end;
  EditGameGate.Text := format('%s:%d', [sGameGateIPaddr, nGameGatePort]);
end;

procedure TfrmTestSelGate.Button1Click(Sender: TObject);
begin
  close;
  frmRouteManage.Open;
end;

end.
