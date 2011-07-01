unit ufbAPI;

interface

uses
  IdHTTP, Classes, XMLDoc, listAreas, listProjects, listfixFors, listCategories,
  listPeople, listPriorities, caseNew, listMailboxes, viewPerson, viewProject,
  listStatuses, Windows, api, logon, IdSSLOpenSSL, error, searchResult, viewArea;

type

  TResultColumn = (ixBug,fOpen,sTitle,sLatestTextSummary,ixBugEventLatestText,ixProject,sProject,ixArea,sArea,ixGroup,ixPersonAssignedTo,sPersonAssignedTo,sEmailAssignedTo,ixPersonOpenedBy,ixPersonResolvedBy,ixPersonClosedBy,ixPersonLastEditedBy,ixStatus,sStatus,ixPriority,sPriority,ixFixFor,sFixFor,dtFixFor,sVersion,sComputer,hrsOrigEst,hrsCurrEst,hrsElapsed,c,sCustomerEmail,ixMailbox,ixCategory,sCategory,dtOpened,dtResolved,dtClosed,ixBugEventLatest,dtLastUpdated,fReplied,fForwarded,sTicket,ixDiscussTopic,dtDue,sReleaseNotes,ixBugEventLastView,dtLastView,ixRelatedBugs,sScoutDescription,sScoutMessage,fScoutStopReporting,fSubscribed);
  TResultColumns = set of TResultColumn;

  TfbRequest = class
  private
    FList: TStringList;
    FRequestString: string;
    FCommand: string;
    FXMLDoc: TXMLDocument;
    function GetRequestString: string;
  public
    constructor Create(ACommand: string);
    destructor Destroy;override;
    property Command: string read FCommand write FCommand;
    property RequestString: string read GetRequestString write FRequestString;
    property XMLDoc: TXMLDocument read FXMLDoc;
    procedure AddParameter(AName: string; AValue: string);overload;
    procedure AddParameter(AName: string; AValue: integer);overload;
  end;

  TfbApi = class
  private
    FToken: string;
    FApiUrl: string;
    FHTTP: TIdHTTP;
    FSSL: TIdSSLIOHandlerSocketOpenSSL;
    FWaitStartEvent: TNotifyEvent;
    FWaitStopEvent: TNotifyEvent;
    function ExecuteRequest(var Request: TfbRequest): string;overload;
    procedure RaiseFBErrorCode(const iError: Integer);
    function ResultColumnsString(ResultColumns: TResultColumns): string;
    function GetServerUrl: string;
  public
    constructor Create;
    destructor Destroy;override;
    property WaitStartEvent: TNotifyEvent read FWaitStartEvent write FWaitStartEvent;
    property WaitStopEvent: TNotifyEvent read FWaitStopEvent write FWaitStopEvent;
    property ApiUrl: string read FApiUrl write FApiUrl;
    property Token: string read FToken;
    procedure ReadSettings;
    function UserApiToApiUrl(ApiURL: string): string;
    function Login(const Username: string; const Password: string): string;
    procedure Logout;
    property ServerUrl: string read GetServerUrl;
    function CheckServer: Boolean;
    function Projects(fWrite: boolean; ixProject: string = ''): IXMLProjectsType;
    function Areas(fWrite: boolean; ixProject: string = ''; ixArea: string = ''): IXMLAreasType;
    function FixFors(fIncludeDeleted: boolean; ixProject: string = ''; ixFixFor: string = ''): IXMLFixforsType;
    function Categories: IXMLCategoriesType;
    function People: IXMLPeopleType;
    function Priorities: IXMLPrioritiesType;
    function Mailboxes: IXMLMailboxesType;
    function Statuses: IXMLStatusesType;
    function DefaultMailboxID: string;
    function DefaultUser: IXMLPersonType;
    function NewCase(sTitle, ixProject, ixArea, ixFixFor, ixCategory, ixPersonAssignedTo, ixPriority, scustomerEmail, ixMailBox, sEvent: string; dtDue: TDateTime; hrsCurrEst: Single): Integer;
    function EditCase(ixBug, sTitle, ixProject, ixArea, ixFixFor, ixCategory, ixPersonAssignedTo, ixPriority, scustomerEmail, ixMailBox, sEvent: string; dtDue: TDateTime; hrsCurrEst: Single): Integer;
    function Project(ixProject: Integer): IXMLProjectType;
    function Area(ixArea: Integer): viewArea.IXMLAreaType;
    function Search(q: string; ResultColumns: TResultColumns): IXMLCasesType;
    procedure StartWork(const ixBug: Integer);
    procedure StopWork;
  end;

