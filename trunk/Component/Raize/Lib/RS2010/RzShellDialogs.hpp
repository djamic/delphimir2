// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Rzshelldialogs.pas' rev: 21.00

#ifndef RzshelldialogsHPP
#define RzshelldialogsHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Shlobj.hpp>	// Pascal unit
#include <Rzshellctrls.hpp>	// Pascal unit
#include <Rzcommon.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Rzshelldialogs
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TRzSelectFolderDialogOption { sfdoCreateDeleteButtons, sfdoContextMenus, sfdoReadOnly, sfdoIncludeNonFolders, sfdoOleDrag, sfdoOleDrop, sfdoCreateFolderIcon, sfdoDeleteFolderIcon, sfdoVirtualFolders, sfdoShowHidden };
#pragma option pop

typedef Set<TRzSelectFolderDialogOption, sfdoCreateDeleteButtons, sfdoShowHidden>  TRzSelectFolderDialogOptions;

class DELPHICLASS TRzShellDialog;
class PASCALIMPLEMENTATION TRzShellDialog : public Classes::TComponent
{
	typedef Classes::TComponent inherited;
	
private:
	Forms::TPosition FFormPosition;
	int FFormLeft;
	int FFormTop;
	int FFormWidth;
	int FFormHeight;
	Forms::TWindowState FWindowState;
	System::UnicodeString FTitle;
	Classes::TNotifyEvent FOnInit;
	Classes::TNotifyEvent FOnFormShow;
	Classes::TNotifyEvent FOnFormClose;
	bool FExecuting;
	Graphics::TColor FFrameColor;
	Rzcommon::TFrameStyleEx FFrameStyle;
	bool FFrameVisible;
	Rzcommon::TFramingPreference FFramingPreference;
	Graphics::TColor FButtonColor;
	bool FShowButtonGlyphs;
	Graphics::TColor FHighlightColor;
	bool FHotTrack;
	Graphics::TColor FHotTrackColor;
	Rzcommon::TRzHotTrackColorType FHotTrackColorType;
	Rzcommon::TRzGradientColorStyle FToolBtnGradientColorStyle;
	Graphics::TColor FToolBtnSelectionColorStart;
	Graphics::TColor FToolBtnSelectionColorStop;
	Graphics::TColor FToolBtnSelectionFrameColor;
	Rzcommon::TRzVisualStyle FToolBtnVisualStyle;
	
protected:
	Rzcommon::TRzAboutInfo FAboutInfo;
	DYNAMIC void __fastcall DoInitialized(void);
	DYNAMIC bool __fastcall DoExecute(void) = 0 ;
	__property bool Executing = {read=FExecuting, nodefault};
	__property System::UnicodeString Title = {read=FTitle, write=FTitle};
	__property Forms::TPosition FormPosition = {read=FFormPosition, write=FFormPosition, default=4};
	__property int FormLeft = {read=FFormLeft, write=FFormLeft, default=-1};
	__property int FormTop = {read=FFormTop, write=FFormTop, default=-1};
	__property int FormWidth = {read=FFormWidth, write=FFormWidth, default=-1};
	__property int FormHeight = {read=FFormHeight, write=FFormHeight, default=-1};
	__property Forms::TWindowState FormWindowState = {read=FWindowState, write=FWindowState, default=0};
	__property Graphics::TColor ButtonColor = {read=FButtonColor, write=FButtonColor, default=-16777201};
	__property bool ShowButtonGlyphs = {read=FShowButtonGlyphs, write=FShowButtonGlyphs, default=0};
	__property Graphics::TColor FrameColor = {read=FFrameColor, write=FFrameColor, default=-16777200};
	__property Rzcommon::TFrameStyle FrameStyle = {read=FFrameStyle, write=FFrameStyle, default=1};
	__property bool FrameVisible = {read=FFrameVisible, write=FFrameVisible, default=0};
	__property Rzcommon::TFramingPreference FramingPreference = {read=FFramingPreference, write=FFramingPreference, default=1};
	__property bool HotTrack = {read=FHotTrack, write=FHotTrack, default=0};
	__property Graphics::TColor HighlightColor = {read=FHighlightColor, write=FHighlightColor, default=-16777203};
	__property Graphics::TColor HotTrackColor = {read=FHotTrackColor, write=FHotTrackColor, default=1350640};
	__property Rzcommon::TRzHotTrackColorType HotTrackColorType = {read=FHotTrackColorType, write=FHotTrackColorType, default=1};
	__property Rzcommon::TRzGradientColorStyle ToolBtnGradientColorStyle = {read=FToolBtnGradientColorStyle, write=FToolBtnGradientColorStyle, default=0};
	__property Graphics::TColor ToolBtnSelectionColorStart = {read=FToolBtnSelectionColorStart, write=FToolBtnSelectionColorStart, default=-16777201};
	__property Graphics::TColor ToolBtnSelectionColorStop = {read=FToolBtnSelectionColorStop, write=FToolBtnSelectionColorStop, default=-16777200};
	__property Graphics::TColor ToolBtnSelectionFrameColor = {read=FToolBtnSelectionFrameColor, write=FToolBtnSelectionFrameColor, default=-16777195};
	__property Rzcommon::TRzVisualStyle ToolBtnVisualStyle = {read=FToolBtnVisualStyle, write=FToolBtnVisualStyle, default=1};
	__property Classes::TNotifyEvent OnInitialized = {read=FOnInit, write=FOnInit};
	__property Classes::TNotifyEvent OnFormClose = {read=FOnFormClose, write=FOnFormClose};
	__property Classes::TNotifyEvent OnFormShow = {read=FOnFormShow, write=FOnFormShow};
	
public:
	__fastcall virtual TRzShellDialog(Classes::TComponent* AOwner);
	bool __fastcall Execute(void);
	void __fastcall ReadStateFromRegistry(HKEY BaseKey, System::UnicodeString SubKeyName, System::UnicodeString ValueName);
	void __fastcall WriteStateToRegistry(HKEY BaseKey, System::UnicodeString SubKeyName, System::UnicodeString ValueName);
	DYNAMIC void __fastcall ReadStateFromStream(Classes::TStream* Stream);
	DYNAMIC void __fastcall WriteStateToStream(Classes::TStream* Stream);
public:
	/* TComponent.Destroy */ inline __fastcall virtual ~TRzShellDialog(void) { }
	
};


