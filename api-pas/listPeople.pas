
{****************************************************************}
{                                                                }
{                        XML Data Binding                        }
{                                                                }
{         Generated on: 21-12-2009 15:11:27                      }
{       Generated from: H:\svn\FBPlugin\api-xml\listPeople.xml   }
{   Settings stored in: H:\svn\FBPlugin\api-xml\listPeople.xdb   }
{                                                                }
{****************************************************************}

unit listPeople;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLResponseType = interface;
  IXMLPeopleType = interface;
  IXMLPersonType = interface;

{ IXMLResponseType }

  IXMLResponseType = interface(IXMLNode)
    ['{D5263B8E-B19A-4827-B87C-1AF06A145CE9}']
    { Property Accessors }
    function Get_People: IXMLPeopleType;
    { Methods & Properties }
    property People: IXMLPeopleType read Get_People;
  end;

{ IXMLPeopleType }

  IXMLPeopleType = interface(IXMLNodeCollection)
    ['{321667A1-FE71-4B0C-8DB3-980CC88FA838}']
    { Property Accessors }
    function Get_Person(Index: Integer): IXMLPersonType;
    { Methods & Properties }
    function Add: IXMLPersonType;
    function Insert(const Index: Integer): IXMLPersonType;
    property Person[Index: Integer]: IXMLPersonType read Get_Person; default;
  end;

{ IXMLPersonType }

  IXMLPersonType = interface(IXMLNode)
    ['{91945529-E7B0-44E3-9592-CA3A75FB0C43}']
    { Property Accessors }
    function Get_IxPerson: UnicodeString;
    function Get_SFullName: UnicodeString;
    function Get_SEmail: UnicodeString;
    function Get_SPhone: UnicodeString;
    function Get_FAdministrator: UnicodeString;
    function Get_FCommunity: UnicodeString;
    function Get_FVirtual: UnicodeString;
    function Get_FDeleted: UnicodeString;
    function Get_FNotify: UnicodeString;
    function Get_SHomepage: UnicodeString;
    function Get_SLocale: UnicodeString;
    function Get_SLanguage: UnicodeString;
    function Get_STimeZoneKey: UnicodeString;
    function Get_FExpert: UnicodeString;
    procedure Set_IxPerson(Value: UnicodeString);
    procedure Set_SFullName(Value: UnicodeString);
    procedure Set_SEmail(Value: UnicodeString);
    procedure Set_SPhone(Value: UnicodeString);
    procedure Set_FAdministrator(Value: UnicodeString);
    procedure Set_FCommunity(Value: UnicodeString);
    procedure Set_FVirtual(Value: UnicodeString);
    procedure Set_FDeleted(Value: UnicodeString);
    procedure Set_FNotify(Value: UnicodeString);
    procedure Set_SHomepage(Value: UnicodeString);
    procedure Set_SLocale(Value: UnicodeString);
    procedure Set_SLanguage(Value: UnicodeString);
    procedure Set_STimeZoneKey(Value: UnicodeString);
    procedure Set_FExpert(Value: UnicodeString);
    { Methods & Properties }
    property IxPerson: UnicodeString read Get_IxPerson write Set_IxPerson;
    property SFullName: UnicodeString read Get_SFullName write Set_SFullName;
    property SEmail: UnicodeString read Get_SEmail write Set_SEmail;
    property SPhone: UnicodeString read Get_SPhone write Set_SPhone;
    property FAdministrator: UnicodeString read Get_FAdministrator write Set_FAdministrator;
    property FCommunity: UnicodeString read Get_FCommunity write Set_FCommunity;
    property FVirtual: UnicodeString read Get_FVirtual write Set_FVirtual;
    property FDeleted: UnicodeString read Get_FDeleted write Set_FDeleted;
    property FNotify: UnicodeString read Get_FNotify write Set_FNotify;
    property SHomepage: UnicodeString read Get_SHomepage write Set_SHomepage;
    property SLocale: UnicodeString read Get_SLocale write Set_SLocale;
    property SLanguage: UnicodeString read Get_SLanguage write Set_SLanguage;
    property STimeZoneKey: UnicodeString read Get_STimeZoneKey write Set_STimeZoneKey;
    property FExpert: UnicodeString read Get_FExpert write Set_FExpert;
  end;

