
{***************************************************************************}
{                                                                           }
{                             XML Data Binding                              }
{                                                                           }
{         Generated on: 24-12-2009 12:46:45                                 }
{       Generated from: H:\svn\FogBugzTools\api-xml\searchProjectArea.xml   }
{                                                                           }
{***************************************************************************}

unit searchProjectArea;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLResponseType = interface;
  IXMLCasesType = interface;
  IXMLCaseType = interface;

{ IXMLResponseType }

  IXMLResponseType = interface(IXMLNode)
    ['{C415FA86-7C9C-42B5-94BD-E743071F8BE0}']
    { Property Accessors }
    function Get_Cases: IXMLCasesType;
    { Methods & Properties }
    property Cases: IXMLCasesType read Get_Cases;
  end;

{ IXMLCasesType }

  IXMLCasesType = interface(IXMLNodeCollection)
    ['{84950D04-C9E3-4F7A-B1C4-EEACD7767116}']
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
    ['{6E2098A9-2E57-4762-AE00-D61484C92B5D}']
    { Property Accessors }
    function Get_IxBug: Integer;
    function Get_Operations: UnicodeString;
    function Get_IxProject: UnicodeString;
    function Get_IxArea: UnicodeString;
    procedure Set_IxBug(Value: Integer);
    procedure Set_Operations(Value: UnicodeString);
    procedure Set_IxProject(Value: UnicodeString);
    procedure Set_IxArea(Value: UnicodeString);
    { Methods & Properties }
    property IxBug: Integer read Get_IxBug write Set_IxBug;
    property Operations: UnicodeString read Get_Operations write Set_Operations;
    property IxProject: UnicodeString read Get_IxProject write Set_IxProject;
    property IxArea: UnicodeString read Get_IxArea write Set_IxArea;
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
    function Get_IxProject: UnicodeString;
    function Get_IxArea: UnicodeString;
    procedure Set_IxBug(Value: Integer);
    procedure Set_Operations(Value: UnicodeString);
    procedure Set_IxProject(Value: UnicodeString);
    procedure Set_IxArea(Value: UnicodeString);
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

procedure TXMLCaseType.Set_IxBug(Value: Integer);
begin
  SetAttribute('ixBug', Value);
end;

function TXMLCaseType.Get_Operations: UnicodeString;
begin
  Result := AttributeNodes['operations'].Text;
end;

procedure TXMLCaseType.Set_Operations(Value: UnicodeString);
begin
  SetAttribute('operations', Value);
end;

function TXMLCaseType.Get_IxProject: UnicodeString;
begin
  Result := ChildNodes['ixProject'].Text;
end;

procedure TXMLCaseType.Set_IxProject(Value: UnicodeString);
begin
  ChildNodes['ixProject'].NodeValue := Value;
end;

function TXMLCaseType.Get_IxArea: UnicodeString;
begin
  Result := ChildNodes['ixArea'].Text;
end;

procedure TXMLCaseType.Set_IxArea(Value: UnicodeString);
begin
  ChildNodes['ixArea'].NodeValue := Value;
end;

end.