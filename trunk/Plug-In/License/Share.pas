unit Share;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, PlugShare;
  //    cRegistryKey: array[0..300 - 1] of Char;
var
  R_SystemInitialize: PBoolean;
  R_nOwner, R_nUserNumber, R_nVersion: PInteger;
  R_boShareAllow: Boolean; //��������
  R_ShareStatus: TRegistryStatus; //����ģʽ
  R_nShareNumber: Integer; //���ô���
  R_ShareDate: TDate; //��������

  R_MyRootKey: Integer = HKEY_CURRENT_USER; //ע������
  R_MySubKey: string = '\Software\Registry\'; //ע����Ӽ�
  R_Key: string = 'Key';
  R_nRegistryCount:Integer=0;
  R_SystemConfig: TSystemConfig;
implementation

end.

