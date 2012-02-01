// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Rzchecklisttabstopeditor.pas' rev: 21.00

#ifndef RzchecklisttabstopeditorHPP
#define RzchecklisttabstopeditorHPP

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
#include <Menus.hpp>	// Pascal unit
#include <Rzdesigneditors.hpp>	// Pascal unit
#include <Rztrkbar.hpp>	// Pascal unit
#include <Designintf.hpp>	// Pascal unit
#include <Designeditors.hpp>	// Pascal unit
#include <Designmenus.hpp>	// Pascal unit
#include <Rzlstbox.hpp>	// Pascal unit
#include <Rzradchk.hpp>	// Pascal unit
#include <Rzlabel.hpp>	// Pascal unit
#include <Rzbutton.hpp>	// Pascal unit
#include <Extctrls.hpp>	// Pascal unit
#include <Rzpanel.hpp>	// Pascal unit
#include <Rzchklst.hpp>	// Pascal unit
#include <Rzradgrp.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Rzchecklisttabstopeditor
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TRzCheckListTabStopProperty;
class PASCALIMPLEMENTATION TRzCheckListTabStopProperty : public Designeditors::TPropertyEditor
{
	typedef Designeditors::TPropertyEditor inherited;
	
public:
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
	virtual System::UnicodeString __fastcall GetValue(void);
	virtual void __fastcall Edit(void);
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TRzCheckListTabStopProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TPropertyEditor(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TRzCheckListTabStopProperty(void) { }
	
};


class DELPHICLASS TRzCheckListTabStopEditDlg;
class PASCALIMPLEMENTATION TRzCheckListTabStopEditDlg : public Forms::TForm
{
	typedef Forms::TForm inherited;
	
__published:
	Rzbutton::TRzButton* btnOK;
	Rzbutton::TRzButton* btnCancel;
	Rzpanel::TRzGroupBox* grpPreview;
	Rzpanel::TRzGroupBox* grpTabStops;
	Rzlstbox::TRzListBox* lstTabs;
	Rzlabel::TRzLabel* lblMin;
	Rzlabel::TRzLabel* lblMax;
	Rzlabel::TRzLabel* Label3;
	Rzlabel::TRzLabel* lblTabNum;
	Rzchklst::TRzCheckList* LstPreview;
	Rzbutton::TRzButton* btnAdd;
	Rzbutton::TRzButton* btnDelete;
	Rzradchk::TRzCheckBox* chkRightAligned;
	Rztrkbar::TRzTrackBar* trkTabPos;
	Rzradgrp::TRzRadioGroup* grpTabStopsMode;
	void __fastcall btnAddClick(System::TObject* Sender);
	void __fastcall btnDeleteClick(System::TObject* Sender);
	void __fastcall lstTabsClick(System::TObject* Sender);
	void __fastcall FormShow(System::TObject* Sender);
	void __fastcall trkTabPosChange(System::TObject* Sender);
	void __fastcall FormCreate(System::TObject* Sender);
	void __fastcall chkRightAlignedClick(System::TObject* Sender);
	void __fastcall grpTabStopsModeClick(System::TObject* Sender);
	
private:
	bool FUpdating;
public:
	/* TCustomForm.Create */ inline __fastcall virtual TRzCheckListTabStopEditDlg(Classes::TComponent* AOwner) : Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TRzCheckListTabStopEditDlg(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TRzCheckListTabStopEditDlg(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TRzCheckListTabStopEditDlg(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Rzchecklisttabstopeditor */
using namespace Rzchecklisttabstopeditor;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// RzchecklisttabstopeditorHPP