typedef void __fastcall (__closure *TRzFolderBrowseSelChangeEvent)(System::TObject* Sender, Shlobj::PItemIDList NewSel);

class DELPHICLASS TRzCustomSelectFolderDialog;
class PASCALIMPLEMENTATION TRzCustomSelectFolderDialog : public TRzShellDialog
{
	typedef TRzShellDialog inherited;
	
private:
	Forms::TCustomForm* FForm;
	Rzshellctrls::TRzShellLocator* FBaseFolder;
	TRzSelectFolderDialogOptions FOptions;
	Rzshellctrls::TRzShAddItemEvent FOnAddItem;
	TRzFolderBrowseSelChangeEvent FOnSelChange;
	System::UnicodeString FStatus;
	Rzshellctrls::TRzShellLocator* FSelectedFolder;
	bool __fastcall GetOkEnabled(void);
	System::UnicodeString __fastcall GetSelectedPathName(void);
	void __fastcall SetBaseFolder(Rzshellctrls::TRzShellLocator* Value);
	void __fastcall SetOkEnabled(bool Value);
	void __fastcall SetStatus(const System::UnicodeString Value);
	void __fastcall SetSelectedPathName(const System::UnicodeString Value);
	void __fastcall SetSelectedFolder(Rzshellctrls::TRzShellLocator* Value);
	
protected:
	void __fastcall AssertFormActive(void);
	void __fastcall AssertFormNotActive(void);
	DYNAMIC bool __fastcall DoExecute(void);
	virtual Forms::TCustomForm* __fastcall CreateForm(void);
	virtual void __fastcall InitForm(Forms::TCustomForm* Form);
	virtual void __fastcall SaveFormSettings(Forms::TCustomForm* Form);
	__property Forms::TCustomForm* Form = {read=FForm};
	__property System::UnicodeString SelectedPathName = {read=GetSelectedPathName, write=SetSelectedPathName};
	__property Rzshellctrls::TRzShellLocator* SelectedFolder = {read=FSelectedFolder, write=SetSelectedFolder};
	__property System::UnicodeString Status = {read=FStatus, write=SetStatus};
	__property bool OkEnabled = {read=GetOkEnabled, write=SetOkEnabled, nodefault};
	__property Rzshellctrls::TRzShellLocator* BaseFolder = {read=FBaseFolder, write=SetBaseFolder};
	__property TRzSelectFolderDialogOptions Options = {read=FOptions, write=FOptions, default=706};
	__property Rzshellctrls::TRzShAddItemEvent OnAddItem = {read=FOnAddItem, write=FOnAddItem};
	__property TRzFolderBrowseSelChangeEvent OnSelChange = {read=FOnSelChange, write=FOnSelChange};
	
public:
	__fastcall virtual TRzCustomSelectFolderDialog(Classes::TComponent* AOwner);
	__fastcall virtual ~TRzCustomSelectFolderDialog(void);
	__property Executing;
};


