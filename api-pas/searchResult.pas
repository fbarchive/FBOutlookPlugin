
{**********************************************************************}
{                                                                      }
{                           XML Data Binding                           }
{                                                                      }
{         Generated on: 24-12-2009 12:52:17                            }
{       Generated from: H:\svn\FogBugzTools\api-xml\searchResult.xml   }
{                                                                      }
{**********************************************************************}

unit searchResult;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLResponseType = interface;
  IXMLCasesType = interface;
  IXMLCaseType = interface;

{ IXMLResponseType }

  IXMLResponseType = interface(IXMLNode)
    ['{50AB1CB6-550F-46F1-8D01-ADB6329FEBBE}']
    { Property Accessors }
    function Get_Cases: IXMLCasesType;
    { Methods & Properties }
    property Cases: IXMLCasesType read Get_Cases;
  end;

{ IXMLCasesType }

  IXMLCasesType = interface(IXMLNodeCollection)
    ['{260A8871-D7C8-4742-B948-AF2A79478046}']
    { Property Accessors }
    function Get_Count: Integer;
    function Get_Case_(Index: Integer): IXMLCaseType;
    procedure Set_Count(Value: Integer);
    { Methods & Properties }
    function Add: IXMLCaseType;
    function Insert(const Index: Integer): IXMLCaseType;
    property Count: Integer read Get_Count write Set_Count;
    property Case_[Index: Integer]: IXMLCaseType read Get_Case_; default;
  end;

