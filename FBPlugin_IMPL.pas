unit FBPlugin_IMPL;

interface

uses
  SysUtils, ComObj, ComServ, ActiveX, Variants, Office2000, adxAddIn, FBPlugin_TLB,
  Outlook2000, Classes, StdVcl, ufbApi;

type
  TTfbPlugin = class(TadxAddin, ITfbPlugin)
  end;

  TAddInModule = class(TadxCOMAddInModule)
    rtOutlookMail: TadxRibbonTab;
    cmMail: TadxContextMenu;
    cbOutlook: TadxOlExplorerCommandBar;
    procedure adxCOMAddInModuleAddInInitialize(Sender: TObject);
    procedure adxCOMAddInModuleAddInFinalize(Sender: TObject);
    procedure rtOutlookControls0Controls0Click(Sender: TObject; const RibbonControl: IRibbonControl);
    procedure cmMailControls0Click(Sender: TObject);
    procedure cbOutlookControls0Click(Sender: TObject);
    procedure cbOutlookControls1Click(Sender: TObject);
  private
    FFBApi: TfbApi;
  protected
    procedure CreateCaseFromMessage;
    procedure WorkOnCase;
    procedure OptionsPagesAdd(ASender: TObject; const Pages: PropertyPages); override;
    function GetMailItem: _MailItem;
    property MailItem: _MailItem read GetMailItem;
  public
    function FBApi: TfbApi;
  end;

var
  adxTfbPlugin: TAddInModule;

implementation

uses
  ffbCase, Dialogs, uMapiFunctions, searchResult;

{$R *.dfm}

function TAddInModule.GetMailItem: _MailItem;
begin
  Result := nil;
  try
    if (OutlookApp.ActiveWindow <> nil) and (OleVariant(OutlookApp.ActiveWindow).Class = olExplorer) then
    begin
      if (OutlookApp.ActiveExplorer <> nil) and
      Assigned(OutlookApp.ActiveExplorer.Selection) and
      (OutlookApp.ActiveExplorer.Selection.Count > 0) and
      OleVariant(OutlookApp.ActiveExplorer.Selection.Item(1)).Class = olMail then
        OutlookApp.ActiveExplorer.Selection.Item(1).QueryInterface(IID__MailItem, Result);
    end
    else
      if (OutlookApp.ActiveInspector <> nil) and
      Assigned(OutlookApp.ActiveInspector.CurrentItem) and
      OleVariant(OutlookApp.ActiveInspector.CurrentItem).Class = olMail then
        Result := _MailItem(OutlookApp.ActiveInspector.CurrentItem);
  except
    Result := nil;
  end;
end;

procedure TAddInModule.adxCOMAddInModuleAddInInitialize(Sender: TObject);
begin
  adxTfbPlugin := Self;
end;

procedure TAddInModule.cbOutlookControls0Click(Sender: TObject);
begin
  CreateCaseFromMessage;
end;

procedure TAddInModule.cbOutlookControls1Click(Sender: TObject);
begin
  WorkOnCase;
end;

procedure TAddInModule.cmMailControls0Click(Sender: TObject);
begin
  CreateCaseFromMessage;
end;

procedure TAddInModule.CreateCaseFromMessage;
var
  MI: _MailItem;
  NewCase: TFBCase;
begin
  MI := MailItem;
  if not Assigned(MI) then
  begin
    MessageDlg('No mail item selected', mtError, [mbOk], 0);
    EXIT;
  end;

  NewCase := TfbCase.Create(Self);
  try
    NewCase.teTitle.Text := MI.Subject;
    NewCase.CustomerName := MI.SenderName;
    NewCase.CustomerEmail := GetSenderAddressViaMAPI(MI);
    NewCase.mCase.Lines.Text := MI.Body;
    NewCase.ShowModal;
  finally
    NewCase.Free;
  end;
end;

function TAddInModule.FBApi: TfbApi;
begin
  if not Assigned(FFBApi) then
  begin
    FFBApi := TfbApi.Create;
//    FFBApi.WaitStartEvent := OnStartWait;
//    FFBApi.WaitStopEvent := OnStopWait;
  end;
  Result := FFBApi;
end;

procedure TAddInModule.adxCOMAddInModuleAddInFinalize(Sender: TObject);
begin
  adxTfbPlugin := nil;
end;

procedure TAddInModule.OptionsPagesAdd(ASender: TObject; const Pages: PropertyPages);
begin
  Pages.Add('FBPlugin.TfbSettings', 'FogBugz API');
end;

procedure TAddInModule.rtOutlookControls0Controls0Click(Sender: TObject; const RibbonControl: IRibbonControl);
begin
  CreateCaseFromMessage;
end;

procedure TAddInModule.WorkOnCase;
var
  sCase: string;
  iCase: Integer;
  NewApp: AppointmentItem;
  MyCases: IXMLCasesType;
  MyCase: IXMLCaseType;
begin
  iCase := -1;
  while iCase < 0 do
  begin
    sCase := InputBox('Work on case', 'Case nr. ', '');
    if sCase = '' then sCase := '-1';
    TryStrToInt(sCase, iCase);
    if iCase = -1 then
      EXIT;
  end;

  MyCases := FBApi.Search('ixBug:' + IntToStr(iCase), []);
  if MyCases.Count = 1 then
  begin
    NewApp := AppointmentItem(OutlookApp.CreateItem(olAppointmentItem));
    NewApp.Subject := '';
    MyCase := MyCases[0];
    NewApp.Subject := MyCase.STitle;
    NewApp.Start := Now;
    NewApp.End_ := Now + (MyCase.HrsCurrEst - MyCase.HrsElapsed) / HoursPerDay;
    NewApp.Categories := 'FogBugz';
    NewApp.Body := Format('%s?%s', [FBApi.ServerUrl, IntToStr(iCase)]);
    NewApp.Display(True);
  end
  else
  begin
    MessageDlg('Could not find this case. Try another number.', mtError, [mbOk], 0);
  end;
end;

initialization
  TadxFactory.Create(ComServer, TTfbPlugin, CLASS_TfbPlugin, TAddInModule);

end.
