// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Rzdbtrak.pas' rev: 21.00

#ifndef RzdbtrakHPP
#define RzdbtrakHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Rztrkbar.hpp>	// Pascal unit
#include <Dbctrls.hpp>	// Pascal unit
#include <Db.hpp>	// Pascal unit
#include <Rzcommon.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Rzdbtrak
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TRzTrackValueList;
class DELPHICLASS TRzDBTrackBar;
class PASCALIMPLEMENTATION TRzTrackValueList : public Classes::TStringList
{
	typedef Classes::TStringList inherited;
	
private:
	TRzDBTrackBar* FTrackBar;
	
public:
	virtual int __fastcall Add(const System::UnicodeString Value);
	virtual void __fastcall Clear(void);
	virtual void __fastcall Delete(int Index);
	virtual void __fastcall Insert(int Index, const System::UnicodeString Value);
public:
	/* TStringList.Create */ inline __fastcall TRzTrackValueList(void)/* overload */ : Classes::TStringList() { }
	/* TStringList.Destroy */ inline __fastcall virtual ~TRzTrackValueList(void) { }
	
};


class PASCALIMPLEMENTATION TRzDBTrackBar : public Rztrkbar::TRzTrackBar
{
	typedef Rztrkbar::TRzTrackBar inherited;
	
private:
	Dbctrls::TFieldDataLink* FDataLink;
	System::UnicodeString FValue;
	Classes::TStrings* FValues;
	void __fastcall DataChange(System::TObject* Sender);
	void __fastcall UpdateData(System::TObject* Sender);
	HIDESBASE MESSAGE void __fastcall CMExit(Messages::TWMNoParams &Msg);
	
protected:
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	DYNAMIC void __fastcall Change(void);
	DYNAMIC void __fastcall KeyPress(System::WideChar &Key);
	virtual bool __fastcall CanInternalChange(int NewPos);
	virtual Db::TField* __fastcall GetField(void);
	virtual System::UnicodeString __fastcall GetDataField(void);
	virtual void __fastcall SetDataField(const System::UnicodeString Value);
	virtual Db::TDataSource* __fastcall GetDataSource(void);
	virtual void __fastcall SetDataSource(Db::TDataSource* Value);
	virtual bool __fastcall GetReadOnly(void);
	virtual void __fastcall SetReadOnly(bool Value);
	virtual System::UnicodeString __fastcall GetPositionValue(int Index);
	virtual System::UnicodeString __fastcall GetValue(void);
	virtual void __fastcall SetValue(const System::UnicodeString Value);
	virtual void __fastcall SetValues(Classes::TStrings* Value);
	__property Dbctrls::TFieldDataLink* DataLink = {read=FDataLink};
	
public:
	__fastcall virtual TRzDBTrackBar(Classes::TComponent* AOwner);
	__fastcall virtual ~TRzDBTrackBar(void);
	__property Db::TField* Field = {read=GetField};
	__property System::UnicodeString Value = {read=GetValue, write=SetValue};
	
__published:
	__property System::UnicodeString DataField = {read=GetDataField, write=SetDataField};
	__property Db::TDataSource* DataSource = {read=GetDataSource, write=SetDataSource};
	__property bool ReadOnly = {read=GetReadOnly, write=SetReadOnly, default=0};
	__property Classes::TStrings* Values = {read=FValues, write=SetValues};
public:
	/* TWinControl.CreateParented */ inline __fastcall TRzDBTrackBar(HWND ParentWindow) : Rztrkbar::TRzTrackBar(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Rzdbtrak */
using namespace Rzdbtrak;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// RzdbtrakHPP
