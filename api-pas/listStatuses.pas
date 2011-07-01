
{*************************************************************************}
{                                                                         }
{                            XML Data Binding                             }
{                                                                         }
{         Generated on: 22-12-2009 10:50:45                               }
{       Generated from: H:\svn\FBOutlookPlugin\api-xml\listStatuses.xml   }
{                                                                         }
{*************************************************************************}

unit listStatuses;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLResponseType = interface;
  IXMLStatusesType = interface;
  IXMLStatusType = interface;

{ IXMLResponseType }

  IXMLResponseType = interface(IXMLNode)
    ['{1178ACE3-731E-4968-B535-C3841F8C7DD1}']
    { Property Accessors }
    function Get_Statuses: IXMLStatusesType;
    { Methods & Properties }
    property Statuses: IXMLStatusesType read Get_Statuses;
  end;

{ IXMLStatusesType }

  IXMLStatusesType = interface(IXMLNodeCollection)
    ['{8CE3C71A-E130-4998-8A0F-02BFE78E89EE}']
    { Property Accessors }
    function Get_Status(Index: Integer): IXMLStatusType;
    { Methods & Properties }
    function Add: IXMLStatusType;
    function Insert(const Index: Integer): IXMLStatusType;
    property Status[Index: Integer]: IXMLStatusType read Get_Status; default;
  end;

{ IXMLStatusType }

  IXMLStatusType = interface(IXMLNode)
    ['{9ECF6414-2968-4E92-84D9-BD25A5E7E8F8}']
    { Property Accessors }
    function Get_IxStatus: UnicodeString;
    function Get_SStatus: UnicodeString;
    function Get_IxCategory: UnicodeString;
    procedure Set_IxStatus(Value: UnicodeString);
    procedure Set_SStatus(Value: UnicodeString);
    procedure Set_IxCategory(Value: UnicodeString);
    { Methods & Properties }
    property IxStatus: UnicodeString read Get_IxStatus write Set_IxStatus;
    property SStatus: UnicodeString read Get_SStatus write Set_SStatus;
    property IxCategory: UnicodeString read Get_IxCategory write Set_IxCategory;
  end;

{ Forward Decls }

  TXMLResponseType = class;
  TXMLStatusesType = class;
  TXMLStatusType = class;

{ TXMLResponseType }

  TXMLResponseType = class(TXMLNode, IXMLResponseType)
  protected
    { IXMLResponseType }
    function Get_Statuses: IXMLStatusesType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLStatusesType }

  TXMLStatusesType = class(TXMLNodeCollection, IXMLStatusesType)
  protected
    { IXMLStatusesType }
    function Get_Status(Index: Integer): IXMLStatusType;
    function Add: IXMLStatusType;
    function Insert(const Index: Integer): IXMLStatusType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLStatusType }

  TXMLStatusType = class(TXMLNode, IXMLStatusType)
  protected
    { IXMLStatusType }
    function Get_IxStatus: UnicodeString;
    function Get_SStatus: UnicodeString;
    function Get_IxCategory: UnicodeString;
    procedure Set_IxStatus(Value: UnicodeString);
    procedure Set_SStatus(Value: UnicodeString);
    procedure Set_IxCategory(Value: UnicodeString);
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
  RegisterChildNode('statuses', TXMLStatusesType);
  inherited;
end;

function TXMLResponseType.Get_Statuses: IXMLStatusesType;
begin
  Result := ChildNodes['statuses'] as IXMLStatusesType;
end;

{ TXMLStatusesType }

procedure TXMLStatusesType.AfterConstruction;
begin
  RegisterChildNode('status', TXMLStatusType);
  ItemTag := 'status';
  ItemInterface := IXMLStatusType;
  inherited;
end;

function TXMLStatusesType.Get_Status(Index: Integer): IXMLStatusType;
begin
  Result := List[Index] as IXMLStatusType;
end;

function TXMLStatusesType.Add: IXMLStatusType;
begin
  Result := AddItem(-1) as IXMLStatusType;
end;

function TXMLStatusesType.Insert(const Index: Integer): IXMLStatusType;
begin
  Result := AddItem(Index) as IXMLStatusType;
end;

{ TXMLStatusType }

function TXMLStatusType.Get_IxStatus: UnicodeString;
begin
  Result := ChildNodes['ixStatus'].Text;
end;

procedure TXMLStatusType.Set_IxStatus(Value: UnicodeString);
begin
  ChildNodes['ixStatus'].NodeValue := Value;
end;

function TXMLStatusType.Get_SStatus: UnicodeString;
begin
  Result := ChildNodes['sStatus'].Text;
end;

procedure TXMLStatusType.Set_SStatus(Value: UnicodeString);
begin
  ChildNodes['sStatus'].NodeValue := Value;
end;

function TXMLStatusType.Get_IxCategory: UnicodeString;
begin
  Result := ChildNodes['ixCategory'].Text;
end;

procedure TXMLStatusType.Set_IxCategory(Value: UnicodeString);
begin
  ChildNodes['ixCategory'].NodeValue := Value;
end;

end.