{ IXMLCaseType }

  IXMLCaseType = interface(IXMLNode)
    ['{3AF01755-E1B1-4ED3-8789-EDF7CD44B3E9}']
    { Property Accessors }
    function Get_IxBug: Integer;
    function Get_Operations: UnicodeString;
    function Get_FOpen: UnicodeString;
    function Get_STitle: UnicodeString;
    function Get_SLatestTextSummary: UnicodeString;
    function Get_IxBugEventLatestText: Integer;
    function Get_IxProject: UnicodeString;
    function Get_SProject: UnicodeString;
    function Get_IxArea: UnicodeString;
    function Get_SArea: UnicodeString;
    function Get_IxGroup: UnicodeString;
    function Get_IxPersonAssignedTo: UnicodeString;
    function Get_SPersonAssignedTo: UnicodeString;
    function Get_SEmailAssignedTo: UnicodeString;
    function Get_IxPersonOpenedBy: UnicodeString;
    function Get_IxPersonResolvedBy: UnicodeString;
    function Get_IxPersonClosedBy: UnicodeString;
    function Get_IxPersonLastEditedBy: UnicodeString;
    function Get_IxStatus: UnicodeString;
    function Get_SStatus: UnicodeString;
    function Get_IxPriority: UnicodeString;
    function Get_SPriority: UnicodeString;
    function Get_IxFixFor: UnicodeString;
    function Get_SFixFor: UnicodeString;
    function Get_DtFixFor: UnicodeString;
    function Get_SVersion: UnicodeString;
    function Get_SComputer: UnicodeString;
    function Get_HrsOrigEst: Integer;
    function Get_HrsCurrEst: Integer;
    function Get_HrsElapsed: Integer;
    function Get_C: Integer;
    function Get_SCustomerEmail: UnicodeString;
    function Get_IxMailbox: Integer;
    function Get_IxCategory: Integer;
    function Get_DtOpened: UnicodeString;
    function Get_DtResolved: UnicodeString;
    function Get_DtClosed: UnicodeString;
    function Get_IxBugEventLatest: Integer;
    function Get_FReplied: UnicodeString;
    function Get_FForwarded: UnicodeString;
    function Get_STicket: UnicodeString;
    function Get_IxDiscussTopic: Integer;
    function Get_DtDue: UnicodeString;
    function Get_SReleaseNotes: UnicodeString;
    function Get_IxBugEventLastView: Integer;
    function Get_DtLastView: UnicodeString;
    function Get_SCategory: UnicodeString;
    function Get_DtLastUpdated: UnicodeString;
    function Get_IxRelatedBugs: UnicodeString;
    function Get_SScoutDescription: UnicodeString;
    function Get_SScoutMessage: UnicodeString;
    function Get_FScoutStopReporting: UnicodeString;
    function Get_FSubscribed: UnicodeString;
    procedure Set_IxBug(Value: Integer);
    procedure Set_Operations(Value: UnicodeString);
    procedure Set_FOpen(Value: UnicodeString);
    procedure Set_STitle(Value: UnicodeString);
    procedure Set_SLatestTextSummary(Value: UnicodeString);
    procedure Set_IxBugEventLatestText(Value: Integer);
    procedure Set_IxProject(Value: UnicodeString);
    procedure Set_SProject(Value: UnicodeString);
    procedure Set_IxArea(Value: UnicodeString);
    procedure Set_SArea(Value: UnicodeString);
    procedure Set_IxGroup(Value: UnicodeString);
    procedure Set_IxPersonAssignedTo(Value: UnicodeString);
    procedure Set_SPersonAssignedTo(Value: UnicodeString);
    procedure Set_SEmailAssignedTo(Value: UnicodeString);
    procedure Set_IxPersonOpenedBy(Value: UnicodeString);
    procedure Set_IxPersonResolvedBy(Value: UnicodeString);
    procedure Set_IxPersonClosedBy(Value: UnicodeString);
    procedure Set_IxPersonLastEditedBy(Value: UnicodeString);
    procedure Set_IxStatus(Value: UnicodeString);
    procedure Set_SStatus(Value: UnicodeString);
    procedure Set_IxPriority(Value: UnicodeString);
    procedure Set_SPriority(Value: UnicodeString);
    procedure Set_IxFixFor(Value: UnicodeString);
    procedure Set_SFixFor(Value: UnicodeString);
    procedure Set_DtFixFor(Value: UnicodeString);
    procedure Set_SVersion(Value: UnicodeString);
    procedure Set_SComputer(Value: UnicodeString);
    procedure Set_HrsOrigEst(Value: Integer);
    procedure Set_HrsCurrEst(Value: Integer);
    procedure Set_HrsElapsed(Value: Integer);
    procedure Set_C(Value: Integer);
    procedure Set_SCustomerEmail(Value: UnicodeString);
    procedure Set_IxMailbox(Value: Integer);
    procedure Set_IxCategory(Value: Integer);
    procedure Set_DtOpened(Value: UnicodeString);
    procedure Set_DtResolved(Value: UnicodeString);
    procedure Set_DtClosed(Value: UnicodeString);
    procedure Set_IxBugEventLatest(Value: Integer);
    procedure Set_FReplied(Value: UnicodeString);
    procedure Set_FForwarded(Value: UnicodeString);
    procedure Set_STicket(Value: UnicodeString);
    procedure Set_IxDiscussTopic(Value: Integer);
    procedure Set_DtDue(Value: UnicodeString);
    procedure Set_SReleaseNotes(Value: UnicodeString);
    procedure Set_IxBugEventLastView(Value: Integer);
    procedure Set_DtLastView(Value: UnicodeString);
    procedure Set_SCategory(Value: UnicodeString);
    procedure Set_DtLastUpdated(Value: UnicodeString);
    procedure Set_IxRelatedBugs(Value: UnicodeString);
    procedure Set_SScoutDescription(Value: UnicodeString);
    procedure Set_SScoutMessage(Value: UnicodeString);
    procedure Set_FScoutStopReporting(Value: UnicodeString);
    procedure Set_FSubscribed(Value: UnicodeString);
    { Methods & Properties }
    property IxBug: Integer read Get_IxBug write Set_IxBug;
    property Operations: UnicodeString read Get_Operations write Set_Operations;
    property IxBug: Integer read Get_IxBug write Set_IxBug;
    property FOpen: UnicodeString read Get_FOpen write Set_FOpen;
    property STitle: UnicodeString read Get_STitle write Set_STitle;
    property SLatestTextSummary: UnicodeString read Get_SLatestTextSummary write Set_SLatestTextSummary;
    property IxBugEventLatestText: Integer read Get_IxBugEventLatestText write Set_IxBugEventLatestText;
    property IxProject: UnicodeString read Get_IxProject write Set_IxProject;
    property SProject: UnicodeString read Get_SProject write Set_SProject;
    property IxArea: UnicodeString read Get_IxArea write Set_IxArea;
    property SArea: UnicodeString read Get_SArea write Set_SArea;
    property IxGroup: UnicodeString read Get_IxGroup write Set_IxGroup;
    property IxPersonAssignedTo: UnicodeString read Get_IxPersonAssignedTo write Set_IxPersonAssignedTo;
    property SPersonAssignedTo: UnicodeString read Get_SPersonAssignedTo write Set_SPersonAssignedTo;
    property SEmailAssignedTo: UnicodeString read Get_SEmailAssignedTo write Set_SEmailAssignedTo;
    property IxPersonOpenedBy: UnicodeString read Get_IxPersonOpenedBy write Set_IxPersonOpenedBy;
    property IxPersonResolvedBy: UnicodeString read Get_IxPersonResolvedBy write Set_IxPersonResolvedBy;
    property IxPersonClosedBy: UnicodeString read Get_IxPersonClosedBy write Set_IxPersonClosedBy;
    property IxPersonLastEditedBy: UnicodeString read Get_IxPersonLastEditedBy write Set_IxPersonLastEditedBy;
    property IxStatus: UnicodeString read Get_IxStatus write Set_IxStatus;
    property SStatus: UnicodeString read Get_SStatus write Set_SStatus;
    property IxPriority: UnicodeString read Get_IxPriority write Set_IxPriority;
    property SPriority: UnicodeString read Get_SPriority write Set_SPriority;
    property IxFixFor: UnicodeString read Get_IxFixFor write Set_IxFixFor;
    property SFixFor: UnicodeString read Get_SFixFor write Set_SFixFor;
    property DtFixFor: UnicodeString read Get_DtFixFor write Set_DtFixFor;
    property SVersion: UnicodeString read Get_SVersion write Set_SVersion;
    property SComputer: UnicodeString read Get_SComputer write Set_SComputer;
    property HrsOrigEst: Integer read Get_HrsOrigEst write Set_HrsOrigEst;
    property HrsCurrEst: Integer read Get_HrsCurrEst write Set_HrsCurrEst;
    property HrsElapsed: Integer read Get_HrsElapsed write Set_HrsElapsed;
    property C: Integer read Get_C write Set_C;
    property SCustomerEmail: UnicodeString read Get_SCustomerEmail write Set_SCustomerEmail;
    property IxMailbox: Integer read Get_IxMailbox write Set_IxMailbox;
    property IxCategory: Integer read Get_IxCategory write Set_IxCategory;
    property DtOpened: UnicodeString read Get_DtOpened write Set_DtOpened;
    property DtResolved: UnicodeString read Get_DtResolved write Set_DtResolved;
    property DtClosed: UnicodeString read Get_DtClosed write Set_DtClosed;
    property IxBugEventLatest: Integer read Get_IxBugEventLatest write Set_IxBugEventLatest;
    property FReplied: UnicodeString read Get_FReplied write Set_FReplied;
    property FForwarded: UnicodeString read Get_FForwarded write Set_FForwarded;
    property STicket: UnicodeString read Get_STicket write Set_STicket;
    property IxDiscussTopic: Integer read Get_IxDiscussTopic write Set_IxDiscussTopic;
    property DtDue: UnicodeString read Get_DtDue write Set_DtDue;
    property SReleaseNotes: UnicodeString read Get_SReleaseNotes write Set_SReleaseNotes;
    property IxBugEventLastView: Integer read Get_IxBugEventLastView write Set_IxBugEventLastView;
    property DtLastView: UnicodeString read Get_DtLastView write Set_DtLastView;
    property SCategory: UnicodeString read Get_SCategory write Set_SCategory;
    property DtLastUpdated: UnicodeString read Get_DtLastUpdated write Set_DtLastUpdated;
    property IxRelatedBugs: UnicodeString read Get_IxRelatedBugs write Set_IxRelatedBugs;
    property SScoutDescription: UnicodeString read Get_SScoutDescription write Set_SScoutDescription;
    property SScoutMessage: UnicodeString read Get_SScoutMessage write Set_SScoutMessage;
    property FScoutStopReporting: UnicodeString read Get_FScoutStopReporting write Set_FScoutStopReporting;
    property FSubscribed: UnicodeString read Get_FSubscribed write Set_FSubscribed;
  end;

