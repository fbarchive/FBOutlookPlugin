unit ffbCase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufbAPI, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Menus, StdCtrls, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxImageComboBox,
  dxLayoutcxEditAdapters, dxLayoutControl, cxMemo, dxLayoutLookAndFeels, ImgList,
  cxCalendar, cxSpinEdit, cxTimeEdit, cxLabel, ExtCtrls, cxClasses,
  dxGDIPlusClasses, dxSkinsCore, dxSkinFoggy, dxSkinsForm, dxGDIPlusApi,
  cxHyperLinkEdit, IdBaseComponent, IdComponent, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, ComCtrls, dxSkinsdxStatusBarPainter,
  dxStatusBar, searchResult, viewArea, dxSkinscxPCPainter;

type
  TFBCase = class(TForm)
    ilCategories: TcxImageList;
    ilPriorities: TcxImageList;
    ilPersons: TcxImageList;
    teTitle: TcxTextEdit;
    icbProject: TcxImageComboBox;
    icbArea: TcxImageComboBox;
    icbFixFor: TcxImageComboBox;
    icbCategories: TcxImageComboBox;
    icbPeople: TcxImageComboBox;
    icbStatus: TcxImageComboBox;
    Image2: TImage;
    icbPriorities: TcxImageComboBox;
    deDue: TcxDateEdit;
    teDue: TcxTimeEdit;
    seEstimate: TcxSpinEdit;
    mCase: TcxMemo;
    teCustomerName: TcxTextEdit;
    teCustomerEmail: TcxTextEdit;
    bSettings: TcxButton;
    bCancel: TcxButton;
    bNewCase: TcxButton;
    LCGroup_Root: TdxLayoutGroup;
    LC: TdxLayoutControl;
    LCGroup1: TdxLayoutGroup;
    LCItem1: TdxLayoutItem;
    LCItem2: TdxLayoutItem;
    LCItem3: TdxLayoutItem;
    LCItem4: TdxLayoutItem;
    LCItem5: TdxLayoutItem;
    LCItem6: TdxLayoutItem;
    LCItem7: TdxLayoutItem;
    LCItem8: TdxLayoutItem;
    LCItem9: TdxLayoutItem;
    LCItem10: TdxLayoutItem;
    LCItem11: TdxLayoutItem;
    LCGroup6: TdxLayoutGroup;
    LCItem12: TdxLayoutItem;
    LCItem13: TdxLayoutItem;
    LCItem14: TdxLayoutItem;
    LCGroup7: TdxLayoutGroup;
    LCItem15: TdxLayoutItem;
    LCItem16: TdxLayoutItem;
    LCItem17: TdxLayoutItem;
    LCItem18: TdxLayoutItem;
    LCGroup2: TdxLayoutGroup;
    LCGroup8: TdxLayoutGroup;
    LCGroup9: TdxLayoutGroup;
    LCGroup10: TdxLayoutGroup;
    LCGroup3: TdxLayoutGroup;
    llafFB: TdxLayoutLookAndFeelList;
    lafSkin: TdxLayoutSkinLookAndFeel;
    scFB: TdxSkinController;
    lDateTime: TcxLabel;
    LCItem19: TdxLayoutItem;
    lOpenedBy: TcxLabel;
    LCItem20: TdxLayoutItem;
    LCGroup4: TdxLayoutGroup;
    LCGroup5: TdxLayoutGroup;
    LCGroup11: TdxLayoutGroup;
    Priority: TdxLayoutGroup;
    LCGroup12: TdxLayoutGroup;
    LCGroup13: TdxLayoutGroup;
    lcgCorrespondent: TdxLayoutGroup;
    l2: TcxLabel;
    LCItem21: TdxLayoutItem;
    l1: TcxLabel;
    LCItem22: TdxLayoutItem;
    l3: TcxLabel;
    LCItem23: TdxLayoutItem;
    LCGroup15: TdxLayoutGroup;
    LCGroup16: TdxLayoutGroup;
    LCSpaceItem1: TdxLayoutEmptySpaceItem;
    sbWait: TdxStatusBar;
    lBullets: TcxImageList;
    tInit: TTimer;
    teExistingCaseID: TcxTextEdit;
    LCItem24: TdxLayoutItem;
    LCGroup17: TdxLayoutGroup;
    procedure bNewCaseClick(Sender: TObject);
    procedure icbProjectPropertiesChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
    procedure teCustomerEmailExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure icbAreaPropertiesChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tInitTimer(Sender: TObject);
    procedure teExistingCaseIDPropertiesChange(Sender: TObject);
    procedure bDonateClick(Sender: TObject);
    procedure bSettingsClick(Sender: TObject);
  private
    FFBApi: TfbApi;
    FInitialized: Boolean;
    FOrigCaption: string;
    FLastDefaultAssignedProject: Integer;
    FDefCursor: TCursor;
    function FBApi: TfbApi;
    procedure SetupicbProject;
    procedure SetupicbPeople;
    procedure SetupicpPriorities;
    procedure SetupicbFixfor;
    procedure SetupicbArea;
    procedure SetupicbStatus;
    procedure SetupicbCategories;
    procedure SetDefaultAssignedToProject;
    procedure SetDefaultAssignedToArea;
    procedure InitForm;
    procedure MarkCorrespondentProject;
    procedure MarkCorrespondentArea;
    function ValidateForm: boolean;
    procedure OnStartWait(Sender: TObject);
    procedure OnStopWait(Sender: TObject);
    function ShowConfirmation(CaseID: integer; NewCase: Boolean = True): Boolean;
    function GetNameFromEmail(Email: string): string;
    function GetMailFromEmail(Email: string): string;
    function GetCustomerName: string;
    procedure SetCustomerName(const Value: string);
    function GetCustomerEmail: string;
    procedure SetCustomerEmail(const Value: string);
  public
    constructor Create(AOwer: TComponent);override;
    property CustomerName: string read GetCustomerName write SetCustomerName;
    property CustomerEmail: string read GetCustomerEmail write SetCustomerEmail;
  end;

