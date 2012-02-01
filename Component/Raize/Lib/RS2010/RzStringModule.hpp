// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Rzstringmodule.pas' rev: 21.00

#ifndef RzstringmoduleHPP
#define RzstringmoduleHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Sysutils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Designconst.hpp>	// Pascal unit
#include <Toolsapi.hpp>	// Pascal unit
#include <Istreams.hpp>	// Pascal unit
#include <Stfilsys.hpp>	// Pascal unit
#include <Typinfo.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Rzstringmodule
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TRzStringsModuleCreator;
class PASCALIMPLEMENTATION TRzStringsModuleCreator : public System::TInterfacedObject
{
	typedef System::TInterfacedObject inherited;
	
private:
	System::UnicodeString FFileName;
	Classes::TStringStream* FStream;
	System::TDateTime FAge;
	
public:
	__fastcall TRzStringsModuleCreator(const System::UnicodeString FileName, Classes::TStringStream* Stream, System::TDateTime Age);
	__fastcall virtual ~TRzStringsModuleCreator(void);
	System::UnicodeString __fastcall GetCreatorType(void);
	bool __fastcall GetExisting(void);
	System::UnicodeString __fastcall GetFileSystem(void);
	Toolsapi::_di_IOTAModule __fastcall GetOwner(void);
	bool __fastcall GetUnnamed(void);
	System::UnicodeString __fastcall GetAncestorName(void);
	System::UnicodeString __fastcall GetImplFileName(void);
	System::UnicodeString __fastcall GetIntfFileName(void);
	System::UnicodeString __fastcall GetFormName(void);
	bool __fastcall GetMainForm(void);
	bool __fastcall GetShowForm(void);
	bool __fastcall GetShowSource(void);
	Toolsapi::_di_IOTAFile __fastcall NewFormFile(const System::UnicodeString FormIdent, const System::UnicodeString AncestorIdent);
	Toolsapi::_di_IOTAFile __fastcall NewImplSource(const System::UnicodeString ModuleIdent, const System::UnicodeString FormIdent, const System::UnicodeString AncestorIdent);
	Toolsapi::_di_IOTAFile __fastcall NewIntfSource(const System::UnicodeString ModuleIdent, const System::UnicodeString FormIdent, const System::UnicodeString AncestorIdent);
	void __fastcall FormCreated(const Toolsapi::_di_IOTAFormEditor FormEditor);
private:
	void *__IOTAModuleCreator;	/* Toolsapi::IOTAModuleCreator */
	
public:
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Toolsapi::_di_IOTAModuleCreator()
	{
		Toolsapi::_di_IOTAModuleCreator intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IOTAModuleCreator*(void) { return (IOTAModuleCreator*)&__IOTAModuleCreator; }
	#endif
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Toolsapi::_di_IOTACreator()
	{
		Toolsapi::_di_IOTACreator intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IOTACreator*(void) { return (IOTACreator*)&__IOTAModuleCreator; }
	#endif
	
};


class DELPHICLASS TRzOTAFile;
class PASCALIMPLEMENTATION TRzOTAFile : public System::TInterfacedObject
{
	typedef System::TInterfacedObject inherited;
	
private:
	System::UnicodeString FSource;
	System::TDateTime FAge;
	
public:
	__fastcall TRzOTAFile(const System::UnicodeString ASource, System::TDateTime AAge);
	System::UnicodeString __fastcall GetSource(void);
	System::TDateTime __fastcall GetAge(void);
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzOTAFile(void) { }
	
private:
	void *__IOTAFile;	/* Toolsapi::IOTAFile */
	
public:
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Toolsapi::_di_IOTAFile()
	{
		Toolsapi::_di_IOTAFile intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IOTAFile*(void) { return (IOTAFile*)&__IOTAFile; }
	#endif
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Rzstringmodule */
using namespace Rzstringmodule;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// RzstringmoduleHPP
