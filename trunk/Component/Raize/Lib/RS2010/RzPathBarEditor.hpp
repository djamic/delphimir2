// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Rzpathbareditor.pas' rev: 21.00

#ifndef RzpathbareditorHPP
#define RzpathbareditorHPP

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
#include <Rzpathbar.hpp>	// Pascal unit
#include <Designintf.hpp>	// Pascal unit
#include <Designeditors.hpp>	// Pascal unit
#include <Designmenus.hpp>	// Pascal unit
#include <Rzdesigneditors.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Rzlabel.hpp>	// Pascal unit
#include <Extctrls.hpp>	// Pascal unit
#include <Rzpanel.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Rzpathbareditor
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TRzPathBarEditor;
class PASCALIMPLEMENTATION TRzPathBarEditor : public Rzdesigneditors::TRzComponentEditor
{
	typedef Rzdesigneditors::TRzComponentEditor inherited;
	
protected:
	Rzpathbar::TRzPathBar* __fastcall PathBar(void);
	virtual bool __fastcall GetCompRefData(int Index, Classes::TComponentClass &CompRefClass, System::UnicodeString &CompRefPropName, Classes::TNotifyEvent &CompRefMenuHandler);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall ItemsMenuHandler(System::TObject* Sender);
	void __fastcall ImagesMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
	virtual void __fastcall Edit(void);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzPathBarEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : Rzdesigneditors::TRzComponentEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzPathBarEditor(void) { }
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Rzpathbareditor */
using namespace Rzpathbareditor;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// RzpathbareditorHPP
