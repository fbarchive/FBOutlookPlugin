unit fCaseCreated;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ffbCase, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinFoggy, cxContainer, cxEdit,
  dxLayoutcxEditAdapters, dxLayoutControl, cxLabel, dxGDIPlusClasses, ExtCtrls,
  Menus, StdCtrls, cxButtons, ShellAPi, dxSkinscxPCPainter;

type
  TfConfirmation = class(TForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    Image1: TImage;
    lCaseID: TcxLabel;
    dxLayoutControl1Item2: TdxLayoutItem;
    lText: TcxLabel;
    dxLayoutControl1Item3: TdxLayoutItem;
    dxLayoutControl1Group1: TdxLayoutGroup;
    dxLayoutControl1Item1: TdxLayoutItem;
    cxButton1: TcxButton;
    dxLayoutControl1Item4: TdxLayoutItem;
    dxLayoutControl1Group2: TdxLayoutGroup;
    procedure lCaseIDClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FActionURL: string;
    function GetCaseID: Integer;
    procedure SetCaseID(const Value: Integer);
  public
    property CaseID: Integer read GetCaseID write SetCaseID;
    property ActionURL: string read FActionURL write FActionURL;
  end;

var
  fConfirmation: TfConfirmation;

implementation

{$R *.dfm}

procedure TfConfirmation.FormCreate(Sender: TObject);
begin
  with lCaseID.Style.Font do
  begin
    Size := 14;
    Color := clBlue;
    Style := [fsUnderline, fsBold];
  end;
end;

function TfConfirmation.GetCaseID: Integer;
begin
  Result := StrToInt(lCaseID.Caption);
end;

procedure TfConfirmation.lCaseIDClick(Sender: TObject);
begin
  ShellExecute(self.WindowHandle,'open',PChar(ActionURL),nil,nil, SW_SHOWNORMAL);
  ModalResult := mrOK;
end;

procedure TfConfirmation.SetCaseID(const Value: Integer);
begin
  lCaseID.Caption := IntToStr(Value);
end;

end.
