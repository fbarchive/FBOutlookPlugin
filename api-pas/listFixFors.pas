
{*****************************************************************}
{                                                                 }
{                        XML Data Binding                         }
{                                                                 }
{         Generated on: 21-12-2009 14:50:00                       }
{       Generated from: H:\svn\FBPlugin\api-xml\listFixFors.xml   }
{                                                                 }
{*****************************************************************}

unit listFixFors;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLResponseType = interface;
  IXMLFixforsType = interface;
  IXMLFixforType = interface;

{ IXMLResponseType }

  IXMLResponseType = interface(IXMLNode)
    ['{4127FB9B-317C-442D-8390-66751EAD4151}']
    { Property Accessors }
    function Get_Fixfors: IXMLFixforsType;
    { Methods & Properties }
    property Fixfors: IXMLFixforsType read Get_Fixfors;
  end;

{ IXMLFixforsType }

  IXMLFixforsType = interface(IXMLNodeCollection)
    ['{3A2E7EDF-A7E9-4BF0-92EC-51E894B63660}']
    { Property Accessors }
    function Get_Fixfor(Index: Integer): IXMLFixforType;
    { Methods & Properties }
    function Add: IXMLFixforType;
    function Insert(const Index: Integer): IXMLFixforType;
    property Fixfor[Index: Integer]: IXMLFixforType read Get_Fixfor; default;
  end;

{ IXMLFixforType }

  IXMLFixforType = interface(IXMLNode)
    ['{8DBB127F-9397-49DE-9832-D836FD2FC968}']
    { Property Accessors }
    function Get_IxFixFor: UnicodeString;
    function Get_SFixFor: UnicodeString;
    function Get_FDeleted: UnicodeString;
    function Get_Dt: UnicodeString;
    function Get_IxProject: UnicodeString;
    function Get_SProject: UnicodeString;
    procedure Set_IxFixFor(Value: UnicodeString);
    procedure Set_SFixFor(Value: UnicodeString);
    procedure Set_FDeleted(Value: UnicodeString);
    procedure Set_Dt(Value: UnicodeString);
    procedure Set_IxProject(Value: UnicodeString);
    procedure Set_SProject(Value: UnicodeString);
    { Methods & Properties }
    property IxFixFor: UnicodeString read Get_IxFixFor write Set_IxFixFor;
    property SFixFor: UnicodeString read Get_SFixFor write Set_SFixFor;
    property FDeleted: UnicodeString read Get_FDeleted write Set_FDeleted;
    property Dt: UnicodeString read Get_Dt write Set_Dt;
    property IxProject: UnicodeString read Get_IxProject write Set_IxProject;
    property SProject: UnicodeString read Get_SProject write Set_SProject;
  end;

{ Forward Decls }

  TXMLResponseType = class;
  TXMLFixforsType = class;
  TXMLFixforType = class;

{ TXMLResponseType }

  TXMLResponseType = class(TXMLNode, IXMLResponseType)
  protected
    { IXMLResponseType }
    function Get_Fixfors: IXMLFixforsType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLFixforsType }

  TXMLFixforsType = class(TXMLNodeCollection, IXMLFixforsType)
  protected
    { IXMLFixforsType }
    function Get_Fixfor(Index: Integer): IXMLFixforType;
    function Add: IXMLFixforType;
    function Insert(const Index: Integer): IXMLFixforType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLFixforType }

  TXMLFixforType = class(TXMLNode, IXMLFixforType)
  protected
    { IXMLFixforType }
    function Get_IxFixFor: UnicodeString;
    function Get_SFixFor: UnicodeString;
    function Get_FDeleted: UnicodeString;
    function Get_Dt: UnicodeString;
    function Get_IxProject: UnicodeString;
    function Get_SProject: UnicodeString;
    procedure Set_IxFixFor(Value: UnicodeString);
    procedure Set_SFixFor(Value: UnicodeString);
    procedure Set_FDeleted(Value: UnicodeString);
    procedure Set_Dt(Value: UnicodeString);
    procedure Set_IxProject(Value: UnicodeString);
    procedure Set_SProject(Value: UnicodeString);
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
  RegisterChildNode('fixfors', TXMLFixforsType);
  inherited;
end;

function TXMLResponseType.Get_Fixfors: IXMLFixforsType;
begin
  Result := ChildNodes['fixfors'] as IXMLFixforsType;
end;

{ TXMLFixforsType }

procedure TXMLFixforsType.AfterConstruction;
begin
  RegisterChildNode('fixfor', TXMLFixforType);
  ItemTag := 'fixfor';
  ItemInterface := IXMLFixforType;
  inherited;
end;

function TXMLFixforsType.Get_Fixfor(Index: Integer): IXMLFixforType;
begin
  Result := List[Index] as IXMLFixforType;
end;

function TXMLFixforsType.Add: IXMLFixforType;
begin
  Result := AddItem(-1) as IXMLFixforType;
end;

function TXMLFixforsType.Insert(const Index: Integer): IXMLFixforType;
begin
  Result := AddItem(Index) as IXMLFixforType;
end;

{ TXMLFixforType }

function TXMLFixforType.Get_IxFixFor: UnicodeString;
begin
  Result := ChildNodes['ixFixFor'].Text;
end;

procedure TXMLFixforType.Set_IxFixFor(Value: UnicodeString);
begin
  ChildNodes['ixFixFor'].NodeValue := Value;
end;

function TXMLFixforType.Get_SFixFor: UnicodeString;
begin
  Result := ChildNodes['sFixFor'].Text;
end;

procedure TXMLFixforType.Set_SFixFor(Value: UnicodeString);
begin
  ChildNodes['sFixFor'].NodeValue := Value;
end;

function TXMLFixforType.Get_FDeleted: UnicodeString;
begin
  Result := ChildNodes['fDeleted'].Text;
end;

procedure TXMLFixforType.Set_FDeleted(Value: UnicodeString);
begin
  ChildNodes['fDeleted'].NodeValue := Value;
end;

function TXMLFixforType.Get_Dt: UnicodeString;
begin
  Result := ChildNodes['dt'].Text;
end;

procedure TXMLFixforType.Set_Dt(Value: UnicodeString);
begin
  ChildNodes['dt'].NodeValue := Value;
end;

function TXMLFixforType.Get_IxProject: UnicodeString;
begin
  Result := ChildNodes['ixProject'].Text;
end;

procedure TXMLFixforType.Set_IxProject(Value: UnicodeString);
begin
  ChildNodes['ixProject'].NodeValue := Value;
end;

function TXMLFixforType.Get_SProject: UnicodeString;
begin
  Result := ChildNodes['sProject'].Text;
end;

procedure TXMLFixforType.Set_SProject(Value: UnicodeString);
begin
  ChildNodes['sProject'].NodeValue := Value;
end;

end.