// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Rzlookupform.pas' rev: 21.00

#ifndef RzlookupformHPP
#define RzlookupformHPP

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
#include <Buttons.hpp>	// Pascal unit
#include <Extctrls.hpp>	// Pascal unit
#include <Mask.hpp>	// Pascal unit
#include <Rzedit.hpp>	// Pascal unit
#include <Rzlstbox.hpp>	// Pascal unit
#include <Rzdlgbtn.hpp>	// Pascal unit
#include <Rzpanel.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Rzlookupform
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TRzLookupForm;
class PASCALIMPLEMENTATION TRzLookupForm : public Forms::TForm
{
	typedef Forms::TForm inherited;
	
__published:
	Extctrls::TPanel* PnlSelections;
	Rzlstbox::TRzListBox* LstSelections;
	Extctrls::TPanel* PnlPrompt;
	Extctrls::TPanel* PnlSearch;
	Rzedit::TRzEdit* EdtSearch;
	Rzdlgbtn::TRzDialogButtons* PnlButtons;
	void __fastcall EdtSearchChange(System::TObject* Sender);
	void __fastcall FormResize(System::TObject* Sender);
	void __fastcall FormShow(System::TObject* Sender);
	void __fastcall PnlButtonsClickHelp(System::TObject* Sender);
	void __fastcall EdtSearchKeyDown(System::TObject* Sender, System::Word &Key, Classes::TShiftState Shift);
	void __fastcall FormCreate(System::TObject* Sender);
	
private:
	int __fastcall FindClosest(System::UnicodeString S);
public:
	/* TCustomForm.Create */ inline __fastcall virtual TRzLookupForm(Classes::TComponent* AOwner) : Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TRzLookupForm(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TRzLookupForm(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TRzLookupForm(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Rzlookupform */
using namespace Rzlookupform;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// RzlookupformHPP