class DELPHICLASS TRzSelectFolderDialog;
class PASCALIMPLEMENTATION TRzSelectFolderDialog : public TRzCustomSelectFolderDialog
{
	typedef TRzCustomSelectFolderDialog inherited;
	
public:
	__property Form;
	__property SelectedFolder;
	__property SelectedPathName;
	__property Status;
	__property OkEnabled;
	
__published:
	__property Rzcommon::TRzAboutInfo About = {read=FAboutInfo, write=FAboutInfo, stored=false, nodefault};
	__property Title;
	__property FormPosition = {default=4};
	__property FormLeft = {default=-1};
	__property FormTop = {default=-1};
	__property FormWidth = {default=-1};
	__property FormHeight = {default=-1};
	__property FormWindowState = {default=0};
	__property BaseFolder;
	__property Options = {default=706};
	__property FrameColor = {default=-16777200};
	__property FrameStyle = {default=1};
	__property FrameVisible = {default=0};
	__property FramingPreference = {default=1};
	__property ButtonColor = {default=-16777201};
	__property ShowButtonGlyphs = {default=0};
	__property HotTrack = {default=0};
	__property HighlightColor = {default=-16777203};
	__property HotTrackColor = {default=1350640};
	__property HotTrackColorType = {default=1};
	__property ToolBtnGradientColorStyle = {default=0};
	__property ToolBtnSelectionColorStart = {default=-16777201};
	__property ToolBtnSelectionColorStop = {default=-16777200};
	__property ToolBtnSelectionFrameColor = {default=-16777195};
	__property ToolBtnVisualStyle = {default=1};
	__property OnAddItem;
	__property OnFormClose;
	__property OnFormShow;
	__property OnSelChange;
	__property OnInitialized;
public:
	/* TRzCustomSelectFolderDialog.Create */ inline __fastcall virtual TRzSelectFolderDialog(Classes::TComponent* AOwner) : TRzCustomSelectFolderDialog(AOwner) { }
	/* TRzCustomSelectFolderDialog.Destroy */ inline __fastcall virtual ~TRzSelectFolderDialog(void) { }
	
};


#pragma option push -b-
enum TRzOpenSaveOption { osoAllowMultiselect, osoCreatePrompt, osoExtensionDifferent, osoFileMustExist, osoHideReadOnly, osoNoChangeDir, osoNoDereferenceLinks, osoNoReadOnlyReturn, osoNoTestFileCreate, osoNoValidate, osoOverwritePrompt, osoReadOnly, osoPathMustExist, osoShareAware, osoShowHelp, osoAllowTree, osoShowTree, osoShowHints, osoHideFoldersInListWhenTreeVisible, osoOleDrag, osoOleDrop, osoShowHidden, osoFilesCanBeFolders };
#pragma option pop

typedef Set<TRzOpenSaveOption, osoAllowMultiselect, osoFilesCanBeFolders>  TRzOpenSaveOptions;

