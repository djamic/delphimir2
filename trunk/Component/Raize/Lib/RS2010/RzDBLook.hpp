// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Rzdblook.pas' rev: 21.00

#ifndef RzdblookHPP
#define RzdblookHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Db.hpp>	// Pascal unit
#include <Rzcommon.hpp>	// Pascal unit
#include <Sysutils.hpp>	// Pascal unit
#include <Stdctrls.hpp>	// Pascal unit
#include <Grids.hpp>	// Pascal unit
#include <Dbgrids.hpp>	// Pascal unit
#include <Dbctrls.hpp>	// Pascal unit
#include <Rzdbnav.hpp>	// Pascal unit
#include <Types.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Rzdblook
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS EInvalidSearchField;
class PASCALIMPLEMENTATION EInvalidSearchField : public Sysutils::Exception
{
	typedef Sysutils::Exception inherited;
	
public:
	/* Exception.Create */ inline __fastcall EInvalidSearchField(const System::UnicodeString Msg) : Sysutils::Exception(Msg) { }
	/* Exception.CreateFmt */ inline __fastcall EInvalidSearchField(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size) : Sysutils::Exception(Msg, Args, Args_Size) { }
	/* Exception.CreateRes */ inline __fastcall EInvalidSearchField(int Ident)/* overload */ : Sysutils::Exception(Ident) { }
	/* Exception.CreateResFmt */ inline __fastcall EInvalidSearchField(int Ident, System::TVarRec const *Args, const int Args_Size)/* overload */ : Sysutils::Exception(Ident, Args, Args_Size) { }
	/* Exception.CreateHelp */ inline __fastcall EInvalidSearchField(const System::UnicodeString Msg, int AHelpContext) : Sysutils::Exception(Msg, AHelpContext) { }
	/* Exception.CreateFmtHelp */ inline __fastcall EInvalidSearchField(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size, int AHelpContext) : Sysutils::Exception(Msg, Args, Args_Size, AHelpContext) { }
	/* Exception.CreateResHelp */ inline __fastcall EInvalidSearchField(int Ident, int AHelpContext)/* overload */ : Sysutils::Exception(Ident, AHelpContext) { }
	/* Exception.CreateResFmtHelp */ inline __fastcall EInvalidSearchField(System::PResStringRec ResStringRec, System::TVarRec const *Args, const int Args_Size, int AHelpContext)/* overload */ : Sysutils::Exception(ResStringRec, Args, Args_Size, AHelpContext) { }
	/* Exception.Destroy */ inline __fastcall virtual ~EInvalidSearchField(void) { }
	
};


class DELPHICLASS EInvalidDataset;
class PASCALIMPLEMENTATION EInvalidDataset : public Sysutils::Exception
{
	typedef Sysutils::Exception inherited;
	
public:
	/* Exception.Create */ inline __fastcall EInvalidDataset(const System::UnicodeString Msg) : Sysutils::Exception(Msg) { }
	/* Exception.CreateFmt */ inline __fastcall EInvalidDataset(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size) : Sysutils::Exception(Msg, Args, Args_Size) { }
	/* Exception.CreateRes */ inline __fastcall EInvalidDataset(int Ident)/* overload */ : Sysutils::Exception(Ident) { }
	/* Exception.CreateResFmt */ inline __fastcall EInvalidDataset(int Ident, System::TVarRec const *Args, const int Args_Size)/* overload */ : Sysutils::Exception(Ident, Args, Args_Size) { }
	/* Exception.CreateHelp */ inline __fastcall EInvalidDataset(const System::UnicodeString Msg, int AHelpContext) : Sysutils::Exception(Msg, AHelpContext) { }
	/* Exception.CreateFmtHelp */ inline __fastcall EInvalidDataset(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size, int AHelpContext) : Sysutils::Exception(Msg, Args, Args_Size, AHelpContext) { }
	/* Exception.CreateResHelp */ inline __fastcall EInvalidDataset(int Ident, int AHelpContext)/* overload */ : Sysutils::Exception(Ident, AHelpContext) { }
	/* Exception.CreateResFmtHelp */ inline __fastcall EInvalidDataset(System::PResStringRec ResStringRec, System::TVarRec const *Args, const int Args_Size, int AHelpContext)/* overload */ : Sysutils::Exception(ResStringRec, Args, Args_Size, AHelpContext) { }
	/* Exception.Destroy */ inline __fastcall virtual ~EInvalidDataset(void) { }
	
};


typedef void __fastcall (__closure *TRzDrawColumnCellEvent)(Dbgrids::TDBGrid* Grid, const Types::TRect &Rect, int DataCol, Dbgrids::TColumn* Column, Grids::TGridDrawState State);

