// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Rzdbrgrp.pas' rev: 21.00

#ifndef RzdbrgrpHPP
#define RzdbrgrpHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Sysutils.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Stdctrls.hpp>	// Pascal unit
#include <Rzradgrp.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Db.hpp>	// Pascal unit
#include <Rzpanel.hpp>	// Pascal unit
#include <Dbctrls.hpp>	// Pascal unit
#include <Extctrls.hpp>	// Pascal unit
#include <Rzcommon.hpp>	// Pascal unit
#include <Imglist.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Rzdbrgrp
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TRzDBRadioGroup;
class PASCALIMPLEMENTATION TRzDBRadioGroup : public Rzradgrp::TRzCustomRadioGroup
{
	typedef Rzradgrp::TRzCustomRadioGroup inherited;
	
private:
	Rzcommon::TRzAboutInfo FAboutInfo;
	Dbctrls::TFieldDataLink* FDataLink;
	System::UnicodeString FValue;
	Classes::TStrings* FValues;
	bool FInSetValue;
	Classes::TNotifyEvent FOnChange;
	void __fastcall ActiveChange(System::TObject* Sender);
	void __fastcall DataChange(System::TObject* Sender);
	void __fastcall UpdateData(System::TObject* Sender);
	HIDESBASE MESSAGE void __fastcall CMExit(Messages::TWMNoParams &Msg);
	
protected:
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	DYNAMIC void __fastcall Change(void);
	DYNAMIC void __fastcall Click(void);
	DYNAMIC void __fastcall KeyPress(System::WideChar &Key);
	virtual bool __fastcall CanModify(void);
	virtual Db::TField* __fastcall GetField(void);
	virtual System::UnicodeString __fastcall GetDataField(void);
	virtual void __fastcall SetDataField(const System::UnicodeString Value);
	virtual Db::TDataSource* __fastcall GetDataSource(void);
	virtual void __fastcall SetDataSource(Db::TDataSource* Value);
	virtual bool __fastcall GetReadOnly(void);
	virtual void __fastcall SetReadOnly(bool Value);
	virtual System::UnicodeString __fastcall GetButtonValue(int Index);
	virtual void __fastcall SetValue(const System::UnicodeString Value);
	virtual void __fastcall SetItems(Classes::TStrings* Value);
	virtual void __fastcall SetValues(Classes::TStrings* Value);
	__property Dbctrls::TFieldDataLink* DataLink = {read=FDataLink};
	
public:
	__fastcall virtual TRzDBRadioGroup(Classes::TComponent* AOwner);
	__fastcall virtual ~TRzDBRadioGroup(void);
	DYNAMIC bool __fastcall ExecuteAction(Classes::TBasicAction* Action);
	virtual bool __fastcall UpdateAction(Classes::TBasicAction* Action);
	void __fastcall AddItemValue(const System::UnicodeString Item, const System::UnicodeString Value);
	__property Db::TField* Field = {read=GetField};
	__property System::UnicodeString Value = {read=FValue, write=SetValue};
	__property Buttons;
	__property ItemEnabled;
	__property ItemIndex = {default=-1};
	
__published:
	__property Rzcommon::TRzAboutInfo About = {read=FAboutInfo, write=FAboutInfo, stored=false, nodefault};
	__property System::UnicodeString DataField = {read=GetDataField, write=SetDataField};
	__property Db::TDataSource* DataSource = {read=GetDataSource, write=SetDataSource};
	__property Items = {write=SetItems};
	__property bool ReadOnly = {read=GetReadOnly, write=SetReadOnly, default=0};
	__property Classes::TStrings* Values = {read=FValues, write=SetValues};
	__property Classes::TNotifyEvent OnChange = {read=FOnChange, write=FOnChange};
	__property Align = {default=0};
	__property Alignment = {default=0};
	__property Anchors = {default=3};
	__property BannerHeight = {default=0};
	__property BevelWidth = {default=1};
	__property BiDiMode;
	__property BorderColor = {default=-16777201};
	__property BorderInner = {default=0};
	__property BorderOuter = {default=0};
	__property BorderSides = {default=15};
	__property BorderWidth = {default=0};
	__property Caption;
	__property CaptionFont;
	__property Color = {default=-16777201};
	__property Columns = {default=1};
	__property Constraints;
	__property Ctl3D;
	__property CustomGlyphs;
	__property CustomGlyphImages;
	__property DragCursor = {default=-12};
	__property DragKind = {default=0};
	__property DragMode = {default=0};
	__property Enabled = {default=1};
	__property FlatColor = {default=-16777200};
	__property FlatColorAdjustment = {default=30};
	__property Font;
	__property FrameController;
	__property GradientColorStyle = {default=0};
	__property GradientColorStart = {default=16777215};
	__property GradientColorStop = {default=-16777201};
	__property GradientDirection = {default=2};
	__property GroupStyle = {default=3};
	__property Height = {default=105};
	__property ItemFrameColor = {default=-16777200};
	__property ItemHighlightColor = {default=-16777203};
	__property ItemHotTrack = {default=0};
	__property ItemHotTrackColor = {default=1350640};
	__property ItemHotTrackColorType = {default=1};
	__property ItemFont;
	__property ItemHeight;
	__property LightTextStyle = {default=0};
	__property ParentBiDiMode = {default=1};
	__property ParentColor = {default=0};
	__property ParentCtl3D = {default=1};
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property PopupMenu;
	__property TextHighlightColor = {default=-16777196};
	__property TextShadowColor = {default=-16777200};
	__property TextShadowDepth = {default=2};
	__property ReadOnlyColor = {default=-16777192};
	__property ReadOnlyColorOnFocus = {default=0};
	__property ShowHint;
	__property SpaceEvenly = {default=0};
	__property StartXPos = {index=1, default=8};
	__property StartYPos = {index=2, default=2};
	__property TabOnEnter = {default=0};
	__property TabOrder = {default=-1};
	__property TabStop = {default=0};
	__property TextStyle = {default=0};
	__property Touch;
	__property Transparent = {default=0};
	__property TransparentColor = {default=32896};
	__property UseCustomGlyphs = {default=0};
	__property VerticalSpacing = {default=3};
	__property Visible = {default=1};
	__property VisualStyle = {default=1};
	__property WinMaskColor = {default=65280};
	__property OnChanging;
	__property OnClick;
	__property OnContextPopup;
	__property OnDblClick;
	__property OnDragDrop;
	__property OnDragOver;
	__property OnEndDock;
	__property OnEndDrag;
	__property OnEnter;
	__property OnExit;
	__property OnGesture;
	__property OnMouseActivate;
	__property OnMouseDown;
	__property OnMouseEnter;
	__property OnMouseLeave;
	__property OnMouseMove;
	__property OnMouseUp;
	__property OnPaint;
	__property OnResize;
	__property OnStartDock;
	__property OnStartDrag;
public:
	/* TWinControl.CreateParented */ inline __fastcall TRzDBRadioGroup(HWND ParentWindow) : Rzradgrp::TRzCustomRadioGroup(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Rzdbrgrp */
using namespace Rzdbrgrp;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// RzdbrgrpHPP
