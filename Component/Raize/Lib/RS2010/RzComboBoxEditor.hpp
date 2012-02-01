// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Rzcomboboxeditor.pas' rev: 21.00

#ifndef RzcomboboxeditorHPP
#define RzcomboboxeditorHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Stdctrls.hpp>	// Pascal unit
#include <Extctrls.hpp>	// Pascal unit
#include <Comctrls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Designintf.hpp>	// Pascal unit
#include <Designeditors.hpp>	// Pascal unit
#include <Vcleditors.hpp>	// Pascal unit
#include <Designmenus.hpp>	// Pascal unit
#include <Rzdesigneditors.hpp>	// Pascal unit
#include <Rzpanel.hpp>	// Pascal unit
#include <Grids.hpp>	// Pascal unit
#include <Rzcmbobx.hpp>	// Pascal unit
#include <Rzbutton.hpp>	// Pascal unit
#include <Rzgrids.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Rzcomboboxeditor
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TRzComboBoxEditor;
class PASCALIMPLEMENTATION TRzComboBoxEditor : public Rzdesigneditors::TRzDefaultEditor
{
	typedef Rzdesigneditors::TRzDefaultEditor inherited;
	
protected:
	Rzcmbobx::TRzComboBox* __fastcall ComboBox(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzComboBoxEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : Rzdesigneditors::TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzComboBoxEditor(void) { }
	
};


class DELPHICLASS TRzComboBoxTextProperty;
class PASCALIMPLEMENTATION TRzComboBoxTextProperty : public Vcleditors::TCaptionProperty
{
	typedef Vcleditors::TCaptionProperty inherited;
	
public:
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
	virtual void __fastcall GetValues(Classes::TGetStrProc Proc);
	virtual void __fastcall SetValue(const System::UnicodeString Value)/* overload */;
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TRzComboBoxTextProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Vcleditors::TCaptionProperty(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TRzComboBoxTextProperty(void) { }
	
	
/* Hoisted overloads: */
	
public:
	inline void __fastcall  SetValue(const System::WideString Value){ Designeditors::TPropertyEditor::SetValue(Value); }
	
};


class DELPHICLASS TRzComboBoxEditDlg;
class PASCALIMPLEMENTATION TRzComboBoxEditDlg : public Forms::TForm
{
	typedef Forms::TForm inherited;
	
__published:
	Rzpanel::TRzPanel* PnlButtons;
	Rzbutton::TRzButton* btnLoad;
	Rzbutton::TRzButton* btnClear;
	Dialogs::TOpenDialog* dlgOpen;
	Rzpanel::TRzPanel* RzPanel1;
	Rzbutton::TRzButton* btnOk;
	Rzbutton::TRzButton* btnCancel;
	Rzpanel::TRzPanel* pnlClientArea;
	Rzgrids::TRzStringGrid* grdItemsValues;
	void __fastcall btnLoadClick(System::TObject* Sender);
	void __fastcall btnClearClick(System::TObject* Sender);
	void __fastcall FormCreate(System::TObject* Sender);
	void __fastcall grdItemsValuesResize(System::TObject* Sender);
	
private:
	void __fastcall ResetGrid(void);
	
public:
	void __fastcall UpdateUI(Rzcmbobx::TRzComboBox* ComboBox);
	void __fastcall UpdateCombo(Rzcmbobx::TRzComboBox* ComboBox);
public:
	/* TCustomForm.Create */ inline __fastcall virtual TRzComboBoxEditDlg(Classes::TComponent* AOwner) : Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TRzComboBoxEditDlg(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TRzComboBoxEditDlg(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TRzComboBoxEditDlg(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Rzcomboboxeditor */
using namespace Rzcomboboxeditor;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// RzcomboboxeditorHPP
