// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Rzchecklistitemform.pas' rev: 21.00

#ifndef RzchecklistitemformHPP
#define RzchecklistitemformHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Stdctrls.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Rzedit.hpp>	// Pascal unit
#include <Rzbutton.hpp>	// Pascal unit
#include <Rzlabel.hpp>	// Pascal unit
#include <Rzradchk.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Rzchecklistitemform
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TRzCheckItemEditDlg;
class PASCALIMPLEMENTATION TRzCheckItemEditDlg : public Forms::TForm
{
	typedef Forms::TForm inherited;
	
__published:
	Rzlabel::TRzLabel* Label1;
	Rzbutton::TRzButton* btnOK;
	Rzbutton::TRzButton* btnCancel;
	Rzedit::TRzMemo* edtItem;
	Rzradchk::TRzRadioButton* optItem;
	Rzradchk::TRzRadioButton* optGroup;
	void __fastcall FormCreate(System::TObject* Sender);
	
private:
	void __fastcall SetItem(const System::UnicodeString Item);
	System::UnicodeString __fastcall GetItem(void);
	
public:
	__property System::UnicodeString Item = {read=GetItem, write=SetItem};
public:
	/* TCustomForm.Create */ inline __fastcall virtual TRzCheckItemEditDlg(Classes::TComponent* AOwner) : Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TRzCheckItemEditDlg(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TRzCheckItemEditDlg(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TRzCheckItemEditDlg(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Rzchecklistitemform */
using namespace Rzchecklistitemform;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// RzchecklistitemformHPP
