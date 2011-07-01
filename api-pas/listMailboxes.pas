
{**************************************************************************}
{                                                                          }
{                             XML Data Binding                             }
{                                                                          }
{         Generated on: 21-12-2009 16:51:01                                }
{       Generated from: H:\svn\FBOutlookPlugin\api-xml\listMailboxes.xml   }
{   Settings stored in: H:\svn\FBOutlookPlugin\api-xml\listMailboxes.xdb   }
{                                                                          }
{**************************************************************************}

unit listMailboxes;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLResponseType = interface;
  IXMLMailboxesType = interface;
  IXMLMailboxType = interface;

{ IXMLResponseType }

  IXMLResponseType = interface(IXMLNode)
    ['{8AC05DFB-5851-4F4C-AD49-B2969A4F2B9C}']
    { Property Accessors }
    function Get_Mailboxes: IXMLMailboxesType;
    { Methods & Properties }
    property Mailboxes: IXMLMailboxesType read Get_Mailboxes;
  end;

{ IXMLMailboxesType }

  IXMLMailboxesType = interface(IXMLNode)
    ['{3A1F5239-4F83-48EB-8043-3EBC461EE435}']
    { Property Accessors }
    function Get_Mailbox: IXMLMailboxType;
    { Methods & Properties }
    property Mailbox: IXMLMailboxType read Get_Mailbox;
  end;

{ IXMLMailboxType }

  IXMLMailboxType = interface(IXMLNode)
    ['{EE5FBEB5-D93A-40FE-9692-9280A4EA2196}']
    { Property Accessors }
    function Get_IxMailbox: UnicodeString;
    function Get_SEmail: UnicodeString;
    function Get_SEmailUser: UnicodeString;
    function Get_STemplate: UnicodeString;
    procedure Set_IxMailbox(Value: UnicodeString);
    procedure Set_SEmail(Value: UnicodeString);
    procedure Set_SEmailUser(Value: UnicodeString);
    procedure Set_STemplate(Value: UnicodeString);
    { Methods & Properties }
    property IxMailbox: UnicodeString read Get_IxMailbox write Set_IxMailbox;
    property SEmail: UnicodeString read Get_SEmail write Set_SEmail;
    property SEmailUser: UnicodeString read Get_SEmailUser write Set_SEmailUser;
    property STemplate: UnicodeString read Get_STemplate write Set_STemplate;
  end;

{ Forward Decls }

  TXMLResponseType = class;
  TXMLMailboxesType = class;
  TXMLMailboxType = class;

{ TXMLResponseType }

  TXMLResponseType = class(TXMLNode, IXMLResponseType)
  protected
    { IXMLResponseType }
    function Get_Mailboxes: IXMLMailboxesType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLMailboxesType }

  TXMLMailboxesType = class(TXMLNode, IXMLMailboxesType)
  protected
    { IXMLMailboxesType }
    function Get_Mailbox: IXMLMailboxType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLMailboxType }

  TXMLMailboxType = class(TXMLNode, IXMLMailboxType)
  protected
    { IXMLMailboxType }
    function Get_IxMailbox: UnicodeString;
    function Get_SEmail: UnicodeString;
    function Get_SEmailUser: UnicodeString;
    function Get_STemplate: UnicodeString;
    procedure Set_IxMailbox(Value: UnicodeString);
    procedure Set_SEmail(Value: UnicodeString);
    procedure Set_SEmailUser(Value: UnicodeString);
    procedure Set_STemplate(Value: UnicodeString);
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
  RegisterChildNode('mailboxes', TXMLMailboxesType);
  inherited;
end;

function TXMLResponseType.Get_Mailboxes: IXMLMailboxesType;
begin
  Result := ChildNodes['mailboxes'] as IXMLMailboxesType;
end;

{ TXMLMailboxesType }

procedure TXMLMailboxesType.AfterConstruction;
begin
  RegisterChildNode('mailbox', TXMLMailboxType);
  inherited;
end;

function TXMLMailboxesType.Get_Mailbox: IXMLMailboxType;
begin
  Result := ChildNodes['mailbox'] as IXMLMailboxType;
end;

{ TXMLMailboxType }

function TXMLMailboxType.Get_IxMailbox: UnicodeString;
begin
  Result := ChildNodes['ixMailbox'].Text;
end;

procedure TXMLMailboxType.Set_IxMailbox(Value: UnicodeString);
begin
  ChildNodes['ixMailbox'].NodeValue := Value;
end;

function TXMLMailboxType.Get_SEmail: UnicodeString;
begin
  Result := ChildNodes['sEmail'].Text;
end;

procedure TXMLMailboxType.Set_SEmail(Value: UnicodeString);
begin
  ChildNodes['sEmail'].NodeValue := Value;
end;

function TXMLMailboxType.Get_SEmailUser: UnicodeString;
begin
  Result := ChildNodes['sEmailUser'].Text;
end;

procedure TXMLMailboxType.Set_SEmailUser(Value: UnicodeString);
begin
  ChildNodes['sEmailUser'].NodeValue := Value;
end;

function TXMLMailboxType.Get_STemplate: UnicodeString;
begin
  Result := ChildNodes['sTemplate'].Text;
end;

procedure TXMLMailboxType.Set_STemplate(Value: UnicodeString);
begin
  ChildNodes['sTemplate'].NodeValue := Value;
end;

end.