var
  FBCase: TFBCase;

implementation

uses
  listProjects, listAreas, listFixFors, listPeople, listCategories,
  listPriorities, listMailboxes, dateutils, viewProject, listStatuses,
  Settings, fCaseCreated, strutils, shellapi, fDonate;

{$R *.dfm}

procedure TFBCase.icbAreaPropertiesChange(Sender: TObject);
begin
 SetDefaultAssignedToArea;
end;

procedure TFBCase.icbProjectPropertiesChange(Sender: TObject);
begin
  SetDefaultAssignedToProject;
  SetupicbArea;
  MarkCorrespondentArea;
  SetupicbFixfor;
end;

procedure TFBCase.InitForm;
var
  sUser: string;
begin
  if not FInitialized then
  try
    LockWindowUpdate(Handle);
    sUser := FBApi.DefaultUser.SFullName;
    lOpenedBy.Caption := Format('Opened by %s', [sUser]);
    lDateTime.Caption := Format('%s (Today) %s', [DateToStr(Now), TimeToStr(Now)]);
    SetupicbPeople;
    SetupicbProject;
    SetupicpPriorities;
    SetupicbCategories;
    SetupicbStatus;
    MarkCorrespondentProject;
    MarkCorrespondentArea;
    FInitialized := True;
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TFBCase.OnStartWait(Sender: TObject);
begin
  FDefCursor := Cursor;
  Screen.Cursor := crHourGlass;
  Caption := FOrigCaption + ' - please wait... communicating with server';
  sbWait.Panels[0].Text := 'please wait... communicating with server';
  sbWait.Repaint;
end;

procedure TFBCase.OnStopWait(Sender: TObject);
begin
  Caption := FOrigCaption;
  sbWait.Panels[0].Text := 'Ready...';
  sbWait.Repaint;
  Screen.Cursor := FDefCursor;
end;

procedure TFBCase.bCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TFBCase.bNewCaseClick(Sender: TObject);
var
  iNewCase: Integer;
begin
  if ValidateForm then
  try
    if (teExistingCaseID.Text <> '') then
    begin
      iNewCase := FBApi.EditCase(teExistingCaseID.Text, teTitle.Text, icbProject.EditValue, icbArea.EditValue, icbFixFor.EditValue, icbCategories.EditValue, icbPeople.EditValue, icbPriorities.EditValue, teCustomerName.Text + ' <' + teCustomerEmail.Text + '>', FBApi.DefaultMailboxID, mCase.Lines.Text, Trunc(deDue.Date) + teDue.Time, seEstimate.Value);
      ShowConfirmation(iNewCase, False);
    end
    else
    begin
      iNewCase := FBApi.NewCase(teTitle.Text, icbProject.EditValue, icbArea.EditValue, icbFixFor.EditValue, icbCategories.EditValue, icbPeople.EditValue, icbPriorities.EditValue, teCustomerName.Text + ' <' + teCustomerEmail.Text + '>', FBApi.DefaultMailboxID, mCase.Lines.Text, Trunc(deDue.Date) + teDue.Time, seEstimate.Value);
      ShowConfirmation(iNewCase, True);
    end;
    ModalResult := mrOk
  except
    ShowMessage('The case has not been created!');
    ModalResult := mrNone;
  end;
