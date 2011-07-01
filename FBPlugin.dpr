library FBPlugin;

uses
  ComServ,
  FBPlugin_TLB in 'FBPlugin_TLB.pas',
  FBPlugin_IMPL in 'FBPlugin_IMPL.pas' {AddInModule: TAddInModule} {TFBPlugin: CoClass},
  TfbSettings in 'TfbSettings.pas' {TFBSettings: TActiveForm} {TFBSettings: CoClass},
  uMAPIFunctions in 'uMAPIFunctions.pas',
  ffbCase in 'ffbCase.pas' {FBCase},
  fCaseCreated in 'fCaseCreated.pas' {fConfirmation},
  fDonate in 'fDonate.pas' {frmDonate};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