class DELPHICLASS TRzFileDialog;
class PASCALIMPLEMENTATION TRzFileDialog : public TRzShellDialog
{
	typedef TRzShellDialog inherited;
	
private:
	Classes::TStrings* FHistoryList;
	TRzOpenSaveOptions FOptions;
	System::UnicodeString FDefaultExt;
	Classes::TStrings* FFiles;
	System::UnicodeString FFilter;
	int FFilterIndex;
	Classes::THelpContext FHelpContext;
	System::UnicodeString FInitialDir;
	int FFormSplitterPos;
	Rzshellctrls::TRzShAddItemEvent FOnAddListItem;
	Rzshellctrls::TRzShAddItemEvent FOnAddTreeItem;
	Rzshellctrls::TRzShAddItemEvent FOnAddComboItem;
	Classes::TNotifyEvent FOnFolderChanged;
	Classes::TNotifyEvent FOnSelectionChanged;
	Classes::TNotifyEvent FOnTypeChanged;
	Forms::THelpEvent FOnHelp;
	System::UnicodeString __fastcall GetFilename(void);
	int __fastcall GetFilterIndex(void);
	void __fastcall SetFilename(const System::UnicodeString Value);
	void __fastcall SetOptions(TRzOpenSaveOptions Value);
	void __fastcall SetFilter(const System::UnicodeString Value);
	void __fastcall SetFilterIndex(int Value);
	void __fastcall SetFormSplitterPos(int Value);
	void __fastcall SetOnAddListItem(Rzshellctrls::TRzShAddItemEvent Value);
	void __fastcall SetOnAddTreeItem(Rzshellctrls::TRzShAddItemEvent Value);
	void __fastcall SetOnAddComboItem(Rzshellctrls::TRzShAddItemEvent Value);
	void __fastcall SetHistoryList(Classes::TStrings* Value);
	
protected:
	Forms::TCustomForm* FForm;
	DYNAMIC bool __fastcall DoExecute(void);
	virtual Forms::TCustomForm* __fastcall CreateForm(void);
	virtual void __fastcall InitForm(Forms::TCustomForm* Form);
	virtual void __fastcall SaveFormSettings(Forms::TCustomForm* Form);
	__property Forms::TCustomForm* Form = {read=FForm};
	__property System::UnicodeString DefaultExt = {read=FDefaultExt, write=FDefaultExt};
	__property TRzOpenSaveOptions Options = {read=FOptions, write=SetOptions, nodefault};
	__property System::UnicodeString FileName = {read=GetFilename, write=SetFilename};
	__property Classes::TStrings* Files = {read=FFiles};
	__property System::UnicodeString Filter = {read=FFilter, write=SetFilter};
	__property int FilterIndex = {read=GetFilterIndex, write=SetFilterIndex, default=1};
	__property int FormSplitterPos = {read=FFormSplitterPos, write=SetFormSplitterPos, default=-1};
	__property Classes::THelpContext HelpContext = {read=FHelpContext, write=FHelpContext, default=0};
	__property Classes::TStrings* HistoryList = {read=FHistoryList, write=SetHistoryList, stored=false};
	__property System::UnicodeString InitialDir = {read=FInitialDir, write=FInitialDir};
	__property Rzshellctrls::TRzShAddItemEvent OnAddListItem = {read=FOnAddListItem, write=SetOnAddListItem};
	__property Rzshellctrls::TRzShAddItemEvent OnAddTreeItem = {read=FOnAddTreeItem, write=SetOnAddTreeItem};
	__property Rzshellctrls::TRzShAddItemEvent OnAddComboItem = {read=FOnAddComboItem, write=SetOnAddComboItem};
	__property Forms::THelpEvent OnHelp = {read=FOnHelp, write=FOnHelp};
	__property Classes::TNotifyEvent OnFolderChanged = {read=FOnFolderChanged, write=FOnFolderChanged};
	__property Classes::TNotifyEvent OnSelectionChanged = {read=FOnSelectionChanged, write=FOnSelectionChanged};
	__property Classes::TNotifyEvent OnTypeChanged = {read=FOnTypeChanged, write=FOnTypeChanged};
	
public:
	__fastcall virtual TRzFileDialog(Classes::TComponent* AOwner);
	__fastcall virtual ~TRzFileDialog(void);
	DYNAMIC void __fastcall ReadStateFromStream(Classes::TStream* Stream);
	DYNAMIC void __fastcall WriteStateToStream(Classes::TStream* Stream);
	
__published:
	__property FrameColor = {default=-16777200};
	__property FrameStyle = {default=1};
	__property FrameVisible = {default=0};
	__property FramingPreference = {default=1};
	__property ButtonColor = {default=-16777201};
	__property ShowButtonGlyphs = {default=0};
	__property HotTrack = {default=0};
	__property HighlightColor = {default=-16777203};
	__property HotTrackColor = {default=1350640};
	__property HotTrackColorType = {default=1};
	__property ToolBtnGradientColorStyle = {default=0};
	__property ToolBtnSelectionColorStart = {default=-16777201};
	__property ToolBtnSelectionColorStop = {default=-16777200};
	__property ToolBtnSelectionFrameColor = {default=-16777195};
	__property ToolBtnVisualStyle = {default=1};
};


class DELPHICLASS TRzCustomOpenDialog;
class PASCALIMPLEMENTATION TRzCustomOpenDialog : public TRzFileDialog
{
	typedef TRzFileDialog inherited;
	
protected:
	virtual void __fastcall InitForm(Forms::TCustomForm* Form);
	
public:
	__fastcall virtual TRzCustomOpenDialog(Classes::TComponent* AOwner);
public:
	/* TRzFileDialog.Destroy */ inline __fastcall virtual ~TRzCustomOpenDialog(void) { }
	
};


