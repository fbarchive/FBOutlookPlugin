
{***************************************************************}
{                                                               }
{                       XML Data Binding                        }
{                                                               }
{         Generated on: 21-12-2009 14:29:42                     }
{       Generated from: H:\svn\FBPlugin\api-xml\listAreas.xml   }
{                                                               }
{***************************************************************}

unit listAreas;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLResponseType = interface;
  IXMLAreasType = interface;
  IXMLAreaType = interface;

{ IXMLResponseType }

  IXMLResponseType = interface(IXMLNode)
    ['{F3287A03-6B39-4E8F-B89D-D3EC980D59C0}']
    { Property Accessors }
    function Get_Areas: IXMLAreasType;
    { Methods & Properties }
    property Areas: IXMLAreasType read Get_Areas;
  end;

{ IXMLAreasType }

  IXMLAreasType = interface(IXMLNodeCollection)
    ['{F4976205-D7EF-4644-AE6E-554357025354}']
    { Property Accessors }
    function Get_Area(Index: Integer): IXMLAreaType;
    { Methods & Properties }
    function Add: IXMLAreaType;
    function Insert(const Index: Integer): IXMLAreaType;
    property Area[Index: Integer]: IXMLAreaType read Get_Area; default;
  end;

{ IXMLAreaType }

  IXMLAreaType = interface(IXMLNode)
    ['{84D76074-4F96-493D-9ED3-85560FF47D7B}']
    { Property Accessors }
    function Get_IxArea: UnicodeString;
    function Get_SArea: UnicodeString;
    function Get_IxProject: UnicodeString;
    function Get_IxPersonOwner: UnicodeString;
    function Get_SPersonOwner: UnicodeString;
    function Get_SProject: UnicodeString;
    function Get_NType: UnicodeString;
    function Get_CDoc: UnicodeString;
    procedure Set_IxArea(Value: UnicodeString);
    procedure Set_SArea(Value: UnicodeString);
    procedure Set_IxProject(Value: UnicodeString);
    procedure Set_IxPersonOwner(Value: UnicodeString);
    procedure Set_SPersonOwner(Value: UnicodeString);
    procedure Set_SProject(Value: UnicodeString);
    procedure Set_NType(Value: UnicodeString);
    procedure Set_CDoc(Value: UnicodeString);
    { Methods & Properties }
    property IxArea: UnicodeString read Get_IxArea write Set_IxArea;
    property SArea: UnicodeString read Get_SArea write Set_SArea;
    property IxProject: UnicodeString read Get_IxProject write Set_IxProject;
    property IxPersonOwner: UnicodeString read Get_IxPersonOwner write Set_IxPersonOwner;
    property SPersonOwner: UnicodeString read Get_SPersonOwner write Set_SPersonOwner;
    property SProject: UnicodeString read Get_SProject write Set_SProject;
    property NType: UnicodeString read Get_NType write Set_NType;
    property CDoc: UnicodeString read Get_CDoc write Set_CDoc;
  end;

{ Forward Decls }

  TXMLResponseType = class;
  TXMLAreasType = class;
  TXMLAreaType = class;

{ TXMLResponseType }

  TXMLResponseType = class(TXMLNode, IXMLResponseType)
  protected
    { IXMLResponseType }
    function Get_Areas: IXMLAreasType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLAreasType }

  TXMLAreasType = class(TXMLNodeCollection, IXMLAreasType)
  protected
    { IXMLAreasType }
    function Get_Area(Index: Integer): IXMLAreaType;
    function Add: IXMLAreaType;
    function Insert(const Index: Integer): IXMLAreaType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLAreaType }

  TXMLAreaType = class(TXMLNode, IXMLAreaType)
  protected
    { IXMLAreaType }
    function Get_IxArea: UnicodeString;
    function Get_SArea: UnicodeString;
    function Get_IxProject: UnicodeString;
    function Get_IxPersonOwner: UnicodeString;
    function Get_SPersonOwner: UnicodeString;
    function Get_SProject: UnicodeString;
    function Get_NType: UnicodeString;
    function Get_CDoc: UnicodeString;
    procedure Set_IxArea(Value: UnicodeString);
    procedure Set_SArea(Value: UnicodeString);
    procedure Set_IxProject(Value: UnicodeString);
    procedure Set_IxPersonOwner(Value: UnicodeString);
    procedure Set_SPersonOwner(Value: UnicodeString);
    procedure Set_SProject(Value: UnicodeString);
    procedure Set_NType(Value: UnicodeString);
    procedure Set_CDoc(Value: UnicodeString);
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
  RegisterChildNode('areas', TXMLAreasType);
  inherited;
