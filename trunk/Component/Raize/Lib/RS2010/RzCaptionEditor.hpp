// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Rzcaptioneditor.pas' rev: 21.00

#ifndef RzcaptioneditorHPP
#define RzcaptioneditorHPP

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
#include <Designintf.hpp>	// Pascal unit
#include <Designeditors.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Stdctrls.hpp>	// Pascal unit
#include <Extctrls.hpp>	// Pascal unit
#include <Rzdlgbtn.hpp>	// Pascal unit
#include <Rzedit.hpp>	// Pascal unit
#include <Rzpanel.hpp>	// Pascal unit
#include <Rzbutton.hpp>	// Pascal unit
#include <Rzradchk.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Rzcaptioneditor
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TRzCaptionProperty;
class PASCALIMPLEMENTATION TRzCaptionProperty : public Designeditors::TStringProperty
{
	typedef Designeditors::TStringProperty inherited;
	
public:
	virtual void __fastcall Edit(void);
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TRzCaptionProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TStringProperty(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TRzCaptionProperty(void) { }
	
};


class DELPHICLASS TRzHintProperty;
class PASCALIMPLEMENTATION TRzHintProperty : public Designeditors::TStringProperty
{
	typedef Designeditors::TStringProperty inherited;
	
public:
	virtual void __fastcall Edit(void);
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TRzHintProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TStringProperty(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TRzHintProperty(void) { }
	
};


class DELPHICLASS TRzGroupItemCaptionProperty;
class PASCALIMPLEMENTATION TRzGroupItemCaptionProperty : public Designeditors::TStringProperty
{
	typedef Designeditors::TStringProperty inherited;
	
public:
	virtual void __fastcall Edit(void);
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TRzGroupItemCaptionProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TStringProperty(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TRzGroupItemCaptionProperty(void) { }
	
};


class DELPHICLASS TRzGroupTemplateItemCaptionProperty;
class PASCALIMPLEMENTATION TRzGroupTemplateItemCaptionProperty : public Designeditors::TStringProperty
{
	typedef Designeditors::TStringProperty inherited;
	
public:
	virtual void __fastcall Edit(void);
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TRzGroupTemplateItemCaptionProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TStringProperty(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TRzGroupTemplateItemCaptionProperty(void) { }
	
};


class DELPHICLASS TRzCaptionEditDlg;
class PASCALIMPLEMENTATION TRzCaptionEditDlg : public Forms::TForm
{
	typedef Forms::TForm inherited;
	
__published:
	Rzedit::TRzMemo* EdtCaption;
	Rzpanel::TRzPanel* PnlEditor;
	Rzdlgbtn::TRzDialogButtons* RzDialogButtons1;
	void __fastcall FormClose(System::TObject* Sender, Forms::TCloseAction &Action);
	void __fastcall FormCreate(System::TObject* Sender);
public:
	/* TCustomForm.Create */ inline __fastcall virtual TRzCaptionEditDlg(Classes::TComponent* AOwner) : Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TRzCaptionEditDlg(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TRzCaptionEditDlg(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TRzCaptionEditDlg(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE void __fastcall CaptionToStringList(const System::UnicodeString Caption, Classes::TStrings* Lines);
extern PACKAGE void __fastcall StringListToCaption(Classes::TStrings* Lines, System::UnicodeString &Caption);

}	/* namespace Rzcaptioneditor */
using namespace Rzcaptioneditor;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// RzcaptioneditorHPP
