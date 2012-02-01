// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Rztray.pas' rev: 21.00

#ifndef RztrayHPP
#define RztrayHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Stdctrls.hpp>	// Pascal unit
#include <Extctrls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Shellapi.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Sysutils.hpp>	// Pascal unit
#include <Imglist.hpp>	// Pascal unit
#include <Rzcommon.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Rztray
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TRzBalloonHintIcon { bhiNone, bhiInfo, bhiWarning, bhiError };
#pragma option pop

typedef ShortInt TRzBalloonHintTimeout;

struct TRzTimeoutOrVersion
{
	
	#pragma pack(push,1)
	union
	{
		struct 
		{
			unsigned uVersion;
			
		};
		struct 
		{
			unsigned uTimeout;
			
		};
		
	};
	#pragma pack(pop)
};


struct _RZNOTIFYICONDATAA;
typedef _RZNOTIFYICONDATAA *PRzNotifyIconDataA;

struct _RZNOTIFYICONDATAW;
typedef _RZNOTIFYICONDATAW *PRzNotifyIconDataW;

typedef PRzNotifyIconDataA PNotifyIconData;

struct _RZNOTIFYICONDATAA
{
	
public:
	unsigned cbSize;
	HWND Wnd;
	unsigned uID;
	unsigned uFlags;
	unsigned uCallbackMessage;
	HICON hIcon;
	StaticArray<char, 128> szTip;
	unsigned dwState;
	unsigned dwStateMask;
	StaticArray<char, 256> szInfo;
	TRzTimeoutOrVersion TimeoutOrVersion;
	StaticArray<char, 64> szInfoTitle;
	unsigned dwInfoFlags;
};


struct _RZNOTIFYICONDATAW
{
	
public:
	unsigned cbSize;
	HWND Wnd;
	unsigned uID;
	unsigned uFlags;
	unsigned uCallbackMessage;
	HICON hIcon;
	StaticArray<System::WideChar, 128> szTip;
	unsigned dwState;
	unsigned dwStateMask;
	StaticArray<System::WideChar, 256> szInfo;
	TRzTimeoutOrVersion TimeoutOrVersion;
	StaticArray<System::WideChar, 64> szInfoTitle;
	unsigned dwInfoFlags;
};


typedef _RZNOTIFYICONDATAA _RZNOTIFYICONDATA;

typedef _RZNOTIFYICONDATAA TRzNotifyIconDataA;

typedef _RZNOTIFYICONDATAW TRzNotifyIconDataW;

typedef _RZNOTIFYICONDATAW TRzNotifyIconData;

typedef _RZNOTIFYICONDATAA RZNOTIFYICONDATAA;

typedef _RZNOTIFYICONDATAW RZNOTIFYICONDATAW;

typedef _RZNOTIFYICONDATAA RZNOTIFYICONDATA;

class DELPHICLASS ERzTrayIconError;
class PASCALIMPLEMENTATION ERzTrayIconError : public Sysutils::Exception
{
	typedef Sysutils::Exception inherited;
	
public:
	/* Exception.Create */ inline __fastcall ERzTrayIconError(const System::UnicodeString Msg) : Sysutils::Exception(Msg) { }
	/* Exception.CreateFmt */ inline __fastcall ERzTrayIconError(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size) : Sysutils::Exception(Msg, Args, Args_Size) { }
	/* Exception.CreateRes */ inline __fastcall ERzTrayIconError(int Ident)/* overload */ : Sysutils::Exception(Ident) { }
	/* Exception.CreateResFmt */ inline __fastcall ERzTrayIconError(int Ident, System::TVarRec const *Args, const int Args_Size)/* overload */ : Sysutils::Exception(Ident, Args, Args_Size) { }
	/* Exception.CreateHelp */ inline __fastcall ERzTrayIconError(const System::UnicodeString Msg, int AHelpContext) : Sysutils::Exception(Msg, AHelpContext) { }
	/* Exception.CreateFmtHelp */ inline __fastcall ERzTrayIconError(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size, int AHelpContext) : Sysutils::Exception(Msg, Args, Args_Size, AHelpContext) { }
	/* Exception.CreateResHelp */ inline __fastcall ERzTrayIconError(int Ident, int AHelpContext)/* overload */ : Sysutils::Exception(Ident, AHelpContext) { }
	/* Exception.CreateResFmtHelp */ inline __fastcall ERzTrayIconError(System::PResStringRec ResStringRec, System::TVarRec const *Args, const int Args_Size, int AHelpContext)/* overload */ : Sysutils::Exception(ResStringRec, Args, Args_Size, AHelpContext) { }
	/* Exception.Destroy */ inline __fastcall virtual ~ERzTrayIconError(void) { }
	
};


