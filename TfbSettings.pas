unit TfbSettings;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, FBPlugin_TLB, FBPlugin_IMPL, StdVcl,
  OutlookXP, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxLayoutControl, cxContainer, cxEdit,
  dxLayoutcxEditAdapters, cxTextEdit, Menus, cxButtons, cxMaskEdit,
  cxDropDownEdit, cxImageComboBox, cxLabel, cxRadioGroup, dxGDIPlusClasses,
  ExtCtrls, dxLayoutLookAndFeels, XPMan, dxSkinsCore, dxSkinFoggy,
  dxSkinscxPCPainter;

type
  TTfbSettings = class(TActiveForm, ITfbSettings, PropertyPage)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutControl1Group1: TdxLayoutGroup;
    dxLayoutControl1Group2: TdxLayoutGroup;
    dxLayoutControl1Group3: TdxLayoutGroup;
    teAPIUrl: TcxTextEdit;
    dxLayoutControl1Item1: TdxLayoutItem;
    tePassword: TcxTextEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    teUsername: TcxTextEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    dxLayoutControl1Item4: TdxLayoutItem;
    teToken: TcxTextEdit;
    dxLayoutControl1Item5: TdxLayoutItem;
    dxLayoutControl1LabeledItem2: TdxLayoutLabeledItem;
    cxLabel1: TcxLabel;
    dxLayoutControl1Item6: TdxLayoutItem;
    rbProjectLast: TcxRadioButton;
    rbProjectDetect: TcxRadioButton;
    dxLayoutGroup4: TdxLayoutGroup;
    dxLayoutControl2Item2: TdxLayoutItem;
    dxLayoutControl2Item3: TdxLayoutItem;
    dxLayoutControl1Group4: TdxLayoutGroup;
    dxLayoutControl1Group5: TdxLayoutGroup;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutOfficeLookAndFeel1: TdxLayoutOfficeLookAndFeel;
    Image2: TImage;
    dxLayoutControl1Item8: TdxLayoutItem;
    Image3: TImage;
    dxLayoutControl1Item9: TdxLayoutItem;
    dxLayoutControl1Group8: TdxLayoutGroup;
    dxLayoutControl1Group7: TdxLayoutGroup;
    Image1: TImage;
    dxLayoutControl1Item7: TdxLayoutItem;
    dxLayoutControl1Group9: TdxLayoutGroup;
    bGetToken: TButton;
    procedure ActiveFormCreate(Sender: TObject);
    procedure bGetTokenClick(Sender: TObject);
    procedure SetDirty(Sender: TObject);
  private
    FDirty: WordBool;
    FPropertyPageSite: PropertyPageSite;
    FEvents: ITfbSettingsEvents;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure PaintEvent(Sender: TObject);
  protected
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function Get_Active: WordBool; safecall;
    function Get_AutoScroll: WordBool; safecall;
    function Get_AutoSize: WordBool; safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    function Get_Caption: WideString; safecall;
    function Get_Color: Integer; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_HelpFile: WideString; safecall;
    function Get_KeyPreview: WordBool; safecall;
    function Get_PixelsPerInch: Integer; safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    function Get_Scaled: WordBool; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    procedure Set_Color(Value: Integer); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    { Outlook PropertyPage }
    function GetPageInfo(var HelpFile: WideString; var HelpContext: Integer): HResult; stdcall;
    function Get_Dirty(out Dirty: WordBool): HResult; stdcall;
    function Apply: HResult; stdcall;
  public
    procedure Initialize; override;
    destructor Destroy; override;
    procedure GetPropertyPageSite;
    procedure UpdatePropertyPageSite;
  end;

implementation

uses
  ComObj, ComServ, Settings, uFBApi;

{$R *.DFM}

{ TTfbSettings }

procedure TTfbSettings.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_TfbSettings); }
end;

procedure TTfbSettings.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ITfbSettingsEvents;
end;

procedure TTfbSettings.Initialize;
begin
  inherited Initialize;
  OnActivate := ActivateEvent;
  OnClick := ClickEvent;
  OnCreate := CreateEvent;
  OnDblClick := DblClickEvent;
  OnDeactivate := DeactivateEvent;
  OnDestroy := DestroyEvent;
  OnKeyPress := KeyPressEvent;
  OnPaint := PaintEvent;