end;

procedure TFBCase.bSettingsClick(Sender: TObject);
begin
  ShowMessage('See your Outlook settings for the FogBugz plugin settings tab.');
end;

constructor TFBCase.Create(AOwer: TComponent);
begin
  inherited;
  FOrigCaption := Caption;
  FInitialized := False;
  FLastDefaultAssignedProject := -1;
  teTitle.Style.Font.Size := 12;
  teTitle.Style.Font.Style := [fsBold];
  lOpenedBy.Style.Font.Style := [fsBold];
  mCase.Style.Font.Name := 'Courier new';
  l1.Style.Font.Style := [fsBold];
  l2.Style.Font.Style := [fsBold];
  l3.Style.Font.Style := [fsBold];
end;

function TFBCase.FBApi: TfbApi;
begin
  if not Assigned(FFBApi) then
  begin
    FFBApi := TfbApi.Create;
    FFBApi.WaitStartEvent := OnStartWait;
    FFBApi.WaitStopEvent := OnStopWait;
  end;
  Result := FFBApi;
end;

procedure TFBCase.FormActivate(Sender: TObject);
begin
  teTitle.SetFocus;
end;

procedure TFBCase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
// Save form settings
  if not VarIsNull(icbproject.EditValue) then
    SetAppSetting(SET_LAST_PROJECT_ID, Integer(icbProject.EditValue));
end;

procedure TFBCase.FormDestroy(Sender: TObject);
begin
  if Assigned(FFBApi) then
    ffbapi.Free;
  Inherited;
end;

function TFBCase.GetCustomerEmail: string;
begin
  Result := teCustomerEmail.Text;
end;

function TFBCase.GetCustomerName: string;
begin
  Result := teCustomerName.Text;
end;

function TFBCase.GetMailFromEmail(Email: string): string;
var
  iPos: Integer;
begin
  iPos := Pos('<', Email);
  if iPos > 0 then
  begin
    Result := Trim(RightStr(Email, Length(Email) - iPos + 1));
    Result := ReplaceStr(Result, '<', '');
    Result := ReplaceStr(Result, '>', '');
  end
  else
    Result := Email;
end;

function TFBCase.GetNameFromEmail(Email: string): string;
var
  iPos: Integer;
begin
  iPos := Pos('<', Email);
  if iPos > 0 then
    Result := Trim(LeftStr(Email, iPos - 1))
  else
    Result := Email;
end;

procedure TFBCase.SetupicbCategories;
var
  Categories: IXMLCategoriesType;
  I: Integer;
begin
  Categories := FBApi.Categories;
  icbCategories.Properties.Items.Clear;
  for I := 0 to Categories.Count - 1 do
    with icbCategories.Properties.Items.Add do
    begin
      Value := Categories[i].IxCategory;
      Description := Categories[i].SCategory;
      ImageIndex := Value - 1;
    end;
  icbCategories.EditValue := 1;
end;

procedure TFBCase.SetupicbArea;
var
  Areas: IXMLAreasType;
  I: Integer;
  iDefaultArea: Integer;
begin
  Areas := FBApi.Areas(False, icbProject.EditValue);
  icbArea.Properties.Items.Clear;
  iDefaultArea := StrtoInt(Areas[0].IxArea);
  for I := 0 to Areas.Count - 1 do
    with icbArea.Properties.Items.Add do
    begin
      Value := Areas[i].IxArea;
      Description := Areas[i].SArea;
      ImageIndex := 0;
    end;
  icbArea.EditValue := iDefaultArea;
end;

procedure TFBCase.SetupicbFixfor;
var
  FixFors: IXMLFixforsType;
  I: Integer;
  iDefault: Integer;
begin
  FixFors := FBApi.FixFors(False, icbProject.EditValue);
  icbFixFor.Properties.Items.Clear;
  iDefault := StrtoInt(FixFors[0].IxFixFor);
  for I := 0 to FixFors.Count - 1 do
    with icbFixFor.Properties.Items.Add do
    begin
      Value := FixFors[i].IxFixFor;
      Description := FixFors[i].SFixFor;
    end;
  icbFixFor.EditValue := iDefault;
end;

procedure TFBCase.MarkCorrespondentArea;
var
  MyCases: IXMLCasesType;
  iCase: Integer;
  iItem: Integer;
  MyItem: TcxImageComboBoxItem;
