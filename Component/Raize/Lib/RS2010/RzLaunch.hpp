// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Rzlaunch.pas' rev: 21.00

#ifndef RzlaunchHPP
#define RzlaunchHPP

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
#include <Extctrls.hpp>	// Pascal unit
#include <Rzcommon.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Rzlaunch
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TShowMode { smNormal, smMaximized, smMinimized, smHide };
#pragma option pop

class DELPHICLASS TRzLaunchThread;
class DELPHICLASS TRzLauncher;
class PASCALIMPLEMENTATION TRzLaunchThread : public Classes::TThread
{
	typedef Classes::TThread inherited;
	
private:
	TRzLauncher* FLauncher;
	
protected:
	virtual void __fastcall Execute(void);
	
public:
	__fastcall TRzLaunchThread(TRzLauncher* ALauncher);
public:
	/* TThread.Destroy */ inline __fastcall virtual ~TRzLaunchThread(void) { }
	
};


typedef void __fastcall (__closure *TRzLaunchErrorEvent)(System::TObject* Sender, unsigned ErrorCode);

#pragma option push -b-
enum TRzWaitType { wtFullStop, wtProcessMessages };
#pragma option pop

class PASCALIMPLEMENTATION TRzLauncher : public Classes::TComponent
{
	typedef Classes::TComponent inherited;
	
private:
	Rzcommon::TRzAboutInfo FAboutInfo;
	unsigned FHInstance;
	System::UnicodeString FAction;
	System::UnicodeString FFileName;
	System::UnicodeString FParameters;
	TShowMode FShowMode;
	System::UnicodeString FStartDir;
	int FTimeout;
	TRzWaitType FWaitType;
	bool FWaitUntilFinished;
	Classes::TNotifyEvent FOnFinished;
	Classes::TNotifyEvent FOnTimeout;
	TRzLaunchErrorEvent FOnError;
	unsigned FExitCode;
	unsigned FLastErrorCode;
	unsigned FHProcess;
	bool FRunning;
	TRzLaunchThread* FBackgroundThread;
	
protected:
	void __fastcall StartProcess(void);
	DYNAMIC void __fastcall Finished(void);
	DYNAMIC void __fastcall DoTimeout(void);
	DYNAMIC void __fastcall LaunchError(void);
	virtual void __fastcall WaitForProcessAndProcessMsgs(void);
	virtual void __fastcall WaitForProcessFullStop(void);
	virtual void __fastcall WaitForProcessFromThread(void);
	
public:
	__fastcall virtual TRzLauncher(Classes::TComponent* AOwner);
	__fastcall virtual ~TRzLauncher(void);
	virtual void __fastcall Launch(void);
	virtual unsigned __fastcall Execute(void);
	System::UnicodeString __fastcall GetErrorMsg(unsigned ErrorCode);
	__property unsigned HInstance = {read=FHInstance, nodefault};
	__property unsigned ExitCode = {read=FExitCode, nodefault};
	__property unsigned HProcess = {read=FHProcess, nodefault};
	__property bool Running = {read=FRunning, nodefault};
	
__published:
	__property Rzcommon::TRzAboutInfo About = {read=FAboutInfo, write=FAboutInfo, stored=false, nodefault};
	__property System::UnicodeString Action = {read=FAction, write=FAction};
	__property System::UnicodeString FileName = {read=FFileName, write=FFileName};
	__property System::UnicodeString Parameters = {read=FParameters, write=FParameters};
	__property TShowMode ShowMode = {read=FShowMode, write=FShowMode, default=0};
	__property System::UnicodeString StartDir = {read=FStartDir, write=FStartDir};
	__property int Timeout = {read=FTimeout, write=FTimeout, nodefault};
	__property TRzWaitType WaitType = {read=FWaitType, write=FWaitType, default=0};
	__property bool WaitUntilFinished = {read=FWaitUntilFinished, write=FWaitUntilFinished, default=0};
	__property Classes::TNotifyEvent OnFinished = {read=FOnFinished, write=FOnFinished};
	__property TRzLaunchErrorEvent OnError = {read=FOnError, write=FOnError};
	__property Classes::TNotifyEvent OnTimeout = {read=FOnTimeout, write=FOnTimeout};
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE StaticArray<int, 4> ShowWindowModes;

}	/* namespace Rzlaunch */
using namespace Rzlaunch;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// RzlaunchHPP
