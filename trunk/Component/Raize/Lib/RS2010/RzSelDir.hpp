// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Rzseldir.pas' rev: 21.00

#ifndef RzseldirHPP
#define RzseldirHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Stdctrls.hpp>	// Pascal unit
#include <Rzcommon.hpp>	// Pascal unit
#include <Rzfilsys.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Rzseldir
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TRzSelDirDialog;
class PASCALIMPLEMENTATION TRzSelDirDialog [[deprecated]] : public Rzcommon::TRzDialogComponent
{
	typedef Rzcommon::TRzDialogComponent inherited;
	
private:
	bool FAllowCreate [[deprecated]];
	bool FButtonGlyphs [[deprecated]];
	bool FChangeCurrentDir [[deprecated]];
	System::UnicodeString FDirectory [[deprecated]];
	Rzfilsys::TNetworkVolumeFormat FNetworkVolumeFormat [[deprecated]];
	bool FOpenCurrentDir [[deprecated]];
	bool FAutoSelect [[deprecated]];
	System::UnicodeString FPrompt [[deprecated]];
	System::UnicodeString FPromptFolders [[deprecated]];
	System::UnicodeString FPromptDrives [[deprecated]];
	Rzfilsys::TDriveTypes FDriveTypes [[deprecated]];
	
public:
	__fastcall virtual TRzSelDirDialog [[deprecated]](Classes::TComponent* AOwner);
	DYNAMIC bool __fastcall Execute [[deprecated]](void);
	
__published:
	__property Rzcommon::TRzAboutInfo About [[deprecated]] = {read=FAboutInfo, write=FAboutInfo, stored=false, nodefault};
	__property bool AllowCreate [[deprecated]] = {read=FAllowCreate, write=FAllowCreate, default=0};
	__property bool ButtonGlyphs [[deprecated]] = {read=FButtonGlyphs, write=FButtonGlyphs, default=0};
	__property bool ChangeCurrentDir [[deprecated]] = {read=FChangeCurrentDir, write=FChangeCurrentDir, default=1};
	__property System::UnicodeString Directory [[deprecated]] = {read=FDirectory, write=FDirectory};
	__property Rzfilsys::TDriveTypes DriveTypes [[deprecated]] = {read=FDriveTypes, write=FDriveTypes, nodefault};
	__property Rzfilsys::TNetworkVolumeFormat NetworkVolumeFormat [[deprecated]] = {read=FNetworkVolumeFormat, write=FNetworkVolumeFormat, default=0};
	__property bool OpenCurrentDir [[deprecated]] = {read=FOpenCurrentDir, write=FOpenCurrentDir, default=0};
	__property bool AutoSelect [[deprecated]] = {read=FAutoSelect, write=FAutoSelect, default=0};
	__property System::UnicodeString Prompt [[deprecated]] = {read=FPrompt, write=FPrompt};
	__property System::UnicodeString PromptFolders [[deprecated]] = {read=FPromptFolders, write=FPromptFolders};
	__property System::UnicodeString PromptDrives [[deprecated]] = {read=FPromptDrives, write=FPromptDrives};
	__property BorderStyle [[deprecated]] = {default=3};
	__property Caption [[deprecated]];
	__property CaptionOK [[deprecated]];
	__property CaptionCancel [[deprecated]];
	__property CaptionHelp [[deprecated]];
	__property Font [[deprecated]];
	__property FrameColor [[deprecated]] = {default=-16777200};
	__property FrameStyle [[deprecated]] = {default=1};
	__property FrameVisible [[deprecated]] = {default=0};
	__property FramingPreference [[deprecated]] = {default=1};
	__property Height [[deprecated]] = {default=325};
	__property HelpContext [[deprecated]] = {default=0};
	__property Width [[deprecated]] = {default=275};
public:
	/* TRzDialogComponent.Destroy */ inline __fastcall virtual ~TRzSelDirDialog(void) { }
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Rzseldir */
using namespace Rzseldir;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// RzseldirHPP