{ Forward Decls }

  TXMLResponseType = class;
  TXMLCasesType = class;
  TXMLCaseType = class;

{ TXMLResponseType }

  TXMLResponseType = class(TXMLNode, IXMLResponseType)
  protected
    { IXMLResponseType }
    function Get_Cases: IXMLCasesType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLCasesType }

  TXMLCasesType = class(TXMLNodeCollection, IXMLCasesType)
  protected
    { IXMLCasesType }
    function Get_Count: Integer;
    function Get_Case_(Index: Integer): IXMLCaseType;
    procedure Set_Count(Value: Integer);
    function Add: IXMLCaseType;
    function Insert(const Index: Integer): IXMLCaseType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLCaseType }

  TXMLCaseType = class(TXMLNode, IXMLCaseType)
  protected
    { IXMLCaseType }
    function Get_IxBug: Integer;
    function Get_Operations: UnicodeString;
    function Get_FOpen: UnicodeString;
    function Get_STitle: UnicodeString;
    function Get_SLatestTextSummary: UnicodeString;
    function Get_IxBugEventLatestText: Integer;
    function Get_IxProject: UnicodeString;
    function Get_SProject: UnicodeString;
    function Get_IxArea: UnicodeString;
    function Get_SArea: UnicodeString;
    function Get_IxGroup: UnicodeString;
    function Get_IxPersonAssignedTo: UnicodeString;
    function Get_SPersonAssignedTo: UnicodeString;
    function Get_SEmailAssignedTo: UnicodeString;
    function Get_IxPersonOpenedBy: UnicodeString;
    function Get_IxPersonResolvedBy: UnicodeString;
    function Get_IxPersonClosedBy: UnicodeString;
    function Get_IxPersonLastEditedBy: UnicodeString;
    function Get_IxStatus: UnicodeString;
    function Get_SStatus: UnicodeString;
    function Get_IxPriority: UnicodeString;
    function Get_SPriority: UnicodeString;
    function Get_IxFixFor: UnicodeString;
    function Get_SFixFor: UnicodeString;
    function Get_DtFixFor: UnicodeString;
    function Get_SVersion: UnicodeString;
    function Get_SComputer: UnicodeString;
    function Get_HrsOrigEst: Integer;
    function Get_HrsCurrEst: Integer;
    function Get_HrsElapsed: Integer;
    function Get_C: Integer;
    function Get_SCustomerEmail: UnicodeString;
    function Get_IxMailbox: Integer;
    function Get_IxCategory: Integer;
    function Get_DtOpened: UnicodeString;
    function Get_DtResolved: UnicodeString;
    function Get_DtClosed: UnicodeString;
    function Get_IxBugEventLatest: Integer;
    function Get_FReplied: UnicodeString;
    function Get_FForwarded: UnicodeString;
    function Get_STicket: UnicodeString;
    function Get_IxDiscussTopic: Integer;
    function Get_DtDue: UnicodeString;
    function Get_SReleaseNotes: UnicodeString;
    function Get_IxBugEventLastView: Integer;
    function Get_DtLastView: UnicodeString;
    function Get_SCategory: UnicodeString;
    function Get_DtLastUpdated: UnicodeString;
    function Get_IxRelatedBugs: UnicodeString;
    function Get_SScoutDescription: UnicodeString;
    function Get_SScoutMessage: UnicodeString;
    function Get_FScoutStopReporting: UnicodeString;
    function Get_FSubscribed: UnicodeString;
    procedure Set_IxBug(Value: Integer);
    procedure Set_Operations(Value: UnicodeString);
    procedure Set_FOpen(Value: UnicodeString);
    procedure Set_STitle(Value: UnicodeString);
    procedure Set_SLatestTextSummary(Value: UnicodeString);
    procedure Set_IxBugEventLatestText(Value: Integer);
    procedure Set_IxProject(Value: UnicodeString);
    procedure Set_SProject(Value: UnicodeString);
    procedure Set_IxArea(Value: UnicodeString);
    procedure Set_SArea(Value: UnicodeString);
    procedure Set_IxGroup(Value: UnicodeString);
    procedure Set_IxPersonAssignedTo(Value: UnicodeString);
    procedure Set_SPersonAssignedTo(Value: UnicodeString);
    procedure Set_SEmailAssignedTo(Value: UnicodeString);
    procedure Set_IxPersonOpenedBy(Value: UnicodeString);
    procedure Set_IxPersonResolvedBy(Value: UnicodeString);
    procedure Set_IxPersonClosedBy(Value: UnicodeString);
    procedure Set_IxPersonLastEditedBy(Value: UnicodeString);
    procedure Set_IxStatus(Value: UnicodeString);
    procedure Set_SStatus(Value: UnicodeString);
    procedure Set_IxPriority(Value: UnicodeString);
    procedure Set_SPriority(Value: UnicodeString);
    procedure Set_IxFixFor(Value: UnicodeString);
    procedure Set_SFixFor(Value: UnicodeString);
    procedure Set_DtFixFor(Value: UnicodeString);
    procedure Set_SVersion(Value: UnicodeString);
    procedure Set_SComputer(Value: UnicodeString);
    procedure Set_HrsOrigEst(Value: Integer);
    procedure Set_HrsCurrEst(Value: Integer);
    procedure Set_HrsElapsed(Value: Integer);
    procedure Set_C(Value: Integer);
    procedure Set_SCustomerEmail(Value: UnicodeString);
    procedure Set_IxMailbox(Value: Integer);
    procedure Set_IxCategory(Value: Integer);
    procedure Set_DtOpened(Value: UnicodeString);
    procedure Set_DtResolved(Value: UnicodeString);
    procedure Set_DtClosed(Value: UnicodeString);
    procedure Set_IxBugEventLatest(Value: Integer);
    procedure Set_FReplied(Value: UnicodeString);
    procedure Set_FForwarded(Value: UnicodeString);
    procedure Set_STicket(Value: UnicodeString);
    procedure Set_IxDiscussTopic(Value: Integer);
    procedure Set_DtDue(Value: UnicodeString);
    procedure Set_SReleaseNotes(Value: UnicodeString);
    procedure Set_IxBugEventLastView(Value: Integer);
    procedure Set_DtLastView(Value: UnicodeString);
    procedure Set_SCategory(Value: UnicodeString);
    procedure Set_DtLastUpdated(Value: UnicodeString);
    procedure Set_IxRelatedBugs(Value: UnicodeString);
    procedure Set_SScoutDescription(Value: UnicodeString);
    procedure Set_SScoutMessage(Value: UnicodeString);
    procedure Set_FScoutStopReporting(Value: UnicodeString);
    procedure Set_FSubscribed(Value: UnicodeString);
  end;

