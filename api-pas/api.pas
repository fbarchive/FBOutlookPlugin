
{****************************************************************}
{                                                                }
{                        XML Data Binding                        }
{                                                                }
{         Generated on: 22-12-2009 12:26:51                      }
{       Generated from: H:\svn\FBOutlookPlugin\api-xml\api.xml   }
{                                                                }
{****************************************************************}

unit api;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLResponseType = interface;

{ IXMLResponseType }

  IXMLResponseType = interface(IXMLNode)
    ['{5EE9BC40-D82E-42A7-AAA8-FAF41AF64659}']
    { Property Accessors }
    function Get_Version: Integer;
    function Get_Minversion: Integer;
    function Get_Url: UnicodeString;
    procedure Set_Version(Value: Integer);
    procedure Set_Minversion(Value: Integer);
    procedure Set_Url(Value: UnicodeString);
    { Methods & Properties }
    property Version: Integer read Get_Version write Set_Version;
    property Minversion: Integer read Get_Minversion write Set_Minversion;
    property Url: UnicodeString read Get_Url write Set_Url;
  end;

{ Forward Decls }

  TXMLResponseType = class;

{ TXMLResponseType }

  TXMLResponseType = class(TXMLNode, IXMLResponseType)
  protected
    { IXMLResponseType }
    function Get_Version: Integer;
    function Get_Minversion: Integer;
    function Get_Url: UnicodeString;
    procedure Set_Version(Value: Integer);
    procedure Set_Minversion(Value: Integer);
    procedure Set_Url(Value: UnicodeString);
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

function TXMLResponseType.Get_Version: Integer;
begin
  Result := ChildNodes['version'].NodeValue;
end;

procedure TXMLResponseType.Set_Version(Value: Integer);
begin
  ChildNodes['version'].NodeValue := Value;
end;

function TXMLResponseType.Get_Minversion: Integer;
begin
  Result := ChildNodes['minversion'].NodeValue;
end;

procedure TXMLResponseType.Set_Minversion(Value: Integer);
begin
  ChildNodes['minversion'].NodeValue := Value;
end;

function TXMLResponseType.Get_Url: UnicodeString;
begin
  Result := ChildNodes['url'].Text;
end;

procedure TXMLResponseType.Set_Url(Value: UnicodeString);
begin
  ChildNodes['url'].NodeValue := Value;
end;

end.