// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Rzfilsys.pas' rev: 21.00

#ifndef RzfilsysHPP
#define RzfilsysHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Stdctrls.hpp>	// Pascal unit
#include <Filectrl.hpp>	// Pascal unit
#include <Shellapi.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Rztreevw.hpp>	// Pascal unit
#include <Comctrls.hpp>	// Pascal unit
#include <Commctrl.hpp>	// Pascal unit
#include <Rzcommon.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Imglist.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Rzfilsys
{
//-- type declarations -------------------------------------------------------
typedef Set<Filectrl::TDriveType, dtUnknown, dtRAM>  TDriveTypes;

typedef Set<ShortInt, 0, 25>  TDriveBits;

class DELPHICLASS TRzFileInfo;
class PASCALIMPLEMENTATION TRzFileInfo : public System::TObject
{
	typedef System::TObject inherited;
	
public:
	System::UnicodeString Name;
	int Attr;
	int Time;
	int Size;
	bool IsDirectory;
	unsigned IconHandle;
	Graphics::TBitmap* IconGlyph;
public:
	/* TObject.Create */ inline __fastcall TRzFileInfo(void) : System::TObject() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TRzFileInfo(void) { }
	
};


class DELPHICLASS TRzFileListBox;
class DELPHICLASS TRzDirectoryTree;
class PASCALIMPLEMENTATION TRzFileListBox [[deprecated]] : public Filectrl::TFileListBox
{
	typedef Filectrl::TFileListBox inherited;
	
private:
	Rzcommon::TRzAboutInfo FAboutInfo [[deprecated]];
	TRzDirectoryTree* FDirTree [[deprecated]];
	Classes::TStringList* FFileInfoList [[deprecated]];
	bool FShowLongNames [[deprecated]];
	bool FAllowOpen [[deprecated]];
	bool FUpdatingColor [[deprecated]];
	Graphics::TColor FDisabledColor [[deprecated]];
	Graphics::TColor FFocusColor [[deprecated]];
	Graphics::TColor FNormalColor [[deprecated]];
	Graphics::TColor FFrameColor [[deprecated]];
	Rzcommon::TRzFrameController* FFrameController [[deprecated]];
	Graphics::TColor FFrameHotColor [[deprecated]];
	bool FFrameHotTrack [[deprecated]];
	Rzcommon::TFrameStyleEx FFrameHotStyle [[deprecated]];
	Rzcommon::TSides FFrameSides [[deprecated]];
	Rzcommon::TFrameStyleEx FFrameStyle [[deprecated]];
	bool FFrameVisible [[deprecated]];
	Rzcommon::TFramingPreference FFramingPreference [[deprecated]];
	bool FInReadFileNames [[deprecated]];
	HIDESBASE void __fastcall ResetItemHeight [[deprecated]](void);
	void __fastcall ReadOldFrameFlatProp [[deprecated]](Classes::TReader* Reader);
	void __fastcall ReadOldFrameFocusStyleProp [[deprecated]](Classes::TReader* Reader);
	HIDESBASE MESSAGE void __fastcall CMColorChanged [[deprecated]](Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall CMFontChanged [[deprecated]](Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall CNDrawItem [[deprecated]](Messages::TWMDrawItem &Msg);
	HIDESBASE MESSAGE void __fastcall WMWindowPosChanging [[deprecated]](Messages::TWMWindowPosMsg &Msg);
	HIDESBASE MESSAGE void __fastcall WMNCPaint [[deprecated]](Messages::TWMNCPaint &Msg);
	HIDESBASE MESSAGE void __fastcall CMParentColorChanged [[deprecated]](Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall CMEnter [[deprecated]](Messages::TWMNoParams &Msg);
	HIDESBASE MESSAGE void __fastcall CMExit [[deprecated]](Messages::TWMNoParams &Msg);
	HIDESBASE MESSAGE void __fastcall CMMouseEnter [[deprecated]](Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall CMMouseLeave [[deprecated]](Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall WMSize [[deprecated]](Messages::TWMSize &Msg);
	HIDESBASE MESSAGE void __fastcall CMEnabledChanged [[deprecated]](Messages::TMessage &Msg);
	
protected:
	Graphics::TCanvas* FCanvas [[deprecated]];
	bool FOverControl [[deprecated]];
	virtual void __fastcall DefineProperties [[deprecated]](Classes::TFiler* Filer);
	virtual void __fastcall Loaded [[deprecated]](void);
	virtual void __fastcall Notification [[deprecated]](Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall UpdateColors [[deprecated]](void);
	virtual void __fastcall UpdateFrame [[deprecated]](bool ViaMouse, bool InFocus);
	virtual void __fastcall RepaintFrame [[deprecated]](void);
	virtual void __fastcall ClearFileInfoList [[deprecated]](void);
	DYNAMIC void __fastcall DblClick [[deprecated]](void);
	virtual void __fastcall ReadBitmaps [[deprecated]](void);
	virtual void __fastcall ReadFileNames [[deprecated]](void);
	void __fastcall LocalSetDirectory [[deprecated]](const System::UnicodeString NewDirectory);
	System::UnicodeString __fastcall LocalGetFileName [[deprecated]](void);
	void __fastcall LocalSetFileName [[deprecated]](const System::UnicodeString NewFile);
	virtual int __fastcall Compare [[deprecated]](TRzFileInfo* A, TRzFileInfo* B);
	virtual void __fastcall QuickSort [[deprecated]](int L, int R);
	virtual void __fastcall DrawItem [[deprecated]](int Index, const Types::TRect &Rect, Windows::TOwnerDrawState State);
	DYNAMIC bool __fastcall DoMouseWheelDown [[deprecated]](Classes::TShiftState Shift, const Types::TPoint &MousePos);
	DYNAMIC bool __fastcall DoMouseWheelUp [[deprecated]](Classes::TShiftState Shift, const Types::TPoint &MousePos);
	bool __fastcall StoreColor [[deprecated]](void);
	bool __fastcall StoreFocusColor [[deprecated]](void);
	bool __fastcall NotUsingController [[deprecated]](void);
	virtual void __fastcall SetDisabledColor [[deprecated]](Graphics::TColor Value);
	virtual void __fastcall SetFocusColor [[deprecated]](Graphics::TColor Value);
	virtual void __fastcall SetFrameColor [[deprecated]](Graphics::TColor Value);
	virtual void __fastcall SetFrameController [[deprecated]](Rzcommon::TRzFrameController* Value);
	virtual void __fastcall SetFrameHotColor [[deprecated]](Graphics::TColor Value);
	virtual void __fastcall SetFrameHotTrack [[deprecated]](bool Value);
	virtual void __fastcall SetFrameHotStyle [[deprecated]](Rzcommon::TFrameStyle Value);
	virtual void __fastcall SetFrameSides [[deprecated]](Rzcommon::TSides Value);
	virtual void __fastcall SetFrameStyle [[deprecated]](Rzcommon::TFrameStyle Value);
	virtual void __fastcall SetFrameVisible [[deprecated]](bool Value);
	virtual void __fastcall SetFramingPreference [[deprecated]](Rzcommon::TFramingPreference Value);
	virtual bool __fastcall GetShowGlyphs [[deprecated]](void);
	HIDESBASE virtual void __fastcall SetShowGlyphs [[deprecated]](bool Value);
	virtual void __fastcall SetShowLongNames [[deprecated]](bool Value);
	virtual System::UnicodeString __fastcall GetLongFileName [[deprecated]](void);
	virtual System::UnicodeString __fastcall GetShortFileName [[deprecated]](void);
	
public:
	__fastcall virtual TRzFileListBox [[deprecated]](Classes::TComponent* AOwner);
	__fastcall virtual ~TRzFileListBox [[deprecated]](void);
	virtual bool __fastcall UseThemes [[deprecated]](void);
	void __fastcall UpOneLevel [[deprecated]](void);
	virtual void __fastcall ApplyFilePath [[deprecated]](const System::UnicodeString Value);
	__property System::UnicodeString LongFileName [[deprecated]] = {read=GetLongFileName};
	__property System::UnicodeString ShortFileName [[deprecated]] = {read=GetShortFileName};
	
__published:
	__property Rzcommon::TRzAboutInfo About [[deprecated]] = {read=FAboutInfo, write=FAboutInfo, stored=false, nodefault};
	__property bool AllowOpen [[deprecated]] = {read=FAllowOpen, write=FAllowOpen, default=0};
	__property Columns [[deprecated]] = {default=0};
	__property Color [[deprecated]] = {stored=StoreColor, default=-16777211};
	__property Graphics::TColor DisabledColor [[deprecated]] = {read=FDisabledColor, write=SetDisabledColor, stored=NotUsingController, default=-16777201};
	__property Graphics::TColor FocusColor [[deprecated]] = {read=FFocusColor, write=SetFocusColor, stored=StoreFocusColor, default=-16777211};
	__property Graphics::TColor FrameColor [[deprecated]] = {read=FFrameColor, write=SetFrameColor, stored=NotUsingController, default=-16777200};
	__property Rzcommon::TRzFrameController* FrameController [[deprecated]] = {read=FFrameController, write=SetFrameController};
	__property Graphics::TColor FrameHotColor [[deprecated]] = {read=FFrameHotColor, write=SetFrameHotColor, stored=NotUsingController, default=-16777200};
	__property Rzcommon::TFrameStyle FrameHotStyle [[deprecated]] = {read=FFrameHotStyle, write=SetFrameHotStyle, stored=NotUsingController, default=10};
	__property bool FrameHotTrack [[deprecated]] = {read=FFrameHotTrack, write=SetFrameHotTrack, stored=NotUsingController, default=0};
	__property Rzcommon::TSides FrameSides [[deprecated]] = {read=FFrameSides, write=SetFrameSides, stored=NotUsingController, default=15};
	__property Rzcommon::TFrameStyle FrameStyle [[deprecated]] = {read=FFrameStyle, write=SetFrameStyle, stored=NotUsingController, default=1};
	__property bool FrameVisible [[deprecated]] = {read=FFrameVisible, write=SetFrameVisible, stored=NotUsingController, default=0};
	__property Rzcommon::TFramingPreference FramingPreference [[deprecated]] = {read=FFramingPreference, write=SetFramingPreference, default=1};
	__property bool ShowLongNames [[deprecated]] = {read=FShowLongNames, write=SetShowLongNames, default=1};
	__property bool ShowGlyphs [[deprecated]] = {read=GetShowGlyphs, write=SetShowGlyphs, default=1};
	__property OnMouseWheel [[deprecated]];
	__property OnMouseWheelUp [[deprecated]];
	__property OnMouseWheelDown [[deprecated]];
public:
	/* TWinControl.CreateParented */ inline __fastcall TRzFileListBox(HWND ParentWindow) : Filectrl::TFileListBox(ParentWindow) { }
	
};


struct TFolderInfo;
typedef TFolderInfo *PFolderInfo;

struct TFolderInfo
{
	
public:
	System::UnicodeString FullPath;
	bool ProcessedChildren;
};


#pragma option push -b-
enum TNetworkVolumeFormat { nvfExplorer, nvfUNC, nvfVolumeOnly };
#pragma option pop

class PASCALIMPLEMENTATION TRzDirectoryTree [[deprecated]] : public Rztreevw::TRzCustomTreeView
{
	typedef Rztreevw::TRzCustomTreeView inherited;
	
private:
	Rzcommon::TRzAboutInfo FAboutInfo [[deprecated]];
	TRzFileListBox* FFileList [[deprecated]];
	Stdctrls::TLabel* FDirLabel [[deprecated]];
	bool FShowHiddenDirs [[deprecated]];
	bool FOpenCurrentDir [[deprecated]];
	TNetworkVolumeFormat FNetworkVolumeFormat [[deprecated]];
	void *FObjInst [[deprecated]];
	void *FOldWndProc [[deprecated]];
	HWND FFormHandle [[deprecated]];
	System::UnicodeString FSaveDirectory [[deprecated]];
	bool FUpdating [[deprecated]];
	Controls::TImageList* FImages [[deprecated]];
	int FFolderOpenIconIndex [[deprecated]];
	int FFolderClosedIconIndex [[deprecated]];
	TDriveBits FActiveDrives [[deprecated]];
	TDriveTypes FDriveTypes [[deprecated]];
	StaticArray<unsigned, 26> FDriveSerialNums [[deprecated]];
	System::WideChar FOldDrive [[deprecated]];
	Classes::TNotifyEvent FOnDriveChange [[deprecated]];
	Comctrls::TTVExpandedEvent FOnDeletion [[deprecated]];
	void __fastcall AddFolderInfoToNode [[deprecated]](Comctrls::TTreeNode* Node, const System::UnicodeString NodePath, int IconIndex);
	void __fastcall FormWndProc [[deprecated]](Messages::TMessage &Msg);
	
protected:
	virtual void __fastcall CreateWindowHandle [[deprecated]](const Controls::TCreateParams &Params);
	virtual void __fastcall CreateWnd [[deprecated]](void);
	virtual void __fastcall DestroyWindowHandle [[deprecated]](void);
	virtual void __fastcall DestroyWnd [[deprecated]](void);
	virtual void __fastcall InitImageList [[deprecated]](void);
	virtual void __fastcall InitView [[deprecated]](void);
	virtual void __fastcall Loaded [[deprecated]](void);
	virtual void __fastcall Notification [[deprecated]](Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall UpdateActiveDrives [[deprecated]](void);
	virtual void __fastcall ClearTree [[deprecated]](void);
	DYNAMIC bool __fastcall CanExpand [[deprecated]](Comctrls::TTreeNode* Node);
	virtual void __fastcall ResetNode [[deprecated]](Comctrls::TTreeNode* Node);
	void __fastcall ProcessChildren [[deprecated]](Comctrls::TTreeNode* &Node);
	bool __fastcall HaveProcessedChildren [[deprecated]](Comctrls::TTreeNode* Node);
	void __fastcall AddTempNodeIfHasChildren [[deprecated]](Comctrls::TTreeNode* &Node);
	DYNAMIC void __fastcall Delete [[deprecated]](Comctrls::TTreeNode* Node);
	DYNAMIC void __fastcall DriveChange [[deprecated]](void);
	DYNAMIC bool __fastcall CanChange [[deprecated]](Comctrls::TTreeNode* Node);
	DYNAMIC void __fastcall Change [[deprecated]](Comctrls::TTreeNode* Node);
	DYNAMIC void __fastcall Click [[deprecated]](void);
	DYNAMIC void __fastcall KeyDown [[deprecated]](System::Word &Key, Classes::TShiftState Shift);
	void __fastcall EditingHandler [[deprecated]](System::TObject* Sender, Comctrls::TTreeNode* Node, bool &AllowEdit);
	void __fastcall EditedHandler [[deprecated]](System::TObject* Sender, Comctrls::TTreeNode* Node, System::UnicodeString &S);
	virtual System::UnicodeString __fastcall GetDirectory [[deprecated]](void);
	virtual void __fastcall SetDirectory [[deprecated]](const System::UnicodeString Value);
	virtual System::WideChar __fastcall GetDrive [[deprecated]](void);
	virtual TDriveBits __fastcall GetDrives [[deprecated]](void);
	virtual void __fastcall SetDriveTypes [[deprecated]](TDriveTypes Value);
	virtual void __fastcall SetFileList [[deprecated]](TRzFileListBox* Value);
	virtual void __fastcall SetDirLabel [[deprecated]](Stdctrls::TLabel* Value);
	virtual void __fastcall SetDirLabelCaption [[deprecated]](void);
	virtual void __fastcall SetNetworkVolumeFormat [[deprecated]](TNetworkVolumeFormat Value);
	virtual void __fastcall SetShowHiddenDirs [[deprecated]](bool Value);
	__property Items [[deprecated]] = {stored=false};
	
public:
	__fastcall virtual TRzDirectoryTree [[deprecated]](Classes::TComponent* AOwner);
	__fastcall virtual ~TRzDirectoryTree [[deprecated]](void);
	virtual void __fastcall RefreshTree [[deprecated]](void);
	void __fastcall RefreshDriveTree [[deprecated]](System::WideChar DriveChar);
	bool __fastcall NodeHasData [[deprecated]](Comctrls::TTreeNode* Node);
	Comctrls::TTreeNode* __fastcall GetNodeFromPath [[deprecated]](System::UnicodeString Path);
	System::UnicodeString __fastcall GetPathFromNode [[deprecated]](Comctrls::TTreeNode* Node);
	void __fastcall UpOneLevel [[deprecated]](void);
	void __fastcall CreateNewDir [[deprecated]](System::UnicodeString NewDirName, bool PlaceInEditMode);
	__property System::UnicodeString Directory [[deprecated]] = {read=GetDirectory, write=SetDirectory};
	__property System::WideChar Drive [[deprecated]] = {read=GetDrive, nodefault};
	
__published:
	__property Rzcommon::TRzAboutInfo About [[deprecated]] = {read=FAboutInfo, write=FAboutInfo, stored=false, nodefault};
	__property Stdctrls::TLabel* DirLabel [[deprecated]] = {read=FDirLabel, write=SetDirLabel};
	__property TDriveTypes DriveTypes [[deprecated]] = {read=FDriveTypes, write=SetDriveTypes, default=125};
	__property TRzFileListBox* FileList [[deprecated]] = {read=FFileList, write=SetFileList};
	__property bool OpenCurrentDir [[deprecated]] = {read=FOpenCurrentDir, write=FOpenCurrentDir, default=0};
	__property TNetworkVolumeFormat NetworkVolumeFormat [[deprecated]] = {read=FNetworkVolumeFormat, write=SetNetworkVolumeFormat, default=0};
	__property bool ShowHiddenDirs [[deprecated]] = {read=FShowHiddenDirs, write=SetShowHiddenDirs, default=0};
	__property Classes::TNotifyEvent OnDriveChange [[deprecated]] = {read=FOnDriveChange, write=FOnDriveChange};
	__property Comctrls::TTVExpandedEvent OnDeletion [[deprecated]] = {read=FOnDeletion, write=FOnDeletion};
	__property Align [[deprecated]] = {default=0};
	__property Anchors [[deprecated]] = {default=3};
	__property AutoExpand [[deprecated]] = {default=0};
	__property AutoSelect [[deprecated]] = {default=0};
	__property BiDiMode [[deprecated]];
	__property BorderStyle [[deprecated]] = {default=1};
	__property BorderWidth [[deprecated]] = {default=0};
	__property ChangeDelay [[deprecated]] = {default=0};
	__property Color [[deprecated]] = {default=-16777211};
	__property Constraints [[deprecated]];
	__property Ctl3D [[deprecated]];
	__property DisabledColor [[deprecated]] = {default=-16777201};
	__property DragCursor [[deprecated]] = {default=-12};
	__property DragKind [[deprecated]] = {default=0};
	__property DragMode [[deprecated]] = {default=0};
	__property Enabled [[deprecated]] = {default=1};
	__property Font [[deprecated]];
	__property FocusColor [[deprecated]] = {default=-16777211};
	__property FrameColor [[deprecated]] = {default=-16777200};
	__property FrameController [[deprecated]];
	__property FrameHotColor [[deprecated]] = {default=-16777200};
	__property FrameHotTrack [[deprecated]] = {default=0};
	__property FrameHotStyle [[deprecated]] = {default=10};
	__property FrameSides [[deprecated]] = {default=15};
	__property FrameStyle [[deprecated]] = {default=1};
	__property FrameVisible [[deprecated]] = {default=0};
	__property FramingPreference [[deprecated]] = {default=1};
	__property Height [[deprecated]] = {default=150};
	__property HideSelection [[deprecated]] = {default=1};
	__property HotTrack [[deprecated]] = {default=0};
	__property Indent [[deprecated]];
	__property ParentBiDiMode [[deprecated]] = {default=1};
	__property ParentColor [[deprecated]] = {default=0};
	__property ParentCtl3D [[deprecated]] = {default=1};
	__property ParentFont [[deprecated]] = {default=1};
	__property ParentShowHint [[deprecated]] = {default=1};
	__property PopupMenu [[deprecated]];
	__property ReadOnly [[deprecated]] = {default=1};
	__property RightClickSelect [[deprecated]] = {default=0};
	__property RowSelect [[deprecated]] = {default=0};
	__property SelectionPen [[deprecated]];
	__property ShowButtons [[deprecated]] = {default=1};
	__property ShowHint [[deprecated]];
	__property ShowLines [[deprecated]] = {default=1};
	__property StateImages [[deprecated]];
	__property TabOrder [[deprecated]] = {default=-1};
	__property TabStop [[deprecated]] = {default=1};
	__property ToolTips [[deprecated]] = {default=1};
	__property Visible [[deprecated]] = {default=1};
	__property Width [[deprecated]] = {default=250};
	__property OnChange [[deprecated]];
	__property OnChanging [[deprecated]];
	__property OnClick [[deprecated]];
	__property OnCollapsed [[deprecated]];
	__property OnCollapsing [[deprecated]];
	__property OnCompare [[deprecated]];
	__property OnContextPopup [[deprecated]];
	__property OnDblClick [[deprecated]];
	__property OnDragDrop [[deprecated]];
	__property OnDragOver [[deprecated]];
	__property OnEndDock [[deprecated]];
	__property OnEndDrag [[deprecated]];
	__property OnEnter [[deprecated]];
	__property OnExit [[deprecated]];
	__property OnExpanded [[deprecated]];
	__property OnExpanding [[deprecated]];
	__property OnKeyDown [[deprecated]];
	__property OnKeyPress [[deprecated]];
	__property OnKeyUp [[deprecated]];
	__property OnMouseActivate [[deprecated]];
	__property OnMouseDown [[deprecated]];
	__property OnMouseEnter [[deprecated]];
	__property OnMouseLeave [[deprecated]];
	__property OnMouseMove [[deprecated]];
	__property OnMouseUp [[deprecated]];
	__property OnMouseWheel [[deprecated]];
	__property OnMouseWheelDown [[deprecated]];
	__property OnMouseWheelUp [[deprecated]];
	__property OnStartDock [[deprecated]];
	__property OnStartDrag [[deprecated]];
public:
	/* TWinControl.CreateParented */ inline __fastcall TRzDirectoryTree(HWND ParentWindow) : Rztreevw::TRzCustomTreeView(ParentWindow) { }
	
};


class DELPHICLASS TRzDirectoryListBox;
class PASCALIMPLEMENTATION TRzDirectoryListBox [[deprecated]] : public Filectrl::TDirectoryListBox
{
	typedef Filectrl::TDirectoryListBox inherited;
	
private:
	Rzcommon::TRzAboutInfo FAboutInfo [[deprecated]];
	bool FUpdatingColor [[deprecated]];
	Graphics::TColor FDisabledColor [[deprecated]];
	Graphics::TColor FFocusColor [[deprecated]];
	Graphics::TColor FNormalColor [[deprecated]];
	Graphics::TColor FFrameColor [[deprecated]];
	Rzcommon::TRzFrameController* FFrameController [[deprecated]];
	Graphics::TColor FFrameHotColor [[deprecated]];
	bool FFrameHotTrack [[deprecated]];
	Rzcommon::TFrameStyleEx FFrameHotStyle [[deprecated]];
	Rzcommon::TSides FFrameSides [[deprecated]];
	Rzcommon::TFrameStyleEx FFrameStyle [[deprecated]];
	bool FFrameVisible [[deprecated]];
	Rzcommon::TFramingPreference FFramingPreference [[deprecated]];
	bool FShowLongNames [[deprecated]];
	void __fastcall ReadOldFrameFlatProp [[deprecated]](Classes::TReader* Reader);
	void __fastcall ReadOldFrameFocusStyleProp [[deprecated]](Classes::TReader* Reader);
	HIDESBASE MESSAGE void __fastcall CMColorChanged [[deprecated]](Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall WMNCPaint [[deprecated]](Messages::TWMNCPaint &Msg);
	HIDESBASE MESSAGE void __fastcall CMParentColorChanged [[deprecated]](Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall CMEnter [[deprecated]](Messages::TWMNoParams &Msg);
	HIDESBASE MESSAGE void __fastcall CMExit [[deprecated]](Messages::TWMNoParams &Msg);
	HIDESBASE MESSAGE void __fastcall CMMouseEnter [[deprecated]](Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall CMMouseLeave [[deprecated]](Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall WMSize [[deprecated]](Messages::TWMSize &Msg);
	HIDESBASE MESSAGE void __fastcall CMEnabledChanged [[deprecated]](Messages::TMessage &Msg);
	
protected:
	Graphics::TCanvas* FCanvas [[deprecated]];
	bool FOverControl [[deprecated]];
	virtual void __fastcall DefineProperties [[deprecated]](Classes::TFiler* Filer);
	virtual void __fastcall Loaded [[deprecated]](void);
	virtual void __fastcall Notification [[deprecated]](Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall UpdateColors [[deprecated]](void);
	virtual void __fastcall UpdateFrame [[deprecated]](bool ViaMouse, bool InFocus);
	virtual void __fastcall RepaintFrame [[deprecated]](void);
	virtual void __fastcall BuildList [[deprecated]](void);
	virtual void __fastcall Change [[deprecated]](void);
	virtual void __fastcall ReadBitmaps [[deprecated]](void);
	virtual void __fastcall DrawItem [[deprecated]](int Index, const Types::TRect &Rect, Windows::TOwnerDrawState State);
	int __fastcall DirLevel [[deprecated]](const System::UnicodeString PathName);
	System::UnicodeString __fastcall GetLongDirName [[deprecated]](void);
	void __fastcall UpdateDirLabel [[deprecated]](void);
	DYNAMIC bool __fastcall DoMouseWheelDown [[deprecated]](Classes::TShiftState Shift, const Types::TPoint &MousePos);
	DYNAMIC bool __fastcall DoMouseWheelUp [[deprecated]](Classes::TShiftState Shift, const Types::TPoint &MousePos);
	bool __fastcall StoreColor [[deprecated]](void);
	bool __fastcall StoreFocusColor [[deprecated]](void);
	bool __fastcall NotUsingController [[deprecated]](void);
	virtual void __fastcall SetDisabledColor [[deprecated]](Graphics::TColor Value);
	virtual void __fastcall SetFocusColor [[deprecated]](Graphics::TColor Value);
	virtual void __fastcall SetFrameColor [[deprecated]](Graphics::TColor Value);
	virtual void __fastcall SetFrameController [[deprecated]](Rzcommon::TRzFrameController* Value);
	virtual void __fastcall SetFrameHotColor [[deprecated]](Graphics::TColor Value);
	virtual void __fastcall SetFrameHotTrack [[deprecated]](bool Value);
	virtual void __fastcall SetFrameHotStyle [[deprecated]](Rzcommon::TFrameStyle Value);
	virtual void __fastcall SetFrameSides [[deprecated]](Rzcommon::TSides Value);
	virtual void __fastcall SetFrameStyle [[deprecated]](Rzcommon::TFrameStyle Value);
	virtual void __fastcall SetFrameVisible [[deprecated]](bool Value);
	virtual void __fastcall SetFramingPreference [[deprecated]](Rzcommon::TFramingPreference Value);
	void __fastcall SetShowLongNames [[deprecated]](bool Value);
	
public:
	__fastcall virtual TRzDirectoryListBox [[deprecated]](Classes::TComponent* AOwner);
	__fastcall virtual ~TRzDirectoryListBox [[deprecated]](void);
	virtual bool __fastcall UseThemes [[deprecated]](void);
	__property System::UnicodeString LongDirName [[deprecated]] = {read=GetLongDirName};
	
__published:
	__property Rzcommon::TRzAboutInfo About [[deprecated]] = {read=FAboutInfo, write=FAboutInfo, stored=false, nodefault};
	__property Color [[deprecated]] = {stored=StoreColor, default=-16777211};
	__property Graphics::TColor DisabledColor [[deprecated]] = {read=FDisabledColor, write=SetDisabledColor, stored=NotUsingController, default=-16777201};
	__property Graphics::TColor FocusColor [[deprecated]] = {read=FFocusColor, write=SetFocusColor, stored=StoreFocusColor, default=-16777211};
	__property Graphics::TColor FrameColor [[deprecated]] = {read=FFrameColor, write=SetFrameColor, stored=NotUsingController, default=-16777200};
	__property Rzcommon::TRzFrameController* FrameController [[deprecated]] = {read=FFrameController, write=SetFrameController};
	__property Graphics::TColor FrameHotColor [[deprecated]] = {read=FFrameHotColor, write=SetFrameHotColor, stored=NotUsingController, default=-16777200};
	__property Rzcommon::TFrameStyle FrameHotStyle [[deprecated]] = {read=FFrameHotStyle, write=SetFrameHotStyle, stored=NotUsingController, default=10};
	__property bool FrameHotTrack [[deprecated]] = {read=FFrameHotTrack, write=SetFrameHotTrack, stored=NotUsingController, default=0};
	__property Rzcommon::TSides FrameSides [[deprecated]] = {read=FFrameSides, write=SetFrameSides, stored=NotUsingController, default=15};
	__property Rzcommon::TFrameStyle FrameStyle [[deprecated]] = {read=FFrameStyle, write=SetFrameStyle, stored=NotUsingController, default=1};
	__property bool FrameVisible [[deprecated]] = {read=FFrameVisible, write=SetFrameVisible, stored=NotUsingController, default=0};
	__property Rzcommon::TFramingPreference FramingPreference [[deprecated]] = {read=FFramingPreference, write=SetFramingPreference, default=1};
	__property bool ShowLongNames [[deprecated]] = {read=FShowLongNames, write=SetShowLongNames, default=1};
	__property OnMouseWheel [[deprecated]];
	__property OnMouseWheelUp [[deprecated]];
	__property OnMouseWheelDown [[deprecated]];
public:
	/* TWinControl.CreateParented */ inline __fastcall TRzDirectoryListBox(HWND ParentWindow) : Filectrl::TDirectoryListBox(ParentWindow) { }
	
};


class DELPHICLASS TRzDriveComboBox;
class PASCALIMPLEMENTATION TRzDriveComboBox [[deprecated]] : public Filectrl::TDriveComboBox
{
	typedef Filectrl::TDriveComboBox inherited;
	
private:
	Rzcommon::TRzAboutInfo FAboutInfo [[deprecated]];
	TDriveTypes FDriveTypes [[deprecated]];
	bool FFlatButtons [[deprecated]];
	Graphics::TColor FFlatButtonColor [[deprecated]];
	bool FUpdatingColor [[deprecated]];
	Graphics::TColor FDisabledColor [[deprecated]];
	Graphics::TColor FFocusColor [[deprecated]];
	Graphics::TColor FNormalColor [[deprecated]];
	Graphics::TColor FFrameColor [[deprecated]];
	Rzcommon::TRzFrameController* FFrameController [[deprecated]];
	Graphics::TColor FFrameHotColor [[deprecated]];
	bool FFrameHotTrack [[deprecated]];
	Rzcommon::TFrameStyleEx FFrameHotStyle [[deprecated]];
	Rzcommon::TSides FFrameSides [[deprecated]];
	Rzcommon::TFrameStyleEx FFrameStyle [[deprecated]];
	bool FFrameVisible [[deprecated]];
	Rzcommon::TFramingPreference FFramingPreference [[deprecated]];
	void __fastcall ReadOldFrameFlatProp [[deprecated]](Classes::TReader* Reader);
	void __fastcall ReadOldFrameFocusStyleProp [[deprecated]](Classes::TReader* Reader);
	HIDESBASE MESSAGE void __fastcall CMColorChanged [[deprecated]](Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall CMFontChanged [[deprecated]](Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall WMPaint [[deprecated]](Messages::TWMPaint &Msg);
	HIDESBASE MESSAGE void __fastcall CMEnter [[deprecated]](Messages::TWMNoParams &Msg);
	HIDESBASE MESSAGE void __fastcall CMExit [[deprecated]](Messages::TWMNoParams &Msg);
	HIDESBASE MESSAGE void __fastcall CMMouseEnter [[deprecated]](Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall CMMouseLeave [[deprecated]](Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall WMSize [[deprecated]](Messages::TWMSize &Msg);
	HIDESBASE MESSAGE void __fastcall CMParentColorChanged [[deprecated]](Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall CMEnabledChanged [[deprecated]](Messages::TMessage &Msg);
	
protected:
	Graphics::TCanvas* FCanvas [[deprecated]];
	bool FInControl [[deprecated]];
	bool FOverControl [[deprecated]];
	bool FIsFocused [[deprecated]];
	virtual void __fastcall DefineProperties [[deprecated]](Classes::TFiler* Filer);
	virtual void __fastcall Loaded [[deprecated]](void);
	virtual void __fastcall Notification [[deprecated]](Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall UpdateColors [[deprecated]](void);
	virtual void __fastcall UpdateFrame [[deprecated]](bool ViaMouse, bool InFocus);
	void __fastcall ReadNewBitmaps [[deprecated]](void);
	virtual void __fastcall BuildList [[deprecated]](void);
	HIDESBASE void __fastcall ResetItemHeight [[deprecated]](void);
	virtual void __fastcall SetFlatButtons [[deprecated]](bool Value);
	virtual void __fastcall SetFlatButtonColor [[deprecated]](Graphics::TColor Value);
	bool __fastcall StoreColor [[deprecated]](void);
	bool __fastcall StoreFocusColor [[deprecated]](void);
	bool __fastcall NotUsingController [[deprecated]](void);
	virtual void __fastcall SetDisabledColor [[deprecated]](Graphics::TColor Value);
	virtual void __fastcall SetFocusColor [[deprecated]](Graphics::TColor Value);
	virtual void __fastcall SetFrameColor [[deprecated]](Graphics::TColor Value);
	virtual void __fastcall SetFrameController [[deprecated]](Rzcommon::TRzFrameController* Value);
	virtual void __fastcall SetFrameHotColor [[deprecated]](Graphics::TColor Value);
	virtual void __fastcall SetFrameHotTrack [[deprecated]](bool Value);
	virtual void __fastcall SetFrameHotStyle [[deprecated]](Rzcommon::TFrameStyle Value);
	virtual void __fastcall SetFrameSides [[deprecated]](Rzcommon::TSides Value);
	virtual void __fastcall SetFrameStyle [[deprecated]](Rzcommon::TFrameStyle Value);
	virtual void __fastcall SetFrameVisible [[deprecated]](bool Value);
	virtual void __fastcall SetFramingPreference [[deprecated]](Rzcommon::TFramingPreference Value);
	void __fastcall SetDriveTypes [[deprecated]](TDriveTypes Value);
	
public:
	__fastcall virtual TRzDriveComboBox [[deprecated]](Classes::TComponent* AOwner);
	__fastcall virtual ~TRzDriveComboBox [[deprecated]](void);
	virtual bool __fastcall UseThemes [[deprecated]](void);
	
__published:
	__property Rzcommon::TRzAboutInfo About [[deprecated]] = {read=FAboutInfo, write=FAboutInfo, stored=false, nodefault};
	__property TDriveTypes DriveTypes [[deprecated]] = {read=FDriveTypes, write=SetDriveTypes, default=124};
	__property Color [[deprecated]] = {stored=StoreColor, default=-16777211};
	__property Graphics::TColor FlatButtonColor [[deprecated]] = {read=FFlatButtonColor, write=SetFlatButtonColor, stored=NotUsingController, default=-16777201};
	__property bool FlatButtons [[deprecated]] = {read=FFlatButtons, write=SetFlatButtons, stored=NotUsingController, default=0};
	__property Graphics::TColor DisabledColor [[deprecated]] = {read=FDisabledColor, write=SetDisabledColor, stored=NotUsingController, default=-16777201};
	__property Graphics::TColor FocusColor [[deprecated]] = {read=FFocusColor, write=SetFocusColor, stored=StoreFocusColor, default=-16777211};
	__property Graphics::TColor FrameColor [[deprecated]] = {read=FFrameColor, write=SetFrameColor, stored=NotUsingController, default=-16777200};
	__property Rzcommon::TRzFrameController* FrameController [[deprecated]] = {read=FFrameController, write=SetFrameController};
	__property Graphics::TColor FrameHotColor [[deprecated]] = {read=FFrameHotColor, write=SetFrameHotColor, stored=NotUsingController, default=-16777200};
	__property Rzcommon::TFrameStyle FrameHotStyle [[deprecated]] = {read=FFrameHotStyle, write=SetFrameHotStyle, stored=NotUsingController, default=10};
	__property bool FrameHotTrack [[deprecated]] = {read=FFrameHotTrack, write=SetFrameHotTrack, stored=NotUsingController, default=0};
	__property Rzcommon::TSides FrameSides [[deprecated]] = {read=FFrameSides, write=SetFrameSides, stored=NotUsingController, default=15};
	__property Rzcommon::TFrameStyle FrameStyle [[deprecated]] = {read=FFrameStyle, write=SetFrameStyle, stored=NotUsingController, default=1};
	__property bool FrameVisible [[deprecated]] = {read=FFrameVisible, write=SetFrameVisible, stored=NotUsingController, default=0};
	__property Rzcommon::TFramingPreference FramingPreference [[deprecated]] = {read=FFramingPreference, write=SetFramingPreference, default=1};
	__property Align [[deprecated]] = {default=0};
public:
	/* TWinControl.CreateParented */ inline __fastcall TRzDriveComboBox(HWND ParentWindow) : Filectrl::TDriveComboBox(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE System::UnicodeString __fastcall VolumeID(System::WideChar Drive);
extern PACKAGE System::UnicodeString __fastcall NetworkVolume(System::WideChar Drive);
extern PACKAGE void __fastcall GetDriveInfo(System::WideChar Drive, System::UnicodeString &Volume, unsigned &SerialNum);
extern PACKAGE void __fastcall GetVolumeInfo(System::WideChar Drive, TNetworkVolumeFormat VolumeFormat, System::UnicodeString &Volume, unsigned &SerialNum);
extern PACKAGE unsigned __fastcall GetDriveSerialNum(System::WideChar Drive);
extern PACKAGE System::UnicodeString __fastcall UNCPathToDriveMapping(System::UnicodeString UNCPath);
extern PACKAGE System::UnicodeString __fastcall GetCurrentRootDir(void);

}	/* namespace Rzfilsys */
using namespace Rzfilsys;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// RzfilsysHPP