{ Forward Decls }

  TXMLResponseType = class;
  TXMLPeopleType = class;
  TXMLPersonType = class;

{ TXMLResponseType }

  TXMLResponseType = class(TXMLNode, IXMLResponseType)
  protected
    { IXMLResponseType }
    function Get_People: IXMLPeopleType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLPeopleType }

  TXMLPeopleType = class(TXMLNodeCollection, IXMLPeopleType)
  protected
    { IXMLPeopleType }
    function Get_Person(Index: Integer): IXMLPersonType;
    function Add: IXMLPersonType;
    function Insert(const Index: Integer): IXMLPersonType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLPersonType }

  TXMLPersonType = class(TXMLNode, IXMLPersonType)
  protected
    { IXMLPersonType }
    function Get_IxPerson: UnicodeString;
    function Get_SFullName: UnicodeString;
    function Get_SEmail: UnicodeString;
    function Get_SPhone: UnicodeString;
    function Get_FAdministrator: UnicodeString;
    function Get_FCommunity: UnicodeString;
    function Get_FVirtual: UnicodeString;
    function Get_FDeleted: UnicodeString;
    function Get_FNotify: UnicodeString;
    function Get_SHomepage: UnicodeString;
    function Get_SLocale: UnicodeString;
    function Get_SLanguage: UnicodeString;
    function Get_STimeZoneKey: UnicodeString;
    function Get_FExpert: UnicodeString;
    procedure Set_IxPerson(Value: UnicodeString);
    procedure Set_SFullName(Value: UnicodeString);
    procedure Set_SEmail(Value: UnicodeString);
    procedure Set_SPhone(Value: UnicodeString);
    procedure Set_FAdministrator(Value: UnicodeString);
    procedure Set_FCommunity(Value: UnicodeString);
    procedure Set_FVirtual(Value: UnicodeString);
    procedure Set_FDeleted(Value: UnicodeString);
    procedure Set_FNotify(Value: UnicodeString);
    procedure Set_SHomepage(Value: UnicodeString);
    procedure Set_SLocale(Value: UnicodeString);
    procedure Set_SLanguage(Value: UnicodeString);
    procedure Set_STimeZoneKey(Value: UnicodeString);
    procedure Set_FExpert(Value: UnicodeString);
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
  RegisterChildNode('people', TXMLPeopleType);
  inherited;
end;

function TXMLResponseType.Get_People: IXMLPeopleType;
begin
  Result := ChildNodes['people'] as IXMLPeopleType;
end;

{ TXMLPeopleType }

procedure TXMLPeopleType.AfterConstruction;
begin
  RegisterChildNode('person', TXMLPersonType);
  ItemTag := 'person';
  ItemInterface := IXMLPersonType;
  inherited;
end;

function TXMLPeopleType.Get_Person(Index: Integer): IXMLPersonType;
begin
  Result := List[Index] as IXMLPersonType;
end;

function TXMLPeopleType.Add: IXMLPersonType;
begin
  Result := AddItem(-1) as IXMLPersonType;
end;

function TXMLPeopleType.Insert(const Index: Integer): IXMLPersonType;
begin
  Result := AddItem(Index) as IXMLPersonType;
end;

{ TXMLPersonType }

function TXMLPersonType.Get_IxPerson: UnicodeString;
begin
  Result := ChildNodes['ixPerson'].Text;
end;

procedure TXMLPersonType.Set_IxPerson(Value: UnicodeString);
begin
  ChildNodes['ixPerson'].NodeValue := Value;
