// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Rztabstopeditor.pas' rev: 21.00

#ifndef RztabstopeditorHPP
#define RztabstopeditorHPP

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
#include <Rzradgrp.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Rztabstopeditor
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TRzTabStopProperty;
class PASCALIMPLEMENTATION TRzTabStopProperty : public Designeditors::TPropertyEditor
{
	typedef Designeditors::TPropertyEditor inherited;
	
public:
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
	virtual System::UnicodeString __fastcall GetValue(void);
	virtual void __fastcall Edit(void);
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TRzTabStopProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TPropertyEditor(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TRzTabStopProperty(void) { }
	
};


class DELPHICLASS TRzTabbedListBoxEditor;
class PASCALIMPLEMENTATION TRzTabbedListBoxEditor : public Rzdesigneditors::TRzDefaultEditor
{
	typedef Rzdesigneditors::TRzDefaultEditor inherited;
	
protected:
	Rzlstbox::TRzTabbedListBox* __fastcall ListBox(void);
	virtual int __fastcall AlignMenuIndex(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzTabbedListBoxEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : Rzdesigneditors::TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzTabbedListBoxEditor(void) { }
	
};


class DELPHICLASS TRzTabStopEditDlg;
class PASCALIMPLEMENTATION TRzTabStopEditDlg : public Forms::TForm
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
	Rzlstbox::TRzTabbedListBox* lstPreview;
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
	/* TCustomForm.Create */ inline __fastcall virtual TRzTabStopEditDlg(Classes::TComponent* AOwner) : Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TRzTabStopEditDlg(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TRzTabStopEditDlg(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TRzTabStopEditDlg(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Rztabstopeditor */
using namespace Rztabstopeditor;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// RztabstopeditorHPP
