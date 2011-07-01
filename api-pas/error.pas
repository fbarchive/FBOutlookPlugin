
{***************************************************************}
{                                                               }
{                       XML Data Binding                        }
{                                                               }
{         Generated on: 23-12-2009 15:55:29                     }
{       Generated from: H:\svn\FogBugzTools\api-xml\error.xml   }
{                                                               }
{***************************************************************}

unit error;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLResponseType = interface;
  IXMLErrorType = interface;

{ IXMLResponseType }

  IXMLResponseType = interface(IXMLNode)
    ['{B5F906FF-2F09-42B0-96C6-F7832985411E}']
    { Property Accessors }
    function Get_Error: IXMLErrorType;
    { Methods & Properties }
    property Error: IXMLErrorType read Get_Error;
  end;

{ IXMLErrorType }

  IXMLErrorType = interface(IXMLNode)
    ['{DA8D15D4-FF09-4738-82E2-72E84D57C2E4}']
    { Property Accessors }
    function Get_Code: Integer;
    procedure Set_Code(Value: Integer);
    { Methods & Properties }
    property Code: Integer read Get_Code write Set_Code;
  end;

{ Forward Decls }

  TXMLResponseType = class;
  TXMLErrorType = class;

{ TXMLResponseType }

  TXMLResponseType = class(TXMLNode, IXMLResponseType)
  protected
    { IXMLResponseType }
    function Get_Error: IXMLErrorType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLErrorType }

  TXMLErrorType = class(TXMLNode, IXMLErrorType)
  protected
    { IXMLErrorType }
    function Get_Code: Integer;
    procedure Set_Code(Value: Integer);
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
  RegisterChildNode('error', TXMLErrorType);
  inherited;
end;

function TXMLResponseType.Get_Error: IXMLErrorType;
begin
  Result := ChildNodes['error'] as IXMLErrorType;
end;

{ TXMLErrorType }

function TXMLErrorType.Get_Code: Integer;
begin
  Result := AttributeNodes['code'].NodeValue;
end;

procedure TXMLErrorType.Set_Code(Value: Integer);
begin
  SetAttribute('code', Value);
end;

end.