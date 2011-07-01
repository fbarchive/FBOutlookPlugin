
{******************************************************************}
{                                                                  }
{                         XML Data Binding                         }
{                                                                  }
{         Generated on: 23-12-2009 9:04:37                         }
{       Generated from: H:\svn\FBOutlookPlugin\api-xml\logon.xml   }
{   Settings stored in: H:\svn\FBOutlookPlugin\api-xml\logon.xdb   }
{                                                                  }
{******************************************************************}

unit logon;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLResponseType = interface;

{ IXMLResponseType }

  IXMLResponseType = interface(IXMLNode)
    ['{E002B020-5C5D-47C0-A218-D00087FC0048}']
    { Property Accessors }
    function Get_Token: UnicodeString;
    procedure Set_Token(Value: UnicodeString);
    { Methods & Properties }
    property Token: UnicodeString read Get_Token write Set_Token;
  end;

{ Forward Decls }

  TXMLResponseType = class;

{ TXMLResponseType }

  TXMLResponseType = class(TXMLNode, IXMLResponseType)
  protected
    { IXMLResponseType }
    function Get_Token: UnicodeString;
    procedure Set_Token(Value: UnicodeString);
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

function TXMLResponseType.Get_Token: UnicodeString;
begin
  Result := ChildNodes['token'].Text;
end;

procedure TXMLResponseType.Set_Token(Value: UnicodeString);
begin
  ChildNodes['token'].NodeValue := Value;
end;

end.