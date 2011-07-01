
{***********************************************************************}
{                                                                       }
{                           XML Data Binding                            }
{                                                                       }
{         Generated on: 22-12-2009 9:33:28                              }
{       Generated from: H:\svn\FBOutlookPlugin\api-xml\viewPerson.xml   }
{                                                                       }
{***********************************************************************}

unit viewPerson;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLResponseType = interface;
  IXMLPersonType = interface;

{ IXMLResponseType }

  IXMLResponseType = interface(IXMLNode)
    ['{84D2E9C0-055F-4673-A4AE-49D49A50CBAB}']
    { Property Accessors }
    function Get_Person: IXMLPersonType;
    { Methods & Properties }
    property Person: IXMLPersonType read Get_Person;
  end;

{ IXMLPersonType }

  IXMLPersonType = interface(IXMLNode)
    ['{AEA4054B-0A15-47C8-A10F-61A3B858C48F}']
    { Property Accessors }
    function Get_IxPerson: Integer;
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
    function Get_SSnippetKey: UnicodeString;
    function Get_NType: Integer;
    procedure Set_IxPerson(Value: Integer);
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
    procedure Set_SSnippetKey(Value: UnicodeString);
    procedure Set_NType(Value: Integer);
    { Methods & Properties }
    property IxPerson: Integer read Get_IxPerson write Set_IxPerson;
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
    property SSnippetKey: UnicodeString read Get_SSnippetKey write Set_SSnippetKey;
    property NType: Integer read Get_NType write Set_NType;
  end;

{ Forward Decls }

  TXMLResponseType = class;
  TXMLPersonType = class;

{ TXMLResponseType }

  TXMLResponseType = class(TXMLNode, IXMLResponseType)
  protected
    { IXMLResponseType }
    function Get_Person: IXMLPersonType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLPersonType }

  TXMLPersonType = class(TXMLNode, IXMLPersonType)
  protected
    { IXMLPersonType }
    function Get_IxPerson: Integer;
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
    function Get_SSnippetKey: UnicodeString;
    function Get_NType: Integer;
    procedure Set_IxPerson(Value: Integer);
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
    procedure Set_SSnippetKey(Value: UnicodeString);
    procedure Set_NType(Value: Integer);
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
  RegisterChildNode('person', TXMLPersonType);
  inherited;
end;

function TXMLResponseType.Get_Person: IXMLPersonType;
begin
  Result := ChildNodes['person'] as IXMLPersonType;
end;

{ TXMLPersonType }

function TXMLPersonType.Get_IxPerson: Integer;
begin
  Result := ChildNodes['ixPerson'].NodeValue;
end;

procedure TXMLPersonType.Set_IxPerson(Value: Integer);
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

function TXMLPersonType.Get_SSnippetKey: UnicodeString;
begin
  Result := ChildNodes['sSnippetKey'].Text;
end;

procedure TXMLPersonType.Set_SSnippetKey(Value: UnicodeString);
begin
  ChildNodes['sSnippetKey'].NodeValue := Value;
end;

function TXMLPersonType.Get_NType: Integer;
begin
  Result := ChildNodes['nType'].NodeValue;
end;

procedure TXMLPersonType.Set_NType(Value: Integer);
begin
  ChildNodes['nType'].NodeValue := Value;
end;

end.