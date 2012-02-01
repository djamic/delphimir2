// CodeGear C++Builder
// Copyright (c) 1995, 2009 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Rzdesigneditors.pas' rev: 21.00

#ifndef RzdesigneditorsHPP
#define RzdesigneditorsHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Imglist.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Extctrls.hpp>	// Pascal unit
#include <Actnlist.hpp>	// Pascal unit
#include <Designintf.hpp>	// Pascal unit
#include <Designeditors.hpp>	// Pascal unit
#include <Vcleditors.hpp>	// Pascal unit
#include <Vclsprigs.hpp>	// Pascal unit
#include <Designmenus.hpp>	// Pascal unit
#include <Treeintf.hpp>	// Pascal unit
#include <Rzcommon.hpp>	// Pascal unit
#include <Rzedit.hpp>	// Pascal unit
#include <Rzstatus.hpp>	// Pascal unit
#include <Rzlabel.hpp>	// Pascal unit
#include <Rzlstbox.hpp>	// Pascal unit
#include <Rzline.hpp>	// Pascal unit
#include <Rztabs.hpp>	// Pascal unit
#include <Rzradchk.hpp>	// Pascal unit
#include <Rzcmbobx.hpp>	// Pascal unit
#include <Rzpanel.hpp>	// Pascal unit
#include <Rzsplit.hpp>	// Pascal unit
#include <Rzlistvw.hpp>	// Pascal unit
#include <Rztreevw.hpp>	// Pascal unit
#include <Rzdlgbtn.hpp>	// Pascal unit
#include <Rzbckgnd.hpp>	// Pascal unit
#include <Rzborder.hpp>	// Pascal unit
#include <Rztrkbar.hpp>	// Pascal unit
#include <Rzprgres.hpp>	// Pascal unit
#include <Rzbtnedt.hpp>	// Pascal unit
#include <Rzspnedt.hpp>	// Pascal unit
#include <Rztray.hpp>	// Pascal unit
#include <Rzforms.hpp>	// Pascal unit
#include <Rzpopups.hpp>	// Pascal unit
#include <Rzanimtr.hpp>	// Pascal unit
#include <Rzbhints.hpp>	// Pascal unit
#include <Rzgrids.hpp>	// Pascal unit
#include <Types.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Rzdesigneditors
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TRzComponentEditor;
class PASCALIMPLEMENTATION TRzComponentEditor : public Designeditors::TComponentEditor
{
	typedef Designeditors::TComponentEditor inherited;
	
private:
	System::UnicodeString FPropName;
	bool FContinue;
	Designintf::_di_IProperty FPropEditor;
	void __fastcall EnumPropertyEditors(const Designintf::_di_IProperty PropertyEditor);
	void __fastcall TestPropertyEditor(const Designintf::_di_IProperty PropertyEditor, bool &Continue);
	void __fastcall AlignMenuHandler(System::TObject* Sender);
	void __fastcall ImageListMenuHandler(System::TObject* Sender);
	void __fastcall RegIniFileMenuHandler(System::TObject* Sender);
	
protected:
	void __fastcall DesignerModified(void);
	void __fastcall EditPropertyByName(const System::UnicodeString APropName);
	virtual int __fastcall AlignMenuIndex(void);
	virtual bool __fastcall GetCompRefData(int Index, Classes::TComponentClass &CompRefClass, System::UnicodeString &CompRefPropName, Classes::TNotifyEvent &CompRefMenuHandler);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	
public:
	virtual void __fastcall PrepareItem(int Index, const Designmenus::_di_IMenuItem AItem);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzComponentEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : Designeditors::TComponentEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzComponentEditor(void) { }
	
};


class DELPHICLASS TRzDefaultEditor;
class PASCALIMPLEMENTATION TRzDefaultEditor : public Designeditors::TDefaultEditor
{
	typedef Designeditors::TDefaultEditor inherited;
	
private:
	System::UnicodeString FPropName;
	bool FContinue;
	Designintf::_di_IProperty FPropEditor;
	void __fastcall EnumPropertyEditors(const Designintf::_di_IProperty PropertyEditor);
	void __fastcall TestPropertyEditor(const Designintf::_di_IProperty PropertyEditor, bool &Continue);
	void __fastcall AlignMenuHandler(System::TObject* Sender);
	void __fastcall ImageListMenuHandler(System::TObject* Sender);
	void __fastcall RegIniFileMenuHandler(System::TObject* Sender);
	
protected:
	void __fastcall DesignerModified(void);
	void __fastcall EditPropertyByName(const System::UnicodeString APropName);
	virtual int __fastcall AlignMenuIndex(void);
	virtual bool __fastcall GetCompRefData(int Index, Classes::TComponentClass &CompRefClass, System::UnicodeString &CompRefPropName, Classes::TNotifyEvent &CompRefMenuHandler);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	
public:
	virtual void __fastcall PrepareItem(int Index, const Designmenus::_di_IMenuItem AItem);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzDefaultEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : Designeditors::TDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzDefaultEditor(void) { }
	
};


class DELPHICLASS TRzFrameControllerEditor;
class PASCALIMPLEMENTATION TRzFrameControllerEditor : public TRzComponentEditor
{
	typedef TRzComponentEditor inherited;
	
protected:
	Rzcommon::TRzFrameController* __fastcall FrameController(void);
	virtual bool __fastcall GetCompRefData(int Index, Classes::TComponentClass &CompRefClass, System::UnicodeString &CompRefPropName, Classes::TNotifyEvent &CompRefMenuHandler);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzFrameControllerEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzComponentEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzFrameControllerEditor(void) { }
	
};


class DELPHICLASS TRzStatusBarEditor;
class PASCALIMPLEMENTATION TRzStatusBarEditor : public TRzComponentEditor
{
	typedef TRzComponentEditor inherited;
	
protected:
	Rzpanel::TRzStatusBar* __fastcall StatusBar(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall AddPaneMenuHandler(System::TObject* Sender);
	void __fastcall VisualStyleMenuHandler(System::TObject* Sender);
	void __fastcall GradientColorStyleMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall Edit(void);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzStatusBarEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzComponentEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzStatusBarEditor(void) { }
	
};


class DELPHICLASS TRzGroupBoxEditor;
class PASCALIMPLEMENTATION TRzGroupBoxEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	Rzpanel::TRzGroupBox* __fastcall GroupBox(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall GroupStyleMenuHandler(System::TObject* Sender);
	void __fastcall VisualStyleMenuHandler(System::TObject* Sender);
	void __fastcall GradientColorStyleMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzGroupBoxEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzGroupBoxEditor(void) { }
	
};


class DELPHICLASS TRzPageControlEditor;
class PASCALIMPLEMENTATION TRzPageControlEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	Rztabs::TRzPageControl* __fastcall PageControl(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall PageMenuHandler(System::TObject* Sender);
	void __fastcall StyleMenuHandler(System::TObject* Sender);
	void __fastcall OrientationMenuHandler(System::TObject* Sender);
	HIDESBASE void __fastcall ImageListMenuHandler(System::TObject* Sender);
	HIDESBASE void __fastcall AlignMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzPageControlEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzPageControlEditor(void) { }
	
};


class DELPHICLASS TRzPageControlSprig;
class PASCALIMPLEMENTATION TRzPageControlSprig : public Vclsprigs::TWinControlSprig
{
	typedef Vclsprigs::TWinControlSprig inherited;
	
public:
	__fastcall virtual TRzPageControlSprig(Classes::TPersistent* AItem)/* overload */;
	virtual bool __fastcall SortByIndex(void);
public:
	/* TSprig.Destroy */ inline __fastcall virtual ~TRzPageControlSprig(void) { }
	
};


class DELPHICLASS TRzTabSheetSprig;
class PASCALIMPLEMENTATION TRzTabSheetSprig : public Vclsprigs::TWinControlSprig
{
	typedef Vclsprigs::TWinControlSprig inherited;
	
public:
	__fastcall virtual TRzTabSheetSprig(Classes::TPersistent* AItem)/* overload */;
	virtual System::UnicodeString __fastcall Caption(void);
	virtual int __fastcall ItemIndex(void);
	virtual bool __fastcall Hidden(void);
public:
	/* TSprig.Destroy */ inline __fastcall virtual ~TRzTabSheetSprig(void) { }
	
};


class DELPHICLASS TRzTabControlEditor;
class PASCALIMPLEMENTATION TRzTabControlEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	Rztabs::TRzTabControl* __fastcall TabControl(void);
	virtual int __fastcall AlignMenuIndex(void);
	virtual bool __fastcall GetCompRefData(int Index, Classes::TComponentClass &CompRefClass, System::UnicodeString &CompRefPropName, Classes::TNotifyEvent &CompRefMenuHandler);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall TabMenuHandler(System::TObject* Sender);
	void __fastcall StyleMenuHandler(System::TObject* Sender);
	void __fastcall OrientationMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzTabControlEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzTabControlEditor(void) { }
	
};