begin
  if teCustomerEmail.Text <> '' then
  begin
    MyCases := FBApi.Search('Correspondent:"' + teCustomerEmail.Text + '"', [ixArea]);
    // Reset icons
    for iItem := 0 to icbArea.Properties.Items.Count - 1 do
      icbArea.Properties.Items[iItem].ImageIndex := 0;

    for iCase := 0 to MyCases.Count - 1 do
    begin
      // Change Area icon
      MyItem := icbArea.Properties.FindItemByValue(MyCases[iCase].IxArea);
      if Assigned(MyItem) then
        MyItem.ImageIndex := 1;
    end;
  end;
end;

procedure TFBCase.MarkCorrespondentProject;
var
  MyCases: IXMLCasesType;
  iCase: Integer;
  iItem: Integer;
  MyItem: TcxImageComboBoxItem;
begin
  if teCustomerEmail.Text <> '' then
  begin
    MyCases := FBApi.Search('Correspondent:"' + teCustomerEmail.Text + '"', [ixProject, ixArea]);
    // Reset icons
    for iItem := 0 to icbProject.Properties.Items.Count - 1 do
      icbProject.Properties.Items[iItem].ImageIndex := 0;

    for iCase := 0 to MyCases.Count - 1 do
    begin
      // Change project icon
      MyItem := icbProject.Properties.FindItemByValue(MyCases[iCase].IxProject);
      if Assigned(MyItem) then
        MyItem.ImageIndex := 1;
    end;
  end;

  if Assigned(MyCases) and (MyCases.Count > 0) and (GetAppSettingAsBool(SET_DEF_PROJECT_DETECT)) then
    iItem := StrToInt(MyCases[0].IxProject)
  else
    iItem := GetAppSettingAsInteger(SET_LAST_PROJECT_ID);
  if iItem > 0 then
    icbProject.EditValue := iItem;
end;

procedure TFBCase.SetCustomerEmail(const Value: string);
begin
  teCustomerEmail.Text := Value;
  if teCustomerEmail.Text <> '' then
    lcgCorrespondent.Expanded := True;
end;

procedure TFBCase.SetCustomerName(const Value: string);
begin
  teCustomerName.Text := Value;
  if teCustomerName.Text <> '' then
    lcgCorrespondent.Expanded := True;
end;

procedure TFBCase.SetDefaultAssignedToArea;
var
  Area: viewArea.IXMLAreaType;
  iOwner: integer;
  I: Integer;
begin
  Area := FBApi.Area(icbArea.EditValue);
  iOwner := StrToInt(Area.IxPersonOwner);
  for I := 0 to icbPeople.Properties.Items.Count - 1 do
    if icbPeople.Properties.Items[i].Value = iOwner then
      icbPeople.Properties.Items[i].ImageIndex := 0
    else
      icbPeople.Properties.Items[i].ImageIndex := 1;
  if iOwner > -1 then
    icbPeople.EditValue := iOwner
  else
    SetDefaultAssignedToProject;
end;

procedure TFBCase.SetDefaultAssignedToProject;
var
  Project: IXMLProjectType;
  iOwner: integer;
  I: Integer;
begin
  if FLastDefaultAssignedProject <> icbProject.EditValue then
  begin
    Project := FBApi.Project(icbProject.EditValue);
    iOwner := StrToInt(Project.IxPersonOwner);
    for I := 0 to icbPeople.Properties.Items.Count - 1 do
      if icbPeople.Properties.Items[i].Value = iOwner then
        icbPeople.Properties.Items[i].ImageIndex := 0
      else
        icbPeople.Properties.Items[i].ImageIndex := 1;
    if iOwner > -1 then icbPeople.EditValue := iOwner;
    FLastDefaultAssignedProject := icbProject.EditValue;
  end;
end;

procedure TFBCase.SetupicbPeople;
var
  People: IXMLPeopleType;
  I: Integer;
begin
  People := FBApi.People;
  icbPeople.Properties.Items.Clear;
  for I := 0 to People.Count - 1 do
    with icbPeople.Properties.Items.Add do
    begin
      Value := People[i].IxPerson;
      Description := People[i].SFullName;
    end;
end;

procedure TFBCase.SetupicbProject;
var
  Projects: IXMLProjectsType;
  I: Integer;
begin
  Projects := FBApi.Projects(False);
  icbProject.Properties.Items.Clear;
  for I := 0 to Projects.Count - 1 do
    with icbProject.Properties.Items.Add do
    begin
      Value := Projects[i].IxProject;
      Description := Projects[i].SProject;
      ImageIndex := 0;
    end;
    if Projects.Count > 0 then
      icbProject.EditValue := Projects[0].IxProject;
  SetDefaultAssignedToProject;
