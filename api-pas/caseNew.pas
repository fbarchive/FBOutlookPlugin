
{********************************************************************}
{                                                                    }
{                          XML Data Binding                          }
{                                                                    }
{         Generated on: 21-12-2009 16:39:20                          }
{       Generated from: H:\svn\FBOutlookPlugin\api-xml\caseNew.xml   }
{   Settings stored in: H:\svn\FBOutlookPlugin\api-xml\caseNew.xdb   }
{                                                                    }
{********************************************************************}

unit caseNew;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLResponseType = interface;
  IXMLCaseType = interface;

{ IXMLResponseType }

  IXMLResponseType = interface(IXMLNode)
    ['{B56B5F55-F499-4FA4-A72F-F83C32E3B8CC}']
    { Property Accessors }
    function Get_Case_: IXMLCaseType;
    { Methods & Properties }
    property Case_: IXMLCaseType read Get_Case_;
  end;

{ IXMLCaseType }

  IXMLCaseType = interface(IXMLNode)
    ['{E00536A0-D5A5-42BF-B4A0-EBE7396F224F}']
    { Property Accessors }
    function Get_IxBug: Integer;
    function Get_Operations: UnicodeString;
    procedure Set_IxBug(Value: Integer);
    procedure Set_Operations(Value: UnicodeString);
    { Methods & Properties }
    property IxBug: Integer read Get_IxBug write Set_IxBug;
    property Operations: UnicodeString read Get_Operations write Set_Operations;
  end;

{ Forward Decls }

  TXMLResponseType = class;
  TXMLCaseType = class;

{ TXMLResponseType }

  TXMLResponseType = class(TXMLNode, IXMLResponseType)
  protected
    { IXMLResponseType }
    function Get_Case_: IXMLCaseType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLCaseType }

  TXMLCaseType = class(TXMLNode, IXMLCaseType)
  protected
    { IXMLCaseType }
    function Get_IxBug: Integer;
    function Get_Operations: UnicodeString;
    procedure Set_IxBug(Value: Integer);
    procedure Set_Operations(Value: UnicodeString);
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
  RegisterChildNode('case', TXMLCaseType);
  inherited;
end;

function TXMLResponseType.Get_Case_: IXMLCaseType;
begin
  Result := ChildNodes['case'] as IXMLCaseType;
end;

{ TXMLCaseType }

function TXMLCaseType.Get_IxBug: Integer;
begin
  Result := AttributeNodes['ixBug'].NodeValue;
end;

procedure TXMLCaseType.Set_IxBug(Value: Integer);
begin
  SetAttribute('ixBug', Value);
end;

function TXMLCaseType.Get_Operations: UnicodeString;
begin
  Result := AttributeNodes['operations'].Text;
end;

procedure TXMLCaseType.Set_Operations(Value: UnicodeString);
begin
  SetAttribute('operations', Value);
end;

end.