{ Global Functions }

function Getresponse(Doc: IXMLDocument): IXMLResponseType;
function Loadresponse(const FileName: string): IXMLResponseType;
function Newresponse: IXMLResponseType;

const
  TargetNamespace = '';

implementation

{ Global Functions }

function Getresponse(Doc: IXMLDocument): IXMLResponseType;
begin
  Result := Doc.GetDocBinding('response', TXMLResponseType, TargetNamespace) as IXMLResponseType;
end;

function Loadresponse(const FileName: string): IXMLResponseType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('response', TXMLResponseType, TargetNamespace) as IXMLResponseType;
end;

function Newresponse: IXMLResponseType;
begin
  Result := NewXMLDocument.GetDocBinding('response', TXMLResponseType, TargetNamespace) as IXMLResponseType;
end;

{ TXMLResponseType }

procedure TXMLResponseType.AfterConstruction;
begin
  RegisterChildNode('cases', TXMLCasesType);
  inherited;
end;

function TXMLResponseType.Get_Cases: IXMLCasesType;
begin
  Result := ChildNodes['cases'] as IXMLCasesType;
end;

{ TXMLCasesType }

procedure TXMLCasesType.AfterConstruction;
begin
  RegisterChildNode('case', TXMLCaseType);
  ItemTag := 'case';
  ItemInterface := IXMLCaseType;
  inherited;