implementation

uses
  SysUtils, xmldom, Forms, Settings, IdURI, strutils, TypInfo;

{ TfbApi }

function TfbApi.Categories: IXMLCategoriesType;
var
  Request: TfbRequest;
begin
  Request := TfbRequest.Create('listCategories');
  try
    ExecuteRequest(Request);
    Result := listCategories.Getresponse(Request.XMLDoc).Categories;
  finally
    Request.Free;
  end;
end;

function TfbApi.CheckServer: Boolean;
begin
  if (ApiUrl = '') or (Token = '') then
  begin
    Result := False
  end
  else
    Result := True;
end;

constructor TfbApi.Create;
begin
  FHTTP := TIdHTTP.Create(nil);
  FSSL := TIdSSLIOHandlerSocketOpenSSL.Create(Application);
  FHTTP.IOHandler := FSSL;
  ReadSettings;
end;

destructor TfbApi.Destroy;
begin
  if Assigned(FHTTP) then FHTTP.Free;
  inherited;
end;

function TfbApi.EditCase(ixBug, sTitle, ixProject, ixArea, ixFixFor, ixCategory, ixPersonAssignedTo, ixPriority, scustomerEmail, ixMailBox, sEvent: string;  dtDue: TDateTime; hrsCurrEst: Single): Integer;
var
  ARequest: TfbRequest;
begin
  ARequest := TfbRequest.Create('edit');
  try
    ARequest.AddParameter('ixBug', ixBug);
    ARequest.AddParameter('sTitle', sTitle);
    ARequest.AddParameter('ixProject', ixProject);
    ARequest.AddParameter('ixArea', ixArea);
    ARequest.AddParameter('ixFixFor', ixFixFor);
    ARequest.AddParameter('ixCategory', ixCategory);
    ARequest.AddParameter('ixPersonAssignedTo', ixPersonAssignedTo);
    ARequest.AddParameter('ixPriority', ixPriority);
    ARequest.AddParameter('sCustomerEmail', sCustomerEmail);
    ARequest.AddParameter('ixMailBox', ixMailBox);
    ARequest.AddParameter('sEvent', sEvent);
    ARequest.AddParameter('cols', 'ixBug');
    ARequest.AddParameter('dtDue', DateTimeToStr(dtDue));
    ARequest.AddParameter('hrsCurrEst', FloatToStr(hrsCurrEst));
    ExecuteRequest(ARequest);
    Result := caseNew.Getresponse(ARequest.XMLDoc).Case_.IxBug;
  finally
    ARequest.Free;
  end;
end;

function TfbApi.ExecuteRequest(var Request: TfbRequest): string;
var
  s: string;
  sEnc: string;
  sResult: string;
  iError: Integer;
begin
  if (Request.Command <> 'logon') and (Token = '') and (Request.Command <> 'apiurl') and (Request.Command <> 'logoff') then
    raise Exception.Create('You must login first!');
  if (Request.Command <> 'apiurl') and (FApiUrl = '') then
    raise Exception.Create('Please provide a valid API url!');

  if FToken <> '' then
    Request.FList.Insert(0, 'token=' + Token);
  s := Format('%s%s', [ApiUrl, Request.RequestString]);
  sEnc := TIdURI.URLEncode(s);
  try
    if Assigned(WaitStartEvent) then
      WaitStartEvent(Self);
    try
      FHTTP.IOHandler.Open;
      sResult := FHTTP.Get(sEnc);
      FHTTP.IOHandler.Close;
    except
      on e: EIdHTTPProtocolException do
      begin
        if e.ErrorCode = 404 then
          raise Exception.CreateFmt('Could not contact server on %s. Please check your settings.', [FApiUrl]);
      end;
    end;
    Request.XMLDoc.XML.Text := sResult;
    Request.XMLDoc.Active := True;
    // Try to detect if the result is an error string
    iError := Pos('error', Request.XMLDoc.XML.Text);
    if (iError > 0) and (iError < 65) then
    try
      iError := error.Getresponse(Request.XMLDoc).Error.Code;
      if iError > 0 then
      RaiseFBErrorCode(iError);
    except
      // do nothing. Apparently the result wasn't an error!
    end;
  finally
    if Assigned(WaitStopEvent) then
      WaitStopEvent(Self);
  end;
