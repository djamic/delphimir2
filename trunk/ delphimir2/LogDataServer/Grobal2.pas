unit Grobal2;

interface
uses
  Windows;
const
  DEFBLOCKSIZE = 16;
  BUFFERSIZE = 10000;
  GS_QUIT = 2000;
  SG_FORMHANDLE=1000;//������HANLD
  SG_STARTNOW=1001;  //��������������...
  SG_STARTOK=1002;   //�������...
type
  TDefaultMessage = record
    Recog: Integer;
    Ident: word;
    Param: word;
    Tag: word;
    Series: word;
  end;
  
implementation

end.