end;

function TXMLCasesType.Get_Count: Integer;
begin
  Result := AttributeNodes['count'].NodeValue;
end;

procedure TXMLCasesType.Set_Count(Value: Integer);
begin
  SetAttribute('count', Value);
end;

function TXMLCasesType.Get_Case_(Index: Integer): IXMLCaseType;
begin
  Result := List[Index] as IXMLCaseType;
end;

function TXMLCasesType.Add: IXMLCaseType;
begin
  Result := AddItem(-1) as IXMLCaseType;
end;

function TXMLCasesType.Insert(const Index: Integer): IXMLCaseType;
begin
  Result := AddItem(Index) as IXMLCaseType;
end;

{ TXMLCaseType }

function TXMLCaseType.Get_IxBug: Integer;
begin
  Result := AttributeNodes['ixBug'].NodeValue;
end;

function TXMLCaseType.Get_Operations: UnicodeString;
begin
  Result := AttributeNodes['operations'].Text;
end;

procedure TXMLCaseType.Set_Operations(Value: UnicodeString);
begin
  SetAttribute('operations', Value);
end;

procedure TXMLCaseType.Set_IxBug(Value: Integer);
begin
  ChildNodes['ixBug'].NodeValue := Value;
end;

function TXMLCaseType.Get_FOpen: UnicodeString;
begin
  Result := ChildNodes['fOpen'].Text;
end;

procedure TXMLCaseType.Set_FOpen(Value: UnicodeString);
begin
  ChildNodes['fOpen'].NodeValue := Value;
end;

function TXMLCaseType.Get_STitle: UnicodeString;
begin
  Result := ChildNodes['sTitle'].Text;
end;

procedure TXMLCaseType.Set_STitle(Value: UnicodeString);
begin
  ChildNodes['sTitle'].NodeValue := Value;
end;

function TXMLCaseType.Get_SLatestTextSummary: UnicodeString;
begin
  Result := ChildNodes['sLatestTextSummary'].Text;
end;

procedure TXMLCaseType.Set_SLatestTextSummary(Value: UnicodeString);
begin
  ChildNodes['sLatestTextSummary'].NodeValue := Value;
end;

function TXMLCaseType.Get_IxBugEventLatestText: Integer;
begin
  Result := ChildNodes['ixBugEventLatestText'].NodeValue;
end;

procedure TXMLCaseType.Set_IxBugEventLatestText(Value: Integer);
begin
  ChildNodes['ixBugEventLatestText'].NodeValue := Value;
end;

function TXMLCaseType.Get_IxProject: UnicodeString;
begin
  Result := ChildNodes['ixProject'].Text;
end;

procedure TXMLCaseType.Set_IxProject(Value: UnicodeString);
begin
  ChildNodes['ixProject'].NodeValue := Value;
end;

function TXMLCaseType.Get_SProject: UnicodeString;
begin
  Result := ChildNodes['sProject'].Text;
