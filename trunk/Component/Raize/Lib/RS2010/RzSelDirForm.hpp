// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Rzseldirform.pas' rev: 21.00

#ifndef RzseldirformHPP
#define RzseldirformHPP

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
#include <Filectrl.hpp>	// Pascal unit
#include <Buttons.hpp>	// Pascal unit
#include <Extctrls.hpp>	// Pascal unit
#include <Rzfilsys.hpp>	// Pascal unit
#include <Mask.hpp>	// Pascal unit
#include <Rzedit.hpp>	// Pascal unit
#include <Comctrls.hpp>	// Pascal unit
#include <Rztreevw.hpp>	// Pascal unit
#include <Rzpanel.hpp>	// Pascal unit
#include <Rzdlgbtn.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Rzseldirform
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TRzSelDirForm;
class PASCALIMPLEMENTATION TRzSelDirForm : public Forms::TForm
{
	typedef Forms::TForm inherited;
	
__published:
	Rzpanel::TRzPanel* PnlFolders;
	Rzpanel::TRzPanel* PnlPrompt;
	Rzpanel::TRzPanel* PnlDrives;
	Stdctrls::TLabel* LblDrives;
	Stdctrls::TLabel* LblDir;
	Rzedit::TRzEdit* EdtDir;
	Stdctrls::TLabel* LblFolders;
	Stdctrls::TLabel* LblPrompt;
	Rzdlgbtn::TRzDialogButtons* PnlButtons;
	void __fastcall FormCreate(System::TObject* Sender);
	void __fastcall EdtDirEnter(System::TObject* Sender);
	void __fastcall EdtDirExit(System::TObject* Sender);
	void __fastcall PnlButtonsClickOk(System::TObject* Sender);
	void __fastcall PnlButtonsClickHelp(System::TObject* Sender);
	
private:
	System::UnicodeString __fastcall GetDirectory(void);
	void __fastcall SetDirectory(System::UnicodeString Value);
	void __fastcall TvwDirsChange(System::TObject* Sender, Comctrls::TTreeNode* Node);
	
public:
	Rzfilsys::TRzDirectoryTree* TvwDirs;
	bool AllowCreate;
	__property System::UnicodeString Directory = {read=GetDirectory, write=SetDirectory};
public:
	/* TCustomForm.Create */ inline __fastcall virtual TRzSelDirForm(Classes::TComponent* AOwner) : Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TRzSelDirForm(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TRzSelDirForm(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TRzSelDirForm(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Rzseldirform */
using namespace Rzseldirform;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// RzseldirformHPP