end;

function TTfbSettings.Get_Active: WordBool;
begin
  Result := Active;
end;

function TTfbSettings.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TTfbSettings.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TTfbSettings.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TTfbSettings.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TTfbSettings.Get_Color: Integer;
begin
  Result := Integer(Color);
end;

function TTfbSettings.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TTfbSettings.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TTfbSettings.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TTfbSettings.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TTfbSettings.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TTfbSettings.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TTfbSettings.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TTfbSettings.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TTfbSettings.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TTfbSettings.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TTfbSettings.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TTfbSettings.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TTfbSettings.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TTfbSettings.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TTfbSettings.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TTfbSettings.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TTfbSettings.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TTfbSettings.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TTfbSettings.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TTfbSettings.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TTfbSettings.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TTfbSettings.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TTfbSettings.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TTfbSettings.Set_Color(Value: Integer);
begin
  Color := TColor(Value);
end;

procedure TTfbSettings.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TTfbSettings.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TTfbSettings.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TTfbSettings.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TTfbSettings.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TTfbSettings.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TTfbSettings.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TTfbSettings.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TTfbSettings.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TTfbSettings.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TTfbSettings.SetDirty(Sender: TObject);
begin
  GetPropertyPageSite;
  UpdatePropertyPageSite;
end;

destructor TTfbSettings.Destroy;
var
  ParkingHandle: HWND;
begin
  ParkingHandle := FindWindowEx(0, 0, 'DAXParkingWindow', nil);
  if ParkingHandle <> 0 then
    SendMessage(ParkingHandle, WM_CLOSE, 0, 0);
  inherited Destroy;
end;

{ Outlook PropertyPage }

function TTfbSettings.GetPageInfo(var HelpFile: WideString;
  var HelpContext: Integer): HResult;
begin
  HelpFile := '';
  HelpContext := 0;
  Result := S_OK;
end;

function TTfbSettings.Get_Dirty(out Dirty: WordBool): HResult;
begin
  Dirty := FDirty;
  Result := S_OK;
end;

procedure TTfbSettings.ActiveFormCreate(Sender: TObject);
begin
  teAPIUrl.Text := GetAppSetting(SET_SERVICE_URL);
  teUsername.Text := GetAppSetting(SET_SERVICE_USERNAME);
  tePassword.Text := GetAppSetting(SET_SERVICE_PASSWORD);
  teToken.Text := GetAppSetting(SET_SERVICE_TOKEN);
  rbProjectLast.Checked := not GetAppSettingAsBool(SET_DEF_PROJECT_DETECT);
  rbProjectDetect.Checked := GetAppSettingAsBool(SET_DEF_PROJECT_DETECT);
end;

function TTfbSettings.Apply: HResult;
begin
  SetAppSetting(SET_SERVICE_URL, teAPIUrl.Text);
  SetAppSetting(SET_SERVICE_PASSWORD, tePassword.Text);
  SetAppSetting(SET_SERVICE_USERNAME, teUsername.Text);
  SetAppSetting(SET_SERVICE_TOKEN, teToken.Text);
  SetAppSetting(SET_DEF_PROJECT_DETECT, rbProjectDetect.Checked);
  FDirty := False;
  Result := S_OK;
end;

procedure TTfbSettings.bGetTokenClick(Sender: TObject);
var
  FBapi: TfbApi;
begin
  FBApi := tfbapi.Create;
  try
    FBApi.ApiUrl := FBapi.UserApiToApiUrl(teAPIUrl.Text);
    teAPIUrl.Text := fbapi.ApiUrl;
    teToken.Text := FBapi.Login(teUsername.Text, tePassword.Text);
  finally
    FBApi.Free;
  end;
end;

procedure TTfbSettings.GetPropertyPageSite;
begin
  if FPropertyPageSite = nil then
    if Assigned(ActiveFormControl) then
      if Assigned(ActiveFormControl.ClientSite) then
        ActiveFormControl.ClientSite.QueryInterface(IID_PropertyPageSite, FPropertyPageSite);
end;

procedure TTfbSettings.UpdatePropertyPageSite;
begin
  if Assigned(FPropertyPageSite) and not FDirty then
  begin
    FDirty := True;
    FPropertyPageSite.OnStatusChange;
  end;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TTfbSettings,
    Class_TfbSettings,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.
