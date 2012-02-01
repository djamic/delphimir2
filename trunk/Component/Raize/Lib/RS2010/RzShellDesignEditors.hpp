// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Rzshelldesigneditors.pas' rev: 21.00

#ifndef RzshelldesigneditorsHPP
#define RzshelldesigneditorsHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Sysutils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Stdctrls.hpp>	// Pascal unit
#include <Comctrls.hpp>	// Pascal unit
#include <Designintf.hpp>	// Pascal unit
#include <Designeditors.hpp>	// Pascal unit
#include <Vcleditors.hpp>	// Pascal unit
#include <Designmenus.hpp>	// Pascal unit
#include <Rzdesigneditors.hpp>	// Pascal unit
#include <Rzshelldialogs.hpp>	// Pascal unit
#include <Rzlabel.hpp>	// Pascal unit
#include <Rzshellctrls.hpp>	// Pascal unit
#include <Rzshellutils.hpp>	// Pascal unit
#include <Mask.hpp>	// Pascal unit
#include <Rzedit.hpp>	// Pascal unit
#include <Rzcmbobx.hpp>	// Pascal unit
#include <Rzradchk.hpp>	// Pascal unit
#include <Rzbutton.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Rzshelldesigneditors
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TRzShellLocatorProperty;
class PASCALIMPLEMENTATION TRzShellLocatorProperty : public Designeditors::TClassProperty
{
	typedef Designeditors::TClassProperty inherited;
	
public:
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
	virtual void __fastcall Edit(void);
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TRzShellLocatorProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TClassProperty(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TRzShellLocatorProperty(void) { }
	
};


class DELPHICLASS TCSIDLProperty;
class PASCALIMPLEMENTATION TCSIDLProperty : public Designeditors::TEnumProperty
{
	typedef Designeditors::TEnumProperty inherited;
	
public:
	virtual void __fastcall GetValues(Classes::TGetStrProc Proc);
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TCSIDLProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TEnumProperty(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TCSIDLProperty(void) { }
	
};


class DELPHICLASS TRzShellDialogEditor;
class PASCALIMPLEMENTATION TRzShellDialogEditor : public Rzdesigneditors::TRzDefaultEditor
{
	typedef Rzdesigneditors::TRzDefaultEditor inherited;
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzShellDialogEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : Rzdesigneditors::TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzShellDialogEditor(void) { }
	
};


class DELPHICLASS TRzShellListEditor;
class PASCALIMPLEMENTATION TRzShellListEditor : public Rzdesigneditors::TRzDefaultEditor
{
	typedef Rzdesigneditors::TRzDefaultEditor inherited;
	
protected:
	Rzshellctrls::TRzShellList* __fastcall ShellList(void);
	virtual int __fastcall AlignMenuIndex(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall ViewStyleMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzShellListEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : Rzdesigneditors::TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzShellListEditor(void) { }
	
};


class DELPHICLASS TRzShellTreeEditor;
class PASCALIMPLEMENTATION TRzShellTreeEditor : public Rzdesigneditors::TRzComponentEditor
{
	typedef Rzdesigneditors::TRzComponentEditor inherited;
	
protected:
	Rzshellctrls::TRzShellTree* __fastcall ShellTree(void);
	virtual int __fastcall AlignMenuIndex(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall ShellListMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzShellTreeEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : Rzdesigneditors::TRzComponentEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzShellTreeEditor(void) { }
	
};


class DELPHICLASS TRzShellComboEditor;
class PASCALIMPLEMENTATION TRzShellComboEditor : public Rzdesigneditors::TRzComponentEditor
{
	typedef Rzdesigneditors::TRzComponentEditor inherited;
	
protected:
	Rzshellctrls::TRzShellCombo* __fastcall ShellCombo(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall ShellListMenuHandler(System::TObject* Sender);
	void __fastcall ShellTreeMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzShellComboEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : Rzdesigneditors::TRzComponentEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzShellComboEditor(void) { }
	
};


class DELPHICLASS TRzShellLocatorEditDlg;
class PASCALIMPLEMENTATION TRzShellLocatorEditDlg : public Forms::TForm
{
	typedef Forms::TForm inherited;
	
__published:
	Rzbutton::TRzButton* OkBtn;
	Rzbutton::TRzButton* CancelBtn;
	Rzradchk::TRzRadioButton* UsePidlRdo;
	Rzradchk::TRzRadioButton* DontUseAnythingRdo;
	Rzradchk::TRzRadioButton* UsePathnameRdo;
	Rzradchk::TRzRadioButton* UseCSIDLRdo;
	Rzshelldialogs::TRzSelectFolderDialog* RzSelectFolderDialog1;
	Rzcmbobx::TRzComboBox* ComboBox1;
	Rzedit::TRzEdit* PathNameEdt;
	Rzlabel::TRzLabel* ItemTxt;
	Rzbutton::TRzButton* BrowseBtn;
	void __fastcall UsePidlRdoClick(System::TObject* Sender);
	void __fastcall FormClose(System::TObject* Sender, Forms::TCloseAction &Action);
	void __fastcall BrowseBtnClick(System::TObject* Sender);
	void __fastcall FormCreate(System::TObject* Sender);
	
private:
	Rzshellctrls::TRzShellLocator* FLocator;
	void __fastcall SetLocator(Rzshellctrls::TRzShellLocator* Value);
	
public:
	__property Rzshellctrls::TRzShellLocator* Locator = {read=FLocator, write=SetLocator};
public:
	/* TCustomForm.Create */ inline __fastcall virtual TRzShellLocatorEditDlg(Classes::TComponent* AOwner) : Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TRzShellLocatorEditDlg(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TRzShellLocatorEditDlg(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TRzShellLocatorEditDlg(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE System::UnicodeString __fastcall GetCSIDLStr(Rzshellutils::TCSIDL id);

}	/* namespace Rzshelldesigneditors */
using namespace Rzshelldesigneditors;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// RzshelldesigneditorsHPP