end;

procedure TXMLCaseType.Set_SProject(Value: UnicodeString);
begin
  ChildNodes['sProject'].NodeValue := Value;
end;

function TXMLCaseType.Get_IxArea: UnicodeString;
begin
  Result := ChildNodes['ixArea'].Text;
end;

procedure TXMLCaseType.Set_IxArea(Value: UnicodeString);
begin
  ChildNodes['ixArea'].NodeValue := Value;
end;

function TXMLCaseType.Get_SArea: UnicodeString;
begin
  Result := ChildNodes['sArea'].Text;
end;

procedure TXMLCaseType.Set_SArea(Value: UnicodeString);
begin
  ChildNodes['sArea'].NodeValue := Value;
end;

function TXMLCaseType.Get_IxGroup: UnicodeString;
begin
  Result := ChildNodes['ixGroup'].Text;
end;

procedure TXMLCaseType.Set_IxGroup(Value: UnicodeString);
begin
  ChildNodes['ixGroup'].NodeValue := Value;
end;

function TXMLCaseType.Get_IxPersonAssignedTo: UnicodeString;
begin
  Result := ChildNodes['ixPersonAssignedTo'].Text;
end;

procedure TXMLCaseType.Set_IxPersonAssignedTo(Value: UnicodeString);
begin
  ChildNodes['ixPersonAssignedTo'].NodeValue := Value;
end;

function TXMLCaseType.Get_SPersonAssignedTo: UnicodeString;
begin
  Result := ChildNodes['sPersonAssignedTo'].Text;
end;

procedure TXMLCaseType.Set_SPersonAssignedTo(Value: UnicodeString);
begin
  ChildNodes['sPersonAssignedTo'].NodeValue := Value;
end;

function TXMLCaseType.Get_SEmailAssignedTo: UnicodeString;
begin
  Result := ChildNodes['sEmailAssignedTo'].Text;
end;

procedure TXMLCaseType.Set_SEmailAssignedTo(Value: UnicodeString);
begin
  ChildNodes['sEmailAssignedTo'].NodeValue := Value;
end;

function TXMLCaseType.Get_IxPersonOpenedBy: UnicodeString;
begin
  Result := ChildNodes['ixPersonOpenedBy'].Text;
end;

procedure TXMLCaseType.Set_IxPersonOpenedBy(Value: UnicodeString);
begin
  ChildNodes['ixPersonOpenedBy'].NodeValue := Value;
end;

function TXMLCaseType.Get_IxPersonResolvedBy: UnicodeString;
begin
  Result := ChildNodes['ixPersonResolvedBy'].Text;
end;

procedure TXMLCaseType.Set_IxPersonResolvedBy(Value: UnicodeString);
begin
  ChildNodes['ixPersonResolvedBy'].NodeValue := Value;
end;

function TXMLCaseType.Get_IxPersonClosedBy: UnicodeString;
begin
  Result := ChildNodes['ixPersonClosedBy'].Text;
end;

procedure TXMLCaseType.Set_IxPersonClosedBy(Value: UnicodeString);
begin
  ChildNodes['ixPersonClosedBy'].NodeValue := Value;
end;

function TXMLCaseType.Get_IxPersonLastEditedBy: UnicodeString;
begin
  Result := ChildNodes['ixPersonLastEditedBy'].Text;
end;

procedure TXMLCaseType.Set_IxPersonLastEditedBy(Value: UnicodeString);
begin
  ChildNodes['ixPersonLastEditedBy'].NodeValue := Value;
end;

function TXMLCaseType.Get_IxStatus: UnicodeString;
begin
  Result := ChildNodes['ixStatus'].Text;
end;

procedure TXMLCaseType.Set_IxStatus(Value: UnicodeString);
begin
  ChildNodes['ixStatus'].NodeValue := Value;
end;

function TXMLCaseType.Get_SStatus: UnicodeString;
begin
  Result := ChildNodes['sStatus'].Text;
end;

procedure TXMLCaseType.Set_SStatus(Value: UnicodeString);
begin
  ChildNodes['sStatus'].NodeValue := Value;
end;

function TXMLCaseType.Get_IxPriority: UnicodeString;
begin
  Result := ChildNodes['ixPriority'].Text;
end;

procedure TXMLCaseType.Set_IxPriority(Value: UnicodeString);
begin
  ChildNodes['ixPriority'].NodeValue := Value;
end;

function TXMLCaseType.Get_SPriority: UnicodeString;
begin
  Result := ChildNodes['sPriority'].Text;
end;

procedure TXMLCaseType.Set_SPriority(Value: UnicodeString);
begin
  ChildNodes['sPriority'].NodeValue := Value;
end;