end;

function TfbApi.FixFors(fIncludeDeleted: boolean; ixProject, ixFixFor: string): IXMLFixforsType;
var
  Request: TfbRequest;
begin
  Request := TfbRequest.Create('listFixFors');
  try
    if fIncludeDeleted then Request.AddParameter('fIncludeDeleted', '1');
    if ixProject <> '' then Request.AddParameter('ixProject', ixProject);
    if ixFixFor <> '' then Request.AddParameter('ixFixFor', ixFixFor);
    ExecuteRequest(Request);
    Result := listfixFors.Getresponse(Request.XMLDoc).Fixfors;
  finally
    Request.Free;
  end;
end;

function TfbApi.GetServerUrl: string;
var
  iPos: integer;
begin
  iPos := Length(ApiUrl);
  while PosEx('/', ApiUrl, iPos) < 0 do
    Dec(iPos);
  Result := LeftStr(ApiUrl, iPos);
end;

function TfbApi.Login(const Username, Password: string): string;
var
  ARequest: TfbRequest;
begin
  ARequest := TfbRequest.Create('logon');
  try
    ARequest.AddParameter('email', UserName);
    ARequest.AddParameter('password', Password);
    FToken := '';
    ExecuteRequest(ARequest);
    Result := logon.Getresponse(ARequest.XMLDoc).Token;
    FToken := Result;
    if FToken = '' then
      raise Exception.Create('Invalid username / password.');
  finally
    ARequest.Free;
  end;
end;

procedure TfbApi.Logout;
var
  ARequest: TfbRequest;
begin
  ARequest := TfbRequest.Create('logoff');
  try
    ExecuteRequest(ARequest);
    SetAppSetting(SET_SERVICE_TOKEN, '');
  finally
    ARequest.Free;
  end;
end;

function TfbApi.Area(ixArea: Integer): viewArea.IXMLAreaType;
var
  Request: TfbRequest;
begin
  Request := TfbRequest.Create('viewArea');
  try
    Request.AddParameter('ixArea', ixArea);
    ExecuteRequest(Request);
    Result := viewArea.Getresponse(Request.XMLDoc).Area;
  finally
    Request.Free;
  end;
end;

function TfbApi.Areas(fWrite: boolean; ixProject, ixArea: string): IXMLAreasType;
var
  Request: TfbRequest;
begin
  Request := TfbRequest.Create('listAreas');
  try
    if fWrite then Request.AddParameter('fWrite', '1');
    if ixProject <> '' then Request.AddParameter('ixProject', ixProject);
    if ixArea <> '' then Request.AddParameter('ixArea', ixArea);
    ExecuteRequest(Request);
    Result := listAreas.Getresponse(Request.XMLDoc).Areas;
  finally
    Request.Free;
  end;
end;

function TfbApi.People: IXMLPeopleType;
var
  Request: TfbRequest;
begin
  Request := TfbRequest.Create('listPeople');
  try
    ExecuteRequest(Request);
    Result := listPeople.Getresponse(Request.XMLDoc).People;
  finally
    Request.Free;
  end;
end;

function TfbApi.Projects(fWrite: boolean; ixProject: string = ''): IXMLProjectsType;
var
  Request: TfbRequest;
begin
  Request := TfbRequest.Create('listProjects');
  try
    if fWrite then Request.AddParameter('fWrite', '1');
    if ixProject <> '' then Request.AddParameter('ixProject', ixProject);
    ExecuteRequest(Request);
    Result := listProjects.Getresponse(Request.XMLDoc).Projects;
  finally
    Request.Free;
  end;
end;

procedure TfbApi.RaiseFBErrorCode(const iError: Integer);
var
  sMessage: string;
