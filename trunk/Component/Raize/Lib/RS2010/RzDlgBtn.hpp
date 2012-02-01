// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Rzdlgbtn.pas' rev: 21.00

#ifndef RzdlgbtnHPP
#define RzdlgbtnHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Stdctrls.hpp>	// Pascal unit
#include <Extctrls.hpp>	// Pascal unit
#include <Rzbutton.hpp>	// Pascal unit
#include <Sysutils.hpp>	// Pascal unit
#include <Rzcommon.hpp>	// Pascal unit
#include <Rzpanel.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Rzdlgbtn
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TRzDialogButtons;
class PASCALIMPLEMENTATION TRzDialogButtons : public Rzpanel::TRzCustomPanel
{
	typedef Rzpanel::TRzCustomPanel inherited;
	
private:
	Rzcommon::TRzAboutInfo FAboutInfo;
	bool FShowDivider;
	bool FShowGlyphs;
	StaticArray<int, 3> FWidths;
	Classes::TNotifyEvent FOnClickOk;
	Classes::TNotifyEvent FOnClickCancel;
	Classes::TNotifyEvent FOnClickHelp;
	int FButtonHeight;
	int FButtonWidth;
	void __fastcall ReadOldFrameFlatProp(Classes::TReader* Reader);
	void __fastcall BtnOkClickHandler(System::TObject* Sender);
	void __fastcall BtnCancelClickHandler(System::TObject* Sender);
	void __fastcall BtnHelpClickHandler(System::TObject* Sender);
	
protected:
	Rzbutton::TRzBitBtn* FBtnOk;
	Rzbutton::TRzBitBtn* FBtnCancel;
	Rzbutton::TRzBitBtn* FBtnHelp;
	virtual void __fastcall CreateButtons(void);
	virtual void __fastcall DefineProperties(Classes::TFiler* Filer);
	virtual void __fastcall Loaded(void);
	virtual void __fastcall Paint(void);
	DYNAMIC void __fastcall ChangeScale(int M, int D);
	virtual void __fastcall AdjustPanelSize(void);
	virtual void __fastcall PositionButtons(void);
	DYNAMIC void __fastcall Resize(void);
	DYNAMIC void __fastcall BtnOkClick(void);
	DYNAMIC void __fastcall BtnCancelClick(void);
	DYNAMIC void __fastcall BtnHelpClick(void);
	virtual Classes::TBasicAction* __fastcall GetBtnAction(int Index);
	virtual void __fastcall SetBtnAction(int Index, Classes::TBasicAction* Value);
	virtual Controls::TAlign __fastcall GetAlign(void);
	HIDESBASE virtual void __fastcall SetAlign(Controls::TAlign Value);
	virtual Graphics::TColor __fastcall GetButtonColor(void);
	virtual void __fastcall SetButtonColor(Graphics::TColor Value);
	virtual Graphics::TColor __fastcall GetButtonFrameColor(void);
	virtual void __fastcall SetButtonFrameColor(Graphics::TColor Value);
	virtual Controls::TCaption __fastcall GetOkCaption(void);
	virtual void __fastcall SetOkCaption(const Controls::TCaption Value);
	bool __fastcall StoreOkCaption(void);
	virtual Controls::TCaption __fastcall GetCancelCaption(void);
	virtual void __fastcall SetCancelCaption(const Controls::TCaption Value);
	bool __fastcall StoreCancelCaption(void);
	virtual Controls::TCaption __fastcall GetHelpCaption(void);
	virtual void __fastcall SetHelpCaption(const Controls::TCaption Value);
	bool __fastcall StoreHelpCaption(void);
	virtual bool __fastcall GetBtnEnable(int Index);
	virtual void __fastcall SetBtnEnable(int Index, bool Value);
	virtual int __fastcall GetBtnWidth(int Index);
	virtual void __fastcall SetBtnWidth(int Index, const int Value);
	virtual void __fastcall SetShowDivider(bool Value);
	virtual void __fastcall SetShowGlyphs(bool Value);
	virtual bool __fastcall GetShowButton(int Index);
	virtual void __fastcall SetShowButton(int Index, bool Value);
	virtual bool __fastcall GetCancelCancel(void);
	virtual void __fastcall SetCancelCancel(bool Value);
	virtual bool __fastcall GetOKDefault(void);
	virtual void __fastcall SetOKDefault(bool Value);
	virtual bool __fastcall GetHotTrack(void);
	virtual void __fastcall SetHotTrack(bool Value);
	virtual Graphics::TColor __fastcall GetHotTrackColor(void);
	virtual void __fastcall SetHotTrackColor(Graphics::TColor Value);
	virtual Rzcommon::TRzHotTrackColorType __fastcall GetHotTrackColorType(void);
	virtual void __fastcall SetHotTrackColorType(Rzcommon::TRzHotTrackColorType Value);
	virtual Graphics::TColor __fastcall GetHighlightColor(void);
	virtual void __fastcall SetHighlightColor(Graphics::TColor Value);
	virtual Controls::TModalResult __fastcall GetBtnModalResult(int Index);
	virtual void __fastcall SetBtnModalResult(int Index, Controls::TModalResult Value);
	
public:
	__fastcall virtual TRzDialogButtons(Classes::TComponent* AOwner);
	__property Rzbutton::TRzBitBtn* BtnOK = {read=FBtnOk};
	__property Rzbutton::TRzBitBtn* BtnCancel = {read=FBtnCancel};
	__property Rzbutton::TRzBitBtn* BtnHelp = {read=FBtnHelp};
	
__published:
	__property Rzcommon::TRzAboutInfo About = {read=FAboutInfo, write=FAboutInfo, stored=false, nodefault};
	__property Classes::TBasicAction* ActionOk = {read=GetBtnAction, write=SetBtnAction, index=1};
	__property Classes::TBasicAction* ActionCancel = {read=GetBtnAction, write=SetBtnAction, index=2};
	__property Classes::TBasicAction* ActionHelp = {read=GetBtnAction, write=SetBtnAction, index=3};
	__property Controls::TAlign Align = {read=GetAlign, write=SetAlign, default=2};
	__property Graphics::TColor ButtonColor = {read=GetButtonColor, write=SetButtonColor, default=-16777201};
	__property Graphics::TColor ButtonFrameColor = {read=GetButtonFrameColor, write=SetButtonFrameColor, default=-16777195};
	__property Controls::TCaption CaptionOk = {read=GetOkCaption, write=SetOkCaption, stored=StoreOkCaption};
	__property Controls::TCaption CaptionCancel = {read=GetCancelCaption, write=SetCancelCaption, stored=StoreCancelCaption};
	__property Controls::TCaption CaptionHelp = {read=GetHelpCaption, write=SetHelpCaption, stored=StoreHelpCaption};
	__property bool EnableOk = {read=GetBtnEnable, write=SetBtnEnable, index=1, default=1};
	__property bool EnableCancel = {read=GetBtnEnable, write=SetBtnEnable, index=2, default=1};
	__property bool EnableHelp = {read=GetBtnEnable, write=SetBtnEnable, index=3, default=1};
	__property bool HotTrack = {read=GetHotTrack, write=SetHotTrack, default=0};
	__property Graphics::TColor HighlightColor = {read=GetHighlightColor, write=SetHighlightColor, default=-16777203};
	__property Graphics::TColor HotTrackColor = {read=GetHotTrackColor, write=SetHotTrackColor, default=1350640};
	__property Rzcommon::TRzHotTrackColorType HotTrackColorType = {read=GetHotTrackColorType, write=SetHotTrackColorType, default=1};
	__property bool CancelCancel = {read=GetCancelCancel, write=SetCancelCancel, default=1};
	__property bool OKDefault = {read=GetOKDefault, write=SetOKDefault, default=1};
	__property Controls::TModalResult ModalResultOk = {read=GetBtnModalResult, write=SetBtnModalResult, index=1, default=1};
	__property Controls::TModalResult ModalResultCancel = {read=GetBtnModalResult, write=SetBtnModalResult, index=2, default=2};
	__property Controls::TModalResult ModalResultHelp = {read=GetBtnModalResult, write=SetBtnModalResult, index=3, default=0};
	__property bool ShowDivider = {read=FShowDivider, write=SetShowDivider, default=0};
	__property bool ShowGlyphs = {read=FShowGlyphs, write=SetShowGlyphs, default=0};
	__property bool ShowOKButton = {read=GetShowButton, write=SetShowButton, index=1, default=1};
	__property bool ShowCancelButton = {read=GetShowButton, write=SetShowButton, index=2, default=1};
	__property bool ShowHelpButton = {read=GetShowButton, write=SetShowButton, index=3, default=0};
	__property int WidthOk = {read=GetBtnWidth, write=SetBtnWidth, index=1, default=75};
	__property int WidthCancel = {read=GetBtnWidth, write=SetBtnWidth, index=2, default=75};
	__property int WidthHelp = {read=GetBtnWidth, write=SetBtnWidth, index=3, default=75};
	__property Classes::TNotifyEvent OnClickOk = {read=FOnClickOk, write=FOnClickOk};
	__property Classes::TNotifyEvent OnClickCancel = {read=FOnClickCancel, write=FOnClickCancel};
	__property Classes::TNotifyEvent OnClickHelp = {read=FOnClickHelp, write=FOnClickHelp};
	__property Color = {default=-16777201};
	__property Ctl3D;
	__property DragCursor = {default=-12};
	__property DragMode = {default=0};
	__property Font;
	__property FullRepaint = {default=1};
	__property GradientColorStyle = {default=0};
	__property GradientColorStart = {default=16777215};
	__property GradientColorStop = {default=-16777201};
	__property GradientDirection = {default=2};
	__property Height = {default=36};
	__property Locked = {default=0};
	__property ParentColor = {default=0};
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property PopupMenu;
	__property ShowHint;
	__property TabOrder = {default=-1};
	__property TabStop = {default=0};
	__property Visible = {default=1};
	__property VisualStyle = {default=1};
	__property OnClick;
	__property OnContextPopup;
	__property OnDblClick;
	__property OnDragDrop;
	__property OnDragOver;
	__property OnEndDrag;
	__property OnEnter;
	__property OnExit;
	__property OnMouseActivate;
	__property OnMouseDown;
	__property OnMouseMove;
	__property OnMouseUp;
	__property OnResize;
	__property OnStartDrag;
public:
	/* TRzCustomPanel.Destroy */ inline __fastcall virtual ~TRzDialogButtons(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TRzDialogButtons(HWND ParentWindow) : Rzpanel::TRzCustomPanel(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Rzdlgbtn */
using namespace Rzdlgbtn;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// RzdlgbtnHPP