function TXMLCaseType.Get_IxFixFor: UnicodeString;
begin
  Result := ChildNodes['ixFixFor'].Text;
end;

procedure TXMLCaseType.Set_IxFixFor(Value: UnicodeString);
begin
  ChildNodes['ixFixFor'].NodeValue := Value;
end;

function TXMLCaseType.Get_SFixFor: UnicodeString;
begin
  Result := ChildNodes['sFixFor'].Text;
end;

procedure TXMLCaseType.Set_SFixFor(Value: UnicodeString);
begin
  ChildNodes['sFixFor'].NodeValue := Value;
end;

function TXMLCaseType.Get_DtFixFor: UnicodeString;
begin
  Result := ChildNodes['dtFixFor'].Text;
end;

procedure TXMLCaseType.Set_DtFixFor(Value: UnicodeString);
begin
  ChildNodes['dtFixFor'].NodeValue := Value;
end;

function TXMLCaseType.Get_SVersion: UnicodeString;
begin
  Result := ChildNodes['sVersion'].Text;
end;

procedure TXMLCaseType.Set_SVersion(Value: UnicodeString);
begin
  ChildNodes['sVersion'].NodeValue := Value;
end;

function TXMLCaseType.Get_SComputer: UnicodeString;
begin
  Result := ChildNodes['sComputer'].Text;
end;

procedure TXMLCaseType.Set_SComputer(Value: UnicodeString);
begin
  ChildNodes['sComputer'].NodeValue := Value;
end;

function TXMLCaseType.Get_HrsOrigEst: Integer;
begin
  Result := ChildNodes['hrsOrigEst'].NodeValue;
end;

procedure TXMLCaseType.Set_HrsOrigEst(Value: Integer);
begin
  ChildNodes['hrsOrigEst'].NodeValue := Value;
end;

function TXMLCaseType.Get_HrsCurrEst: Integer;
begin
  Result := ChildNodes['hrsCurrEst'].NodeValue;
end;

procedure TXMLCaseType.Set_HrsCurrEst(Value: Integer);
begin
  ChildNodes['hrsCurrEst'].NodeValue := Value;
end;

function TXMLCaseType.Get_HrsElapsed: Integer;
begin
  Result := ChildNodes['hrsElapsed'].NodeValue;
end;

procedure TXMLCaseType.Set_HrsElapsed(Value: Integer);
begin
  ChildNodes['hrsElapsed'].NodeValue := Value;
end;

function TXMLCaseType.Get_C: Integer;
begin
  Result := ChildNodes[WideString('c')].NodeValue;
end;

procedure TXMLCaseType.Set_C(Value: Integer);
begin
  ChildNodes[WideString('c')].NodeValue := Value;
end;

function TXMLCaseType.Get_SCustomerEmail: UnicodeString;
begin
  Result := ChildNodes['sCustomerEmail'].Text;
end;

procedure TXMLCaseType.Set_SCustomerEmail(Value: UnicodeString);
begin
  ChildNodes['sCustomerEmail'].NodeValue := Value;
end;

function TXMLCaseType.Get_IxMailbox: Integer;
begin
  Result := ChildNodes['ixMailbox'].NodeValue;
end;

procedure TXMLCaseType.Set_IxMailbox(Value: Integer);
begin
  ChildNodes['ixMailbox'].NodeValue := Value;
end;

function TXMLCaseType.Get_IxCategory: Integer;
begin
  Result := ChildNodes['ixCategory'].NodeValue;
end;

procedure TXMLCaseType.Set_IxCategory(Value: Integer);
begin
  ChildNodes['ixCategory'].NodeValue := Value;
end;

function TXMLCaseType.Get_DtOpened: UnicodeString;
begin
  Result := ChildNodes['dtOpened'].Text;
end;

procedure TXMLCaseType.Set_DtOpened(Value: UnicodeString);
begin
  ChildNodes['dtOpened'].NodeValue := Value;
end;

function TXMLCaseType.Get_DtResolved: UnicodeString;
begin
  Result := ChildNodes['dtResolved'].Text;
end;

procedure TXMLCaseType.Set_DtResolved(Value: UnicodeString);
begin
  ChildNodes['dtResolved'].NodeValue := Value;
end;

function TXMLCaseType.Get_DtClosed: UnicodeString;
begin
  Result := ChildNodes['dtClosed'].Text;
end;

procedure TXMLCaseType.Set_DtClosed(Value: UnicodeString);
begin
  ChildNodes['dtClosed'].NodeValue := Value;
end;

function TXMLCaseType.Get_IxBugEventLatest: Integer;
begin
  Result := ChildNodes['ixBugEventLatest'].NodeValue;
end;

procedure TXMLCaseType.Set_IxBugEventLatest(Value: Integer);
begin
  ChildNodes['ixBugEventLatest'].NodeValue := Value;