class DELPHICLASS TRzSizePanelEditor;
class PASCALIMPLEMENTATION TRzSizePanelEditor : public TRzComponentEditor
{
	typedef TRzComponentEditor inherited;
	
protected:
	Rzsplit::TRzSizePanel* __fastcall SizePanel(void);
	virtual int __fastcall AlignMenuIndex(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzSizePanelEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzComponentEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzSizePanelEditor(void) { }
	
};


class DELPHICLASS TRzCheckBoxEditor;
class PASCALIMPLEMENTATION TRzCheckBoxEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	Rzradchk::TRzCheckBox* __fastcall CheckBox(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzCheckBoxEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzCheckBoxEditor(void) { }
	
};


class DELPHICLASS TRzRadioButtonEditor;
class PASCALIMPLEMENTATION TRzRadioButtonEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	Rzradchk::TRzRadioButton* __fastcall RadioButton(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzRadioButtonEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzRadioButtonEditor(void) { }
	
};


class DELPHICLASS TRzMemoEditor;
class PASCALIMPLEMENTATION TRzMemoEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	virtual bool __fastcall GetWordWrap(void);
	virtual void __fastcall SetWordWrap(bool Value);
	virtual int __fastcall AlignMenuIndex(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	__property bool WordWrap = {read=GetWordWrap, write=SetWordWrap, nodefault};
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzMemoEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzMemoEditor(void) { }
	
};


class DELPHICLASS TRzRichEditEditor;
class PASCALIMPLEMENTATION TRzRichEditEditor : public TRzMemoEditor
{
	typedef TRzMemoEditor inherited;
	
protected:
	virtual bool __fastcall GetWordWrap(void);
	virtual void __fastcall SetWordWrap(bool Value);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzRichEditEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzMemoEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzRichEditEditor(void) { }
	
};


class DELPHICLASS TRzListBoxEditor;
class PASCALIMPLEMENTATION TRzListBoxEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	Rzlstbox::TRzListBox* __fastcall ListBox(void);
	virtual int __fastcall AlignMenuIndex(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzListBoxEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzListBoxEditor(void) { }
	
};


class DELPHICLASS TRzRankListBoxEditor;
class PASCALIMPLEMENTATION TRzRankListBoxEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	Rzlstbox::TRzRankListBox* __fastcall ListBox(void);
	virtual int __fastcall AlignMenuIndex(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzRankListBoxEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzRankListBoxEditor(void) { }
	
};


class DELPHICLASS TRzMRUComboBoxEditor;
class PASCALIMPLEMENTATION TRzMRUComboBoxEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzMRUComboBoxEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzMRUComboBoxEditor(void) { }
	
};


class DELPHICLASS TRzImageComboBoxEditor;
class PASCALIMPLEMENTATION TRzImageComboBoxEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	virtual bool __fastcall GetCompRefData(int Index, Classes::TComponentClass &CompRefClass, System::UnicodeString &CompRefPropName, Classes::TNotifyEvent &CompRefMenuHandler);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzImageComboBoxEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzImageComboBoxEditor(void) { }
	
};


class DELPHICLASS TRzListViewEditor;
class PASCALIMPLEMENTATION TRzListViewEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	Rzlistvw::TRzListView* __fastcall ListView(void);
	virtual int __fastcall AlignMenuIndex(void);
	virtual bool __fastcall GetCompRefData(int Index, Classes::TComponentClass &CompRefClass, System::UnicodeString &CompRefPropName, Classes::TNotifyEvent &CompRefMenuHandler);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall ViewStyleMenuHandler(System::TObject* Sender);
	void __fastcall SmallImagesMenuHandler(System::TObject* Sender);
	void __fastcall LargeImagesMenuHandler(System::TObject* Sender);
	void __fastcall StateImagesMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzListViewEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzListViewEditor(void) { }
	
};


class DELPHICLASS TRzTreeViewEditor;
class PASCALIMPLEMENTATION TRzTreeViewEditor : public TRzComponentEditor
{
	typedef TRzComponentEditor inherited;
	
protected:
	Rztreevw::TRzTreeView* __fastcall TreeView(void);
	virtual int __fastcall AlignMenuIndex(void);
	virtual bool __fastcall GetCompRefData(int Index, Classes::TComponentClass &CompRefClass, System::UnicodeString &CompRefPropName, Classes::TNotifyEvent &CompRefMenuHandler);
	void __fastcall ImagesMenuHandler(System::TObject* Sender);
	void __fastcall StateImagesMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzTreeViewEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzComponentEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzTreeViewEditor(void) { }
	
};


