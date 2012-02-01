// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Rzdtp.pas' rev: 21.00

#ifndef RzdtpHPP
#define RzdtpHPP

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
#include <Comctrls.hpp>	// Pascal unit
#include <Commctrl.hpp>	// Pascal unit
#include <Rzcommon.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Rzdtp
{
//-- type declarations -------------------------------------------------------
typedef ShortInt TRzDTPDropRange;

class DELPHICLASS TRzMonthCalColors;
class DELPHICLASS TRzDateTimePicker;
class PASCALIMPLEMENTATION TRzMonthCalColors : public Classes::TPersistent
{
	typedef Classes::TPersistent inherited;
	
private:
	TRzDateTimePicker* Owner;
	Graphics::TColor FBackColor;
	Graphics::TColor FTextColor;
	Graphics::TColor FTitleBackColor;
	Graphics::TColor FTitleTextColor;
	Graphics::TColor FMonthBackColor;
	Graphics::TColor FTrailingTextColor;
	
public:
	__fastcall TRzMonthCalColors(TRzDateTimePicker* AOwner);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	void __fastcall SetColor(int Index, Graphics::TColor Value);
	void __fastcall SetAllColors(void);
	
__published:
	__property Graphics::TColor BackColor = {read=FBackColor, write=SetColor, index=0, default=-16777211};
	__property Graphics::TColor TextColor = {read=FTextColor, write=SetColor, index=1, default=-16777208};
	__property Graphics::TColor TitleBackColor = {read=FTitleBackColor, write=SetColor, index=2, default=-16777214};
	__property Graphics::TColor TitleTextColor = {read=FTitleTextColor, write=SetColor, index=3, default=-16777207};
	__property Graphics::TColor MonthBackColor = {read=FMonthBackColor, write=SetColor, index=4, default=-16777211};
	__property Graphics::TColor TrailingTextColor = {read=FTrailingTextColor, write=SetColor, index=5, default=8421504};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TRzMonthCalColors(void) { }
	
};


class PASCALIMPLEMENTATION TRzDateTimePicker [[deprecated]] : public Comctrls::TDateTimePicker
{
	typedef Comctrls::TDateTimePicker inherited;
	
private:
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
	bool FShowToday [[deprecated]];
	bool FShowTodayCircle [[deprecated]];
	bool FShowWeekNumbers [[deprecated]];
	TRzDTPDropRange FDropColumns [[deprecated]];
	TRzDTPDropRange FDropRows [[deprecated]];
	System::UnicodeString FFormat [[deprecated]];
	TRzMonthCalColors* FInternalCalColors [[deprecated]];
	void __fastcall ReadOldFrameFlatProp [[deprecated]](Classes::TReader* Reader);
	void __fastcall ReadOldFrameFocusStyleProp [[deprecated]](Classes::TReader* Reader);
	HIDESBASE MESSAGE void __fastcall CMColorChanged [[deprecated]](Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall CMEnabledChanged [[deprecated]](Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall WMNCPaint [[deprecated]](Messages::TWMNCPaint &Msg);
	HIDESBASE MESSAGE void __fastcall CMParentColorChanged [[deprecated]](Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall WMPaint [[deprecated]](Messages::TWMPaint &Msg);
	HIDESBASE MESSAGE void __fastcall CMEnter [[deprecated]](Messages::TWMNoParams &Msg);
	HIDESBASE MESSAGE void __fastcall CMExit [[deprecated]](Messages::TWMNoParams &Msg);
	HIDESBASE MESSAGE void __fastcall CMMouseEnter [[deprecated]](Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall CMMouseLeave [[deprecated]](Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall WMSize [[deprecated]](Messages::TWMSize &Msg);
	HIDESBASE MESSAGE void __fastcall CNNotify [[deprecated]](Messages::TWMNotify &Msg);
	
protected:
	Rzcommon::TRzAboutInfo FAboutInfo [[deprecated]];
	Graphics::TCanvas* FCanvas [[deprecated]];
	bool FInControl [[deprecated]];
	bool FOverControl [[deprecated]];
	System::UnicodeString FSaveFormat [[deprecated]];
	virtual void __fastcall CreateWnd [[deprecated]](void);
	virtual void __fastcall DestroyWnd [[deprecated]](void);
	virtual void __fastcall DefineProperties [[deprecated]](Classes::TFiler* Filer);
	virtual void __fastcall Loaded [[deprecated]](void);
	virtual void __fastcall Notification [[deprecated]](Classes::TComponent* AComponent, Classes::TOperation Operation);
	virtual void __fastcall UpdateColors [[deprecated]](void);
	virtual void __fastcall UpdateFrame [[deprecated]](bool ViaMouse, bool InFocus);
	virtual void __fastcall RepaintFrame [[deprecated]](void);
	virtual Types::TRect __fastcall GetEditRect [[deprecated]](void);
	virtual System::UnicodeString __fastcall GetRightJustifiedText [[deprecated]](void);
	HIDESBASE void __fastcall SetCalColors [[deprecated]](TRzMonthCalColors* Value);
	virtual void __fastcall SetFlatButtons [[deprecated]](bool Value);
	virtual void __fastcall SetFlatButtonColor [[deprecated]](Graphics::TColor Value);
	HIDESBASE virtual void __fastcall SetFormat [[deprecated]](const System::UnicodeString Value);
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
	__property Graphics::TCanvas* Canvas [[deprecated]] = {read=FCanvas};
	
public:
	__fastcall virtual TRzDateTimePicker [[deprecated]](Classes::TComponent* AOwner);
	__fastcall virtual ~TRzDateTimePicker [[deprecated]](void);
	virtual bool __fastcall UseThemes [[deprecated]](void);
	HIDESBASE void __fastcall PaintTo [[deprecated]](HDC DC, int X, int Y);
	bool __fastcall UpdateCalColors [[deprecated]](int ColorIndex, Graphics::TColor ColorValue);
	
__published:
	__property Rzcommon::TRzAboutInfo About [[deprecated]] = {read=FAboutInfo, write=FAboutInfo, stored=false, nodefault};
	__property TRzMonthCalColors* CalColors [[deprecated]] = {read=FInternalCalColors, write=SetCalColors};
	__property Color [[deprecated]] = {stored=StoreColor, default=-16777211};
	__property TRzDTPDropRange DropColumns [[deprecated]] = {read=FDropColumns, write=FDropColumns, default=1};
	__property TRzDTPDropRange DropRows [[deprecated]] = {read=FDropRows, write=FDropRows, default=1};
	__property Graphics::TColor FlatButtonColor [[deprecated]] = {read=FFlatButtonColor, write=SetFlatButtonColor, stored=NotUsingController, default=-16777201};
	__property bool FlatButtons [[deprecated]] = {read=FFlatButtons, write=SetFlatButtons, stored=NotUsingController, default=0};
	__property System::UnicodeString Format [[deprecated]] = {read=FFormat, write=SetFormat};
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
	__property bool ShowToday [[deprecated]] = {read=FShowToday, write=FShowToday, default=0};
	__property bool ShowTodayCircle [[deprecated]] = {read=FShowTodayCircle, write=FShowTodayCircle, default=0};
	__property bool ShowWeekNumbers [[deprecated]] = {read=FShowWeekNumbers, write=FShowWeekNumbers, default=0};
	__property FirstDayOfWeek [[deprecated]] = {default=7};
public:
	/* TWinControl.CreateParented */ inline __fastcall TRzDateTimePicker(HWND ParentWindow) : Comctrls::TDateTimePicker(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Rzdtp */
using namespace Rzdtp;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// RzdtpHPP