end;

function TXMLCaseType.Get_FReplied: UnicodeString;
begin
  Result := ChildNodes['fReplied'].Text;
end;

procedure TXMLCaseType.Set_FReplied(Value: UnicodeString);
begin
  ChildNodes['fReplied'].NodeValue := Value;
end;

function TXMLCaseType.Get_FForwarded: UnicodeString;
begin
  Result := ChildNodes['fForwarded'].Text;
end;

procedure TXMLCaseType.Set_FForwarded(Value: UnicodeString);
begin
  ChildNodes['fForwarded'].NodeValue := Value;
end;

function TXMLCaseType.Get_STicket: UnicodeString;
begin
  Result := ChildNodes['sTicket'].Text;
end;

procedure TXMLCaseType.Set_STicket(Value: UnicodeString);
begin
  ChildNodes['sTicket'].NodeValue := Value;
end;

function TXMLCaseType.Get_IxDiscussTopic: Integer;
begin
  Result := ChildNodes['ixDiscussTopic'].NodeValue;
end;

procedure TXMLCaseType.Set_IxDiscussTopic(Value: Integer);
begin
  ChildNodes['ixDiscussTopic'].NodeValue := Value;
end;

function TXMLCaseType.Get_DtDue: UnicodeString;
begin
  Result := ChildNodes['dtDue'].Text;
end;

procedure TXMLCaseType.Set_DtDue(Value: UnicodeString);
begin
  ChildNodes['dtDue'].NodeValue := Value;
end;

function TXMLCaseType.Get_SReleaseNotes: UnicodeString;
begin
  Result := ChildNodes['sReleaseNotes'].Text;
end;

procedure TXMLCaseType.Set_SReleaseNotes(Value: UnicodeString);
begin
  ChildNodes['sReleaseNotes'].NodeValue := Value;
end;

function TXMLCaseType.Get_IxBugEventLastView: Integer;
begin
  Result := ChildNodes['ixBugEventLastView'].NodeValue;
end;

procedure TXMLCaseType.Set_IxBugEventLastView(Value: Integer);
begin
  ChildNodes['ixBugEventLastView'].NodeValue := Value;
end;

function TXMLCaseType.Get_DtLastView: UnicodeString;
begin
  Result := ChildNodes['dtLastView'].Text;
end;

procedure TXMLCaseType.Set_DtLastView(Value: UnicodeString);
begin
  ChildNodes['dtLastView'].NodeValue := Value;
end;

function TXMLCaseType.Get_SCategory: UnicodeString;
begin
  Result := ChildNodes['sCategory'].Text;
end;

procedure TXMLCaseType.Set_SCategory(Value: UnicodeString);
begin
  ChildNodes['sCategory'].NodeValue := Value;
end;

function TXMLCaseType.Get_DtLastUpdated: UnicodeString;
begin
  Result := ChildNodes['dtLastUpdated'].Text;
end;

procedure TXMLCaseType.Set_DtLastUpdated(Value: UnicodeString);
begin
  ChildNodes['dtLastUpdated'].NodeValue := Value;
end;

function TXMLCaseType.Get_IxRelatedBugs: UnicodeString;
begin
  Result := ChildNodes['ixRelatedBugs'].Text;
end;

procedure TXMLCaseType.Set_IxRelatedBugs(Value: UnicodeString);
begin
  ChildNodes['ixRelatedBugs'].NodeValue := Value;
end;

function TXMLCaseType.Get_SScoutDescription: UnicodeString;
begin
  Result := ChildNodes['sScoutDescription'].Text;
end;

procedure TXMLCaseType.Set_SScoutDescription(Value: UnicodeString);
begin
  ChildNodes['sScoutDescription'].NodeValue := Value;
end;

function TXMLCaseType.Get_SScoutMessage: UnicodeString;
begin
  Result := ChildNodes['sScoutMessage'].Text;
end;

procedure TXMLCaseType.Set_SScoutMessage(Value: UnicodeString);
begin
  ChildNodes['sScoutMessage'].NodeValue := Value;
end;

function TXMLCaseType.Get_FScoutStopReporting: UnicodeString;
begin
  Result := ChildNodes['fScoutStopReporting'].Text;
end;

procedure TXMLCaseType.Set_FScoutStopReporting(Value: UnicodeString);
begin
  ChildNodes['fScoutStopReporting'].NodeValue := Value;
end;

function TXMLCaseType.Get_FSubscribed: UnicodeString;
begin
  Result := ChildNodes['fSubscribed'].Text;
end;

procedure TXMLCaseType.Set_FSubscribed(Value: UnicodeString);
begin
  ChildNodes['fSubscribed'].NodeValue := Value;
end;

end.