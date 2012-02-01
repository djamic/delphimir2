// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Rzdbcomboboxeditor.pas' rev: 21.00

#ifndef RzdbcomboboxeditorHPP
#define RzdbcomboboxeditorHPP

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
#include <Designmenus.hpp>	// Pascal unit
#include <Rzdbdesigneditors.hpp>	// Pascal unit
#include <Rzpanel.hpp>	// Pascal unit
#include <Grids.hpp>	// Pascal unit
#include <Rzdbcmbo.hpp>	// Pascal unit
#include <Rzbutton.hpp>	// Pascal unit
#include <Rzgrids.hpp>	// Pascal unit
#include <Rzdesigneditors.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Rzdbcomboboxeditor
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TRzDBComboBoxEditor;
class PASCALIMPLEMENTATION TRzDBComboBoxEditor : public Rzdbdesigneditors::TRzDBControlEditor
{
	typedef Rzdbdesigneditors::TRzDBControlEditor inherited;
	
protected:
	Rzdbcmbo::TRzDBComboBox* __fastcall ComboBox(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzDBComboBoxEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : Rzdbdesigneditors::TRzDBControlEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzDBComboBoxEditor(void) { }
	
};


class DELPHICLASS TRzDBComboBoxEditDlg;
class PASCALIMPLEMENTATION TRzDBComboBoxEditDlg : public Forms::TForm
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
	void __fastcall UpdateUI(Rzdbcmbo::TRzDBComboBox* ComboBox);
	void __fastcall UpdateCombo(Rzdbcmbo::TRzDBComboBox* ComboBox);
public:
	/* TCustomForm.Create */ inline __fastcall virtual TRzDBComboBoxEditDlg(Classes::TComponent* AOwner) : Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TRzDBComboBoxEditDlg(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TRzDBComboBoxEditDlg(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TRzDBComboBoxEditDlg(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Rzdbcomboboxeditor */
using namespace Rzdbcomboboxeditor;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// RzdbcomboboxeditorHPP
