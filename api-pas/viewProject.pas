
{************************************************************************}
{                                                                        }
{                            XML Data Binding                            }
{                                                                        }
{         Generated on: 22-12-2009 10:11:41                              }
{       Generated from: H:\svn\FBOutlookPlugin\api-xml\viewProject.xml   }
{                                                                        }
{************************************************************************}

unit viewProject;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLResponseType = interface;
  IXMLProjectType = interface;

{ IXMLResponseType }

  IXMLResponseType = interface(IXMLNode)
    ['{72B26B65-569D-40CE-9F92-EC6DF6A225AB}']
    { Property Accessors }
    function Get_Project: IXMLProjectType;
    { Methods & Properties }
    property Project: IXMLProjectType read Get_Project;
  end;

{ IXMLProjectType }

  IXMLProjectType = interface(IXMLNode)
    ['{8334770F-AA9A-4494-97B9-D37ADDE1EC59}']
    { Property Accessors }
    function Get_IxProject: UnicodeString;
    function Get_SProject: UnicodeString;
    function Get_IxPersonOwner: UnicodeString;
    function Get_FInbox: UnicodeString;
    function Get_IxGroup: UnicodeString;
    function Get_FDeleted: UnicodeString;
    function Get_FAllowPublicSubmit: UnicodeString;
    procedure Set_IxProject(Value: UnicodeString);
    procedure Set_SProject(Value: UnicodeString);
    procedure Set_IxPersonOwner(Value: UnicodeString);
    procedure Set_FInbox(Value: UnicodeString);
    procedure Set_IxGroup(Value: UnicodeString);
    procedure Set_FDeleted(Value: UnicodeString);
    procedure Set_FAllowPublicSubmit(Value: UnicodeString);
    { Methods & Properties }
    property IxProject: UnicodeString read Get_IxProject write Set_IxProject;
    property SProject: UnicodeString read Get_SProject write Set_SProject;
    property IxPersonOwner: UnicodeString read Get_IxPersonOwner write Set_IxPersonOwner;
    property FInbox: UnicodeString read Get_FInbox write Set_FInbox;
    property IxGroup: UnicodeString read Get_IxGroup write Set_IxGroup;
    property FDeleted: UnicodeString read Get_FDeleted write Set_FDeleted;
    property FAllowPublicSubmit: UnicodeString read Get_FAllowPublicSubmit write Set_FAllowPublicSubmit;
  end;

{ Forward Decls }

  TXMLResponseType = class;
  TXMLProjectType = class;

{ TXMLResponseType }

  TXMLResponseType = class(TXMLNode, IXMLResponseType)
  protected
    { IXMLResponseType }
    function Get_Project: IXMLProjectType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLProjectType }

  TXMLProjectType = class(TXMLNode, IXMLProjectType)
  protected
    { IXMLProjectType }
    function Get_IxProject: UnicodeString;
    function Get_SProject: UnicodeString;
    function Get_IxPersonOwner: UnicodeString;
    function Get_FInbox: UnicodeString;
    function Get_IxGroup: UnicodeString;
    function Get_FDeleted: UnicodeString;
    function Get_FAllowPublicSubmit: UnicodeString;
    procedure Set_IxProject(Value: UnicodeString);
    procedure Set_SProject(Value: UnicodeString);
    procedure Set_IxPersonOwner(Value: UnicodeString);
    procedure Set_FInbox(Value: UnicodeString);
    procedure Set_IxGroup(Value: UnicodeString);
    procedure Set_FDeleted(Value: UnicodeString);
    procedure Set_FAllowPublicSubmit(Value: UnicodeString);
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
  RegisterChildNode('project', TXMLProjectType);
  inherited;
end;

function TXMLResponseType.Get_Project: IXMLProjectType;
begin
  Result := ChildNodes['project'] as IXMLProjectType;
end;

{ TXMLProjectType }

function TXMLProjectType.Get_IxProject: UnicodeString;
begin
  Result := ChildNodes['ixProject'].Text;
end;

procedure TXMLProjectType.Set_IxProject(Value: UnicodeString);
begin
  ChildNodes['ixProject'].NodeValue := Value;
end;

function TXMLProjectType.Get_SProject: UnicodeString;
begin
  Result := ChildNodes['sProject'].Text;
end;

procedure TXMLProjectType.Set_SProject(Value: UnicodeString);
begin
  ChildNodes['sProject'].NodeValue := Value;
end;

function TXMLProjectType.Get_IxPersonOwner: UnicodeString;
begin
  Result := ChildNodes['ixPersonOwner'].Text;
end;

procedure TXMLProjectType.Set_IxPersonOwner(Value: UnicodeString);
begin
  ChildNodes['ixPersonOwner'].NodeValue := Value;
end;

function TXMLProjectType.Get_FInbox: UnicodeString;
begin
  Result := ChildNodes['fInbox'].Text;
end;

procedure TXMLProjectType.Set_FInbox(Value: UnicodeString);
begin
  ChildNodes['fInbox'].NodeValue := Value;
end;

function TXMLProjectType.Get_IxGroup: UnicodeString;
begin
  Result := ChildNodes['ixGroup'].Text;
end;

procedure TXMLProjectType.Set_IxGroup(Value: UnicodeString);
begin
  ChildNodes['ixGroup'].NodeValue := Value;
end;

function TXMLProjectType.Get_FDeleted: UnicodeString;
begin
  Result := ChildNodes['fDeleted'].Text;
end;

procedure TXMLProjectType.Set_FDeleted(Value: UnicodeString);
begin
  ChildNodes['fDeleted'].NodeValue := Value;
end;

function TXMLProjectType.Get_FAllowPublicSubmit: UnicodeString;
begin
  Result := ChildNodes['fAllowPublicSubmit'].Text;
end;

procedure TXMLProjectType.Set_FAllowPublicSubmit(Value: UnicodeString);
begin
  ChildNodes['fAllowPublicSubmit'].NodeValue := Value;
end;

end.