class DELPHICLASS TRzCheckTreeEditor;
class PASCALIMPLEMENTATION TRzCheckTreeEditor : public TRzTreeViewEditor
{
	typedef TRzTreeViewEditor inherited;
	
protected:
	Rztreevw::TRzCheckTree* __fastcall CheckTree(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzCheckTreeEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzTreeViewEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzCheckTreeEditor(void) { }
	
};


class DELPHICLASS TRzBackgroundEditor;
class PASCALIMPLEMENTATION TRzBackgroundEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	Rzbckgnd::TRzBackground* __fastcall Background(void);
	virtual int __fastcall AlignMenuIndex(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall GradientDirectionMenuHandler(System::TObject* Sender);
	void __fastcall ImageStyleMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzBackgroundEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzBackgroundEditor(void) { }
	
};


class DELPHICLASS TRzTrackBarEditor;
class PASCALIMPLEMENTATION TRzTrackBarEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	Rztrkbar::TRzTrackBar* __fastcall TrackBar(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall ThumbStyleMenuHandler(System::TObject* Sender);
	void __fastcall TickStepMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzTrackBarEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzTrackBarEditor(void) { }
	
};


class DELPHICLASS TRzProgressBarEditor;
class PASCALIMPLEMENTATION TRzProgressBarEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	Rzprgres::TRzProgressBar* __fastcall ProgressBar(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzProgressBarEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzProgressBarEditor(void) { }
	
};


class DELPHICLASS TRzFontListEditor;
class PASCALIMPLEMENTATION TRzFontListEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	virtual int __fastcall AlignMenuIndex(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall ShowStyleMenuHandler(System::TObject* Sender);
	void __fastcall FontTypeMenuHandler(System::TObject* Sender);
	void __fastcall FontDeviceMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzFontListEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzFontListEditor(void) { }
	
};


class DELPHICLASS TRzEditControlEditor;
class PASCALIMPLEMENTATION TRzEditControlEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	Rzedit::TRzCustomEdit* __fastcall EditControl(void);
	virtual int __fastcall AlignMenuIndex(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzEditControlEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzEditControlEditor(void) { }
	
};


class DELPHICLASS TRzButtonEditEditor;
class PASCALIMPLEMENTATION TRzButtonEditEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	Rzbtnedt::TRzButtonEdit* __fastcall ButtonEdit(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall ButtonKindMenuHandler(System::TObject* Sender);
	void __fastcall AltBtnKindMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzButtonEditEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzButtonEditEditor(void) { }
	
};


class DELPHICLASS TRzNumericEditEditor;
class PASCALIMPLEMENTATION TRzNumericEditEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	Rzedit::TRzNumericEdit* __fastcall NumericEdit(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzNumericEditEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzNumericEditEditor(void) { }
	
};


class DELPHICLASS TRzSpinEditEditor;
class PASCALIMPLEMENTATION TRzSpinEditEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	Rzspnedt::TRzSpinEdit* __fastcall SpinEdit(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall DirectionMenuHandler(System::TObject* Sender);
	void __fastcall OrientationMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzSpinEditEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzSpinEditEditor(void) { }
	
};


class DELPHICLASS TRzSpinButtonsEditor;
class PASCALIMPLEMENTATION TRzSpinButtonsEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	Rzspnedt::TRzSpinButtons* __fastcall SpinButtons(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall DirectionMenuHandler(System::TObject* Sender);
	void __fastcall OrientationMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzSpinButtonsEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzSpinButtonsEditor(void) { }
	
};


class DELPHICLASS TRzSpinnerEditor;
class PASCALIMPLEMENTATION TRzSpinnerEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	Rzspnedt::TRzSpinner* __fastcall Spinner(void);
	virtual bool __fastcall GetCompRefData(int Index, Classes::TComponentClass &CompRefClass, System::UnicodeString &CompRefPropName, Classes::TNotifyEvent &CompRefMenuHandler);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzSpinnerEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzSpinnerEditor(void) { }
	
};


class DELPHICLASS TRzLookupDialogEditor;
class PASCALIMPLEMENTATION TRzLookupDialogEditor : public TRzComponentEditor
{
	typedef TRzComponentEditor inherited;
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzLookupDialogEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzComponentEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzLookupDialogEditor(void) { }
	
};


class DELPHICLASS TRzDialogButtonsEditor;
class PASCALIMPLEMENTATION TRzDialogButtonsEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	Rzdlgbtn::TRzDialogButtons* __fastcall DialogButtons(void);
	virtual int __fastcall AlignMenuIndex(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzDialogButtonsEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzDialogButtonsEditor(void) { }
	
};


class DELPHICLASS TRzFormEditor;
class PASCALIMPLEMENTATION TRzFormEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	Forms::TForm* __fastcall Form(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall QuickDesignFormMenuHandler(System::TObject* Sender);
	void __fastcall AddControlMenuHandler(System::TObject* Sender);
	void __fastcall AddComponentMenuHandler(System::TObject* Sender);
	void __fastcall UIStyleMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzFormEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzFormEditor(void) { }
	
};


class DELPHICLASS TRzFrameEditor;
class PASCALIMPLEMENTATION TRzFrameEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	Forms::TFrame* __fastcall Frame(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall StyleMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzFrameEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzFrameEditor(void) { }
	
};


class DELPHICLASS TRzDateTimeEditEditor;
class PASCALIMPLEMENTATION TRzDateTimeEditEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	Rzedit::TRzDateTimeEdit* __fastcall DateTimeEdit(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall ElementsMenuHandler(System::TObject* Sender);
	void __fastcall FirstDayOfWeekMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzDateTimeEditEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzDateTimeEditEditor(void) { }
	
};


class DELPHICLASS TRzCalendarEditor;
class PASCALIMPLEMENTATION TRzCalendarEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	Rzpopups::TRzCalendar* __fastcall Calendar(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall ElementsMenuHandler(System::TObject* Sender);
	void __fastcall FirstDayOfWeekMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzCalendarEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzCalendarEditor(void) { }
	
};


class DELPHICLASS TRzCalculatorEditor;
class PASCALIMPLEMENTATION TRzCalculatorEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	Rzpopups::TRzCalculator* __fastcall Calculator(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzCalculatorEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzCalculatorEditor(void) { }
	
};


class DELPHICLASS TRzTimePickerEditor;
class PASCALIMPLEMENTATION TRzTimePickerEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	Rzpopups::TRzTimePicker* __fastcall TimePicker(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzTimePickerEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzTimePickerEditor(void) { }
	
};


class DELPHICLASS TRzColorPickerEditor;
class PASCALIMPLEMENTATION TRzColorPickerEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	Rzborder::TRzColorPicker* __fastcall ColorPicker(void);
	virtual bool __fastcall GetCompRefData(int Index, Classes::TComponentClass &CompRefClass, System::UnicodeString &CompRefPropName, Classes::TNotifyEvent &CompRefMenuHandler);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall CustomColorsMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzColorPickerEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzColorPickerEditor(void) { }
	
};


class DELPHICLASS TRzColorEditEditor;
class PASCALIMPLEMENTATION TRzColorEditEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	Rzedit::TRzColorEdit* __fastcall ColorEdit(void);
	virtual bool __fastcall GetCompRefData(int Index, Classes::TComponentClass &CompRefClass, System::UnicodeString &CompRefPropName, Classes::TNotifyEvent &CompRefMenuHandler);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall CustomColorsMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzColorEditEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzColorEditEditor(void) { }
	
};


class DELPHICLASS TRzLEDDisplayEditor;
class PASCALIMPLEMENTATION TRzLEDDisplayEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	Rzborder::TRzLEDDisplay* __fastcall LEDDisplay(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzLEDDisplayEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzLEDDisplayEditor(void) { }
	
};


