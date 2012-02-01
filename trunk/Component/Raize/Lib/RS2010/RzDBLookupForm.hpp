// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Rzdblookupform.pas' rev: 21.00

#ifndef RzdblookupformHPP
#define RzdblookupformHPP

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
#include <Grids.hpp>	// Pascal unit
#include <Dbgrids.hpp>	// Pascal unit
#include <Db.hpp>	// Pascal unit
#include <Buttons.hpp>	// Pascal unit
#include <Extctrls.hpp>	// Pascal unit
#include <Dbctrls.hpp>	// Pascal unit
#include <Rzpanel.hpp>	// Pascal unit
#include <Mask.hpp>	// Pascal unit
#include <Rzedit.hpp>	// Pascal unit
#include <Rzdlgbtn.hpp>	// Pascal unit
#include <Rzdbnav.hpp>	// Pascal unit
#include <Rzdbgrid.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Rzdblookupform
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TRzDBLookupForm;
class PASCALIMPLEMENTATION TRzDBLookupForm : public Forms::TForm
{
	typedef Forms::TForm inherited;
	
__published:
	Db::TDataSource* SrcLookup;
	Extctrls::TPanel* PnlPrompt;
	Stdctrls::TLabel* LblPrompt;
	Extctrls::TPanel* PnlNavigator;
	Rzedit::TRzEdit* EdtSearch;
	Rzpanel::TRzPanel* PnlLookup;
	Rzdbgrid::TRzDBGrid* GrdLookup;
	Rzdlgbtn::TRzDialogButtons* PnlButtons;
	Rzdbnav::TRzDBNavigator* NavLookup;
	void __fastcall EdtSearchChange(System::TObject* Sender);
	void __fastcall FormShow(System::TObject* Sender);
	void __fastcall FormResize(System::TObject* Sender);
	void __fastcall EdtSearchKeyPress(System::TObject* Sender, System::WideChar &Key);
	void __fastcall FormCreate(System::TObject* Sender);
	void __fastcall PnlButtonsClickHelp(System::TObject* Sender);
	void __fastcall EdtSearchKeyDown(System::TObject* Sender, System::Word &Key, Classes::TShiftState Shift);
	void __fastcall GrdLookupDblClick(System::TObject* Sender);
	
public:
	System::UnicodeString SearchField;
	System::UnicodeString KeyField;
	bool NumbersOnly;
	void __fastcall FindKeyField(const System::UnicodeString KeyValue);
public:
	/* TCustomForm.Create */ inline __fastcall virtual TRzDBLookupForm(Classes::TComponent* AOwner) : Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TRzDBLookupForm(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TRzDBLookupForm(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TRzDBLookupForm(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Rzdblookupform */
using namespace Rzdblookupform;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// RzdblookupformHPP