#pragma option push -b-
enum TRzTrayIconClicks { ticNone, ticLeftClick, ticLeftDblClick, ticLeftClickUp, ticRightClick, ticRightDblClick, ticRightClickUp };
#pragma option pop

typedef void __fastcall (__closure *TRzQueryEndSessionEvent)(System::TObject* Sender, bool &AllowSessionToEnd);

class DELPHICLASS TRzTrayIcon;
class PASCALIMPLEMENTATION TRzTrayIcon : public Classes::TComponent
{
	typedef Classes::TComponent inherited;
	
private:
	Rzcommon::TRzAboutInfo FAboutInfo;
	_RZNOTIFYICONDATAW FIconData;
	#pragma pack(push,1)
	_NOTIFYICONDATAW FIconDataPreV5;
	#pragma pack(pop)
	Graphics::TIcon* FIcon;
	Imglist::TCustomImageList* FIconList;
	Imglist::TChangeLink* FImagesChangeLink;
	Menus::TPopupMenu* FPopupMenu;
	Extctrls::TTimer* FTimer;
	System::UnicodeString FHint;
	int FIconIndex;
	bool FEnabled;
	HWND FMsgWindow;
	bool FHideOnMinimize;
	bool FHideOnStartup;
	bool FTaskBarRecreated;
	bool FMenuVisible;
	bool FManualRestore;
	TRzTrayIconClicks FRestoreOn;
	TRzTrayIconClicks FPopupMenuOn;
	Classes::TNotifyEvent FOnMinimizeApp;
	Classes::TNotifyEvent FOnRestoreApp;
	Classes::TNotifyEvent FOnLButtonDown;
	Classes::TNotifyEvent FOnLButtonUp;
	Classes::TNotifyEvent FOnLButtonDblClick;
	Classes::TNotifyEvent FOnRButtonDown;
	Classes::TNotifyEvent FOnRButtonUp;
	Classes::TNotifyEvent FOnRButtonDblClick;
	bool FShell32Ver5;
	Classes::TNotifyEvent FOnBalloonHintHide;
	Classes::TNotifyEvent FOnBalloonHintClose;
	Classes::TNotifyEvent FOnBalloonHintClick;
	TRzQueryEndSessionEvent FOnQueryEndSession;
	Classes::TNotifyEvent FOnEndSession;
	void __fastcall MinimizeAppHandler(System::TObject* Sender);
	void __fastcall RestoreAppHandler(System::TObject* Sender);
	void __fastcall TimerExpiredHandler(System::TObject* Sender);
	void __fastcall ImagesChange(System::TObject* Sender);
	
protected:
	virtual void __fastcall Loaded(void);
	virtual void __fastcall Notification(Classes::TComponent* Component, Classes::TOperation Operation);
	void __fastcall Update(void);
	void __fastcall EnabledChanged(void);
	void __fastcall DeleteIcon(void);
	void __fastcall HideApplication(void);
	void __fastcall ShowApplication(void);
	DYNAMIC void __fastcall QueryEndSession(bool &AllowSessionToEnd);
	DYNAMIC void __fastcall EndSession(void);
	DYNAMIC void __fastcall LButtonDown(void);
	DYNAMIC void __fastcall LButtonUp(void);
	DYNAMIC void __fastcall LButtonDblClick(void);
	DYNAMIC void __fastcall RButtonDown(void);
	DYNAMIC void __fastcall RButtonUp(void);
	DYNAMIC void __fastcall RButtonDblClick(void);
	DYNAMIC void __fastcall DoMinimizeApp(void);
	DYNAMIC void __fastcall DoRestoreApp(void);
	virtual bool __fastcall GetAnimate(void);
	virtual void __fastcall SetAnimate(bool Value);
	virtual void __fastcall SetEnabled(bool Value);
	virtual void __fastcall SetHint(const System::UnicodeString Value);
	virtual int __fastcall GetInterval(void);
	virtual void __fastcall SetInterval(int Value);
	virtual void __fastcall SetIconIndex(int Value);
	virtual void __fastcall SetIconList(Imglist::TCustomImageList* Value);
	__property _RZNOTIFYICONDATAW IconData = {read=FIconData};
	__property _NOTIFYICONDATAW IconDataPreV5 = {read=FIconDataPreV5};
	
public:
	__fastcall virtual TRzTrayIcon(Classes::TComponent* AOwner);
	__fastcall virtual ~TRzTrayIcon(void);
	void __fastcall MsgWndProc(Messages::TMessage &Msg);
	void __fastcall MinimizeApp(void);
	void __fastcall RestoreApp(void);
	void __fastcall ShowMenu(void);
	void __fastcall SetDefaultIcon(void);
	bool __fastcall SupportBalloonHints(void);
	void __fastcall ShowBalloonHint(const System::UnicodeString Title, const System::UnicodeString Msg, TRzBalloonHintIcon IconType = (TRzBalloonHintIcon)(0x1), TRzBalloonHintTimeout TimeoutSecs = (TRzBalloonHintTimeout)(0xa));
	void __fastcall HideBalloonHint(void);
	
__published:
	__property Rzcommon::TRzAboutInfo About = {read=FAboutInfo, write=FAboutInfo, stored=false, nodefault};
	__property bool Animate = {read=GetAnimate, write=SetAnimate, default=0};
	__property bool Enabled = {read=FEnabled, write=SetEnabled, default=1};
	__property bool HideOnMinimize = {read=FHideOnMinimize, write=FHideOnMinimize, default=1};
	__property bool HideOnStartup = {read=FHideOnStartup, write=FHideOnStartup, default=0};
	__property System::UnicodeString Hint = {read=FHint, write=SetHint};
	__property Menus::TPopupMenu* PopupMenu = {read=FPopupMenu, write=FPopupMenu};
	__property Imglist::TCustomImageList* Icons = {read=FIconList, write=SetIconList};
	__property int IconIndex = {read=FIconIndex, write=SetIconIndex, default=0};
	__property int Interval = {read=GetInterval, write=SetInterval, default=1000};
	__property TRzTrayIconClicks RestoreOn = {read=FRestoreOn, write=FRestoreOn, default=2};
	__property TRzTrayIconClicks PopupMenuOn = {read=FPopupMenuOn, write=FPopupMenuOn, default=6};
	__property Classes::TNotifyEvent OnBalloonHintHide = {read=FOnBalloonHintHide, write=FOnBalloonHintHide};
	__property Classes::TNotifyEvent OnBalloonHintClose = {read=FOnBalloonHintClose, write=FOnBalloonHintClose};
	__property Classes::TNotifyEvent OnBalloonHintClick = {read=FOnBalloonHintClick, write=FOnBalloonHintClick};
	__property Classes::TNotifyEvent OnMinimizeApp = {read=FOnMinimizeApp, write=FOnMinimizeApp};
	__property Classes::TNotifyEvent OnRestoreApp = {read=FOnRestoreApp, write=FOnRestoreApp};
	__property Classes::TNotifyEvent OnLButtonDown = {read=FOnLButtonDown, write=FOnLButtonDown};
	__property Classes::TNotifyEvent OnLButtonUp = {read=FOnLButtonUp, write=FOnLButtonUp};
	__property Classes::TNotifyEvent OnLButtonDblClick = {read=FOnLButtonDblClick, write=FOnLButtonDblClick};
	__property Classes::TNotifyEvent OnRButtonDown = {read=FOnRButtonDown, write=FOnRButtonDown};
	__property Classes::TNotifyEvent OnRButtonUp = {read=FOnRButtonUp, write=FOnRButtonUp};
	__property Classes::TNotifyEvent OnRButtonDblClick = {read=FOnRButtonDblClick, write=FOnRButtonDblClick};
	__property Classes::TNotifyEvent OnEndSession = {read=FOnEndSession, write=FOnEndSession};
	__property TRzQueryEndSessionEvent OnQueryEndSession = {read=FOnQueryEndSession, write=FOnQueryEndSession};
};


//-- var, const, procedure ---------------------------------------------------
static const Word wm_TrayIconMessage = 0x2422;

}	/* namespace Rztray */
using namespace Rztray;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// RztrayHPP
