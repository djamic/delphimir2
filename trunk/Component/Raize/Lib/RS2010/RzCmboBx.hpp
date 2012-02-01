// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Rzcmbobx.pas' rev: 21.00

#ifndef RzcmbobxHPP
#define RzcmbobxHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Stdctrls.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Extctrls.hpp>	// Pascal unit
#include <Rzcommon.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Imglist.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Rzcmbobx
{
//-- type declarations -------------------------------------------------------
typedef void __fastcall (__closure *TRzDeleteComboItemEvent)(System::TObject* Sender, void * Item);

class DELPHICLASS TRzCustomComboBox;
class PASCALIMPLEMENTATION TRzCustomComboBox : public Stdctrls::TCustomComboBox
{
	typedef Stdctrls::TCustomComboBox inherited;
	
private:
	bool FAutoComplete;
	bool FAllowEdit;
	bool FBeepOnInvalidKey;
	bool FFlatButtons;
	Graphics::TColor FFlatButtonColor;
	bool FUpdatingColor;
	Graphics::TColor FDisabledColor;
	Graphics::TColor FReadOnlyColor;
	bool FReadOnlyColorOnFocus;
	Graphics::TColor FFocusColor;
	Graphics::TColor FNormalColor;
	Graphics::TColor FFrameColor;
	Rzcommon::TRzFrameController* FFrameController;
	Rzcommon::TRzFrameControllerNotifications FFrameControllerNotifications;
	Graphics::TColor FFrameHotColor;
	bool FFrameHotTrack;
	Rzcommon::TFrameStyleEx FFrameHotStyle;
	Rzcommon::TSides FFrameSides;
	Rzcommon::TFrameStyleEx FFrameStyle;
	bool FFrameVisible;
	Rzcommon::TFramingPreference FFramingPreference;
	bool FKeepSearchCase;
	System::UnicodeString FSearchString;
	int FDropDownWidth;
	int FKeyCount;
	Extctrls::TTimer* FTimer;
	bool FTabOnEnter;
	bool FTyping;
	bool FEnterPressed;
	bool FReadOnly;
	bool FSysKeyDown;
	TRzDeleteComboItemEvent FOnDeleteItem;
	Classes::TNotifyEvent FOnMatch;
	Classes::TNotifyEvent FOnNotInList;
	Classes::TNotifyEvent FOnSelEndCancel;
	Classes::TNotifyEvent FOnSelEndOk;
	Controls::TControl* FMouseControl;
	bool FMouseInClient;
	bool FOverEditArea;
	void __fastcall ReadOldFrameFlatProp(Classes::TReader* Reader);
	void __fastcall ReadOldFrameFocusStyleProp(Classes::TReader* Reader);
	void __fastcall SetItemHeight2(int Value);
	HIDESBASE MESSAGE void __fastcall WMKeyDown(Messages::TWMKey &Msg);
	MESSAGE void __fastcall WMCut(Messages::TMessage &Msg);
	MESSAGE void __fastcall WMPaste(Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall WMKillFocus(Messages::TWMKillFocus &Msg);
	HIDESBASE MESSAGE void __fastcall CNCommand(Messages::TWMCommand &Msg);
	HIDESBASE MESSAGE void __fastcall CNDrawItem(Messages::TWMDrawItem &Msg);
	HIDESBASE MESSAGE void __fastcall CMTextChanged(Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall CMEnabledChanged(Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall CMColorChanged(Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall WMPaint(Messages::TWMPaint &Msg);
	HIDESBASE MESSAGE void __fastcall CMEnter(Messages::TWMNoParams &Msg);
	HIDESBASE MESSAGE void __fastcall CMExit(Messages::TWMNoParams &Msg);
	HIDESBASE MESSAGE void __fastcall CMMouseEnter(Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall CMMouseLeave(Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall WMSize(Messages::TWMSize &Msg);
	HIDESBASE MESSAGE void __fastcall WMDeleteItem(Messages::TWMDeleteItem &Msg);
	HIDESBASE MESSAGE void __fastcall WMLButtonDown(Messages::TWMMouse &Msg);
	MESSAGE void __fastcall WMLButtonDblClick(Messages::TWMMouse &Msg);
	HIDESBASE MESSAGE void __fastcall CMParentColorChanged(Messages::TMessage &Msg);
	
protected:
	Rzcommon::TRzAboutInfo FAboutInfo;
	Graphics::TCanvas* FCanvas;
	bool FInControl;
	bool FOverControl;
	bool FShowFocus;
	bool FIsFocused;
	int FActualDropDownWidth;
	virtual void __fastcall CreateWnd(void);
	virtual void __fastcall DefineProperties(Classes::TFiler* Filer);
	virtual void __fastcall Loaded(void);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall UpdateColors(void);
	virtual void __fastcall UpdateFrame(bool ViaMouse, bool InFocus);
	virtual void __fastcall InvalidKeyPressed(void);
	void __fastcall SearchTimerExpired(System::TObject* Sender);
	virtual void __fastcall UpdateIndex(const System::UnicodeString FindStr, const Messages::TWMKey &Msg);
	virtual bool __fastcall FindListItem(const System::UnicodeString FindStr, const Messages::TMessage &Msg);
	virtual int __fastcall FindClosest(const System::UnicodeString S);
	virtual void __fastcall ComboWndProc(Messages::TMessage &Msg, HWND ComboWnd, void * ComboProc);
	virtual void __fastcall EditWndProc(Messages::TMessage &Msg);
	virtual void __fastcall WndProc(Messages::TMessage &Msg);
	void __fastcall UpdateSearchStr(void);
	DYNAMIC void __fastcall DropDown(void);
	DYNAMIC void __fastcall CloseUp(void);
	DYNAMIC void __fastcall KeyPress(System::WideChar &Key);
	DYNAMIC void __fastcall Match(void);
	DYNAMIC void __fastcall NotInList(void);
	DYNAMIC bool __fastcall DoMouseWheelDown(Classes::TShiftState Shift, const Types::TPoint &MousePos);
	DYNAMIC bool __fastcall DoMouseWheelUp(Classes::TShiftState Shift, const Types::TPoint &MousePos);
	virtual void __fastcall DeleteItem(void * Item);
	DYNAMIC void __fastcall SelEndCancel(void);
	DYNAMIC void __fastcall SelEndOk(void);
	virtual void __fastcall SetFlatButtons(bool Value);
	virtual void __fastcall SetFlatButtonColor(Graphics::TColor Value);
	bool __fastcall StoreColor(void);
	bool __fastcall StoreFocusColor(void);
	bool __fastcall StoreDisabledColor(void);
	bool __fastcall StoreReadOnlyColor(void);
	bool __fastcall StoreReadOnlyColorOnFocus(void);
	bool __fastcall StoreParentColor(void);
	bool __fastcall StoreFlatButtonColor(void);
	bool __fastcall StoreFlatButtons(void);
	bool __fastcall StoreFrameColor(void);
	bool __fastcall StoreFrameHotColor(void);
	bool __fastcall StoreFrameHotTrack(void);
	bool __fastcall StoreFrameHotStyle(void);
	bool __fastcall StoreFrameSides(void);
	bool __fastcall StoreFrameStyle(void);
	bool __fastcall StoreFrameVisible(void);
	bool __fastcall StoreFramingPreference(void);
	virtual void __fastcall SetDisabledColor(Graphics::TColor Value);
	virtual void __fastcall SetFocusColor(Graphics::TColor Value);
	virtual void __fastcall SetFrameColor(Graphics::TColor Value);
	virtual void __fastcall SetFrameController(Rzcommon::TRzFrameController* Value);
	virtual void __fastcall SetFrameHotColor(Graphics::TColor Value);
	virtual void __fastcall SetFrameHotTrack(bool Value);
	virtual void __fastcall SetFrameHotStyle(Rzcommon::TFrameStyle Value);
	virtual void __fastcall SetFrameSides(Rzcommon::TSides Value);
	virtual void __fastcall SetFrameStyle(Rzcommon::TFrameStyle Value);
	virtual void __fastcall SetFrameVisible(bool Value);
	virtual void __fastcall SetFramingPreference(Rzcommon::TFramingPreference Value);
	virtual void __fastcall SetReadOnly(bool Value);
	virtual void __fastcall SetReadOnlyColor(Graphics::TColor Value);
	__property bool AllowEdit = {read=FAllowEdit, write=FAllowEdit, default=1};
	__property bool AutoComplete = {read=FAutoComplete, write=FAutoComplete, default=1};
	__property Color = {stored=StoreColor, default=-16777211};
	__property Graphics::TColor FlatButtonColor = {read=FFlatButtonColor, write=SetFlatButtonColor, stored=StoreFlatButtonColor, default=-16777201};
	__property bool FlatButtons = {read=FFlatButtons, write=SetFlatButtons, stored=StoreFlatButtons, default=0};
	__property Graphics::TColor DisabledColor = {read=FDisabledColor, write=SetDisabledColor, stored=StoreDisabledColor, default=-16777201};
	__property Graphics::TColor FocusColor = {read=FFocusColor, write=SetFocusColor, stored=StoreFocusColor, default=-16777211};
	__property Graphics::TColor FrameColor = {read=FFrameColor, write=SetFrameColor, stored=StoreFrameColor, default=-16777200};
	__property Rzcommon::TRzFrameControllerNotifications FrameControllerNotifications = {read=FFrameControllerNotifications, write=FFrameControllerNotifications, default=65535};
	__property Rzcommon::TRzFrameController* FrameController = {read=FFrameController, write=SetFrameController};
	__property Graphics::TColor FrameHotColor = {read=FFrameHotColor, write=SetFrameHotColor, stored=StoreFrameHotColor, default=-16777200};
	__property Rzcommon::TFrameStyle FrameHotStyle = {read=FFrameHotStyle, write=SetFrameHotStyle, stored=StoreFrameHotStyle, default=10};
	__property bool FrameHotTrack = {read=FFrameHotTrack, write=SetFrameHotTrack, stored=StoreFrameHotTrack, default=0};
	__property Rzcommon::TSides FrameSides = {read=FFrameSides, write=SetFrameSides, stored=StoreFrameSides, default=15};
	__property Rzcommon::TFrameStyle FrameStyle = {read=FFrameStyle, write=SetFrameStyle, stored=StoreFrameStyle, default=1};
	__property bool FrameVisible = {read=FFrameVisible, write=SetFrameVisible, stored=StoreFrameVisible, default=0};
	__property Rzcommon::TFramingPreference FramingPreference = {read=FFramingPreference, write=SetFramingPreference, stored=StoreFramingPreference, default=1};
	__property bool KeepSearchCase = {read=FKeepSearchCase, write=FKeepSearchCase, default=0};
	__property bool TabOnEnter = {read=FTabOnEnter, write=FTabOnEnter, default=0};
	__property int DropDownWidth = {read=FDropDownWidth, write=FDropDownWidth, default=0};
	__property bool ReadOnly = {read=FReadOnly, write=SetReadOnly, default=0};
	__property Graphics::TColor ReadOnlyColor = {read=FReadOnlyColor, write=SetReadOnlyColor, stored=StoreReadOnlyColor, default=-16777192};
	__property bool ReadOnlyColorOnFocus = {read=FReadOnlyColorOnFocus, write=FReadOnlyColorOnFocus, stored=StoreReadOnlyColorOnFocus, default=0};
	__property TRzDeleteComboItemEvent OnDeleteItem = {read=FOnDeleteItem, write=FOnDeleteItem};
	__property Classes::TNotifyEvent OnMatch = {read=FOnMatch, write=FOnMatch};
	__property Classes::TNotifyEvent OnNotInList = {read=FOnNotInList, write=FOnNotInList};
	__property Classes::TNotifyEvent OnSelEndCancel = {read=FOnSelEndCancel, write=FOnSelEndCancel};
	__property Classes::TNotifyEvent OnSelEndOk = {read=FOnSelEndOk, write=FOnSelEndOk};
	__property ItemHeight = {write=SetItemHeight2};
	
public:
	__fastcall virtual TRzCustomComboBox(Classes::TComponent* AOwner);
	__fastcall virtual ~TRzCustomComboBox(void);
	virtual bool __fastcall UseThemes(void);
	DYNAMIC bool __fastcall Focused(void);
	virtual void __fastcall ForceText(const System::UnicodeString Value);
	int __fastcall Add(const System::UnicodeString S);
	int __fastcall AddObject(const System::UnicodeString S, System::TObject* AObject);
	void __fastcall ClearSearchString(void);
	void __fastcall Delete(int Index);
	void __fastcall ClearItems(void);
	virtual int __fastcall IndexOf(const System::UnicodeString S);
	HIDESBASE void __fastcall Insert(int Index, const System::UnicodeString S);
	void __fastcall InsertObject(int Index, const System::UnicodeString S, System::TObject* AObject);
	int __fastcall Count(void);
	bool __fastcall FindItem(const System::UnicodeString S);
	bool __fastcall FindClosestItem(const System::UnicodeString S);
	__property bool BeepOnInvalidKey = {read=FBeepOnInvalidKey, write=FBeepOnInvalidKey, default=1};
	__property System::UnicodeString SearchString = {read=FSearchString};
public:
	/* TWinControl.CreateParented */ inline __fastcall TRzCustomComboBox(HWND ParentWindow) : Stdctrls::TCustomComboBox(ParentWindow) { }
	
};


class DELPHICLASS TRzComboBox;
class PASCALIMPLEMENTATION TRzComboBox : public TRzCustomComboBox
{
	typedef TRzCustomComboBox inherited;
	
private:
	System::UnicodeString FValue;
	Classes::TStrings* FValues;
	bool FInSetValue;
	bool FForceSetValue;
	void __fastcall ValuesChangedHandler(System::TObject* Sender);
	
protected:
	DYNAMIC void __fastcall Change(void);
	DYNAMIC void __fastcall Click(void);
	virtual System::UnicodeString __fastcall GetItemValue(int Index);
	virtual System::UnicodeString __fastcall GetValue(void);
	virtual void __fastcall SetValue(const System::UnicodeString Value);
	virtual void __fastcall SetValues(Classes::TStrings* Value);
	
public:
	__fastcall virtual TRzComboBox(Classes::TComponent* AOwner);
	__fastcall virtual ~TRzComboBox(void);
	void __fastcall ClearItemsValues(void);
	void __fastcall AddItemValue(const System::UnicodeString Item, const System::UnicodeString Value);
	void __fastcall InsertItemValue(int Index, const System::UnicodeString Item, const System::UnicodeString Value);
	void __fastcall DeleteItemValue(int Index);
	__property System::UnicodeString Value = {read=GetValue, write=SetValue};
	
__published:
	__property Rzcommon::TRzAboutInfo About = {read=FAboutInfo, write=FAboutInfo, stored=false, nodefault};
	__property Align = {default=0};
	__property AllowEdit = {default=1};
	__property Anchors = {default=3};
	__property AutoComplete = {default=1};
	__property AutoCloseUp = {default=0};
	__property AutoDropDown = {default=0};
	__property BeepOnInvalidKey = {default=1};
	__property BiDiMode;
	__property Style = {default=0};
	__property CharCase = {default=0};
	__property Color = {default=-16777211};
	__property Constraints;
	__property Ctl3D;
	__property DisabledColor = {default=-16777201};
	__property DoubleBuffered;
	__property DragCursor = {default=-12};
	__property DragKind = {default=0};
	__property DragMode = {default=0};
	__property DropDownCount = {default=8};
	__property DropDownWidth = {default=0};
	__property Enabled = {default=1};
	__property Font;
	__property FlatButtonColor = {default=-16777201};
	__property FlatButtons = {default=0};
	__property FocusColor = {default=-16777211};
	__property FrameColor = {default=-16777200};
	__property FrameControllerNotifications = {default=65535};
	__property FrameController;
	__property FrameHotColor = {default=-16777200};
	__property FrameHotTrack = {default=0};
	__property FrameHotStyle = {default=10};
	__property FrameSides = {default=15};
	__property FrameStyle = {default=1};
	__property FrameVisible = {default=0};
	__property FramingPreference = {default=1};
	__property KeepSearchCase = {default=0};
	__property ImeMode = {default=3};
	__property ImeName;
	__property ItemHeight;
	__property MaxLength = {default=0};
	__property ParentBiDiMode = {default=1};
	__property ParentColor = {default=0};
	__property ParentCtl3D = {default=1};
	__property ParentDoubleBuffered = {default=1};
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property PopupMenu;
	__property ReadOnly = {default=0};
	__property ReadOnlyColor = {default=-16777192};
	__property ReadOnlyColorOnFocus = {default=0};
	__property ShowHint;
	__property Sorted = {default=0};
	__property TabOnEnter = {default=0};
	__property TabOrder = {default=-1};
	__property TabStop = {default=1};
	__property Text;
	__property TextHint;
	__property Touch;
	__property Visible = {default=1};
	__property OnChange;
	__property OnClick;
	__property OnCloseUp;
	__property OnContextPopup;
	__property OnDblClick;
	__property OnDeleteItem;
	__property OnDragDrop;
	__property OnDragOver;
	__property OnDrawItem;
	__property OnDropDown;
	__property OnEndDock;
	__property OnEndDrag;
	__property OnEnter;
	__property OnExit;
	__property OnGesture;
	__property OnKeyDown;
	__property OnKeyPress;
	__property OnKeyUp;
	__property OnMatch;
	__property OnMeasureItem;
	__property OnMouseEnter;
	__property OnMouseLeave;
	__property OnMouseWheel;
	__property OnMouseWheelUp;
	__property OnMouseWheelDown;
	__property OnNotInList;
	__property OnSelect;
	__property OnSelEndCancel;
	__property OnSelEndOk;
	__property OnStartDock;
	__property OnStartDrag;
	__property Items;
	__property ItemIndex = {default=-1};
	__property Classes::TStrings* Values = {read=FValues, write=SetValues};
public:
	/* TWinControl.CreateParented */ inline __fastcall TRzComboBox(HWND ParentWindow) : TRzCustomComboBox(ParentWindow) { }
	
};


class DELPHICLASS TRzColorNames;
class DELPHICLASS TRzColorComboBox;
class PASCALIMPLEMENTATION TRzColorNames : public Classes::TPersistent
{
	typedef Classes::TPersistent inherited;
	
private:
	typedef StaticArray<System::UnicodeString, 16> _TRzColorNames__1;
	
	typedef StaticArray<System::UnicodeString, 25> _TRzColorNames__2;
	
	
private:
	TRzColorComboBox* FComboBox;
	System::UnicodeString FDefaultColor;
	System::UnicodeString FCustomColor;
	_TRzColorNames__1 FStdColors;
	_TRzColorNames__2 FSysColors;
	
protected:
	void __fastcall SetDefaultColor(const System::UnicodeString Value);
	System::UnicodeString __fastcall GetStdColor(int Index);
	void __fastcall SetStdColor(int Index, const System::UnicodeString Value);
	System::UnicodeString __fastcall GetSysColor(int Index);
	void __fastcall SetSysColor(int Index, const System::UnicodeString Value);
	void __fastcall SetCustomColor(const System::UnicodeString Value);
	
public:
	bool ShowSysColors;
	bool ShowDefaultColor;
	bool ShowCustomColor;
	__fastcall TRzColorNames(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	__property System::UnicodeString StdColors[int Index] = {read=GetStdColor, write=SetStdColor};
	__property System::UnicodeString SysColors[int Index] = {read=GetSysColor, write=SetSysColor};
	
__published:
	__property System::UnicodeString Default = {read=FDefaultColor, write=SetDefaultColor};
	__property System::UnicodeString Black = {read=GetStdColor, write=SetStdColor, index=0};
	__property System::UnicodeString Maroon = {read=GetStdColor, write=SetStdColor, index=1};
	__property System::UnicodeString Green = {read=GetStdColor, write=SetStdColor, index=2};
	__property System::UnicodeString Olive = {read=GetStdColor, write=SetStdColor, index=3};
	__property System::UnicodeString Navy = {read=GetStdColor, write=SetStdColor, index=4};
	__property System::UnicodeString Purple = {read=GetStdColor, write=SetStdColor, index=5};
	__property System::UnicodeString Teal = {read=GetStdColor, write=SetStdColor, index=6};
	__property System::UnicodeString Gray = {read=GetStdColor, write=SetStdColor, index=7};
	__property System::UnicodeString Silver = {read=GetStdColor, write=SetStdColor, index=8};
	__property System::UnicodeString Red = {read=GetStdColor, write=SetStdColor, index=9};
	__property System::UnicodeString Lime = {read=GetStdColor, write=SetStdColor, index=10};
	__property System::UnicodeString Yellow = {read=GetStdColor, write=SetStdColor, index=11};
	__property System::UnicodeString Blue = {read=GetStdColor, write=SetStdColor, index=12};
	__property System::UnicodeString Fuchsia = {read=GetStdColor, write=SetStdColor, index=13};
	__property System::UnicodeString Aqua = {read=GetStdColor, write=SetStdColor, index=14};
	__property System::UnicodeString White = {read=GetStdColor, write=SetStdColor, index=15};
	__property System::UnicodeString ScrollBar = {read=GetSysColor, write=SetSysColor, index=0};
	__property System::UnicodeString Background = {read=GetSysColor, write=SetSysColor, index=1};
	__property System::UnicodeString ActiveCaption = {read=GetSysColor, write=SetSysColor, index=2};
	__property System::UnicodeString InactiveCaption = {read=GetSysColor, write=SetSysColor, index=3};
	__property System::UnicodeString Menu = {read=GetSysColor, write=SetSysColor, index=4};
	__property System::UnicodeString Window = {read=GetSysColor, write=SetSysColor, index=5};
	__property System::UnicodeString WindowFrame = {read=GetSysColor, write=SetSysColor, index=6};
	__property System::UnicodeString MenuText = {read=GetSysColor, write=SetSysColor, index=7};
	__property System::UnicodeString WindowText = {read=GetSysColor, write=SetSysColor, index=8};
	__property System::UnicodeString CaptionText = {read=GetSysColor, write=SetSysColor, index=9};
	__property System::UnicodeString ActiveBorder = {read=GetSysColor, write=SetSysColor, index=10};
	__property System::UnicodeString InactiveBorder = {read=GetSysColor, write=SetSysColor, index=11};
	__property System::UnicodeString AppWorkSpace = {read=GetSysColor, write=SetSysColor, index=12};
	__property System::UnicodeString Highlight = {read=GetSysColor, write=SetSysColor, index=13};
	__property System::UnicodeString HighlightText = {read=GetSysColor, write=SetSysColor, index=14};
	__property System::UnicodeString BtnFace = {read=GetSysColor, write=SetSysColor, index=15};
	__property System::UnicodeString BtnShadow = {read=GetSysColor, write=SetSysColor, index=16};
	__property System::UnicodeString GrayText = {read=GetSysColor, write=SetSysColor, index=17};
	__property System::UnicodeString BtnText = {read=GetSysColor, write=SetSysColor, index=18};
	__property System::UnicodeString InactiveCaptionText = {read=GetSysColor, write=SetSysColor, index=19};
	__property System::UnicodeString BtnHighlight = {read=GetSysColor, write=SetSysColor, index=20};
	__property System::UnicodeString DkShadow3D = {read=GetSysColor, write=SetSysColor, index=21};
	__property System::UnicodeString Light3D = {read=GetSysColor, write=SetSysColor, index=22};
	__property System::UnicodeString InfoText = {read=GetSysColor, write=SetSysColor, index=23};
	__property System::UnicodeString InfoBk = {read=GetSysColor, write=SetSysColor, index=24};
	__property System::UnicodeString Custom = {read=FCustomColor, write=SetCustomColor};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TRzColorNames(void) { }
	
};


class PASCALIMPLEMENTATION TRzColorComboBox : public TRzCustomComboBox
{
	typedef TRzCustomComboBox inherited;
	
private:
	bool FCancelPick;
	Graphics::TColor FDefaultColor;
	Graphics::TColor FCustomColor;
	TRzColorNames* FColorNames;
	TRzColorNames* FSaveColorNames;
	bool FShowSysColors;
	bool FShowColorNames;
	bool FShowDefaultColor;
	bool FShowCustomColor;
	Dialogs::TColorDialogOptions FColorDlgOptions;
	Classes::TStrings* FCustomColors;
	bool FStoreColorNames;
	int FSaveItemIndex;
	Rzcommon::TRzRegIniFile* FRegIniFile;
	HIDESBASE MESSAGE void __fastcall CNDrawItem(Messages::TWMDrawItem &Msg);
	HIDESBASE MESSAGE void __fastcall CMFontChanged(Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall CNCommand(Messages::TWMCommand &Msg);
	
protected:
	virtual void __fastcall CreateWnd(void);
	virtual void __fastcall DestroyWnd(void);
	virtual void __fastcall Loaded(void);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	System::UnicodeString __fastcall GetCustomColorName(int Index);
	virtual void __fastcall FixupCustomColors(void);
	virtual void __fastcall InitColorNames(void);
	virtual Graphics::TColor __fastcall GetColorFromItem(int Index);
	virtual void __fastcall DrawItem(int Index, const Types::TRect &Rect, Windows::TOwnerDrawState State);
	DYNAMIC void __fastcall CloseUp(void);
	virtual void __fastcall SetDefaultColor(Graphics::TColor Value);
	virtual void __fastcall SetColorNames(TRzColorNames* Value);
	virtual void __fastcall SetCustomColor(Graphics::TColor Value);
	virtual void __fastcall SetCustomColors(Classes::TStrings* Value);
	virtual void __fastcall SetShowCustomColor(bool Value);
	virtual void __fastcall SetShowDefaultColor(bool Value);
	virtual void __fastcall SetShowSysColors(bool Value);
	virtual void __fastcall SetShowColorNames(bool Value);
	virtual Graphics::TColor __fastcall GetSelectedColor(void);
	virtual void __fastcall SetSelectedColor(Graphics::TColor Value);
	virtual void __fastcall SetFrameVisible(bool Value);
	virtual void __fastcall SetRegIniFile(Rzcommon::TRzRegIniFile* Value);
	
public:
	__fastcall virtual TRzColorComboBox(Classes::TComponent* AOwner);
	__fastcall virtual ~TRzColorComboBox(void);
	void __fastcall LoadCustomColors(const System::UnicodeString Section);
	void __fastcall SaveCustomColors(const System::UnicodeString Section);
	
__published:
	__property Rzcommon::TRzAboutInfo About = {read=FAboutInfo, write=FAboutInfo, stored=false, nodefault};
	__property TRzColorNames* ColorNames = {read=FColorNames, write=SetColorNames, stored=FStoreColorNames};
	__property Graphics::TColor CustomColor = {read=FCustomColor, write=SetCustomColor, default=0};
	__property Classes::TStrings* CustomColors = {read=FCustomColors, write=SetCustomColors};
	__property Dialogs::TColorDialogOptions ColorDlgOptions = {read=FColorDlgOptions, write=FColorDlgOptions, default=1};
	__property Graphics::TColor DefaultColor = {read=FDefaultColor, write=SetDefaultColor, default=0};
	__property Rzcommon::TRzRegIniFile* RegIniFile = {read=FRegIniFile, write=SetRegIniFile};
	__property bool ShowColorNames = {read=FShowColorNames, write=SetShowColorNames, default=1};
	__property bool ShowCustomColor = {read=FShowCustomColor, write=SetShowCustomColor, default=1};
	__property bool ShowDefaultColor = {read=FShowDefaultColor, write=SetShowDefaultColor, default=1};
	__property bool ShowSysColors = {read=FShowSysColors, write=SetShowSysColors, default=1};
	__property Graphics::TColor SelectedColor = {read=GetSelectedColor, write=SetSelectedColor, default=0};
	__property Align = {default=0};
	__property Anchors = {default=3};
	__property AutoCloseUp = {default=0};
	__property AutoDropDown = {default=0};
	__property BeepOnInvalidKey = {default=1};
	__property BiDiMode;
	__property Color = {default=-16777211};
	__property Constraints;
	__property Ctl3D;
	__property DisabledColor = {default=-16777201};
	__property DoubleBuffered;
	__property DragCursor = {default=-12};
	__property DragKind = {default=0};
	__property DragMode = {default=0};
	__property DropDownCount = {default=8};
	__property DropDownWidth = {default=0};
	__property Enabled = {default=1};
	__property FlatButtonColor = {default=-16777201};
	__property FlatButtons = {default=0};
	__property Font;
	__property FocusColor = {default=-16777211};
	__property FrameColor = {default=-16777200};
	__property FrameControllerNotifications = {default=65535};
	__property FrameController;
	__property FrameHotColor = {default=-16777200};
	__property FrameHotTrack = {default=0};
	__property FrameHotStyle = {default=10};
	__property FrameSides = {default=15};
	__property FrameStyle = {default=1};
	__property FrameVisible = {default=0};
	__property FramingPreference = {default=1};
	__property ItemHeight;
	__property ParentBiDiMode = {default=1};
	__property ParentColor = {default=0};
	__property ParentCtl3D = {default=1};
	__property ParentDoubleBuffered = {default=1};
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property PopupMenu;
	__property ReadOnly = {default=0};
	__property ReadOnlyColor = {default=-16777192};
	__property ReadOnlyColorOnFocus = {default=0};
	__property ShowHint;
	__property TabOnEnter = {default=0};
	__property TabOrder = {default=-1};
	__property TabStop = {default=1};
	__property Touch;
	__property Visible = {default=1};
	__property OnChange;
	__property OnClick;
	__property OnCloseUp;
	__property OnContextPopup;
	__property OnDblClick;
	__property OnDragDrop;
	__property OnDragOver;
	__property OnDropDown;
	__property OnEndDock;
	__property OnEndDrag;
	__property OnEnter;
	__property OnExit;
	__property OnGesture;
	__property OnKeyDown;
	__property OnKeyPress;
	__property OnKeyUp;
	__property OnMouseEnter;
	__property OnMouseLeave;
	__property OnMouseWheel;
	__property OnMouseWheelDown;
	__property OnMouseWheelUp;
	__property OnSelect;
	__property OnStartDock;
	__property OnStartDrag;
public:
	/* TWinControl.CreateParented */ inline __fastcall TRzColorComboBox(HWND ParentWindow) : TRzCustomComboBox(ParentWindow) { }
	
};


class DELPHICLASS TRzPreviewFontPanel;
class PASCALIMPLEMENTATION TRzPreviewFontPanel : public Extctrls::TCustomPanel
{
	typedef Extctrls::TCustomPanel inherited;
	
private:
	Controls::TWinControl* FControl;
	MESSAGE void __fastcall CMCancelMode(Controls::TCMCancelMode &Msg);
	HIDESBASE MESSAGE void __fastcall CMShowingChanged(Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall WMKillFocus(Messages::TMessage &Msg);
	
protected:
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	virtual void __fastcall Paint(void);
	
public:
	__fastcall virtual TRzPreviewFontPanel(Classes::TComponent* AOwner);
	__property Controls::TWinControl* Control = {write=FControl};
	__property Alignment = {default=2};
	__property Canvas;
	__property Caption;
	__property Font;
public:
	/* TCustomControl.Destroy */ inline __fastcall virtual ~TRzPreviewFontPanel(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TRzPreviewFontPanel(HWND ParentWindow) : Extctrls::TCustomPanel(ParentWindow) { }
	
};


#pragma option push -b-
enum TRzFontDevice { fdScreen, fdPrinter };
#pragma option pop

#pragma option push -b-
enum TRzFontType { ftAll, ftTrueType, ftFixedPitch, ftPrinter };
#pragma option pop

#pragma option push -b-
enum TRzShowStyle { ssFontName, ssFontSample, ssFontNameAndSample, ssFontPreview };
#pragma option pop

class DELPHICLASS TRzFontComboBox;
class PASCALIMPLEMENTATION TRzFontComboBox : public TRzCustomComboBox
{
	typedef TRzCustomComboBox inherited;
	
private:
	System::UnicodeString FSaveFontName;
	Graphics::TFont* FFont;
	TRzFontDevice FFontDevice;
	TRzFontType FFontType;
	int FFontSize;
	Graphics::TFontStyles FFontStyle;
	bool FShowSymbolFonts;
	TRzShowStyle FShowStyle;
	Graphics::TBitmap* FTrueTypeBmp;
	Graphics::TBitmap* FFixedPitchBmp;
	Graphics::TBitmap* FTrueTypeFixedBmp;
	Graphics::TBitmap* FPrinterBmp;
	Graphics::TBitmap* FDeviceBmp;
	bool FPreviewVisible;
	TRzPreviewFontPanel* FPreviewPanel;
	int FPreviewFontSize;
	int FPreviewWidth;
	int FPreviewHeight;
	Stdctrls::TCustomEdit* FPreviewEdit;
	System::UnicodeString FPreviewText;
	int FMRUCount;
	bool FMaintainMRUFonts;
	HIDESBASE MESSAGE void __fastcall CNDrawItem(Messages::TWMDrawItem &Msg);
	HIDESBASE MESSAGE void __fastcall CMFontChanged(Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall CMCancelMode(Controls::TCMCancelMode &Msg);
	MESSAGE void __fastcall CMHidePreviewPanel(Messages::TMessage &Msg);
	
protected:
	virtual void __fastcall CreateWnd(void);
	virtual void __fastcall DestroyWnd(void);
	virtual void __fastcall LoadFonts(void);
	virtual void __fastcall LoadBitmaps(void);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	void __fastcall UpdatePreviewText(void);
	virtual void __fastcall HidePreviewPanel(void);
	virtual void __fastcall ShowPreviewPanel(void);
	DYNAMIC void __fastcall DropDown(void);
	DYNAMIC void __fastcall CloseUp(void);
	virtual void __fastcall DrawItem(int Index, const Types::TRect &Rect, Windows::TOwnerDrawState State);
	virtual void __fastcall SetFontDevice(TRzFontDevice Value);
	virtual void __fastcall SetFontType(TRzFontType Value);
	virtual Graphics::TFont* __fastcall GetSelectedFont(void);
	virtual void __fastcall SetSelectedFont(Graphics::TFont* Value);
	virtual System::UnicodeString __fastcall GetFontName(void);
	virtual void __fastcall SetFontName(const System::UnicodeString Value);
	virtual void __fastcall SetPreviewEdit(Stdctrls::TCustomEdit* Value);
	virtual void __fastcall SetShowSymbolFonts(bool Value);
	virtual void __fastcall SetShowStyle(TRzShowStyle Value);
	
public:
	__fastcall virtual TRzFontComboBox(Classes::TComponent* AOwner);
	__fastcall virtual ~TRzFontComboBox(void);
	__property Graphics::TFont* SelectedFont = {read=GetSelectedFont, write=SetSelectedFont};
	
__published:
	__property Rzcommon::TRzAboutInfo About = {read=FAboutInfo, write=FAboutInfo, stored=false, nodefault};
	__property TRzFontDevice FontDevice = {read=FFontDevice, write=SetFontDevice, default=0};
	__property System::UnicodeString FontName = {read=GetFontName, write=SetFontName};
	__property int FontSize = {read=FFontSize, write=FFontSize, default=8};
	__property Graphics::TFontStyles FontStyle = {read=FFontStyle, write=FFontStyle, default=0};
	__property TRzFontType FontType = {read=FFontType, write=SetFontType, default=0};
	__property bool MaintainMRUFonts = {read=FMaintainMRUFonts, write=FMaintainMRUFonts, default=1};
	__property Stdctrls::TCustomEdit* PreviewEdit = {read=FPreviewEdit, write=FPreviewEdit};
	__property int PreviewFontSize = {read=FPreviewFontSize, write=FPreviewFontSize, default=36};
	__property int PreviewHeight = {read=FPreviewHeight, write=FPreviewHeight, default=65};
	__property System::UnicodeString PreviewText = {read=FPreviewText, write=FPreviewText};
	__property int PreviewWidth = {read=FPreviewWidth, write=FPreviewWidth, default=260};
	__property bool ShowSymbolFonts = {read=FShowSymbolFonts, write=SetShowSymbolFonts, default=1};
	__property TRzShowStyle ShowStyle = {read=FShowStyle, write=SetShowStyle, default=0};
	__property Align = {default=0};
	__property Anchors = {default=3};
	__property AutoCloseUp = {default=0};
	__property AutoDropDown = {default=0};
	__property BeepOnInvalidKey = {default=1};
	__property BiDiMode;
	__property Color = {default=-16777211};
	__property Constraints;
	__property Ctl3D;
	__property DisabledColor = {default=-16777201};
	__property DoubleBuffered;
	__property DragCursor = {default=-12};
	__property DragKind = {default=0};
	__property DragMode = {default=0};
	__property DropDownCount = {default=14};
	__property DropDownWidth = {default=0};
	__property Enabled = {default=1};
	__property FlatButtonColor = {default=-16777201};
	__property FlatButtons = {default=0};
	__property Font;
	__property FocusColor = {default=-16777211};
	__property FrameColor = {default=-16777200};
	__property FrameControllerNotifications = {default=65535};
	__property FrameController;
	__property FrameHotColor = {default=-16777200};
	__property FrameHotTrack = {default=0};
	__property FrameHotStyle = {default=10};
	__property FrameSides = {default=15};
	__property FrameStyle = {default=1};
	__property FrameVisible = {default=0};
	__property FramingPreference = {default=1};
	__property ItemHeight;
	__property ParentBiDiMode = {default=1};
	__property ParentColor = {default=0};
	__property ParentCtl3D = {default=1};
	__property ParentDoubleBuffered = {default=1};
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property PopupMenu;
	__property ReadOnly = {default=0};
	__property ReadOnlyColor = {default=-16777192};
	__property ReadOnlyColorOnFocus = {default=0};
	__property ShowHint;
	__property Sorted = {default=1};
	__property TabOnEnter = {default=0};
	__property TabOrder = {default=-1};
	__property TabStop = {default=1};
	__property Touch;
	__property Visible = {default=1};
	__property OnChange;
	__property OnClick;
	__property OnCloseUp;
	__property OnContextPopup;
	__property OnDblClick;
	__property OnDragDrop;
	__property OnDragOver;
	__property OnDropDown;
	__property OnEndDock;
	__property OnEndDrag;
	__property OnEnter;
	__property OnExit;
	__property OnGesture;
	__property OnKeyDown;
	__property OnKeyPress;
	__property OnKeyUp;
	__property OnMouseEnter;
	__property OnMouseLeave;
	__property OnMouseWheel;
	__property OnMouseWheelDown;
	__property OnMouseWheelUp;
	__property OnSelect;
	__property OnStartDock;
	__property OnStartDrag;
public:
	/* TWinControl.CreateParented */ inline __fastcall TRzFontComboBox(HWND ParentWindow) : TRzCustomComboBox(ParentWindow) { }
	
};


class DELPHICLASS TRzMRUComboBox;
class PASCALIMPLEMENTATION TRzMRUComboBox : public TRzCustomComboBox
{
	typedef TRzCustomComboBox inherited;
	
private:
	System::UnicodeString FRemoveItemCaption;
	Menus::TPopupMenu* FEmbeddedMenu;
	bool FSelectFirstItemOnLoad;
	Menus::TMenuItem* FMnuUndo;
	Menus::TMenuItem* FMnuSeparator1;
	Menus::TMenuItem* FMnuCut;
	Menus::TMenuItem* FMnuCopy;
	Menus::TMenuItem* FMnuPaste;
	Menus::TMenuItem* FMnuDelete;
	Menus::TMenuItem* FMnuSeparator2;
	Menus::TMenuItem* FMnuSelectAll;
	Menus::TMenuItem* FMnuSeparator3;
	Menus::TMenuItem* FMnuRemove;
	Rzcommon::TRzRegIniFile* FMruRegIniFile;
	System::UnicodeString FMruPath;
	System::UnicodeString FMruSection;
	System::UnicodeString FMruID;
	int FMaxHistory;
	Classes::TNotifyEvent FOnEscapeKeyPressed;
	Classes::TNotifyEvent FOnEnterKeyPressed;
	void __fastcall EmbeddedMenuPopupHandler(System::TObject* Sender);
	void __fastcall MnuUndoClickHandler(System::TObject* Sender);
	void __fastcall MnuCutClickHandler(System::TObject* Sender);
	void __fastcall MnuCopyClickHandler(System::TObject* Sender);
	void __fastcall MnuPasteClickHandler(System::TObject* Sender);
	void __fastcall MnuDeleteClickHandler(System::TObject* Sender);
	void __fastcall MnuSelectAllClickHandler(System::TObject* Sender);
	void __fastcall MnuRemoveItemClickHandler(System::TObject* Sender);
	
protected:
	int FPopupMenuTag;
	bool FDataIsLoaded;
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall Loaded(void);
	virtual void __fastcall CreateWnd(void);
	DYNAMIC void __fastcall SetupMenuItem(Menus::TMenuItem* AMenuItem, System::UnicodeString ACaption, bool AChecked, bool ARadioItem, int AGroupIndex, int AShortCut, Classes::TNotifyEvent AHandler);
	virtual void __fastcall CreatePopupMenuItems(void);
	virtual void __fastcall InitializePopupMenuItems(void);
	virtual void __fastcall AddMenuItemsToPopupMenu(void);
	DYNAMIC void __fastcall EnterKeyPressed(void);
	DYNAMIC void __fastcall EscapeKeyPressed(void);
	DYNAMIC void __fastcall KeyPress(System::WideChar &Key);
	DYNAMIC void __fastcall CloseUp(void);
	DYNAMIC void __fastcall DoExit(void);
	virtual void __fastcall SetMruRegIniFile(Rzcommon::TRzRegIniFile* Value);
	void __fastcall SetRemoveItemCaption(const System::UnicodeString Value);
	
public:
	__fastcall virtual TRzMRUComboBox(Classes::TComponent* AOwner);
	__fastcall virtual ~TRzMRUComboBox(void);
	DYNAMIC void __fastcall LoadMRUData(bool FromStream);
	DYNAMIC void __fastcall SaveMRUData(void);
	DYNAMIC void __fastcall UpdateMRUList(void);
	void __fastcall UpdateMRUListFromCloseUp(void);
	
__published:
	__property Rzcommon::TRzAboutInfo About = {read=FAboutInfo, write=FAboutInfo, stored=false, nodefault};
	__property int MaxHistory = {read=FMaxHistory, write=FMaxHistory, default=25};
	__property System::UnicodeString MruPath = {read=FMruPath, write=FMruPath};
	__property Rzcommon::TRzRegIniFile* MruRegIniFile = {read=FMruRegIniFile, write=SetMruRegIniFile};
	__property System::UnicodeString MruSection = {read=FMruSection, write=FMruSection};
	__property System::UnicodeString MruID = {read=FMruID, write=FMruID};
	__property System::UnicodeString RemoveItemCaption = {read=FRemoveItemCaption, write=SetRemoveItemCaption};
	__property bool SelectFirstItemOnLoad = {read=FSelectFirstItemOnLoad, write=FSelectFirstItemOnLoad, default=0};
	__property Classes::TNotifyEvent OnEnterKeyPressed = {read=FOnEnterKeyPressed, write=FOnEnterKeyPressed};
	__property Classes::TNotifyEvent OnEscapeKeyPressed = {read=FOnEscapeKeyPressed, write=FOnEscapeKeyPressed};
	__property Style = {default=0};
	__property Align = {default=0};
	__property AllowEdit = {default=1};
	__property Anchors = {default=3};
	__property AutoComplete = {default=1};
	__property AutoCloseUp = {default=0};
	__property AutoDropDown = {default=0};
	__property BeepOnInvalidKey = {default=1};
	__property BiDiMode;
	__property CharCase = {default=0};
	__property Color = {default=-16777211};
	__property Constraints;
	__property Ctl3D;
	__property DisabledColor = {default=-16777201};
	__property DoubleBuffered;
	__property DragCursor = {default=-12};
	__property DragKind = {default=0};
	__property DragMode = {default=0};
	__property DropDownCount = {default=8};
	__property DropDownWidth = {default=0};
	__property Enabled = {default=1};
	__property FlatButtonColor = {default=-16777201};
	__property FlatButtons = {default=0};
	__property Font;
	__property FocusColor = {default=-16777211};
	__property FrameColor = {default=-16777200};
	__property FrameControllerNotifications = {default=65535};
	__property FrameController;
	__property FrameHotColor = {default=-16777200};
	__property FrameHotTrack = {default=0};
	__property FrameHotStyle = {default=10};
	__property FrameSides = {default=15};
	__property FrameStyle = {default=1};
	__property FrameVisible = {default=0};
	__property FramingPreference = {default=1};
	__property ImeMode = {default=3};
	__property ImeName;
	__property ItemHeight;
	__property Items;
	__property KeepSearchCase = {default=0};
	__property MaxLength = {default=0};
	__property ParentBiDiMode = {default=1};
	__property ParentColor = {default=0};
	__property ParentCtl3D = {default=1};
	__property ParentDoubleBuffered = {default=1};
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property ReadOnly = {default=0};
	__property ReadOnlyColor = {default=-16777192};
	__property ReadOnlyColorOnFocus = {default=0};
	__property ShowHint;
	__property TabOnEnter = {default=0};
	__property TabOrder = {default=-1};
	__property TabStop = {default=1};
	__property Text;
	__property TextHint;
	__property Touch;
	__property Visible = {default=1};
	__property OnChange;
	__property OnClick;
	__property OnCloseUp;
	__property OnContextPopup;
	__property OnDblClick;
	__property OnDragDrop;
	__property OnDragOver;
	__property OnDrawItem;
	__property OnDropDown;
	__property OnEndDock;
	__property OnEndDrag;
	__property OnEnter;
	__property OnExit;
	__property OnGesture;
	__property OnKeyDown;
	__property OnKeyPress;
	__property OnKeyUp;
	__property OnMatch;
	__property OnMeasureItem;
	__property OnMouseEnter;
	__property OnMouseLeave;
	__property OnMouseWheel;
	__property OnMouseWheelDown;
	__property OnMouseWheelUp;
	__property OnNotInList;
	__property OnSelect;
	__property OnStartDock;
	__property OnStartDrag;
public:
	/* TWinControl.CreateParented */ inline __fastcall TRzMRUComboBox(HWND ParentWindow) : TRzCustomComboBox(ParentWindow) { }
	
};


class DELPHICLASS TRzImageComboBoxItem;
class DELPHICLASS TRzCustomImageComboBox;
class PASCALIMPLEMENTATION TRzImageComboBoxItem : public System::TObject
{
	typedef System::TObject inherited;
	
protected:
	TRzCustomImageComboBox* FOwner;
	int FItemIndex;
	int FIndex;
	int FIndentLevel;
	int FImageIndex;
	int FOverlayIndex;
	System::UnicodeString FCaption;
	int FTag;
	void *FData;
	void __fastcall SetIndentLevel(int Value);
	void __fastcall SetImageIndex(int Value);
	void __fastcall SetCaption(const System::UnicodeString Value);
	void __fastcall SetOverlayIndex(int Value);
	
public:
	__fastcall TRzImageComboBoxItem(TRzCustomImageComboBox* AOwner);
	__fastcall virtual ~TRzImageComboBoxItem(void);
	__property int Index = {read=FIndex, nodefault};
	__property int IndentLevel = {read=FIndentLevel, write=SetIndentLevel, nodefault};
	__property int ImageIndex = {read=FImageIndex, write=SetImageIndex, nodefault};
	__property int OverlayIndex = {read=FOverlayIndex, write=SetOverlayIndex, nodefault};
	__property System::UnicodeString Caption = {read=FCaption, write=SetCaption};
	__property void * Data = {read=FData, write=FData};
	__property int Tag = {read=FTag, write=FTag, nodefault};
};


typedef void __fastcall (__closure *TRzDeleteImageComboBoxItemEvent)(System::TObject* Sender, TRzImageComboBoxItem* Item);

typedef void __fastcall (__closure *TRzImageComboBoxGetItemDataEvent)(System::TObject* Sender, TRzImageComboBoxItem* Item);

class PASCALIMPLEMENTATION TRzCustomImageComboBox : public TRzCustomComboBox
{
	typedef TRzCustomComboBox inherited;
	
private:
	bool FAutoSizeHeight;
	Imglist::TCustomImageList* FImages;
	int FItemIndent;
	TRzDeleteImageComboBoxItemEvent FOnDeleteImageComboBoxItem;
	TRzImageComboBoxGetItemDataEvent FOnGetItemData;
	bool FInWMSetFont;
	bool FFreeObjOnDelete;
	TRzImageComboBoxItem* __fastcall GetImageComboBoxItem(int index);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TWMEraseBkgnd &Msg);
	MESSAGE void __fastcall WMSetFont(Messages::TWMSetFont &Msg);
	
protected:
	void __fastcall DoAutoSize(HFONT hf);
	HIDESBASEDYNAMIC void __fastcall AutoSize(HFONT hf);
	void __fastcall SetItemIndent(int Value);
	void __fastcall SetImages(const Imglist::TCustomImageList* Value);
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	virtual void __fastcall CreateWnd(void);
	virtual void __fastcall DrawItem(int Index, const Types::TRect &Rect, Windows::TOwnerDrawState State);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall DeleteItem(void * Item);
	virtual void __fastcall GetItemData(TRzImageComboBoxItem* Item);
	__property Text = {stored=false};
	__property bool AutoSizeHeight = {read=FAutoSizeHeight, write=FAutoSizeHeight, default=1};
	__property int ItemIndent = {read=FItemIndent, write=SetItemIndent, default=12};
	__property Imglist::TCustomImageList* Images = {read=FImages, write=SetImages};
	__property TRzDeleteImageComboBoxItemEvent OnDeleteItem = {read=FOnDeleteImageComboBoxItem, write=FOnDeleteImageComboBoxItem};
	__property TRzImageComboBoxGetItemDataEvent OnGetItemData = {read=FOnGetItemData, write=FOnGetItemData};
	
public:
	__fastcall virtual TRzCustomImageComboBox(Classes::TComponent* AOwner);
	HIDESBASE virtual TRzImageComboBoxItem* __fastcall AddItem(System::UnicodeString Caption, int ImageIndex, int IndentLevel);
	void __fastcall ItemsBeginUpdate(void);
	void __fastcall ItemsEndUpdate(void);
	HIDESBASE void __fastcall Delete(int Index);
	HIDESBASE void __fastcall ClearItems(void);
	virtual int __fastcall IndexOf(const System::UnicodeString S);
	int __fastcall IndexOfItem(TRzImageComboBoxItem* Item);
	int __fastcall IndexOfData(void * Data);
	__property TRzImageComboBoxItem* ImageComboItem[int Index] = {read=GetImageComboBoxItem};
public:
	/* TRzCustomComboBox.Destroy */ inline __fastcall virtual ~TRzCustomImageComboBox(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TRzCustomImageComboBox(HWND ParentWindow) : TRzCustomComboBox(ParentWindow) { }
	
};


class DELPHICLASS TRzImageComboBox;
class PASCALIMPLEMENTATION TRzImageComboBox : public TRzCustomImageComboBox
{
	typedef TRzCustomImageComboBox inherited;
	
__published:
	__property Rzcommon::TRzAboutInfo About = {read=FAboutInfo, write=FAboutInfo, stored=false, nodefault};
	__property Align = {default=0};
	__property Anchors = {default=3};
	__property AutoCloseUp = {default=0};
	__property AutoDropDown = {default=0};
	__property AutoSizeHeight = {default=1};
	__property BiDiMode;
	__property CharCase = {default=0};
	__property Color = {default=-16777211};
	__property Constraints;
	__property Ctl3D;
	__property DisabledColor = {default=-16777201};
	__property DragCursor = {default=-12};
	__property DragKind = {default=0};
	__property DragMode = {default=0};
	__property DropDownCount = {default=8};
	__property DropDownWidth = {default=0};
	__property Enabled = {default=1};
	__property Font;
	__property FlatButtonColor = {default=-16777201};
	__property FlatButtons = {default=0};
	__property FocusColor = {default=-16777211};
	__property FrameColor = {default=-16777200};
	__property FrameControllerNotifications = {default=65535};
	__property FrameController;
	__property FrameHotColor = {default=-16777200};
	__property FrameHotTrack = {default=0};
	__property FrameHotStyle = {default=10};
	__property FrameSides = {default=15};
	__property FrameStyle = {default=1};
	__property FrameVisible = {default=0};
	__property FramingPreference = {default=1};
	__property Images;
	__property ImeMode = {default=3};
	__property ImeName;
	__property ItemHeight;
	__property ItemIndent = {default=12};
	__property MaxLength = {default=0};
	__property ParentBiDiMode = {default=1};
	__property ParentColor = {default=0};
	__property ParentCtl3D = {default=1};
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property PopupMenu;
	__property ReadOnly = {default=0};
	__property ReadOnlyColor = {default=-16777192};
	__property ReadOnlyColorOnFocus = {default=0};
	__property ShowHint;
	__property Sorted = {default=0};
	__property TabOnEnter = {default=0};
	__property TabOrder = {default=-1};
	__property TabStop = {default=1};
	__property Touch;
	__property Visible = {default=1};
	__property OnChange;
	__property OnClick;
	__property OnCloseUp;
	__property OnContextPopup;
	__property OnDblClick;
	__property OnDeleteItem;
	__property OnDragDrop;
	__property OnDragOver;
	__property OnDrawItem;
	__property OnDropDown;
	__property OnEndDock;
	__property OnEndDrag;
	__property OnEnter;
	__property OnExit;
	__property OnGesture;
	__property OnGetItemData;
	__property OnKeyDown;
	__property OnKeyPress;
	__property OnKeyUp;
	__property OnMeasureItem;
	__property OnMouseEnter;
	__property OnMouseLeave;
	__property OnMouseWheel;
	__property OnMouseWheelUp;
	__property OnMouseWheelDown;
	__property OnSelect;
	__property OnSelEndCancel;
	__property OnSelEndOk;
	__property OnStartDock;
	__property OnStartDrag;
public:
	/* TRzCustomImageComboBox.Create */ inline __fastcall virtual TRzImageComboBox(Classes::TComponent* AOwner) : TRzCustomImageComboBox(AOwner) { }
	
public:
	/* TRzCustomComboBox.Destroy */ inline __fastcall virtual ~TRzImageComboBox(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TRzImageComboBox(HWND ParentWindow) : TRzCustomImageComboBox(ParentWindow) { }
	
};


struct TRzColorRec
{
	
public:
	System::UnicodeString Name;
	Graphics::TColor Color;
};


typedef StaticArray<TRzColorRec, 16> Rzcmbobx__11;

typedef StaticArray<TRzColorRec, 25> Rzcmbobx__21;

//-- var, const, procedure ---------------------------------------------------
static const ShortInt MaxStdColors = 0x10;
static const ShortInt MaxSysColors = 0x19;
extern PACKAGE TRzColorRec DefaultColorItem;
extern PACKAGE TRzColorRec CustomColorItem;
extern PACKAGE Rzcmbobx__11 StdColorItems;
extern PACKAGE Rzcmbobx__21 SysColorItems;
#define ptDefault L"AaBbYyZz"
#define ptDefault1 L"AaBbYyZ"
#define ptDefault2 L"AaBbYy"

}	/* namespace Rzcmbobx */
using namespace Rzcmbobx;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// RzcmbobxHPP
