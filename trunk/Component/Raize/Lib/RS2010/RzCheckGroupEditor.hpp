// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Rzcheckgroupeditor.pas' rev: 21.00

#ifndef RzcheckgroupeditorHPP
#define RzcheckgroupeditorHPP

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
#include <Rzdesigneditors.hpp>	// Pascal unit
#include <Rzradgrp.hpp>	// Pascal unit
#include <Rzpanel.hpp>	// Pascal unit
#include <Rztrkbar.hpp>	// Pascal unit
#include <Rzedit.hpp>	// Pascal unit
#include <Mask.hpp>	// Pascal unit
#include <Rzlabel.hpp>	// Pascal unit
#include <Rzbutton.hpp>	// Pascal unit
#include <Types.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Rzcheckgroupeditor
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TRzCheckGroupEditor;
class PASCALIMPLEMENTATION TRzCheckGroupEditor : public Rzdesigneditors::TRzDefaultEditor
{
	typedef Rzdesigneditors::TRzDefaultEditor inherited;
	
protected:
	virtual Rzradgrp::TRzCheckGroup* __fastcall CheckGroup(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall ItemsMenuHandler(System::TObject* Sender);
	void __fastcall GroupStyleMenuHandler(System::TObject* Sender);
	void __fastcall VisualStyleMenuHandler(System::TObject* Sender);
	void __fastcall GradientColorStyleMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzCheckGroupEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : Rzdesigneditors::TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzCheckGroupEditor(void) { }
	
};


class DELPHICLASS TRzCheckGroupEditDlg;
class PASCALIMPLEMENTATION TRzCheckGroupEditDlg : public Forms::TForm
{
	typedef Forms::TForm inherited;
	
__published:
	Rzpanel::TRzPanel* PnlButtons;
	Rzpanel::TRzPanel* PnlOptions;
	Rzedit::TRzEdit* EdtCaption;
	Rzlabel::TRzLabel* Label1;
	Rzedit::TRzMemo* EdtItems;
	Rzlabel::TRzLabel* Label2;
	Rzbutton::TRzButton* BtnLoad;
	Rzlabel::TRzLabel* Label3;
	Rzbutton::TRzButton* BtnClear;
	Dialogs::TOpenDialog* DlgOpen;
	Rztrkbar::TRzTrackBar* TrkColumns;
	Rzpanel::TRzPanel* PnlPreview;
	Rzradgrp::TRzCheckGroup* GrpPreview;
	Rzpanel::TRzPanel* RzPanel1;
	Rzbutton::TRzButton* BtnOk;
	Rzbutton::TRzButton* BtnCancel;
	void __fastcall EdtCaptionChange(System::TObject* Sender);
	void __fastcall TrkColumnsChange(System::TObject* Sender);
	void __fastcall EdtItemsChange(System::TObject* Sender);
	void __fastcall BtnLoadClick(System::TObject* Sender);
	void __fastcall BtnClearClick(System::TObject* Sender);
	void __fastcall TrkColumnsDrawTick(Rztrkbar::TRzTrackBar* TrackBar, Graphics::TCanvas* Canvas, const Types::TPoint &Location, int Index);
	void __fastcall FormCreate(System::TObject* Sender);
	
private:
	bool FUpdating;
	
public:
	void __fastcall UpdateControls(void);
public:
	/* TCustomForm.Create */ inline __fastcall virtual TRzCheckGroupEditDlg(Classes::TComponent* AOwner) : Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TRzCheckGroupEditDlg(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TRzCheckGroupEditDlg(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TRzCheckGroupEditDlg(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Rzcheckgroupeditor */
using namespace Rzcheckgroupeditor;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// RzcheckgroupeditorHPP
