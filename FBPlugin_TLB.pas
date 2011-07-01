unit FBPlugin_TLB;

// ************************************************************************ //
// WARNING
// -------
// The types declared in this file were generated from data read from a
// Type Library. If this type library is explicitly or indirectly (via
// another type library referring to this type library) re-imported, or the
// 'Refresh' command of the Type Library Editor activated while editing the
// Type Library, the contents of this file will be regenerated and all
// manual modifications will be lost.
// ************************************************************************ //

// $Rev: 17244 $
// File generated on 9-2-2010 12:23:09 from Type Library described below.

// ************************************************************************  //
// Type Lib: H:\svn\fogbugzplugin\FBPlugin (1)
// LIBID: {DB3D1837-40E4-4366-A68C-EE9F3DADBF87}
// LCID: 0
// Helpfile:
// HelpString: FBPlugin Library
// DepndLst:
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers.
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}
interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, OleServer, StdVCL, Variants;



// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:
//   Type Libraries     : LIBID_xxxx
//   CoClasses          : CLASS_xxxx
//   DISPInterfaces     : DIID_xxxx
//   Non-DISP interfaces: IID_xxxx
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  FBPluginMajorVersion = 1;
  FBPluginMinorVersion = 0;

  LIBID_FBPlugin: TGUID = '{DB3D1837-40E4-4366-A68C-EE9F3DADBF87}';

  IID_ITFBPlugin: TGUID = '{D9F0E3EE-1CD8-4DC8-95A4-80E989E270D8}';
  CLASS_TFBPlugin: TGUID = '{39851C8F-6F31-4DF3-99F0-ABBF09A2F763}';
  IID_ITFBSettings: TGUID = '{9C96241B-633B-4826-AECA-23569726EE62}';
  DIID_ITFBSettingsEvents: TGUID = '{94E7520D-9216-4E11-91E0-5A0922EB4718}';
  CLASS_TFBSettings: TGUID = '{2D064735-680A-4A97-A3AF-F465E7EAE0C3}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library
// *********************************************************************//
// Constants for enum TxActiveFormBorderStyle
type
  TxActiveFormBorderStyle = TOleEnum;
const
  afbNone = $00000000;
  afbSingle = $00000001;
  afbSunken = $00000002;
  afbRaised = $00000003;

// Constants for enum TxPrintScale
type
  TxPrintScale = TOleEnum;
const
  poNone = $00000000;
  poProportional = $00000001;
  poPrintToFit = $00000002;

// Constants for enum TxMouseButton
type
  TxMouseButton = TOleEnum;
const
  mbLeft = $00000000;
  mbRight = $00000001;
  mbMiddle = $00000002;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary
// *********************************************************************//
  ITFBPlugin = interface;
  ITFBPluginDisp = dispinterface;
  ITFBSettings = interface;
  ITFBSettingsDisp = dispinterface;
  ITFBSettingsEvents = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  TFBPlugin = ITFBPlugin;
  TFBSettings = ITFBSettings;


// *********************************************************************//
// Interface: ITFBPlugin
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D9F0E3EE-1CD8-4DC8-95A4-80E989E270D8}
// *********************************************************************//
  ITFBPlugin = interface(IDispatch)
    ['{D9F0E3EE-1CD8-4DC8-95A4-80E989E270D8}']
  end;

// *********************************************************************//
// DispIntf:  ITFBPluginDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D9F0E3EE-1CD8-4DC8-95A4-80E989E270D8}
// *********************************************************************//
  ITFBPluginDisp = dispinterface
    ['{D9F0E3EE-1CD8-4DC8-95A4-80E989E270D8}']
  end;