end;

function TXMLPersonType.Get_SFullName: UnicodeString;
begin
  Result := ChildNodes['sFullName'].Text;
end;

procedure TXMLPersonType.Set_SFullName(Value: UnicodeString);
begin
  ChildNodes['sFullName'].NodeValue := Value;
end;

function TXMLPersonType.Get_SEmail: UnicodeString;
begin
  Result := ChildNodes['sEmail'].Text;
end;

procedure TXMLPersonType.Set_SEmail(Value: UnicodeString);
begin
  ChildNodes['sEmail'].NodeValue := Value;
end;

function TXMLPersonType.Get_SPhone: UnicodeString;
begin
  Result := ChildNodes['sPhone'].Text;
end;

procedure TXMLPersonType.Set_SPhone(Value: UnicodeString);
begin
  ChildNodes['sPhone'].NodeValue := Value;
end;

function TXMLPersonType.Get_FAdministrator: UnicodeString;
begin
  Result := ChildNodes['fAdministrator'].Text;
end;

procedure TXMLPersonType.Set_FAdministrator(Value: UnicodeString);
begin
  ChildNodes['fAdministrator'].NodeValue := Value;
end;

function TXMLPersonType.Get_FCommunity: UnicodeString;
begin
  Result := ChildNodes['fCommunity'].Text;
end;

procedure TXMLPersonType.Set_FCommunity(Value: UnicodeString);
begin
  ChildNodes['fCommunity'].NodeValue := Value;
end;

function TXMLPersonType.Get_FVirtual: UnicodeString;
begin
  Result := ChildNodes['fVirtual'].Text;
end;

procedure TXMLPersonType.Set_FVirtual(Value: UnicodeString);
begin
  ChildNodes['fVirtual'].NodeValue := Value;
end;

function TXMLPersonType.Get_FDeleted: UnicodeString;
begin
  Result := ChildNodes['fDeleted'].Text;
end;

procedure TXMLPersonType.Set_FDeleted(Value: UnicodeString);
begin
  ChildNodes['fDeleted'].NodeValue := Value;
end;

function TXMLPersonType.Get_FNotify: UnicodeString;
begin
  Result := ChildNodes['fNotify'].Text;
end;

procedure TXMLPersonType.Set_FNotify(Value: UnicodeString);
begin
  ChildNodes['fNotify'].NodeValue := Value;
end;

function TXMLPersonType.Get_SHomepage: UnicodeString;
begin
  Result := ChildNodes['sHomepage'].Text;
end;

procedure TXMLPersonType.Set_SHomepage(Value: UnicodeString);
begin
  ChildNodes['sHomepage'].NodeValue := Value;
end;

function TXMLPersonType.Get_SLocale: UnicodeString;
begin
  Result := ChildNodes['sLocale'].Text;
end;

procedure TXMLPersonType.Set_SLocale(Value: UnicodeString);
begin
  ChildNodes['sLocale'].NodeValue := Value;
end;

function TXMLPersonType.Get_SLanguage: UnicodeString;
begin
  Result := ChildNodes['sLanguage'].Text;
end;

procedure TXMLPersonType.Set_SLanguage(Value: UnicodeString);
begin
  ChildNodes['sLanguage'].NodeValue := Value;
end;

function TXMLPersonType.Get_STimeZoneKey: UnicodeString;
begin
  Result := ChildNodes['sTimeZoneKey'].Text;
end;

procedure TXMLPersonType.Set_STimeZoneKey(Value: UnicodeString);
begin
  ChildNodes['sTimeZoneKey'].NodeValue := Value;
end;

function TXMLPersonType.Get_FExpert: UnicodeString;
begin
  Result := ChildNodes['fExpert'].Text;
end;

procedure TXMLPersonType.Set_FExpert(Value: UnicodeString);
begin
  ChildNodes['fExpert'].NodeValue := Value;
end;

end.