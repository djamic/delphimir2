// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Rzdbstat.pas' rev: 21.00

#ifndef RzdbstatHPP
#define RzdbstatHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Rzstatus.hpp>	// Pascal unit
#include <Db.hpp>	// Pascal unit
#include <Dbctrls.hpp>	// Pascal unit
#include <Rzcommon.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Rzdbstat
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TRzDBStatusPane;
class PASCALIMPLEMENTATION TRzDBStatusPane : public Rzstatus::TRzCustomFieldStatus
{
	typedef Rzstatus::TRzCustomFieldStatus inherited;
	
private:
	void __fastcall DataChange(System::TObject* Sender);
	
protected:
	Dbctrls::TFieldDataLink* FDataLink;
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual System::UnicodeString __fastcall GetDataField(void);
	virtual void __fastcall SetDataField(const System::UnicodeString Value);
	virtual Db::TDataSource* __fastcall GetDataSource(void);
	virtual void __fastcall SetDataSource(Db::TDataSource* Value);
	
public:
	__fastcall virtual TRzDBStatusPane(Classes::TComponent* AOwner);
	__fastcall virtual ~TRzDBStatusPane(void);
	
__published:
	__property System::UnicodeString DataField = {read=GetDataField, write=SetDataField};
	__property Db::TDataSource* DataSource = {read=GetDataSource, write=SetDataSource};
	__property Alignment = {default=0};
	__property AutoSize = {default=0};
	__property Blinking = {default=0};
	__property BlinkColor = {default=-16777203};
	__property BlinkIntervalOff = {default=500};
	__property BlinkIntervalOn = {default=500};
	__property CaptionOffset = {default=2};
	__property ShowHint = {default=1};
};


class DELPHICLASS TRzDBStateDataLink;
class DELPHICLASS TRzDBStateStatus;
class PASCALIMPLEMENTATION TRzDBStateDataLink : public Db::TDataLink
{
	typedef Db::TDataLink inherited;
	
private:
	TRzDBStateStatus* FStatusControl;
	
protected:
	virtual void __fastcall EditingChanged(void);
	virtual void __fastcall ActiveChanged(void);
	
public:
	__fastcall TRzDBStateDataLink(TRzDBStateStatus* AStatusControl);
	__fastcall virtual ~TRzDBStateDataLink(void);
};


class DELPHICLASS TRzStateCaptions;
class PASCALIMPLEMENTATION TRzStateCaptions : public Classes::TPersistent
{
	typedef Classes::TPersistent inherited;
	
private:
	typedef StaticArray<System::UnicodeString, 7> _TRzStateCaptions__1;
	
	
private:
	_TRzStateCaptions__1 FCaptions;
	TRzDBStateStatus* FStatusControl;
	
protected:
	virtual System::UnicodeString __fastcall GetStateCaption(int Index);
	virtual void __fastcall SetStateCaption(int Index, const System::UnicodeString Value);
	
public:
	__fastcall TRzStateCaptions(TRzDBStateStatus* AStatusControl);
	__fastcall virtual ~TRzStateCaptions(void);
	__property TRzDBStateStatus* StausControl = {read=FStatusControl};
	__property System::UnicodeString Captions[int Index] = {read=GetStateCaption, write=SetStateCaption};
	
__published:
	__property System::UnicodeString Inactive = {read=GetStateCaption, write=SetStateCaption, index=0};
	__property System::UnicodeString Browse = {read=GetStateCaption, write=SetStateCaption, index=1};
	__property System::UnicodeString Edit = {read=GetStateCaption, write=SetStateCaption, index=2};
	__property System::UnicodeString Insert = {read=GetStateCaption, write=SetStateCaption, index=3};
	__property System::UnicodeString Search = {read=GetStateCaption, write=SetStateCaption, index=4};
	__property System::UnicodeString Calculate = {read=GetStateCaption, write=SetStateCaption, index=5};
	__property System::UnicodeString Filter = {read=GetStateCaption, write=SetStateCaption, index=6};
};


class PASCALIMPLEMENTATION TRzDBStateStatus : public Rzstatus::TRzCustomGlyphStatus
{
	typedef Rzstatus::TRzCustomGlyphStatus inherited;
	
private:
	Graphics::TBitmap* FBitmaps;
	TRzStateCaptions* FStateCaptions;
	bool FStoreStateCaptions;
	bool FShowCaption;
	
protected:
	int FGlyphHeight;
	int FGlyphWidth;
	TRzDBStateDataLink* FDataLink;
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall UpdateState(void);
	virtual void __fastcall ExtractGlyph(int Index, Graphics::TBitmap* Bitmap, Graphics::TBitmap* Source, int W, int H);
	virtual void __fastcall SelectGlyph(Graphics::TBitmap* Glyph);
	virtual void __fastcall SetStateCaptions(TRzStateCaptions* Value);
	virtual Db::TDataSource* __fastcall GetDataSource(void);
	virtual void __fastcall SetDataSource(Db::TDataSource* Value);
	virtual Db::TDataSetState __fastcall GetDatasetState(void);
	virtual void __fastcall SetShowCaption(bool Value);
	virtual void __fastcall SetShowGlyph(bool Value);
	
public:
	__fastcall virtual TRzDBStateStatus(Classes::TComponent* AOwner);
	__fastcall virtual ~TRzDBStateStatus(void);
	__property Db::TDataSetState DatasetState = {read=GetDatasetState, nodefault};
	
__published:
	__property Db::TDataSource* DataSource = {read=GetDataSource, write=SetDataSource};
	__property bool ShowCaption = {read=FShowCaption, write=SetShowCaption, default=1};
	__property TRzStateCaptions* StateCaptions = {read=FStateCaptions, write=SetStateCaptions, stored=FStoreStateCaptions};
	__property Alignment = {default=0};
	__property AutoSize = {default=0};
	__property Blinking = {default=0};
	__property BlinkColor = {default=-16777203};
	__property BlinkIntervalOff = {default=500};
	__property BlinkIntervalOn = {default=500};
	__property CaptionOffset = {default=2};
	__property GlyphAlignment = {default=0};
	__property GlyphOffset = {default=5};
	__property ShowGlyph = {default=1};
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Rzdbstat */
using namespace Rzdbstat;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// RzdbstatHPP