class DELPHICLASS TRzStatusPaneEditor;
class PASCALIMPLEMENTATION TRzStatusPaneEditor : public TRzComponentEditor
{
	typedef TRzComponentEditor inherited;
	
protected:
	virtual int __fastcall FlatStyleMenuIndex(void);
	virtual int __fastcall TraditionalStyleMenuIndex(void);
	virtual int __fastcall AutoSizeMenuIndex(void);
	virtual int __fastcall AlignmentMenuIndex(void);
	virtual int __fastcall BlinkingMenuIndex(void);
	virtual int __fastcall AlignMenuIndex(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall AlignmentMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzStatusPaneEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzComponentEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzStatusPaneEditor(void) { }
	
};


class DELPHICLASS TRzGlyphStatusEditor;
class PASCALIMPLEMENTATION TRzGlyphStatusEditor : public TRzStatusPaneEditor
{
	typedef TRzStatusPaneEditor inherited;
	
protected:
	Rzstatus::TRzGlyphStatus* __fastcall GlyphStatus(void);
	virtual int __fastcall FlatStyleMenuIndex(void);
	virtual int __fastcall TraditionalStyleMenuIndex(void);
	virtual int __fastcall AutoSizeMenuIndex(void);
	virtual int __fastcall AlignmentMenuIndex(void);
	virtual int __fastcall BlinkingMenuIndex(void);
	virtual int __fastcall AlignMenuIndex(void);
	virtual bool __fastcall GetCompRefData(int Index, Classes::TComponentClass &CompRefClass, System::UnicodeString &CompRefPropName, Classes::TNotifyEvent &CompRefMenuHandler);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall GlyphAlignmentMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzGlyphStatusEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzStatusPaneEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzGlyphStatusEditor(void) { }
	
};


class DELPHICLASS TRzMarqueeStatusEditor;
class PASCALIMPLEMENTATION TRzMarqueeStatusEditor : public TRzStatusPaneEditor
{
	typedef TRzStatusPaneEditor inherited;
	
protected:
	Rzstatus::TRzMarqueeStatus* __fastcall MarqueeStatus(void);
	virtual int __fastcall FlatStyleMenuIndex(void);
	virtual int __fastcall TraditionalStyleMenuIndex(void);
	virtual int __fastcall AutoSizeMenuIndex(void);
	virtual int __fastcall AlignmentMenuIndex(void);
	virtual int __fastcall BlinkingMenuIndex(void);
	virtual int __fastcall AlignMenuIndex(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzMarqueeStatusEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzStatusPaneEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzMarqueeStatusEditor(void) { }
	
};


class DELPHICLASS TRzClockStatusEditor;
class PASCALIMPLEMENTATION TRzClockStatusEditor : public TRzStatusPaneEditor
{
	typedef TRzStatusPaneEditor inherited;
	
protected:
	Rzstatus::TRzClockStatus* __fastcall ClockStatus(void);
	virtual int __fastcall FlatStyleMenuIndex(void);
	virtual int __fastcall TraditionalStyleMenuIndex(void);
	virtual int __fastcall AutoSizeMenuIndex(void);
	virtual int __fastcall AlignmentMenuIndex(void);
	virtual int __fastcall BlinkingMenuIndex(void);
	virtual int __fastcall AlignMenuIndex(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall ClockMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzClockStatusEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzStatusPaneEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzClockStatusEditor(void) { }
	
};


class DELPHICLASS TRzKeyStatusEditor;
class PASCALIMPLEMENTATION TRzKeyStatusEditor : public TRzStatusPaneEditor
{
	typedef TRzStatusPaneEditor inherited;
	
protected:
	Rzstatus::TRzKeyStatus* __fastcall KeyStatus(void);
	virtual int __fastcall FlatStyleMenuIndex(void);
	virtual int __fastcall TraditionalStyleMenuIndex(void);
	virtual int __fastcall AutoSizeMenuIndex(void);
	virtual int __fastcall AlignmentMenuIndex(void);
	virtual int __fastcall BlinkingMenuIndex(void);
	virtual int __fastcall AlignMenuIndex(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzKeyStatusEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzStatusPaneEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzKeyStatusEditor(void) { }
	
};


class DELPHICLASS TRzVersionInfoStatusEditor;
class PASCALIMPLEMENTATION TRzVersionInfoStatusEditor : public TRzStatusPaneEditor
{
	typedef TRzStatusPaneEditor inherited;
	
protected:
	Rzstatus::TRzVersionInfoStatus* __fastcall VersionInfoStatus(void);
	virtual int __fastcall FlatStyleMenuIndex(void);
	virtual int __fastcall TraditionalStyleMenuIndex(void);
	virtual int __fastcall AutoSizeMenuIndex(void);
	virtual int __fastcall AlignmentMenuIndex(void);
	virtual int __fastcall BlinkingMenuIndex(void);
	virtual int __fastcall AlignMenuIndex(void);
	virtual bool __fastcall GetCompRefData(int Index, Classes::TComponentClass &CompRefClass, System::UnicodeString &CompRefPropName, Classes::TNotifyEvent &CompRefMenuHandler);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall VersionInfoMenuHandler(System::TObject* Sender);
	void __fastcall FieldMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzVersionInfoStatusEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzStatusPaneEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzVersionInfoStatusEditor(void) { }
	
};


class DELPHICLASS TRzResourceStatusEditor;
class PASCALIMPLEMENTATION TRzResourceStatusEditor : public TRzStatusPaneEditor
{
	typedef TRzStatusPaneEditor inherited;
	
protected:
	Rzstatus::TRzResourceStatus* __fastcall ResourceStatus(void);
	virtual int __fastcall FlatStyleMenuIndex(void);
	virtual int __fastcall TraditionalStyleMenuIndex(void);
	virtual int __fastcall AutoSizeMenuIndex(void);
	virtual int __fastcall AlignmentMenuIndex(void);
	virtual int __fastcall BlinkingMenuIndex(void);
	virtual int __fastcall AlignMenuIndex(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzResourceStatusEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzStatusPaneEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzResourceStatusEditor(void) { }
	
};


class DELPHICLASS TRzProgressStatusEditor;
class PASCALIMPLEMENTATION TRzProgressStatusEditor : public TRzStatusPaneEditor
{
	typedef TRzStatusPaneEditor inherited;
	
protected:
	Rzstatus::TRzProgressStatus* __fastcall ProgressStatus(void);
	virtual int __fastcall FlatStyleMenuIndex(void);
	virtual int __fastcall TraditionalStyleMenuIndex(void);
	virtual int __fastcall AutoSizeMenuIndex(void);
	virtual int __fastcall AlignmentMenuIndex(void);
	virtual int __fastcall BlinkingMenuIndex(void);
	virtual int __fastcall AlignMenuIndex(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzProgressStatusEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzStatusPaneEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzProgressStatusEditor(void) { }
	
};


class DELPHICLASS TRzLineEditor;
class PASCALIMPLEMENTATION TRzLineEditor : public TRzComponentEditor
{
	typedef TRzComponentEditor inherited;
	
protected:
	Rzline::TRzLine* __fastcall Line(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall ShowArrowsMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzLineEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzComponentEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzLineEditor(void) { }
	
};


class DELPHICLASS TRzCustomColorsEditor;
class PASCALIMPLEMENTATION TRzCustomColorsEditor : public TRzComponentEditor
{
	typedef TRzComponentEditor inherited;
	
protected:
	virtual bool __fastcall GetCompRefData(int Index, Classes::TComponentClass &CompRefClass, System::UnicodeString &CompRefPropName, Classes::TNotifyEvent &CompRefMenuHandler);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzCustomColorsEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzComponentEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzCustomColorsEditor(void) { }
	
};


class DELPHICLASS TRzShapeButtonEditor;
class PASCALIMPLEMENTATION TRzShapeButtonEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzShapeButtonEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzShapeButtonEditor(void) { }
	
};


class DELPHICLASS TRzPropertyItemPropNameProperty;
class PASCALIMPLEMENTATION TRzPropertyItemPropNameProperty : public Designeditors::TStringProperty
{
	typedef Designeditors::TStringProperty inherited;
	
public:
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
	virtual void __fastcall GetValues(Classes::TGetStrProc Proc);
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TRzPropertyItemPropNameProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TStringProperty(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TRzPropertyItemPropNameProperty(void) { }
	
};


class DELPHICLASS TRzPropertyStoreEditor;
class PASCALIMPLEMENTATION TRzPropertyStoreEditor : public TRzComponentEditor
{
	typedef TRzComponentEditor inherited;
	
protected:
	Rzcommon::TRzPropertyStore* __fastcall PropertyStore(void);
	virtual bool __fastcall GetCompRefData(int Index, Classes::TComponentClass &CompRefClass, System::UnicodeString &CompRefPropName, Classes::TNotifyEvent &CompRefMenuHandler);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzPropertyStoreEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzComponentEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzPropertyStoreEditor(void) { }
	
};


class DELPHICLASS TRzFormStateEditor;
class PASCALIMPLEMENTATION TRzFormStateEditor : public TRzComponentEditor
{
	typedef TRzComponentEditor inherited;
	
protected:
	Rzforms::TRzFormState* __fastcall FormState(void);
	virtual bool __fastcall GetCompRefData(int Index, Classes::TComponentClass &CompRefClass, System::UnicodeString &CompRefPropName, Classes::TNotifyEvent &CompRefMenuHandler);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzFormStateEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzComponentEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzFormStateEditor(void) { }
	
};


class DELPHICLASS TRzFormShapeEditor;
class PASCALIMPLEMENTATION TRzFormShapeEditor : public TRzComponentEditor
{
	typedef TRzComponentEditor inherited;
	
protected:
	Rzforms::TRzFormShape* __fastcall FormShape(void);
	virtual int __fastcall AlignMenuIndex(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzFormShapeEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzComponentEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzFormShapeEditor(void) { }
	
};


class DELPHICLASS TRzBorderEditor;
class PASCALIMPLEMENTATION TRzBorderEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	Rzborder::TRzBorder* __fastcall Border(void);
	virtual int __fastcall AlignMenuIndex(void);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzBorderEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzBorderEditor(void) { }
	
};


class DELPHICLASS TRzTrayIconEditor;
class PASCALIMPLEMENTATION TRzTrayIconEditor : public TRzComponentEditor
{
	typedef TRzComponentEditor inherited;
	
protected:
	Rztray::TRzTrayIcon* __fastcall TrayIcon(void);
	virtual bool __fastcall GetCompRefData(int Index, Classes::TComponentClass &CompRefClass, System::UnicodeString &CompRefPropName, Classes::TNotifyEvent &CompRefMenuHandler);
	void __fastcall IconsMenuHandler(System::TObject* Sender);
	void __fastcall PopupMenuMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzTrayIconEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzComponentEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzTrayIconEditor(void) { }
	
};


class DELPHICLASS TRzAnimatorEditor;
class PASCALIMPLEMENTATION TRzAnimatorEditor : public TRzComponentEditor
{
	typedef TRzComponentEditor inherited;
	
protected:
	Rzanimtr::TRzAnimator* __fastcall Animator(void);
	virtual bool __fastcall GetCompRefData(int Index, Classes::TComponentClass &CompRefClass, System::UnicodeString &CompRefPropName, Classes::TNotifyEvent &CompRefMenuHandler);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	HIDESBASE void __fastcall ImageListMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzAnimatorEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzComponentEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzAnimatorEditor(void) { }
	
};


class DELPHICLASS TRzSeparatorEditor;
class PASCALIMPLEMENTATION TRzSeparatorEditor : public TRzComponentEditor
{
	typedef TRzComponentEditor inherited;
	
protected:
	Rzbckgnd::TRzSeparator* __fastcall Separator(void);
	virtual int __fastcall AlignMenuIndex(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall HighlightLocationMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzSeparatorEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzComponentEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzSeparatorEditor(void) { }
	
};


class DELPHICLASS TRzSpacerEditor;
class PASCALIMPLEMENTATION TRzSpacerEditor : public TRzComponentEditor
{
	typedef TRzComponentEditor inherited;
	
protected:
	Rzpanel::TRzSpacer* __fastcall Spacer(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzSpacerEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzComponentEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzSpacerEditor(void) { }
	
};


class DELPHICLASS TRzBalloonHintsEditor;
class PASCALIMPLEMENTATION TRzBalloonHintsEditor : public TRzComponentEditor
{
	typedef TRzComponentEditor inherited;
	
protected:
	Rzbhints::TRzBalloonHints* __fastcall BalloonHints(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall CornerMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzBalloonHintsEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzComponentEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzBalloonHintsEditor(void) { }
	
};


class DELPHICLASS TRzStringGridEditor;
class PASCALIMPLEMENTATION TRzStringGridEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	Rzgrids::TRzStringGrid* __fastcall Grid(void);
	virtual int __fastcall AlignMenuIndex(void);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzStringGridEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzStringGridEditor(void) { }
	
};


class DELPHICLASS TRzFlowPanelEditor;
class PASCALIMPLEMENTATION TRzFlowPanelEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	Rzpanel::TRzFlowPanel* __fastcall FlowPanel(void);
	virtual int __fastcall AlignMenuIndex(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall FlowStyleMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzFlowPanelEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzFlowPanelEditor(void) { }
	
};


class DELPHICLASS TRzGridPanelEditor;
class PASCALIMPLEMENTATION TRzGridPanelEditor : public TRzDefaultEditor
{
	typedef TRzDefaultEditor inherited;
	
protected:
	Rzpanel::TRzGridPanel* __fastcall GridPanel(void);
	virtual int __fastcall AlignMenuIndex(void);
	virtual void __fastcall PrepareMenuItem(int Index, const Menus::TMenuItem* Item);
	void __fastcall ExpandStyleMenuHandler(System::TObject* Sender);
	
public:
	virtual int __fastcall GetVerbCount(void);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual void __fastcall ExecuteVerb(int Index);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TRzGridPanelEditor(Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : TRzDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzGridPanelEditor(void) { }
	
};


class DELPHICLASS TRzFrameStyleProperty;
class PASCALIMPLEMENTATION TRzFrameStyleProperty : public Designeditors::TEnumProperty
{
	typedef Designeditors::TEnumProperty inherited;
	
private:
	bool FDrawingPropertyValue;
	Types::TRect __fastcall PaintFrameStyleGlyph(const System::UnicodeString Value, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool ASelected);
	
public:
	void __fastcall ListMeasureHeight(const System::UnicodeString Value, Graphics::TCanvas* ACanvas, int &AHeight);
	void __fastcall ListMeasureWidth(const System::UnicodeString Value, Graphics::TCanvas* ACanvas, int &AWidth);
	void __fastcall ListDrawValue(const System::UnicodeString Value, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool ASelected);
	void __fastcall PropDrawName(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool ASelected);
	void __fastcall PropDrawValue(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool ASelected);
	Types::TRect __fastcall PropDrawNameRect(const Types::TRect &ARect);
	Types::TRect __fastcall PropDrawValueRect(const Types::TRect &ARect);
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TRzFrameStyleProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TEnumProperty(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TRzFrameStyleProperty(void) { }
	
private:
	void *__ICustomPropertyDrawing80;	/* Vcleditors::ICustomPropertyDrawing80 */
	void *__ICustomPropertyListDrawing;	/* Vcleditors::ICustomPropertyListDrawing */
	
public:
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Vcleditors::_di_ICustomPropertyDrawing80()
	{
		Vcleditors::_di_ICustomPropertyDrawing80 intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator ICustomPropertyDrawing80*(void) { return (ICustomPropertyDrawing80*)&__ICustomPropertyDrawing80; }
	#endif
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Vcleditors::_di_ICustomPropertyListDrawing()
	{
		Vcleditors::_di_ICustomPropertyListDrawing intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator ICustomPropertyListDrawing*(void) { return (ICustomPropertyListDrawing*)&__ICustomPropertyListDrawing; }
	#endif
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Vcleditors::_di_ICustomPropertyDrawing()
	{
		Vcleditors::_di_ICustomPropertyDrawing intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator ICustomPropertyDrawing*(void) { return (ICustomPropertyDrawing*)&__ICustomPropertyDrawing80; }
	#endif
	
};


typedef void __fastcall (__closure *TRzAlignChangedEvent)(System::TObject* Sender, Controls::TAlign AlignValue);

class DELPHICLASS TRzAlignDropDown;
class PASCALIMPLEMENTATION TRzAlignDropDown : public Rzpanel::TRzPanel
{
	typedef Rzpanel::TRzPanel inherited;
	
private:
	Controls::TAlign FAlignValue;
	TRzAlignChangedEvent FOnAlignChanged;
	Rzpanel::TRzPanel* FFooter;
	Rzpanel::TRzPanel* FGrid;
	Rzpanel::TRzPanel* FTopPanel;
	Rzpanel::TRzPanel* FBottomPanel;
	Rzpanel::TRzPanel* FLeftPanel;
	Rzpanel::TRzPanel* FRightPanel;
	Rzpanel::TRzPanel* FClientPanel;
	Rzpanel::TRzPanel* FNonePanel;
	Rzpanel::TRzPanel* FCustomPanel;
	void __fastcall InitPanel(Rzpanel::TRzPanel* Panel, Controls::TAlign Align);
	void __fastcall UnselectPanel(Rzpanel::TRzPanel* Panel);
	void __fastcall SelectPanel(Rzpanel::TRzPanel* Panel);
	void __fastcall MouseEnterHandler(System::TObject* Sender);
	void __fastcall MouseLeaveHandler(System::TObject* Sender);
	void __fastcall SetAlignValue(Controls::TAlign Value);
	void __fastcall PanelClickHandler(System::TObject* Sender);
	
public:
	__fastcall virtual TRzAlignDropDown(Classes::TComponent* AOwner);
	__property Controls::TAlign AlignValue = {read=FAlignValue, write=SetAlignValue, nodefault};
	__property TRzAlignChangedEvent OnAlignChanged = {read=FOnAlignChanged, write=FOnAlignChanged};
public:
	/* TRzCustomPanel.Destroy */ inline __fastcall virtual ~TRzAlignDropDown(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TRzAlignDropDown(HWND ParentWindow) : Rzpanel::TRzPanel(ParentWindow) { }
	
};


class DELPHICLASS TRzAlignProperty;
class PASCALIMPLEMENTATION TRzAlignProperty : public Designeditors::TEnumProperty
{
	typedef Designeditors::TEnumProperty inherited;
	
private:
	TRzAlignDropDown* FDropDown;
	Designintf::_di_IPropertyHost FHost;
	bool FDrawingPropertyValue;
	Types::TRect __fastcall PaintAlignGlyph(const System::UnicodeString Value, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool ASelected);
	void __fastcall KeyPressHandler(System::TObject* Sender, System::WideChar &Key);
	void __fastcall AlignChangedHandler(System::TObject* Sender, Controls::TAlign AlignValue);
	
public:
	__fastcall virtual ~TRzAlignProperty(void);
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
	void __fastcall PropDrawName(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool ASelected);
	void __fastcall PropDrawValue(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool ASelected);
	Types::TRect __fastcall PropDrawNameRect(const Types::TRect &ARect);
	Types::TRect __fastcall PropDrawValueRect(const Types::TRect &ARect);
	HIDESBASE void __fastcall Edit(const Designintf::_di_IPropertyHost Host, bool DblClick)/* overload */;
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TRzAlignProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TEnumProperty(ADesigner, APropCount) { }
	
private:
	void *__IProperty80;	/* Designintf::IProperty80 */
	void *__ICustomPropertyDrawing80;	/* Vcleditors::ICustomPropertyDrawing80 */
	
public:
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Designintf::_di_IProperty80()
	{
		Designintf::_di_IProperty80 intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator IProperty80*(void) { return (IProperty80*)&__IProperty80; }
	#endif
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Vcleditors::_di_ICustomPropertyDrawing80()
	{
		Vcleditors::_di_ICustomPropertyDrawing80 intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator ICustomPropertyDrawing80*(void) { return (ICustomPropertyDrawing80*)&__ICustomPropertyDrawing80; }
	#endif
	#if defined(MANAGED_INTERFACE_OPERATORS)
	operator Vcleditors::_di_ICustomPropertyDrawing()
	{
		Vcleditors::_di_ICustomPropertyDrawing intf;
		GetInterface(intf);
		return intf;
	}
	#else
	operator ICustomPropertyDrawing*(void) { return (ICustomPropertyDrawing*)&__ICustomPropertyDrawing80; }
	#endif
	
};


class DELPHICLASS TRzActivePageProperty;
class PASCALIMPLEMENTATION TRzActivePageProperty : public Designeditors::TComponentProperty
{
	typedef Designeditors::TComponentProperty inherited;
	
public:
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
	virtual void __fastcall GetValues(Classes::TGetStrProc Proc);
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TRzActivePageProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TComponentProperty(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TRzActivePageProperty(void) { }
	
};


#pragma option push -b-
enum TRzDateTimeFormatFilter { ffAll, ffDates, ffTimes };
#pragma option pop

class DELPHICLASS TRzDateTimeFormatProperty;
class PASCALIMPLEMENTATION TRzDateTimeFormatProperty : public Designeditors::TStringProperty
{
	typedef Designeditors::TStringProperty inherited;
	
protected:
	virtual TRzDateTimeFormatFilter __fastcall FormatFilter(void);
	
public:
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
	virtual void __fastcall GetValues(Classes::TGetStrProc Proc);
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TRzDateTimeFormatProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TStringProperty(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TRzDateTimeFormatProperty(void) { }
	
};


class DELPHICLASS TRzClockStatusFormatProperty;
class PASCALIMPLEMENTATION TRzClockStatusFormatProperty : public TRzDateTimeFormatProperty
{
	typedef TRzDateTimeFormatProperty inherited;
	
protected:
	virtual TRzDateTimeFormatFilter __fastcall FormatFilter(void);
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TRzClockStatusFormatProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : TRzDateTimeFormatProperty(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TRzClockStatusFormatProperty(void) { }
	
};


class DELPHICLASS TRzDTPFormatProperty;
class PASCALIMPLEMENTATION TRzDTPFormatProperty : public Designeditors::TStringProperty
{
	typedef Designeditors::TStringProperty inherited;
	
public:
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
	virtual void __fastcall GetValues(Classes::TGetStrProc Proc);
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TRzDTPFormatProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TStringProperty(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TRzDTPFormatProperty(void) { }
	
};


class DELPHICLASS TRzSpinValueProperty;
class PASCALIMPLEMENTATION TRzSpinValueProperty : public Designeditors::TFloatProperty
{
	typedef Designeditors::TFloatProperty inherited;
	
public:
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
	virtual void __fastcall SetValue(const System::UnicodeString Value)/* overload */;
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TRzSpinValueProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TFloatProperty(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TRzSpinValueProperty(void) { }
	
	
/* Hoisted overloads: */
	
public:
	inline void __fastcall  SetValue(const System::WideString Value){ Designeditors::TPropertyEditor::SetValue(Value); }
	
};


class DELPHICLASS TRzSpinnerGlyphProperty;
class PASCALIMPLEMENTATION TRzSpinnerGlyphProperty : public Designeditors::TFloatProperty
{
	typedef Designeditors::TFloatProperty inherited;
	
public:
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
	virtual System::UnicodeString __fastcall GetValue(void);
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TRzSpinnerGlyphProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TFloatProperty(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TRzSpinnerGlyphProperty(void) { }
	
};


class DELPHICLASS TRzFileNameProperty;
class PASCALIMPLEMENTATION TRzFileNameProperty : public Designeditors::TStringProperty
{
	typedef Designeditors::TStringProperty inherited;
	
public:
	virtual void __fastcall Edit(void);
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TRzFileNameProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TStringProperty(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TRzFileNameProperty(void) { }
	
};


class DELPHICLASS TRzActionProperty;
class PASCALIMPLEMENTATION TRzActionProperty : public Designeditors::TStringProperty
{
	typedef Designeditors::TStringProperty inherited;
	
public:
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
	virtual void __fastcall GetValues(Classes::TGetStrProc Proc);
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TRzActionProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TStringProperty(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TRzActionProperty(void) { }
	
};


class DELPHICLASS TRzCustomColorsProperty;
class PASCALIMPLEMENTATION TRzCustomColorsProperty : public Designeditors::TClassProperty
{
	typedef Designeditors::TClassProperty inherited;
	
public:
	virtual void __fastcall Edit(void);
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TRzCustomColorsProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TClassProperty(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TRzCustomColorsProperty(void) { }
	
};


class DELPHICLASS TRzCustomButtonGuidelines;
class PASCALIMPLEMENTATION TRzCustomButtonGuidelines : public Vcleditors::TControlGuidelines
{
	typedef Vcleditors::TControlGuidelines inherited;
	
protected:
	virtual int __fastcall GetCount(void);
	virtual Designintf::TDesignerGuideType __fastcall GetDesignerGuideType(int Index);
	virtual int __fastcall GetDesignerGuideOffset(int Index);
public:
	/* TBaseComponentGuidelines.Create */ inline __fastcall virtual TRzCustomButtonGuidelines(const Designintf::_di_IDesigner ADesigner) : Vcleditors::TControlGuidelines(ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzCustomButtonGuidelines(void) { }
	
};


class DELPHICLASS TRzButtonGuidelines;
class PASCALIMPLEMENTATION TRzButtonGuidelines : public Vcleditors::TControlGuidelines
{
	typedef Vcleditors::TControlGuidelines inherited;
	
protected:
	virtual int __fastcall GetCount(void);
	virtual Designintf::TDesignerGuideType __fastcall GetDesignerGuideType(int Index);
	virtual int __fastcall GetDesignerGuideOffset(int Index);
public:
	/* TBaseComponentGuidelines.Create */ inline __fastcall virtual TRzButtonGuidelines(const Designintf::_di_IDesigner ADesigner) : Vcleditors::TControlGuidelines(ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzButtonGuidelines(void) { }
	
};


class DELPHICLASS TRzToolButtonGuidelines;
class PASCALIMPLEMENTATION TRzToolButtonGuidelines : public Vcleditors::TControlGuidelines
{
	typedef Vcleditors::TControlGuidelines inherited;
	
protected:
	virtual int __fastcall GetCount(void);
	virtual Designintf::TDesignerGuideType __fastcall GetDesignerGuideType(int Index);
	virtual int __fastcall GetDesignerGuideOffset(int Index);
public:
	/* TBaseComponentGuidelines.Create */ inline __fastcall virtual TRzToolButtonGuidelines(const Designintf::_di_IDesigner ADesigner) : Vcleditors::TControlGuidelines(ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzToolButtonGuidelines(void) { }
	
};


class DELPHICLASS TRzCaptionGuidelines;
class PASCALIMPLEMENTATION TRzCaptionGuidelines : public Vcleditors::TControlGuidelines
{
	typedef Vcleditors::TControlGuidelines inherited;
	
protected:
	virtual int __fastcall GetCount(void);
	virtual Designintf::TDesignerGuideType __fastcall GetDesignerGuideType(int Index);
	virtual int __fastcall GetDesignerGuideOffset(int Index);
public:
	/* TBaseComponentGuidelines.Create */ inline __fastcall virtual TRzCaptionGuidelines(const Designintf::_di_IDesigner ADesigner) : Vcleditors::TControlGuidelines(ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzCaptionGuidelines(void) { }
	
};


class DELPHICLASS TRzLabelGuidelines;
class PASCALIMPLEMENTATION TRzLabelGuidelines : public Vcleditors::TControlGuidelines
{
	typedef Vcleditors::TControlGuidelines inherited;
	
protected:
	virtual int __fastcall GetCount(void);
	virtual Designintf::TDesignerGuideType __fastcall GetDesignerGuideType(int Index);
	virtual int __fastcall GetDesignerGuideOffset(int Index);
public:
	/* TBaseComponentGuidelines.Create */ inline __fastcall virtual TRzLabelGuidelines(const Designintf::_di_IDesigner ADesigner) : Vcleditors::TControlGuidelines(ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzLabelGuidelines(void) { }
	
};


class DELPHICLASS TRzPanelGuidelines;
class PASCALIMPLEMENTATION TRzPanelGuidelines : public Vcleditors::TControlGuidelines
{
	typedef Vcleditors::TControlGuidelines inherited;
	
protected:
	virtual int __fastcall GetCount(void);
	virtual Designintf::TDesignerGuideType __fastcall GetDesignerGuideType(int Index);
	virtual int __fastcall GetDesignerGuideOffset(int Index);
public:
	/* TBaseComponentGuidelines.Create */ inline __fastcall virtual TRzPanelGuidelines(const Designintf::_di_IDesigner ADesigner) : Vcleditors::TControlGuidelines(ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzPanelGuidelines(void) { }
	
};


class DELPHICLASS TRzPageControlGuidelines;
class PASCALIMPLEMENTATION TRzPageControlGuidelines : public Vcleditors::TControlGuidelines
{
	typedef Vcleditors::TControlGuidelines inherited;
	
public:
	virtual int __fastcall GetDesignerGuideOffset(int Index);
public:
	/* TBaseComponentGuidelines.Create */ inline __fastcall virtual TRzPageControlGuidelines(const Designintf::_di_IDesigner ADesigner) : Vcleditors::TControlGuidelines(ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzPageControlGuidelines(void) { }
	
};


class DELPHICLASS TRzTabControlGuidelines;
class PASCALIMPLEMENTATION TRzTabControlGuidelines : public Vcleditors::TControlGuidelines
{
	typedef Vcleditors::TControlGuidelines inherited;
	
public:
	virtual int __fastcall GetDesignerGuideOffset(int Index);
public:
	/* TBaseComponentGuidelines.Create */ inline __fastcall virtual TRzTabControlGuidelines(const Designintf::_di_IDesigner ADesigner) : Vcleditors::TControlGuidelines(ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TRzTabControlGuidelines(void) { }
	
};


class DELPHICLASS TRzPaletteSep;
class PASCALIMPLEMENTATION TRzPaletteSep : public Classes::TComponent
{
	typedef Classes::TComponent inherited;
	
public:
	__fastcall virtual TRzPaletteSep(Classes::TComponent* AOwner);
public:
	/* TComponent.Destroy */ inline __fastcall virtual ~TRzPaletteSep(void) { }
	
};


class DELPHICLASS TRzPaletteSep_Panels;
class PASCALIMPLEMENTATION TRzPaletteSep_Panels : public TRzPaletteSep
{
	typedef TRzPaletteSep inherited;
	
public:
	/* TRzPaletteSep.Create */ inline __fastcall virtual TRzPaletteSep_Panels(Classes::TComponent* AOwner) : TRzPaletteSep(AOwner) { }
	
public:
	/* TComponent.Destroy */ inline __fastcall virtual ~TRzPaletteSep_Panels(void) { }
	
};


class DELPHICLASS TRzPaletteSep_Edits;
class PASCALIMPLEMENTATION TRzPaletteSep_Edits : public TRzPaletteSep
{
	typedef TRzPaletteSep inherited;
	
public:
	/* TRzPaletteSep.Create */ inline __fastcall virtual TRzPaletteSep_Edits(Classes::TComponent* AOwner) : TRzPaletteSep(AOwner) { }
	
public:
	/* TComponent.Destroy */ inline __fastcall virtual ~TRzPaletteSep_Edits(void) { }
	
};


class DELPHICLASS TRzPaletteSep_Lists;
class PASCALIMPLEMENTATION TRzPaletteSep_Lists : public TRzPaletteSep
{
	typedef TRzPaletteSep inherited;
	
public:
	/* TRzPaletteSep.Create */ inline __fastcall virtual TRzPaletteSep_Lists(Classes::TComponent* AOwner) : TRzPaletteSep(AOwner) { }
	
public:
	/* TComponent.Destroy */ inline __fastcall virtual ~TRzPaletteSep_Lists(void) { }
	
};


class DELPHICLASS TRzPaletteSep_Buttons;
class PASCALIMPLEMENTATION TRzPaletteSep_Buttons : public TRzPaletteSep
{
	typedef TRzPaletteSep inherited;
	
public:
	/* TRzPaletteSep.Create */ inline __fastcall virtual TRzPaletteSep_Buttons(Classes::TComponent* AOwner) : TRzPaletteSep(AOwner) { }
	
public:
	/* TComponent.Destroy */ inline __fastcall virtual ~TRzPaletteSep_Buttons(void) { }
	
};


class DELPHICLASS TRzPaletteSep_Display;
class PASCALIMPLEMENTATION TRzPaletteSep_Display : public TRzPaletteSep
{
	typedef TRzPaletteSep inherited;
	
public:
	/* TRzPaletteSep.Create */ inline __fastcall virtual TRzPaletteSep_Display(Classes::TComponent* AOwner) : TRzPaletteSep(AOwner) { }
	
public:
	/* TComponent.Destroy */ inline __fastcall virtual ~TRzPaletteSep_Display(void) { }
	
};


class DELPHICLASS TRzPaletteSep_Shell;
class PASCALIMPLEMENTATION TRzPaletteSep_Shell : public TRzPaletteSep
{
	typedef TRzPaletteSep inherited;
	
public:
	/* TRzPaletteSep.Create */ inline __fastcall virtual TRzPaletteSep_Shell(Classes::TComponent* AOwner) : TRzPaletteSep(AOwner) { }
	
public:
	/* TComponent.Destroy */ inline __fastcall virtual ~TRzPaletteSep_Shell(void) { }
	
};


class DELPHICLASS TRzPaletteSep_Widgets;
class PASCALIMPLEMENTATION TRzPaletteSep_Widgets : public TRzPaletteSep
{
	typedef TRzPaletteSep inherited;
	
public:
	/* TRzPaletteSep.Create */ inline __fastcall virtual TRzPaletteSep_Widgets(Classes::TComponent* AOwner) : TRzPaletteSep(AOwner) { }
	
public:
	/* TComponent.Destroy */ inline __fastcall virtual ~TRzPaletteSep_Widgets(void) { }
	
};


//-- var, const, procedure ---------------------------------------------------
#define ppRaizePanels L"Raize Panels"
#define ppRaizeEdits L"Raize Edits"
#define ppRaizeLists L"Raize Lists"
#define ppRaizeButtons L"Raize Buttons"
#define ppRaizeDisplay L"Raize Display"
#define ppRaizeShell L"Raize Shell"
#define ppRaizeWidgets L"Raize Widgets"
#define RC_SettingsKey L"Software\\Raize\\Raize Components\\5.0"
#define RegisterSection L"Register"
extern PACKAGE System::ResourceString _sRzCustomFramingCategoryName;
#define Rzdesigneditors_sRzCustomFramingCategoryName System::LoadResourceString(&Rzdesigneditors::_sRzCustomFramingCategoryName)
extern PACKAGE System::ResourceString _sRzHotSpotCategoryName;
#define Rzdesigneditors_sRzHotSpotCategoryName System::LoadResourceString(&Rzdesigneditors::_sRzHotSpotCategoryName)
extern PACKAGE System::ResourceString _sRzBorderStyleCategoryName;
#define Rzdesigneditors_sRzBorderStyleCategoryName System::LoadResourceString(&Rzdesigneditors::_sRzBorderStyleCategoryName)
extern PACKAGE System::ResourceString _sRzCustomGlyphsCategoryName;
#define Rzdesigneditors_sRzCustomGlyphsCategoryName System::LoadResourceString(&Rzdesigneditors::_sRzCustomGlyphsCategoryName)
extern PACKAGE System::ResourceString _sRzTextStyleCategoryName;
#define Rzdesigneditors_sRzTextStyleCategoryName System::LoadResourceString(&Rzdesigneditors::_sRzTextStyleCategoryName)
extern PACKAGE System::ResourceString _sRzTrackStyleCategoryName;
#define Rzdesigneditors_sRzTrackStyleCategoryName System::LoadResourceString(&Rzdesigneditors::_sRzTrackStyleCategoryName)
extern PACKAGE System::ResourceString _sRzPrimaryButtonCategoryName;
#define Rzdesigneditors_sRzPrimaryButtonCategoryName System::LoadResourceString(&Rzdesigneditors::_sRzPrimaryButtonCategoryName)
extern PACKAGE System::ResourceString _sRzAlternateButtonCategoryName;
#define Rzdesigneditors_sRzAlternateButtonCategoryName System::LoadResourceString(&Rzdesigneditors::_sRzAlternateButtonCategoryName)
extern PACKAGE System::ResourceString _sRzSplitterCategoryName;
#define Rzdesigneditors_sRzSplitterCategoryName System::LoadResourceString(&Rzdesigneditors::_sRzSplitterCategoryName)
extern PACKAGE System::UnicodeString __fastcall UniqueName(Classes::TComponent* AComponent);
extern PACKAGE void __fastcall CreateVisualStyleMenuItem(Menus::TMenuItem* Item, Rzcommon::TRzVisualStyle VisualStyle, Rzcommon::TRzVisualStyle CurrentVisualStyle, Classes::TNotifyEvent EventHandler);
extern PACKAGE void __fastcall CreateGradientColorStyleMenuItem(Menus::TMenuItem* Item, Rzcommon::TRzGradientColorStyle GradientColorStyle, Rzcommon::TRzGradientColorStyle CurrentGradientColorStyle, Classes::TNotifyEvent EventHandler);
extern PACKAGE void __fastcall CreateGroupStyleMenuItem(Menus::TMenuItem* Item, Rzpanel::TRzGroupBoxStyle GroupStyle, Rzpanel::TRzGroupBoxStyle CurrentGroupStyle, Classes::TNotifyEvent EventHandler);

}	/* namespace Rzdesigneditors */
using namespace Rzdesigneditors;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// RzdesigneditorsHPP
