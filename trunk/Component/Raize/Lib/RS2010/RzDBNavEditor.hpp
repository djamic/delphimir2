// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Rzdbnaveditor.pas' rev: 21.00

#ifndef RzdbnaveditorHPP
#define RzdbnaveditorHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Designintf.hpp>	// Pascal unit
#include <Designmenus.hpp>	// Pascal unit
#include <Designeditors.hpp>	// Pascal unit
#include <Vcleditors.hpp>	// Pascal unit
#include <Rzselectimageeditor.hpp>	// Pascal unit
#include <Imglist.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Rzdbnaveditor
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TRzDBNavigatorImageIndexProperty;
class PASCALIMPLEMENTATION TRzDBNavigatorImageIndexProperty : public Rzselectimageeditor::TRzCustomImageIndexProperty
{
	typedef Rzselectimageeditor::TRzCustomImageIndexProperty inherited;
	
protected:
	virtual Imglist::TCustomImageList* __fastcall GetImageList(void);
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TRzDBNavigatorImageIndexProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Rzselectimageeditor::TRzCustomImageIndexProperty(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TRzDBNavigatorImageIndexProperty(void) { }
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Rzdbnaveditor */
using namespace Rzdbnaveditor;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// RzdbnaveditorHPP
