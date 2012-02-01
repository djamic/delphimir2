{=======================================================================================================================
  ListBoxesFrame Unit

  Raize Components - Demo Program Source Unit

  Copyright © 1995-2002 by Raize Software, Inc.  All Rights Reserved.
=======================================================================================================================}

{$I RCDemo.inc}

unit ListBoxesFrame;

interface

uses
  Forms,
  RzLstBox,
  RzChkLst,
  ExtCtrls,
  RzPanel,
  Controls,
  StdCtrls,
  Classes,
  Windows,
  RzCommon,
  RzLabel, ImgList;
  
type
  TFmeListBoxes = class(TFrame)
    GrpListBox: TRzGroupBox;
    GrpTRzTabbedListBox: TRzGroupBox;
    LstTitles: TRzListBox;
    LstTimes: TRzTabbedListBox;
    GrpTRzCheckList: TRzGroupBox;
    LstVersions: TRzCheckList;
    GrpTRzEditListBox: TRzGroupBox;
    LstEditTitles: TRzEditListBox;
    RzPanel1: TRzPanel;
    HdrTimes: THeader;
    pnlHeader: TRzPanel;
    ImageList1: TImageList;
    procedure HdrTimesSized(Sender: TObject; ASection, AWidth: Integer);
  private
    { Private declarations }
  public
    procedure Init;
    procedure UpdateVisualStyle( VS: TRzVisualStyle; GCS: TRzGradientColorStyle );
  end;


implementation

{$R *.dfm}


procedure TFmeListBoxes.Init;
begin
  ParentBackground := False;
end;


procedure TFmeListBoxes.UpdateVisualStyle( VS: TRzVisualStyle;
                                           GCS: TRzGradientColorStyle );
begin
  pnlHeader.VisualStyle := VS;
  pnlHeader.GradientColorStyle := GCS;
end;


procedure TFmeListBoxes.HdrTimesSized(Sender: TObject; ASection, AWidth: Integer);
begin
  LstTimes.UpdateFromHeader( HdrTimes );
end;


end.
