program FBNewCase;

uses
  Forms,
  ffbCase in 'ffbCase.pas' {FBCase},
  ufbAPI in 'ufbAPI.pas',
  listStatuses in 'api-pas\listStatuses.pas',
  api in 'api-pas\api.pas',
  searchResult in 'api-pas\searchResult.pas',
  viewArea in 'api-pas\viewArea.pas',
  fCaseCreated in 'fCaseCreated.pas' {fConfirmation};

{$R *.res}

begin
  if DebugHook <> 0 then
    ReportMemoryLeaksOnShutdown := true;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'FBPlugin';
  Application.CreateForm(TFBCase, FBCase);
  Application.CreateForm(TfConfirmation, fConfirmation);
  Application.Run;
end.
