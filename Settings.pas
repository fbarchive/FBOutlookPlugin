unit Settings;

{+-----------------------------------------------------------------------------
 | Unit: Settings.pas
 | Description: Settings routines
 | Author: Stefan van As (dutchdelphidude@gmail.com)
 | Copyright (c) 2009 CNOC Informatiesystemen
 +-----------------------------------------------------------------------------}

interface

const
  SET_SERVICE_URL         = 0;
  SET_SERVICE_USERNAME    = 1;
  SET_SERVICE_PASSWORD    = 2;
  SET_SERVICE_TOKEN       = 3;
  SET_DEF_PROJECT_DETECT  = 4;
  SET_LAST_PROJECT_ID     = 5;

function GetAppSetting(ID: Integer): string;
procedure SetAppSetting(ID: Integer; const Value: string); overload;

function GetAppSettingAsBool(ID: Integer): Boolean;
procedure SetAppSetting(ID: Integer; Value: Boolean); overload;

function GetAppSettingAsInteger(ID: Integer): Integer;
procedure SetAppSetting(ID: Integer; Value: Integer); overload;

implementation

uses
  // Delphi
  Registry, ComCtrls;

const
  REG_KEY = 'Software\CNOC\FBPlugin'; // do NOT localize

function GetValueName(ID: Integer): string;
begin
  case ID of
    SET_SERVICE_URL        : Result := 'URL';
    SET_SERVICE_USERNAME   : Result := 'Username';
    SET_SERVICE_PASSWORD   : Result := 'Password';
    SET_SERVICE_TOKEN      : Result := 'Token';
    SET_DEF_PROJECT_DETECT : Result := 'DefaultProjectDetect';
    SET_LAST_PROJECT_ID    : Result := 'LastProjectID';
  end;
end;

function GetDefaultSetting(ID: Integer): Variant;
begin
  case ID of
    SET_SERVICE_URL        : Result := '';
    SET_SERVICE_USERNAME   : Result := '';
    SET_SERVICE_PASSWORD   : Result := '';
    SET_SERVICE_TOKEN      : Result := '';
    SET_DEF_PROJECT_DETECT : Result := False;
    SET_LAST_PROJECT_ID    : Result := 0;
  end;
end;

function GetAppSetting(ID: Integer): string;
begin
  with TRegistry.Create do
  try
    if OpenKeyReadOnly(REG_KEY) then
    try
      if ValueExists(GetValueName(ID)) then
      begin
        Result := ReadString(GetValueName(ID));
        EXIT;
      end;
    finally
      CloseKey;
    end;
    Result := GetDefaultSetting(ID);
  finally
    Free;
  end;
end;

procedure SetAppSetting(ID: Integer; const Value: string);
begin
  with TRegistry.Create do
  try
    if OpenKey(REG_KEY, True) then
    try
      WriteString(GetValueName(ID), Value);
    finally
      CloseKey;
    end;
  finally
    Free;
  end;
end;

function GetAppSettingAsBool(ID: Integer): Boolean;
begin
  with TRegistry.Create do
  try
    if OpenKeyReadOnly(REG_KEY) then
    try
      if ValueExists(GetValueName(ID)) then
      begin
        Result := ReadBool(GetValueName(ID));
        EXIT;
      end;
    finally
      CloseKey;
    end;
    Result := GetDefaultSetting(ID);
  finally
    Free;
  end;
end;

procedure SetAppSetting(ID: Integer; Value: Boolean);
begin
  with TRegistry.Create do
  try
    if OpenKey(REG_KEY, True) then
    try
      WriteBool(GetValueName(ID), Value);
    finally
      CloseKey;
    end;
  finally
    Free;
  end;
end;

function GetAppSettingAsInteger(ID: Integer): Integer;
begin
  with TRegistry.Create do
  try
    if OpenKeyReadOnly(REG_KEY) then
    try
      if ValueExists(GetValueName(ID)) then
      begin
        Result := ReadInteger(GetValueName(ID));
        EXIT;
      end;
    finally
      CloseKey;
    end;
    Result := GetDefaultSetting(ID);
  finally
    Free;
  end;
end;

procedure SetAppSetting(ID: Integer; Value: Integer);
begin
  with TRegistry.Create do
  try
    if OpenKey(REG_KEY, True) then
    try
      WriteInteger(GetValueName(ID), Value);
    finally
      CloseKey;
    end;
  finally
    Free;
  end;
end;

end.