begin
  case iError of
    0: sMessage := 'FogBugz not initialized.  Database may be down or needs to be upgraded.';
    1: sMessage := 'Log On problem - Incorrect Username or Password';
    2: sMessage := 'Log On problem - multiple matches for username';
    3: sMessage := 'You are not logged on.';
    4: sMessage := 'Argument is missing from query';
    5: sMessage := 'Edit problem - the case you are trying to edit could not be found';
    6: sMessage := 'Edit problem - the action you are trying to perform on this case is not permitted';
    7: sMessage := 'Time tracking problem - you cannot add a time interval to this case because the case cannot be found, is closed, has no estimate, or you do not have permission';
    8: sMessage := 'New case problem - you cannot write to any project';
    9: sMessage := 'Case has changed since last view';
    10: sMessage := 'Search problem - an error occurred in search.';
    12: sMessage := 'Wiki creation problem';
    13: sMessage := 'Wiki permission problem';
    14: sMessage := 'Wiki load error';
    15: sMessage := 'Wiki template error';
    16: sMessage := 'Wiki commit error';
    17: sMessage := 'No such project';
    18: sMessage := 'No such user';
    19: sMessage := 'Area creation problem';
    20: sMessage := 'FixFor creation problem';
    21: sMessage := 'Project creation problem';
    22: sMessage := 'User creation problem';
    23: sMessage := 'Project percent time problem';
    24: sMessage := 'No such fixfor';
    25: sMessage := 'Violates fixfor execution order';
  end;
  raise Exception.Create('The FogBugz server returned the following error:' + #10#13 + sMessage);
end;

procedure TfbApi.ReadSettings;
begin
  FToken := GetAppSetting(SET_SERVICE_TOKEN);
  FApiUrl := GetAppSetting(SET_SERVICE_URL);
end;

function TfbApi.ResultColumnsString(ResultColumns: TResultColumns): string;
var
  Column: TResultColumn;
begin
  if (ResultColumns = []) then // if emtpy: add all columns
  begin
    for Column in [Low(TResultColumn) .. High(TResultColumn)] do
      Result := Result + GetEnumName(TypeInfo(TResultColumn), Integer(Column)) + ',';
  end
  else
  begin
  for Column in ResultColumns do
    Result := Result + GetEnumName(TypeInfo(TResultColumn), Integer(Column)) + ',';
  end;

  if Length(Result) > 1 then
    Result := LeftStr(Result, Length(Result)-1);
end;

function TfbApi.Search(q: string; ResultColumns: TResultColumns): IXMLCasesType;
var
  Request: TfbRequest;
  sCols: string;
begin
  sCols := ResultColumnsString(ResultColumns);
  Request := TfbRequest.Create('search');
  try
    Request.AddParameter('q', q);
    Request.AddParameter('cols', sCols);
    ExecuteRequest(Request);
    Result := searchResult.Getresponse(Request.XMLDoc).Cases;
  finally
    Request.Free;
  end;
end;

procedure TfbApi.StartWork(const ixBug: Integer);
var
  Request: TfbRequest;
begin
  Request := TfbRequest.Create('startWork');
  try
    Request.AddParameter('ixBug', ixBug);
    ExecuteRequest(Request);
  finally
    Request.Free;
  end;
end;

function TfbApi.Statuses: IXMLStatusesType;
var
  Request: TfbRequest;
begin
  Request := TfbRequest.Create('listStatuses');
  try
    ExecuteRequest(Request);
    Result := listStatuses.Getresponse(Request.XMLDoc).Statuses;
  finally
    Request.Free;
  end;
end;

procedure TfbApi.StopWork;
var
  Request: TfbRequest;
begin
  Request := TfbRequest.Create('stopWork');
  try
    ExecuteRequest(Request);
  finally
    Request.Free;
  end;
end;

function TfbApi.UserApiToApiUrl(ApiURL: string): string;
var
  ARequest: TfbRequest;
begin
  if ApiURL = '' then
    Result := ''
  else
  begin
    // already a valid apiurl
    if SameText(RightStr(ApiUrl, 8), 'api.php?') or SameText(RightStr(ApiUrl, 8), 'api.asp?') then
    begin
      FApiUrl := ApiUrl;
    end;
    // if a root location is provided (url ends with /) then check for the api.xml
    if not (SameText(RightStr(ApiUrl, 7), 'api.xml') or SameText(RightStr(ApiUrl, 8), 'api.php?') or SameText(RightStr(ApiUrl, 8), 'api.asp?')) then
      if RightStr(ApiUrl, 1) = '/' then
        ApiUrl := ApiUrl + 'api.xml'
      else
        ApiUrl := ApiUrl + '/api.xml';

    // the XML is provided. Get the php / asp location:
    if SameText(RightStr(ApiUrl, 7), 'api.xml') then
    begin
      FApiUrl := '';
      ARequest := TfbRequest.Create('apiurl');
      try
        ARequest.RequestString := ApiUrl;
        ExecuteRequest(ARequest);
        FApiUrl := StringReplace(ApiUrl, 'api.xml', api.Getresponse(ARequest.XMLDoc).Url, [rfIgnoreCase, rfReplaceAll]);
      finally
        ARequest.Free;
      end;
    end;

    if SameText(RightStr(FApiUrl, 8), 'api.php?') or SameText(RightStr(FApiUrl, 8), 'api.asp?') then
      Result := FApiUrl
    else
      Result := '';
  end;
end;

function TfbApi.Priorities: IXMLPrioritiesType;
var
  Request: TfbRequest;
begin
  Request := TfbRequest.Create('listPriorities');
  try
    ExecuteRequest(Request);
    Result := listPriorities.Getresponse(Request.XMLDoc).Priorities;
  finally
    Request.Free;
  end;
end;

function TfbApi.Project(ixProject: Integer): IXMLProjectType;
var
  Request: TfbRequest;
begin
  Request := TfbRequest.Create('viewProject');
  try
    Request.AddParameter('ixProject', ixProject);
    ExecuteRequest(Request);
    Result := viewProject.Getresponse(Request.XMLDoc).Project;
  finally
    Request.Free;
  end;
end;

function TfbApi.Mailboxes: IXMLMailboxesType;
var
  Request: TfbRequest;
begin
  Request := TfbRequest.Create('listMailboxes');
  try
    ExecuteRequest(Request);
    Result := listMailboxes.Getresponse(Request.XMLDoc).Mailboxes;
  finally
    Request.Free;
  end;
end;

function TfbApi.DefaultMailboxID: string;
begin
  Result := Mailboxes.Mailbox.IxMailbox;
end;

function TfbApi.DefaultUser: IXMLPersonType;
var
  Request: TfbRequest;
begin
  Request := TfbRequest.Create('viewPerson');
  try
    ExecuteRequest(Request);
    Result := viewPerson.Getresponse(Request.XMLDoc).Person;
  finally
    Request.Free;
  end;
end;

function TfbApi.NewCase(sTitle, ixProject, ixArea, ixFixFor, ixCategory, ixPersonAssignedTo, ixPriority, sCustomerEmail, ixMailBox, sEvent: string; dtDue: TDateTime; hrsCurrEst: Single): Integer;
var
  ARequest: TfbRequest;
begin
  ARequest := TfbRequest.Create('new');
  try
    ARequest.AddParameter('sTitle', sTitle);
    ARequest.AddParameter('ixProject', ixProject);
    ARequest.AddParameter('ixArea', ixArea);
    ARequest.AddParameter('ixFixFor', ixFixFor);
    ARequest.AddParameter('ixCategory', ixCategory);
    ARequest.AddParameter('ixPersonAssignedTo', ixPersonAssignedTo);
    ARequest.AddParameter('ixPriority', ixPriority);
    ARequest.AddParameter('sCustomerEmail', sCustomerEmail);
    ARequest.AddParameter('ixMailBox', ixMailBox);
    ARequest.AddParameter('sEvent', sEvent);
    ARequest.AddParameter('cols', 'ixBug');
    ARequest.AddParameter('dtDue', DateTimeToStr(dtDue));
    ARequest.AddParameter('hrsCurrEst', FloatToStr(hrsCurrEst));
    ExecuteRequest(ARequest);
    Result := caseNew.Getresponse(ARequest.XMLDoc).Case_.IxBug;
  finally
    ARequest.Free;
  end;
end;

{ TfbRequest }

procedure TfbRequest.AddParameter(AName, AValue: string);
begin
  if (AName <> '') and (AValue <> '') then
    FList.Add(Format('%s=%s', [AName, AValue]));
end;

procedure TfbRequest.AddParameter(AName: string; AValue: integer);
begin
  AddParameter(AName, IntToStr(AValue));
end;

constructor TfbRequest.Create(ACommand: string);
begin
  FCommand := ACommand;
  FXMLDoc := TXMLDocument.Create(Application);
  FList := TStringList.Create;
  FList.Delimiter := '&';
end;

destructor TfbRequest.Destroy;
begin
  FList.Free;
  FXMLDoc.Free;
  inherited;
end;

function TfbRequest.GetRequestString: string;
var
  i: Integer;
begin
  if FRequestString = '' then
  begin
    FRequestString := 'cmd=' + FCommand;
    for I := 0 to FList.Count - 1 do
      FRequestString := FRequestString + '&' + FList.Names[i] + '=' + FList.ValueFromIndex[i];
  end;
  Result := FRequestString;
end;

end.