// *********************************************************************//
// Interface: ITFBSettings
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {9C96241B-633B-4826-AECA-23569726EE62}
// *********************************************************************//
  ITFBSettings = interface(IDispatch)
    ['{9C96241B-633B-4826-AECA-23569726EE62}']
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_AutoScroll: WordBool; safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    function Get_AutoSize: WordBool; safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function Get_Color: Integer; safecall;
    procedure Set_Color(Value: Integer); safecall;
    function Get_KeyPreview: WordBool; safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    function Get_PixelsPerInch: Integer; safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    function Get_Scaled: WordBool; safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    function Get_Active: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    function Get_HelpFile: WideString; safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property AutoScroll: WordBool read Get_AutoScroll write Set_AutoScroll;
    property AutoSize: WordBool read Get_AutoSize write Set_AutoSize;
    property AxBorderStyle: TxActiveFormBorderStyle read Get_AxBorderStyle write Set_AxBorderStyle;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Color: Integer read Get_Color write Set_Color;
    property KeyPreview: WordBool read Get_KeyPreview write Set_KeyPreview;
    property PixelsPerInch: Integer read Get_PixelsPerInch write Set_PixelsPerInch;
    property PrintScale: TxPrintScale read Get_PrintScale write Set_PrintScale;
    property Scaled: WordBool read Get_Scaled write Set_Scaled;
    property Active: WordBool read Get_Active;
    property DropTarget: WordBool read Get_DropTarget write Set_DropTarget;
    property HelpFile: WideString read Get_HelpFile write Set_HelpFile;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property VisibleDockClientCount: Integer read Get_VisibleDockClientCount;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  ITFBSettingsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {9C96241B-633B-4826-AECA-23569726EE62}
// *********************************************************************//
  ITFBSettingsDisp = dispinterface
    ['{9C96241B-633B-4826-AECA-23569726EE62}']
    property Visible: WordBool dispid 1;
    property AutoScroll: WordBool dispid 2;
    property AutoSize: WordBool dispid 3;
    property AxBorderStyle: TxActiveFormBorderStyle dispid 4;
    property Caption: WideString dispid -518;
    property Color: Integer dispid 5;
    property KeyPreview: WordBool dispid 6;
    property PixelsPerInch: Integer dispid 7;
    property PrintScale: TxPrintScale dispid 8;
    property Scaled: WordBool dispid 9;
    property Active: WordBool readonly dispid 10;
    property DropTarget: WordBool dispid 11;
    property HelpFile: WideString dispid 12;
    property DoubleBuffered: WordBool dispid 13;
    property VisibleDockClientCount: Integer readonly dispid 14;
    property Enabled: WordBool dispid -514;
    property Cursor: Smallint dispid 15;
  end;

// *********************************************************************//
// DispIntf:  ITFBSettingsEvents
// Flags:     (0)
// GUID:      {94E7520D-9216-4E11-91E0-5A0922EB4718}
// *********************************************************************//
  ITFBSettingsEvents = dispinterface
    ['{94E7520D-9216-4E11-91E0-5A0922EB4718}']
    procedure OnActivate; dispid 1;
    procedure OnClick; dispid 2;
    procedure OnCreate; dispid 3;
    procedure OnDblClick; dispid 5;
    procedure OnDestroy; dispid 6;
    procedure OnDeactivate; dispid 7;
    procedure OnKeyPress(var Key: Smallint); dispid 11;
    procedure OnPaint; dispid 16;
  end;

// *********************************************************************//
// The Class CoTFBPlugin provides a Create and CreateRemote method to
// create instances of the default interface ITFBPlugin exposed by
// the CoClass TFBPlugin. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoTFBPlugin = class
    class function Create: ITFBPlugin;
    class function CreateRemote(const MachineName: string): ITFBPlugin;
  end;

implementation

uses ComObj;

class function CoTFBPlugin.Create: ITFBPlugin;
begin
  Result := CreateComObject(CLASS_TFBPlugin) as ITFBPlugin;
end;

class function CoTFBPlugin.CreateRemote(const MachineName: string): ITFBPlugin;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TFBPlugin) as ITFBPlugin;
end;

end.

