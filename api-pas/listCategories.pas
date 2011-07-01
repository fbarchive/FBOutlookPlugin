
{********************************************************************}
{                                                                    }
{                          XML Data Binding                          }
{                                                                    }
{         Generated on: 21-12-2009 15:09:10                          }
{       Generated from: H:\svn\FBPlugin\api-xml\listCategories.xml   }
{                                                                    }
{********************************************************************}

unit listCategories;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLResponseType = interface;
  IXMLCategoriesType = interface;
  IXMLCategoryType = interface;

{ IXMLResponseType }

  IXMLResponseType = interface(IXMLNode)
    ['{2BCCDD7E-6922-4C6F-B5A3-8C13D03745A8}']
    { Property Accessors }
    function Get_Categories: IXMLCategoriesType;
    { Methods & Properties }
    property Categories: IXMLCategoriesType read Get_Categories;
  end;

{ IXMLCategoriesType }

  IXMLCategoriesType = interface(IXMLNodeCollection)
    ['{407E29C9-75F7-4BE3-9538-1A9ABF2D3F8B}']
    { Property Accessors }
    function Get_Category(Index: Integer): IXMLCategoryType;
    { Methods & Properties }
    function Add: IXMLCategoryType;
    function Insert(const Index: Integer): IXMLCategoryType;
    property Category[Index: Integer]: IXMLCategoryType read Get_Category; default;
  end;

{ IXMLCategoryType }

  IXMLCategoryType = interface(IXMLNode)
    ['{717C5139-D095-4F32-B130-370D00BB5425}']
    { Property Accessors }
    function Get_IxCategory: UnicodeString;
    function Get_SCategory: UnicodeString;
    function Get_SPlural: UnicodeString;
    function Get_IxStatusDefault: UnicodeString;
    function Get_FIsScheduleItem: UnicodeString;
    procedure Set_IxCategory(Value: UnicodeString);
    procedure Set_SCategory(Value: UnicodeString);
    procedure Set_SPlural(Value: UnicodeString);
    procedure Set_IxStatusDefault(Value: UnicodeString);
    procedure Set_FIsScheduleItem(Value: UnicodeString);
    { Methods & Properties }
    property IxCategory: UnicodeString read Get_IxCategory write Set_IxCategory;
    property SCategory: UnicodeString read Get_SCategory write Set_SCategory;
    property SPlural: UnicodeString read Get_SPlural write Set_SPlural;
    property IxStatusDefault: UnicodeString read Get_IxStatusDefault write Set_IxStatusDefault;
    property FIsScheduleItem: UnicodeString read Get_FIsScheduleItem write Set_FIsScheduleItem;
  end;

{ Forward Decls }

  TXMLResponseType = class;
  TXMLCategoriesType = class;
  TXMLCategoryType = class;

{ TXMLResponseType }

  TXMLResponseType = class(TXMLNode, IXMLResponseType)
  protected
    { IXMLResponseType }
    function Get_Categories: IXMLCategoriesType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLCategoriesType }

  TXMLCategoriesType = class(TXMLNodeCollection, IXMLCategoriesType)
  protected
    { IXMLCategoriesType }
    function Get_Category(Index: Integer): IXMLCategoryType;
    function Add: IXMLCategoryType;
    function Insert(const Index: Integer): IXMLCategoryType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLCategoryType }

  TXMLCategoryType = class(TXMLNode, IXMLCategoryType)
  protected
    { IXMLCategoryType }
    function Get_IxCategory: UnicodeString;
    function Get_SCategory: UnicodeString;
    function Get_SPlural: UnicodeString;
    function Get_IxStatusDefault: UnicodeString;
    function Get_FIsScheduleItem: UnicodeString;
    procedure Set_IxCategory(Value: UnicodeString);
    procedure Set_SCategory(Value: UnicodeString);
    procedure Set_SPlural(Value: UnicodeString);
    procedure Set_IxStatusDefault(Value: UnicodeString);
    procedure Set_FIsScheduleItem(Value: UnicodeString);
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
  RegisterChildNode('categories', TXMLCategoriesType);
  inherited;
end;

function TXMLResponseType.Get_Categories: IXMLCategoriesType;
begin
  Result := ChildNodes['categories'] as IXMLCategoriesType;
end;

{ TXMLCategoriesType }

procedure TXMLCategoriesType.AfterConstruction;
begin
  RegisterChildNode('category', TXMLCategoryType);
  ItemTag := 'category';
  ItemInterface := IXMLCategoryType;
  inherited;
end;

function TXMLCategoriesType.Get_Category(Index: Integer): IXMLCategoryType;
begin
  Result := List[Index] as IXMLCategoryType;
end;

function TXMLCategoriesType.Add: IXMLCategoryType;
begin
  Result := AddItem(-1) as IXMLCategoryType;
end;

function TXMLCategoriesType.Insert(const Index: Integer): IXMLCategoryType;
begin
  Result := AddItem(Index) as IXMLCategoryType;
end;

{ TXMLCategoryType }

function TXMLCategoryType.Get_IxCategory: UnicodeString;
begin
  Result := ChildNodes['ixCategory'].Text;
end;

procedure TXMLCategoryType.Set_IxCategory(Value: UnicodeString);
begin
  ChildNodes['ixCategory'].NodeValue := Value;
end;

function TXMLCategoryType.Get_SCategory: UnicodeString;
begin
  Result := ChildNodes['sCategory'].Text;
end;

procedure TXMLCategoryType.Set_SCategory(Value: UnicodeString);
begin
  ChildNodes['sCategory'].NodeValue := Value;
end;

function TXMLCategoryType.Get_SPlural: UnicodeString;
begin
  Result := ChildNodes['sPlural'].Text;
end;

procedure TXMLCategoryType.Set_SPlural(Value: UnicodeString);
begin
  ChildNodes['sPlural'].NodeValue := Value;
end;

function TXMLCategoryType.Get_IxStatusDefault: UnicodeString;
begin
  Result := ChildNodes['ixStatusDefault'].Text;
end;

procedure TXMLCategoryType.Set_IxStatusDefault(Value: UnicodeString);
begin
  ChildNodes['ixStatusDefault'].NodeValue := Value;
end;

function TXMLCategoryType.Get_FIsScheduleItem: UnicodeString;
begin
  Result := ChildNodes['fIsScheduleItem'].Text;
end;

procedure TXMLCategoryType.Set_FIsScheduleItem(Value: UnicodeString);
begin
  ChildNodes['fIsScheduleItem'].NodeValue := Value;
end;

end.