typedef void __fastcall (__closure *TRzDrawDataCellEvent)(Dbgrids::TDBGrid* Grid, const Types::TRect &Rect, Db::TField* Field, Grids::TGridDrawState State);

class DELPHICLASS TRzDBLookupDialog;
class PASCALIMPLEMENTATION TRzDBLookupDialog : public Rzcommon::TRzDialogComponent
{
	typedef Rzcommon::TRzDialogComponent inherited;
	
private:
	bool FAutoSelect;
	bool FButtonGlyphs;
	Stdctrls::TEditCharCase FCharCase;
	Db::TDataSet* FDataset;
	Dbgrids::TDBGridOptions FGridOptions;
	System::UnicodeString FPrompt;
	bool FMoveSrchFldToFront;
	bool FNumbersOnly;
	System::UnicodeString FKeyField;
	System::UnicodeString FSearchField;
	Stdctrls::TCustomEdit* FSearchEdit;
	System::UnicodeString FSearchString;
	bool FShowNavigator;
	bool FShowNavigatorHints;
	int FNavigatorWidth;
	Rzdbnav::TRzNavigatorButtons FVisibleNavButtons;
	bool FUpdateSearchEdit;
	TRzDrawColumnCellEvent FOnDrawColumnCell;
	TRzDrawDataCellEvent FOnDrawDataCell;
	void __fastcall DrawColumnCellHandler(System::TObject* Sender, const Types::TRect &Rect, int DataCol, Dbgrids::TColumn* Column, Grids::TGridDrawState State);
	void __fastcall DrawDataCellHandler(System::TObject* Sender, const Types::TRect &Rect, Db::TField* Field, Grids::TGridDrawState State);
	
protected:
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall DefineProperties(Classes::TFiler* Filer);
	
public:
	__fastcall virtual TRzDBLookupDialog(Classes::TComponent* AOwner);
	bool __fastcall Execute(void);
	__property System::UnicodeString SearchString = {read=FSearchString, write=FSearchString};
	
__published:
	__property Rzcommon::TRzAboutInfo About = {read=FAboutInfo, write=FAboutInfo, stored=false, nodefault};
	__property bool AutoSelect = {read=FAutoSelect, write=FAutoSelect, default=1};
	__property bool ButtonGlyphs = {read=FButtonGlyphs, write=FButtonGlyphs, default=0};
	__property Stdctrls::TEditCharCase CharCase = {read=FCharCase, write=FCharCase, default=0};
	__property Db::TDataSet* Dataset = {read=FDataset, write=FDataset};
	__property Dbgrids::TDBGridOptions GridOptions = {read=FGridOptions, write=FGridOptions, default=3325};
	__property bool MoveSearchField = {read=FMoveSrchFldToFront, write=FMoveSrchFldToFront, default=1};
	__property bool NumbersOnly = {read=FNumbersOnly, write=FNumbersOnly, default=0};
	__property System::UnicodeString Prompt = {read=FPrompt, write=FPrompt};
	__property System::UnicodeString KeyField = {read=FKeyField, write=FKeyField};
	__property int NavigatorWidth = {read=FNavigatorWidth, write=FNavigatorWidth, default=221};
	__property Stdctrls::TCustomEdit* SearchEdit = {read=FSearchEdit, write=FSearchEdit};
	__property System::UnicodeString SearchField = {read=FSearchField, write=FSearchField};
	__property bool ShowNavigator = {read=FShowNavigator, write=FShowNavigator, default=1};
	__property bool ShowNavigatorHints = {read=FShowNavigatorHints, write=FShowNavigatorHints, default=0};
	__property bool UpdateSearchEdit = {read=FUpdateSearchEdit, write=FUpdateSearchEdit, default=0};
	__property Rzdbnav::TRzNavigatorButtons VisibleNavButtons = {read=FVisibleNavButtons, write=FVisibleNavButtons, default=1023};
	__property TRzDrawColumnCellEvent OnDrawColumnCell = {read=FOnDrawColumnCell, write=FOnDrawColumnCell};
	__property TRzDrawDataCellEvent OnDrawDataCell = {read=FOnDrawDataCell, write=FOnDrawDataCell};
	__property BorderStyle = {default=2};
	__property Caption;
	__property CaptionOK;
	__property CaptionCancel;
	__property CaptionHelp;
	__property Font;
	__property FrameColor = {default=-16777200};
	__property FrameStyle = {default=1};
	__property FrameVisible = {default=0};
	__property FramingPreference = {default=1};
	__property Height = {default=300};
	__property HelpContext = {default=0};
	__property Width = {default=350};
public:
	/* TRzDialogComponent.Destroy */ inline __fastcall virtual ~TRzDBLookupDialog(void) { }
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Rzdblook */
using namespace Rzdblook;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// RzdblookHPP
