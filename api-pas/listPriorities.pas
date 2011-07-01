
{********************************************************************}
{                                                                    }
{                          XML Data Binding                          }
{                                                                    }
{         Generated on: 21-12-2009 15:21:31                          }
{       Generated from: H:\svn\FBPlugin\api-xml\listPriorities.xml   }
{   Settings stored in: H:\svn\FBPlugin\api-xml\listPriorities.xdb   }
{                                                                    }
{********************************************************************}

unit listPriorities;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLResponseType = interface;
  IXMLPrioritiesType = interface;
  IXMLPriorityType = interface;

{ IXMLResponseType }

  IXMLResponseType = interface(IXMLNode)
    ['{F93E9A69-0A40-44FF-A9F2-8B0AAC252B66}']
    { Property Accessors }
    function Get_Priorities: IXMLPrioritiesType;
    { Methods & Properties }
    property Priorities: IXMLPrioritiesType read Get_Priorities;
  end;

{ IXMLPrioritiesType }

  IXMLPrioritiesType = interface(IXMLNodeCollection)
    ['{7D2B815D-F4BF-4B35-A4B8-A0D4C320882D}']
    { Property Accessors }
    function Get_Priority(Index: Integer): IXMLPriorityType;
    { Methods & Properties }
    function Add: IXMLPriorityType;
    function Insert(const Index: Integer): IXMLPriorityType;
    property Priority[Index: Integer]: IXMLPriorityType read Get_Priority; default;
  end;

{ IXMLPriorityType }

  IXMLPriorityType = interface(IXMLNode)
    ['{88CD1338-4529-438E-A742-2C622E688629}']
    { Property Accessors }
    function Get_IxPriority: UnicodeString;
    function Get_FDefault: UnicodeString;
    function Get_SPriority: UnicodeString;
    procedure Set_IxPriority(Value: UnicodeString);
    procedure Set_FDefault(Value: UnicodeString);
    procedure Set_SPriority(Value: UnicodeString);
    { Methods & Properties }
    property IxPriority: UnicodeString read Get_IxPriority write Set_IxPriority;
    property FDefault: UnicodeString read Get_FDefault write Set_FDefault;
    property SPriority: UnicodeString read Get_SPriority write Set_SPriority;
  end;

{ Forward Decls }

  TXMLResponseType = class;
  TXMLPrioritiesType = class;
  TXMLPriorityType = class;

{ TXMLResponseType }

  TXMLResponseType = class(TXMLNode, IXMLResponseType)
  protected
    { IXMLResponseType }
    function Get_Priorities: IXMLPrioritiesType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLPrioritiesType }

  TXMLPrioritiesType = class(TXMLNodeCollection, IXMLPrioritiesType)
  protected
    { IXMLPrioritiesType }
    function Get_Priority(Index: Integer): IXMLPriorityType;
    function Add: IXMLPriorityType;
    function Insert(const Index: Integer): IXMLPriorityType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLPriorityType }

  TXMLPriorityType = class(TXMLNode, IXMLPriorityType)
  protected
    { IXMLPriorityType }
    function Get_IxPriority: UnicodeString;
    function Get_FDefault: UnicodeString;
    function Get_SPriority: UnicodeString;
    procedure Set_IxPriority(Value: UnicodeString);
    procedure Set_FDefault(Value: UnicodeString);
    procedure Set_SPriority(Value: UnicodeString);
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
  RegisterChildNode('priorities', TXMLPrioritiesType);
  inherited;
end;

function TXMLResponseType.Get_Priorities: IXMLPrioritiesType;
begin
  Result := ChildNodes['priorities'] as IXMLPrioritiesType;
end;

{ TXMLPrioritiesType }

procedure TXMLPrioritiesType.AfterConstruction;
begin
  RegisterChildNode('priority', TXMLPriorityType);
  ItemTag := 'priority';
  ItemInterface := IXMLPriorityType;
  inherited;
end;

function TXMLPrioritiesType.Get_Priority(Index: Integer): IXMLPriorityType;
begin
  Result := List[Index] as IXMLPriorityType;
end;

function TXMLPrioritiesType.Add: IXMLPriorityType;
begin
  Result := AddItem(-1) as IXMLPriorityType;
end;

function TXMLPrioritiesType.Insert(const Index: Integer): IXMLPriorityType;
begin
  Result := AddItem(Index) as IXMLPriorityType;
end;

{ TXMLPriorityType }

function TXMLPriorityType.Get_IxPriority: UnicodeString;
begin
  Result := ChildNodes['ixPriority'].Text;
end;

procedure TXMLPriorityType.Set_IxPriority(Value: UnicodeString);
begin
  ChildNodes['ixPriority'].NodeValue := Value;
end;

function TXMLPriorityType.Get_FDefault: UnicodeString;
begin
  Result := ChildNodes['fDefault'].Text;
end;

procedure TXMLPriorityType.Set_FDefault(Value: UnicodeString);
begin
  ChildNodes['fDefault'].NodeValue := Value;
end;

function TXMLPriorityType.Get_SPriority: UnicodeString;
begin
  Result := ChildNodes['sPriority'].Text;
end;

procedure TXMLPriorityType.Set_SPriority(Value: UnicodeString);
begin
  ChildNodes['sPriority'].NodeValue := Value;
end;

end.