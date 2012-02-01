// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Rzdbprog.pas' rev: 21.00

#ifndef RzdbprogHPP
#define RzdbprogHPP

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
#include <Extctrls.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Stdctrls.hpp>	// Pascal unit
#include <Rzprgres.hpp>	// Pascal unit
#include <Db.hpp>	// Pascal unit
#include <Dbctrls.hpp>	// Pascal unit
#include <Rzcommon.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Rzdbprog
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS EInvalidBaseValue;
class PASCALIMPLEMENTATION EInvalidBaseValue : public Sysutils::Exception
{
	typedef Sysutils::Exception inherited;
	
public:
	/* Exception.Create */ inline __fastcall EInvalidBaseValue(const System::UnicodeString Msg) : Sysutils::Exception(Msg) { }
	/* Exception.CreateFmt */ inline __fastcall EInvalidBaseValue(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size) : Sysutils::Exception(Msg, Args, Args_Size) { }
	/* Exception.CreateRes */ inline __fastcall EInvalidBaseValue(int Ident)/* overload */ : Sysutils::Exception(Ident) { }
	/* Exception.CreateResFmt */ inline __fastcall EInvalidBaseValue(int Ident, System::TVarRec const *Args, const int Args_Size)/* overload */ : Sysutils::Exception(Ident, Args, Args_Size) { }
	/* Exception.CreateHelp */ inline __fastcall EInvalidBaseValue(const System::UnicodeString Msg, int AHelpContext) : Sysutils::Exception(Msg, AHelpContext) { }
	/* Exception.CreateFmtHelp */ inline __fastcall EInvalidBaseValue(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size, int AHelpContext) : Sysutils::Exception(Msg, Args, Args_Size, AHelpContext) { }
	/* Exception.CreateResHelp */ inline __fastcall EInvalidBaseValue(int Ident, int AHelpContext)/* overload */ : Sysutils::Exception(Ident, AHelpContext) { }
	/* Exception.CreateResFmtHelp */ inline __fastcall EInvalidBaseValue(System::PResStringRec ResStringRec, System::TVarRec const *Args, const int Args_Size, int AHelpContext)/* overload */ : Sysutils::Exception(ResStringRec, Args, Args_Size, AHelpContext) { }
	/* Exception.Destroy */ inline __fastcall virtual ~EInvalidBaseValue(void) { }
	
};


class DELPHICLASS TRzDBProgressBar;
class PASCALIMPLEMENTATION TRzDBProgressBar : public Rzprgres::TRzCustomProgressBar
{
	typedef Rzprgres::TRzCustomProgressBar inherited;
	
private:
	Rzcommon::TRzAboutInfo FAboutInfo;
	double FBaseValue;
	Dbctrls::TFieldDataLink* FDataLink;
	Dbctrls::TFieldDataLink* FBaseDataLink;
	void __fastcall DataChange(System::TObject* Sender);
	
protected:
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall SetBaseValue(double Value);
	virtual System::UnicodeString __fastcall GetDataField(void);
	virtual void __fastcall SetDataField(const System::UnicodeString Value);
	virtual System::UnicodeString __fastcall GetBaseField(void);
	virtual void __fastcall SetBaseField(const System::UnicodeString Value);
	virtual Db::TDataSource* __fastcall GetDataSource(void);
	virtual void __fastcall SetDataSource(Db::TDataSource* Value);
	virtual int __fastcall GetPercent(void);
	
public:
	__fastcall virtual TRzDBProgressBar(Classes::TComponent* AOwner);
	__fastcall virtual ~TRzDBProgressBar(void);
	__property int Percent = {read=GetPercent, nodefault};
	
__published:
	__property Rzcommon::TRzAboutInfo About = {read=FAboutInfo, write=FAboutInfo, stored=false, nodefault};
	__property System::UnicodeString BaseField = {read=GetBaseField, write=SetBaseField};
	__property double BaseValue = {read=FBaseValue, write=SetBaseValue};
	__property System::UnicodeString DataField = {read=GetDataField, write=SetDataField};
	__property Db::TDataSource* DataSource = {read=GetDataSource, write=SetDataSource};
	__property Align = {default=0};
	__property Anchors = {default=3};
	__property BackColor = {default=16777215};
	__property BackColorStop = {default=-16777201};
	__property BarColor = {default=-16777203};
	__property BarColorStop = {default=-16777190};
	__property BarStyle = {default=0};
	__property BevelWidth = {default=1};
	__property BorderColor = {default=-16777201};
	__property BorderInner = {default=0};
	__property BorderOuter = {default=4};
	__property BorderWidth;
	__property Constraints;
	__property DragKind = {default=0};
	__property Font;
	__property FrameControllerNotifications = {default=65535};
	__property FrameController;
	__property GradientDirection = {default=3};
	__property Height = {default=24};
	__property InteriorOffset;
	__property NumSegments = {default=20};
	__property Orientation = {default=0};
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property PopupMenu;
	__property ShowHint;
	__property ShowPercent = {default=1};
	__property ThemeAware = {default=1};
	__property Touch;
	__property Visible = {default=1};
	__property Width = {default=200};
	__property OnChange;
	__property OnClick;
	__property OnContextPopup;
	__property OnDblClick;
	__property OnEndDock;
	__property OnGesture;
	__property OnMouseActivate;
	__property OnMouseDown;
	__property OnMouseMove;
	__property OnMouseUp;
	__property OnStartDock;
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Rzdbprog */
using namespace Rzdbprog;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// RzdbprogHPP