end;

function TXMLResponseType.Get_Areas: IXMLAreasType;
begin
  Result := ChildNodes['areas'] as IXMLAreasType;
end;

{ TXMLAreasType }

procedure TXMLAreasType.AfterConstruction;
begin
  RegisterChildNode('area', TXMLAreaType);
  ItemTag := 'area';
  ItemInterface := IXMLAreaType;
  inherited;
end;

function TXMLAreasType.Get_Area(Index: Integer): IXMLAreaType;
begin
  Result := List[Index] as IXMLAreaType;
end;

function TXMLAreasType.Add: IXMLAreaType;
begin
  Result := AddItem(-1) as IXMLAreaType;
end;

function TXMLAreasType.Insert(const Index: Integer): IXMLAreaType;
begin
  Result := AddItem(Index) as IXMLAreaType;
end;

{ TXMLAreaType }

function TXMLAreaType.Get_IxArea: UnicodeString;
begin
  Result := ChildNodes['ixArea'].Text;
end;

procedure TXMLAreaType.Set_IxArea(Value: UnicodeString);
begin
  ChildNodes['ixArea'].NodeValue := Value;
end;

function TXMLAreaType.Get_SArea: UnicodeString;
begin
  Result := ChildNodes['sArea'].Text;
end;

procedure TXMLAreaType.Set_SArea(Value: UnicodeString);
begin
  ChildNodes['sArea'].NodeValue := Value;
end;

function TXMLAreaType.Get_IxProject: UnicodeString;
begin
  Result := ChildNodes['ixProject'].Text;
end;

procedure TXMLAreaType.Set_IxProject(Value: UnicodeString);
begin
  ChildNodes['ixProject'].NodeValue := Value;
end;

function TXMLAreaType.Get_IxPersonOwner: UnicodeString;
begin
  Result := ChildNodes['ixPersonOwner'].Text;
end;

procedure TXMLAreaType.Set_IxPersonOwner(Value: UnicodeString);
begin
  ChildNodes['ixPersonOwner'].NodeValue := Value;
end;

function TXMLAreaType.Get_SPersonOwner: UnicodeString;
begin
  Result := ChildNodes['sPersonOwner'].Text;
end;

procedure TXMLAreaType.Set_SPersonOwner(Value: UnicodeString);
begin
  ChildNodes['sPersonOwner'].NodeValue := Value;
end;

function TXMLAreaType.Get_SProject: UnicodeString;
begin
  Result := ChildNodes['sProject'].Text;
end;

procedure TXMLAreaType.Set_SProject(Value: UnicodeString);
begin
  ChildNodes['sProject'].NodeValue := Value;
end;

function TXMLAreaType.Get_NType: UnicodeString;
begin
  Result := ChildNodes['nType'].Text;
end;

procedure TXMLAreaType.Set_NType(Value: UnicodeString);
begin
  ChildNodes['nType'].NodeValue := Value;
end;

function TXMLAreaType.Get_CDoc: UnicodeString;
begin
  Result := ChildNodes['cDoc'].Text;
end;

procedure TXMLAreaType.Set_CDoc(Value: UnicodeString);
begin
  ChildNodes['cDoc'].NodeValue := Value;
end;

end.