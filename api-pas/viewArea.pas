
{******************************************************************}
{                                                                  }
{                         XML Data Binding                         }
{                                                                  }
{         Generated on: 24-12-2009 14:20:40                        }
{       Generated from: H:\svn\FogBugzTools\api-xml\viewArea.xml   }
{                                                                  }
{******************************************************************}

unit viewArea;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLResponseType = interface;
  IXMLAreaType = interface;

{ IXMLResponseType }

  IXMLResponseType = interface(IXMLNode)
    ['{0464AD67-6495-4776-91FA-0957C793A09C}']
    { Property Accessors }
    function Get_Area: IXMLAreaType;
    { Methods & Properties }
    property Area: IXMLAreaType read Get_Area;
  end;

{ IXMLAreaType }

  IXMLAreaType = interface(IXMLNode)
    ['{E484263F-47F0-439D-8F91-C26044A12E84}']
    { Property Accessors }
    function Get_IxArea: UnicodeString;
    function Get_SArea: UnicodeString;
    function Get_IxProject: Integer;
    function Get_SProject: UnicodeString;
    function Get_IxPersonOwner: UnicodeString;
    function Get_NType: Integer;
    function Get_CDoc: Integer;
    function Get_FDeleted: UnicodeString;
    procedure Set_IxArea(Value: UnicodeString);
    procedure Set_SArea(Value: UnicodeString);
    procedure Set_IxProject(Value: Integer);
    procedure Set_SProject(Value: UnicodeString);
    procedure Set_IxPersonOwner(Value: UnicodeString);
    procedure Set_NType(Value: Integer);
    procedure Set_CDoc(Value: Integer);
    procedure Set_FDeleted(Value: UnicodeString);
    { Methods & Properties }
    property IxArea: UnicodeString read Get_IxArea write Set_IxArea;
    property SArea: UnicodeString read Get_SArea write Set_SArea;
    property IxProject: Integer read Get_IxProject write Set_IxProject;
    property SProject: UnicodeString read Get_SProject write Set_SProject;
    property IxPersonOwner: UnicodeString read Get_IxPersonOwner write Set_IxPersonOwner;
    property NType: Integer read Get_NType write Set_NType;
    property CDoc: Integer read Get_CDoc write Set_CDoc;
    property FDeleted: UnicodeString read Get_FDeleted write Set_FDeleted;
  end;

{ Forward Decls }

  TXMLResponseType = class;
  TXMLAreaType = class;

{ TXMLResponseType }

  TXMLResponseType = class(TXMLNode, IXMLResponseType)
  protected
    { IXMLResponseType }
    function Get_Area: IXMLAreaType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLAreaType }

  TXMLAreaType = class(TXMLNode, IXMLAreaType)
  protected
    { IXMLAreaType }
    function Get_IxArea: UnicodeString;
    function Get_SArea: UnicodeString;
    function Get_IxProject: Integer;
    function Get_SProject: UnicodeString;
    function Get_IxPersonOwner: UnicodeString;
    function Get_NType: Integer;
    function Get_CDoc: Integer;
    function Get_FDeleted: UnicodeString;
    procedure Set_IxArea(Value: UnicodeString);
    procedure Set_SArea(Value: UnicodeString);
    procedure Set_IxProject(Value: Integer);
    procedure Set_SProject(Value: UnicodeString);
    procedure Set_IxPersonOwner(Value: UnicodeString);
    procedure Set_NType(Value: Integer);
    procedure Set_CDoc(Value: Integer);
    procedure Set_FDeleted(Value: UnicodeString);
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
  RegisterChildNode('area', TXMLAreaType);
  inherited;
end;

function TXMLResponseType.Get_Area: IXMLAreaType;
begin
  Result := ChildNodes['area'] as IXMLAreaType;
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

function TXMLAreaType.Get_IxProject: Integer;
begin
  Result := ChildNodes['ixProject'].NodeValue;
end;

procedure TXMLAreaType.Set_IxProject(Value: Integer);
begin
  ChildNodes['ixProject'].NodeValue := Value;
end;

function TXMLAreaType.Get_SProject: UnicodeString;
begin
  Result := ChildNodes['sProject'].Text;
end;

procedure TXMLAreaType.Set_SProject(Value: UnicodeString);
begin
  ChildNodes['sProject'].NodeValue := Value;
end;

function TXMLAreaType.Get_IxPersonOwner: UnicodeString;
begin
  Result := ChildNodes['ixPersonOwner'].Text;
end;

procedure TXMLAreaType.Set_IxPersonOwner(Value: UnicodeString);
begin
  ChildNodes['ixPersonOwner'].NodeValue := Value;
end;

function TXMLAreaType.Get_NType: Integer;
begin
  Result := ChildNodes['nType'].NodeValue;
end;

procedure TXMLAreaType.Set_NType(Value: Integer);
begin
  ChildNodes['nType'].NodeValue := Value;
end;

function TXMLAreaType.Get_CDoc: Integer;
begin
  Result := ChildNodes['cDoc'].NodeValue;
end;

procedure TXMLAreaType.Set_CDoc(Value: Integer);
begin
  ChildNodes['cDoc'].NodeValue := Value;
end;

function TXMLAreaType.Get_FDeleted: UnicodeString;
begin
  Result := ChildNodes['fDeleted'].Text;
end;

procedure TXMLAreaType.Set_FDeleted(Value: UnicodeString);
begin
  ChildNodes['fDeleted'].NodeValue := Value;
end;

end.