// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Rzgroupbareditor.pas' rev: 21.00

#ifndef RzgroupbareditorHPP
#define RzgroupbareditorHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Stdctrls.hpp>	// Pascal unit
#include <Rzgroupbar.hpp>	// Pascal unit
#include <Designintf.hpp>	// Pascal unit
#include <Designeditors.hpp>	// Pascal unit
#include <Designmenus.hpp>	// Pascal unit
#include <Rzdesigneditors.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Rzlabel.hpp>	// Pascal unit
#include <Extctrls.hpp>	// Pascal unit
#include <Rzpanel.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Rzgroupbareditor
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TRzGroupBarEditor;
class PASCALIMPLEMENTATION TRzGroupBarEditor : public Rzdesigneditors::TRzComponentEditor
{
	typedef Rzdesigneditors::TRzComponentEditor inherited;
	
protected:
	Rzgroupbar::TRzGroupBar* __fastcall GroupBar(void);
	virtual int __fastcall AlignMenuIndex(void);
	virtual bool __fastcall GetCompRefData(int Index, Classes::TComponentClass &CompRefClass, System::UnicodeString &CompRefPropName, Classes::TNotifyEvent &CompRefMenuHandler);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall GroupBarStyleMenuHandler(System::TObject* Sender);
	void __fastcall VisualStyleMenuHandler(System::TObject* Sender);
	void __fastcall GradientColorStyleMenuHandler(System::TObject* Sender);
	void __fastcall SmallImagesMenuHandler(System::TObject* Sender);
	void __fastcall LargeImagesMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
	virtual void __fastcall Edit(void);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzGroupBarEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : Rzdesigneditors::TRzComponentEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzGroupBarEditor(void) { }
	
};


class DELPHICLASS TRzGroupEditor;
class PASCALIMPLEMENTATION TRzGroupEditor : public Rzdesigneditors::TRzComponentEditor
{
	typedef Rzdesigneditors::TRzComponentEditor inherited;
	
protected:
	Rzgroupbar::TRzGroup* __fastcall Group(void);
	virtual bool __fastcall GetCompRefData(int Index, Classes::TComponentClass &CompRefClass, System::UnicodeString &CompRefPropName, Classes::TNotifyEvent &CompRefMenuHandler);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall ActionListMenuHandler(System::TObject* Sender);
	void __fastcall ItemsMenuHandler(System::TObject* Sender);
	void __fastcall ItemStyleMenuHandler(System::TObject* Sender);
	void __fastcall GroupBarStyleMenuHandler(System::TObject* Sender);
	void __fastcall VisualStyleMenuHandler(System::TObject* Sender);
	void __fastcall GradientColorStyleMenuHandler(System::TObject* Sender);
	void __fastcall SmallImagesMenuHandler(System::TObject* Sender);
	void __fastcall LargeImagesMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
	virtual void __fastcall Edit(void);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzGroupEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : Rzdesigneditors::TRzComponentEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzGroupEditor(void) { }
	
};


class DELPHICLASS TRzGroupControllerEditor;
class PASCALIMPLEMENTATION TRzGroupControllerEditor : public Rzdesigneditors::TRzComponentEditor
{
	typedef Rzdesigneditors::TRzComponentEditor inherited;
	
protected:
	Rzgroupbar::TRzGroupController* __fastcall GroupController(void);
	virtual bool __fastcall GetCompRefData(int Index, Classes::TComponentClass &CompRefClass, System::UnicodeString &CompRefPropName, Classes::TNotifyEvent &CompRefMenuHandler);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
	virtual void __fastcall Edit(void);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzGroupControllerEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : Rzdesigneditors::TRzComponentEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzGroupControllerEditor(void) { }
	
};


class DELPHICLASS TRzGroupTemplateEditor;
class PASCALIMPLEMENTATION TRzGroupTemplateEditor : public Rzdesigneditors::TRzComponentEditor
{
	typedef Rzdesigneditors::TRzComponentEditor inherited;
	
protected:
	Rzgroupbar::TRzGroupTemplate* __fastcall Template(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall ActionListMenuHandler(System::TObject* Sender);
	void __fastcall SmallImagesMenuHandler(System::TObject* Sender);
	void __fastcall LargeImagesMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
	virtual void __fastcall Edit(void);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzGroupTemplateEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : Rzdesigneditors::TRzComponentEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzGroupTemplateEditor(void) { }
	
};


class DELPHICLASS TRzGroupTemplatePreviewDlg;
class PASCALIMPLEMENTATION TRzGroupTemplatePreviewDlg : public Forms::TForm
{
	typedef Forms::TForm inherited;
	
__published:
	Rzgroupbar::TRzGroupBar* GroupBar;
	void __fastcall FormKeyPress(System::TObject* Sender, System::WideChar &Key);
	void __fastcall FormCreate(System::TObject* Sender);
	
private:
	void __fastcall ItemClickHandler(System::TObject* Sender);
	
public:
	void __fastcall SetTemplate(Rzgroupbar::TRzGroupTemplate* Template);
public:
	/* TCustomForm.Create */ inline __fastcall virtual TRzGroupTemplatePreviewDlg(Classes::TComponent* AOwner) : Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TRzGroupTemplatePreviewDlg(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TRzGroupTemplatePreviewDlg(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TRzGroupTemplatePreviewDlg(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Rzgroupbareditor */
using namespace Rzgroupbareditor;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// RzgroupbareditorHPP