class DELPHICLASS TRzOpenDialog;
class PASCALIMPLEMENTATION TRzOpenDialog : public TRzCustomOpenDialog
{
	typedef TRzCustomOpenDialog inherited;
	
public:
	__property Executing;
	__property FileName;
	__property Files;
	__property Form;
	
__published:
	__property Rzcommon::TRzAboutInfo About = {read=FAboutInfo, write=FAboutInfo, stored=false, nodefault};
	__property Title;
	__property Options = {default=3833872};
	__property Filter;
	__property FilterIndex = {default=1};
	__property FormPosition = {default=4};
	__property FormLeft = {default=-1};
	__property FormTop = {default=-1};
	__property FormWidth = {default=-1};
	__property FormHeight = {default=-1};
	__property FormWindowState = {default=0};
	__property FormSplitterPos = {default=-1};
	__property HelpContext = {default=0};
	__property HistoryList;
	__property InitialDir;
	__property DefaultExt;
	__property OnAddListItem;
	__property OnAddTreeItem;
	__property OnAddComboItem;
	__property OnInitialized;
	__property OnHelp;
	__property OnFormClose;
	__property OnFormShow;
	__property OnFolderChanged;
	__property OnSelectionChanged;
	__property OnTypeChanged;
public:
	/* TRzCustomOpenDialog.Create */ inline __fastcall virtual TRzOpenDialog(Classes::TComponent* AOwner) : TRzCustomOpenDialog(AOwner) { }
	
public:
	/* TRzFileDialog.Destroy */ inline __fastcall virtual ~TRzOpenDialog(void) { }
	
};


class DELPHICLASS TRzCustomSaveDialog;
class PASCALIMPLEMENTATION TRzCustomSaveDialog : public TRzFileDialog
{
	typedef TRzFileDialog inherited;
	
protected:
	virtual void __fastcall InitForm(Forms::TCustomForm* Form);
	
public:
	__fastcall virtual TRzCustomSaveDialog(Classes::TComponent* aOwner);
public:
	/* TRzFileDialog.Destroy */ inline __fastcall virtual ~TRzCustomSaveDialog(void) { }
	
};


class DELPHICLASS TRzSaveDialog;
class PASCALIMPLEMENTATION TRzSaveDialog : public TRzCustomSaveDialog
{
	typedef TRzCustomSaveDialog inherited;
	
public:
	__property Executing;
	__property FileName;
	__property Files;
	__property Form;
	
__published:
	__property Rzcommon::TRzAboutInfo About = {read=FAboutInfo, write=FAboutInfo, stored=false, nodefault};
	__property DefaultExt;
	__property Title;
	__property Options = {default=3833872};
	__property Filter;
	__property FilterIndex = {default=1};
	__property FormPosition = {default=4};
	__property FormLeft = {default=-1};
	__property FormTop = {default=-1};
	__property FormWidth = {default=-1};
	__property FormHeight = {default=-1};
	__property FormWindowState = {default=0};
	__property FormSplitterPos = {default=-1};
	__property HelpContext = {default=0};
	__property HistoryList;
	__property InitialDir;
	__property OnAddListItem;
	__property OnAddTreeItem;
	__property OnAddComboItem;
	__property OnInitialized;
	__property OnHelp;
	__property OnFormClose;
	__property OnFormShow;
	__property OnFolderChanged;
	__property OnSelectionChanged;
	__property OnTypeChanged;
public:
	/* TRzCustomSaveDialog.Create */ inline __fastcall virtual TRzSaveDialog(Classes::TComponent* aOwner) : TRzCustomSaveDialog(aOwner) { }
	
public:
	/* TRzFileDialog.Destroy */ inline __fastcall virtual ~TRzSaveDialog(void) { }
	
};


//-- var, const, procedure ---------------------------------------------------
#define DEF_SFDO_OPTIONS (Set<TRzSelectFolderDialogOption, sfdoCreateDeleteButtons, sfdoShowHidden> () << sfdoContextMenus << sfdoCreateFolderIcon << sfdoDeleteFolderIcon << sfdoShowHidden )
#define DEF_OPEN_OPTIONS (Set<TRzOpenSaveOption, osoAllowMultiselect, osoFilesCanBeFolders> () << osoHideReadOnly << osoAllowTree << osoShowHints << osoOleDrag << osoOleDrop << osoShowHidden )
#define DEF_SAVE_OPTIONS (Set<TRzOpenSaveOption, osoAllowMultiselect, osoFilesCanBeFolders> () << osoHideReadOnly << osoAllowTree << osoShowHints << osoOleDrag << osoOleDrop << osoShowHidden )

}	/* namespace Rzshelldialogs */
using namespace Rzshelldialogs;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// RzshelldialogsHPP
