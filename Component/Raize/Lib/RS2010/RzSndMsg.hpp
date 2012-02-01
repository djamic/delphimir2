// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Rzsndmsg.pas' rev: 21.00

#ifndef RzsndmsgHPP
#define RzsndmsgHPP

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
#include <Mapi.hpp>	// Pascal unit
#include <Rzcommon.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Rzsndmsg
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS EMapiUserAbort;
class PASCALIMPLEMENTATION EMapiUserAbort : public Sysutils::EAbort
{
	typedef Sysutils::EAbort inherited;
	
public:
	/* Exception.Create */ inline __fastcall EMapiUserAbort(const System::UnicodeString Msg) : Sysutils::EAbort(Msg) { }
	/* Exception.CreateFmt */ inline __fastcall EMapiUserAbort(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size) : Sysutils::EAbort(Msg, Args, Args_Size) { }
	/* Exception.CreateRes */ inline __fastcall EMapiUserAbort(int Ident)/* overload */ : Sysutils::EAbort(Ident) { }
	/* Exception.CreateResFmt */ inline __fastcall EMapiUserAbort(int Ident, System::TVarRec const *Args, const int Args_Size)/* overload */ : Sysutils::EAbort(Ident, Args, Args_Size) { }
	/* Exception.CreateHelp */ inline __fastcall EMapiUserAbort(const System::UnicodeString Msg, int AHelpContext) : Sysutils::EAbort(Msg, AHelpContext) { }
	/* Exception.CreateFmtHelp */ inline __fastcall EMapiUserAbort(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size, int AHelpContext) : Sysutils::EAbort(Msg, Args, Args_Size, AHelpContext) { }
	/* Exception.CreateResHelp */ inline __fastcall EMapiUserAbort(int Ident, int AHelpContext)/* overload */ : Sysutils::EAbort(Ident, AHelpContext) { }
	/* Exception.CreateResFmtHelp */ inline __fastcall EMapiUserAbort(System::PResStringRec ResStringRec, System::TVarRec const *Args, const int Args_Size, int AHelpContext)/* overload */ : Sysutils::EAbort(ResStringRec, Args, Args_Size, AHelpContext) { }
	/* Exception.Destroy */ inline __fastcall virtual ~EMapiUserAbort(void) { }
	
};


class DELPHICLASS EMapiError;
class PASCALIMPLEMENTATION EMapiError : public Sysutils::Exception
{
	typedef Sysutils::Exception inherited;
	
public:
	int ErrorCode;
public:
	/* Exception.Create */ inline __fastcall EMapiError(const System::UnicodeString Msg) : Sysutils::Exception(Msg) { }
	/* Exception.CreateFmt */ inline __fastcall EMapiError(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size) : Sysutils::Exception(Msg, Args, Args_Size) { }
	/* Exception.CreateRes */ inline __fastcall EMapiError(int Ident)/* overload */ : Sysutils::Exception(Ident) { }
	/* Exception.CreateResFmt */ inline __fastcall EMapiError(int Ident, System::TVarRec const *Args, const int Args_Size)/* overload */ : Sysutils::Exception(Ident, Args, Args_Size) { }
	/* Exception.CreateHelp */ inline __fastcall EMapiError(const System::UnicodeString Msg, int AHelpContext) : Sysutils::Exception(Msg, AHelpContext) { }
	/* Exception.CreateFmtHelp */ inline __fastcall EMapiError(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size, int AHelpContext) : Sysutils::Exception(Msg, Args, Args_Size, AHelpContext) { }
	/* Exception.CreateResHelp */ inline __fastcall EMapiError(int Ident, int AHelpContext)/* overload */ : Sysutils::Exception(Ident, AHelpContext) { }
	/* Exception.CreateResFmtHelp */ inline __fastcall EMapiError(System::PResStringRec ResStringRec, System::TVarRec const *Args, const int Args_Size, int AHelpContext)/* overload */ : Sysutils::Exception(ResStringRec, Args, Args_Size, AHelpContext) { }
	/* Exception.Destroy */ inline __fastcall virtual ~EMapiError(void) { }
	
};


class DELPHICLASS TRzSendMessage;
class PASCALIMPLEMENTATION TRzSendMessage : public Classes::TComponent
{
	typedef Classes::TComponent inherited;
	
private:
	Rzcommon::TRzAboutInfo FAboutInfo;
	Classes::TStrings* FAttachments;
	Classes::TStrings* FToRecipients;
	Classes::TStrings* FCcRecipients;
	Classes::TStrings* FBccRecipients;
	Stdctrls::TCustomMemo* FMessageMemo;
	Classes::TStrings* FMessageText;
	System::UnicodeString FPassword;
	System::UnicodeString FProfileName;
	bool FReview;
	unsigned FSession;
	System::UnicodeString FSubject;
	Stdctrls::TCustomEdit* FSubjectEdit;
	bool FResolveNames;
	
protected:
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall SetAttachments(Classes::TStrings* Value);
	virtual void __fastcall SetToRecipients(Classes::TStrings* Value);
	virtual void __fastcall SetCcRecipients(Classes::TStrings* Value);
	virtual void __fastcall SetBccRecipients(Classes::TStrings* Value);
	virtual void __fastcall SetMailMessage(Classes::TStrings* Value);
	virtual void __fastcall SetMessageMemo(Stdctrls::TCustomMemo* Value);
	virtual void __fastcall SetSubjectEdit(Stdctrls::TCustomEdit* Value);
	
public:
	__fastcall virtual TRzSendMessage(Classes::TComponent* AOwner);
	__fastcall virtual ~TRzSendMessage(void);
	void __fastcall Logon(void);
	void __fastcall Logoff(void);
	void __fastcall Send(void);
	void __fastcall ClearLists(void);
	bool __fastcall MapiInstalled(void);
	
__published:
	__property Rzcommon::TRzAboutInfo About = {read=FAboutInfo, write=FAboutInfo, stored=false, nodefault};
	__property Classes::TStrings* Attachments = {read=FAttachments, write=SetAttachments};
	__property Classes::TStrings* CcRecipients = {read=FCcRecipients, write=SetCcRecipients};
	__property Classes::TStrings* BccRecipients = {read=FBccRecipients, write=SetBccRecipients};
	__property Stdctrls::TCustomMemo* MessageMemo = {read=FMessageMemo, write=SetMessageMemo};
	__property Classes::TStrings* MessageText = {read=FMessageText, write=SetMailMessage};
	__property System::UnicodeString ProfileName = {read=FProfileName, write=FProfileName};
	__property System::UnicodeString Password = {read=FPassword, write=FPassword};
	__property bool Review = {read=FReview, write=FReview, default=1};
	__property bool ResolveNames = {read=FResolveNames, write=FResolveNames, default=1};
	__property Classes::TStrings* ToRecipients = {read=FToRecipients, write=SetToRecipients};
	__property System::UnicodeString Subject = {read=FSubject, write=FSubject};
	__property Stdctrls::TCustomEdit* SubjectEdit = {read=FSubjectEdit, write=SetSubjectEdit};
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Rzsndmsg */
using namespace Rzsndmsg;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// RzsndmsgHPP