end;

procedure TFBCase.SetupicbStatus;
var
  Statuses: IXMLStatusesType;
  I: Integer;
begin
  Statuses := FBApi.Statuses;
  icbStatus.Properties.Items.Clear;
  for I := 0 to Statuses.Count - 1 do
    with icbStatus.Properties.Items.Add do
    begin
      Value := Statuses[i].IxStatus;
      Description := Statuses[i].SStatus;
    end;
  icbStatus.EditValue := 1;
  icbStatus.Properties.ReadOnly := true;
end;

procedure TFBCase.SetupicpPriorities;
var
  Priorities: IXMLPrioritiesType;
  I: Integer;
  iDefault: Integer;
begin
  iDefault := 0;
  Priorities := FBApi.Priorities;
  icbPriorities.Properties.Items.Clear;
  for I := 0 to Priorities.Count - 1 do
    with icbPriorities.Properties.Items.Add do
    begin
      Value := Priorities[i].IxPriority;
      Description := Priorities[i].IxPriority + ' - ' + Priorities[i].SPriority;
      if SameText(Priorities[i].FDefault, 'True') then iDefault := Value;
      case Value of
        1,2,3: ImageIndex := 2;
        4,5: ImageIndex := 1;
      else
        ImageIndex := 0;
      end;
    end;
  if iDefault <> 0 then
    icbPriorities.EditValue := iDefault;
end;

function TFBCase.ShowConfirmation(CaseID: integer; NewCase: Boolean = True): Boolean;
var
  MyConf: TfConfirmation;
begin
  MyConf := TfConfirmation.Create(Self);
  try
    MyConf.CaseID := CaseID;
    if NewCase then
      MyConf.lText.Caption := 'The new case has been created:'
    else
      MyConf.lText.Caption := 'The case has been changed:';
    MyConf.ActionURL := StringReplace(FBApi.ApiUrl, 'api.', 'default.', [rfReplaceAll, rfIgnoreCase]) + IntToStr(CaseID);
    MyConf.ShowModal;
  finally
    Result := True;
  end;
end;

procedure TFBCase.teCustomerEmailExit(Sender: TObject);
begin
  if teExistingCaseID.Text = '' then
    MarkCorrespondentProject;
end;

procedure TFBCase.teExistingCaseIDPropertiesChange(Sender: TObject);
var
  MyCases: IXMLCasesType;
  MyCase: IXMLCaseType;
begin
  if teExistingCaseID.Text <> '' then
  begin
    MyCases := FBApi.Search('ixBug:' + teExistingCaseID.Text, []);
    if MyCases.Count = 1 then
    begin
      MyCase := MyCases[0];
//      teTitle.Text := MyCase.STitle;
      icbProject.EditValue := MyCase.IxProject;
      icbArea.EditValue := MyCase.IxArea;
      icbFixFor.EditValue := MyCase.IxFixFor;
      icbCategories.EditValue := MyCase.IxCategory;
      icbPeople.EditValue := MyCase.IxPersonAssignedTo;
      icbStatus.EditValue := MyCase.IxStatus;
      icbPriorities.EditValue := MyCase.IxPriority;
      if MyCase.SCustomerEmail <> '' then
      begin
        teCustomerEmail.EditValue := GetMailFromEmail(MyCase.SCustomerEmail);
        teCustomerName.EditValue := GetNameFromEmail(MyCase.SCustomerEmail);
        lcgCorrespondent.Expanded := True;
      end;
    end
    else
    begin
      MessageDlg('Could not find this case. Try another number.', mtError, [mbOk], 0);
      teExistingCaseID.Text := '';
    end;
  end;
end;

procedure TFBCase.tInitTimer(Sender: TObject);
begin
  tInit.Enabled := False;
  if FBApi.CheckServer then
    InitForm
  else
  begin
    MessageDlg('Could not connect to FogBugz server. Please review your settings.', mtError, [mbOK], 0);
  end;
end;

function TFBCase.ValidateForm: boolean;
var
  sMessage: string;
begin
  sMessage := '';
  if teTitle.Text = '' then sMessage := sMessage + ' - please provide a title' + #10#13;

  if sMessage <> '' then
  begin
    ShowMessage('Please correct the folowing issues before submitting this case:'+ #10#13 + sMessage);
    Result := False;
  end
  else
    Result := True;

end;

initialization
  dxInitializeGDIPlus;

finalization
  dxFinalizeGDIPlus;

end.
