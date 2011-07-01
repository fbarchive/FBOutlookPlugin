
{******************************************************************}
{                                                                  }
{                         XML Data Binding                         }
{                                                                  }
{         Generated on: 21-12-2009 14:31:16                        }
{       Generated from: H:\svn\FBPlugin\api-xml\listProjects.xml   }
{                                                                  }
{******************************************************************}

unit listProjects;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLResponseType = interface;
  IXMLProjectsType = interface;
  IXMLProjectType = interface;

{ IXMLResponseType }

  IXMLResponseType = interface(IXMLNode)
    ['{C0F590BD-06B7-469E-98BD-1099F36300AD}']
    { Property Accessors }
    function Get_Projects: IXMLProjectsType;
    { Methods & Properties }
    property Projects: IXMLProjectsType read Get_Projects;
  end;

{ IXMLProjectsType }

  IXMLProjectsType = interface(IXMLNodeCollection)
    ['{025881DE-F2A0-409A-8EBC-3304EC27F765}']
    { Property Accessors }
    function Get_Project(Index: Integer): IXMLProjectType;
    { Methods & Properties }
    function Add: IXMLProjectType;
    function Insert(const Index: Integer): IXMLProjectType;
    property Project[Index: Integer]: IXMLProjectType read Get_Project; default;
  end;

{ IXMLProjectType }

  IXMLProjectType = interface(IXMLNode)
    ['{506187F8-7DE1-49EE-9552-10C5537F5E5B}']
    { Property Accessors }
    function Get_IxProject: UnicodeString;
    function Get_SProject: UnicodeString;
    function Get_IxPersonOwner: UnicodeString;
    function Get_SPersonOwner: UnicodeString;
    function Get_SEmail: UnicodeString;
    function Get_SPhone: UnicodeString;
    function Get_FInbox: UnicodeString;
    function Get_IxGroup: UnicodeString;
    function Get_IType: UnicodeString;
    function Get_SGroup: UnicodeString;
    procedure Set_IxProject(Value: UnicodeString);
    procedure Set_SProject(Value: UnicodeString);
    procedure Set_IxPersonOwner(Value: UnicodeString);
    procedure Set_SPersonOwner(Value: UnicodeString);
    procedure Set_SEmail(Value: UnicodeString);
    procedure Set_SPhone(Value: UnicodeString);
    procedure Set_FInbox(Value: UnicodeString);
    procedure Set_IxGroup(Value: UnicodeString);
    procedure Set_IType(Value: UnicodeString);
    procedure Set_SGroup(Value: UnicodeString);
    { Methods & Properties }
    property IxProject: UnicodeString read Get_IxProject write Set_IxProject;
    property SProject: UnicodeString read Get_SProject write Set_SProject;
    property IxPersonOwner: UnicodeString read Get_IxPersonOwner write Set_IxPersonOwner;
    property SPersonOwner: UnicodeString read Get_SPersonOwner write Set_SPersonOwner;
    property SEmail: UnicodeString read Get_SEmail write Set_SEmail;
    property SPhone: UnicodeString read Get_SPhone write Set_SPhone;
    property FInbox: UnicodeString read Get_FInbox write Set_FInbox;
    property IxGroup: UnicodeString read Get_IxGroup write Set_IxGroup;
    property IType: UnicodeString read Get_IType write Set_IType;
    property SGroup: UnicodeString read Get_SGroup write Set_SGroup;
  end;

{ Forward Decls }

  TXMLResponseType = class;
  TXMLProjectsType = class;
  TXMLProjectType = class;

{ TXMLResponseType }

  TXMLResponseType = class(TXMLNode, IXMLResponseType)
  protected
    { IXMLResponseType }
    function Get_Projects: IXMLProjectsType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLProjectsType }

  TXMLProjectsType = class(TXMLNodeCollection, IXMLProjectsType)
  protected
    { IXMLProjectsType }
    function Get_Project(Index: Integer): IXMLProjectType;
    function Add: IXMLProjectType;
    function Insert(const Index: Integer): IXMLProjectType;
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
    function Get_SPersonOwner: UnicodeString;
    function Get_SEmail: UnicodeString;
    function Get_SPhone: UnicodeString;
    function Get_FInbox: UnicodeString;
    function Get_IxGroup: UnicodeString;
    function Get_IType: UnicodeString;
    function Get_SGroup: UnicodeString;
    procedure Set_IxProject(Value: UnicodeString);
    procedure Set_SProject(Value: UnicodeString);
    procedure Set_IxPersonOwner(Value: UnicodeString);
    procedure Set_SPersonOwner(Value: UnicodeString);
    procedure Set_SEmail(Value: UnicodeString);
    procedure Set_SPhone(Value: UnicodeString);
    procedure Set_FInbox(Value: UnicodeString);
    procedure Set_IxGroup(Value: UnicodeString);
    procedure Set_IType(Value: UnicodeString);
    procedure Set_SGroup(Value: UnicodeString);
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
  RegisterChildNode('projects', TXMLProjectsType);
  inherited;
end;

function TXMLResponseType.Get_Projects: IXMLProjectsType;
begin
  Result := ChildNodes['projects'] as IXMLProjectsType;
end;

{ TXMLProjectsType }

procedure TXMLProjectsType.AfterConstruction;
begin
  RegisterChildNode('project', TXMLProjectType);
  ItemTag := 'project';
  ItemInterface := IXMLProjectType;
  inherited;
end;

function TXMLProjectsType.Get_Project(Index: Integer): IXMLProjectType;
begin
  Result := List[Index] as IXMLProjectType;
end;

function TXMLProjectsType.Add: IXMLProjectType;
begin
  Result := AddItem(-1) as IXMLProjectType;
end;

function TXMLProjectsType.Insert(const Index: Integer): IXMLProjectType;
begin
  Result := AddItem(Index) as IXMLProjectType;
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

function TXMLProjectType.Get_SPersonOwner: UnicodeString;
begin
  Result := ChildNodes['sPersonOwner'].Text;
end;

procedure TXMLProjectType.Set_SPersonOwner(Value: UnicodeString);
begin
  ChildNodes['sPersonOwner'].NodeValue := Value;
end;

function TXMLProjectType.Get_SEmail: UnicodeString;
begin
  Result := ChildNodes['sEmail'].Text;
end;

procedure TXMLProjectType.Set_SEmail(Value: UnicodeString);
begin
  ChildNodes['sEmail'].NodeValue := Value;
end;

function TXMLProjectType.Get_SPhone: UnicodeString;
begin
  Result := ChildNodes['sPhone'].Text;
end;

procedure TXMLProjectType.Set_SPhone(Value: UnicodeString);
begin
  ChildNodes['sPhone'].NodeValue := Value;
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

function TXMLProjectType.Get_IType: UnicodeString;
begin
  Result := ChildNodes['iType'].Text;
end;

procedure TXMLProjectType.Set_IType(Value: UnicodeString);
begin
  ChildNodes['iType'].NodeValue := Value;
end;

function TXMLProjectType.Get_SGroup: UnicodeString;
begin
  Result := ChildNodes['sGroup'].Text;
end;

procedure TXMLProjectType.Set_SGroup(Value: UnicodeString);
begin
  ChildNodes['sGroup'].NodeValue := Value;
end;

end.