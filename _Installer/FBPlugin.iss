[Setup]
AppName                =FogBugz Outlook Plugin
AppVerName             =FogBugz Outlook Plugin 1.3
OutputBaseFilename     =FBPlugin-v1.3
DefaultDirName         ={pf}\FogBugzOutlookPlugin
OutputDir              =..\_Installer
VersionInfoVersion=1.3
VersionInfoCompany=CNOC Informatiesystemen
VersionInfoDescription=FogBugz Outlook Plugin
ShowLanguageDialog=auto
AllowUNCPath=false
SetupIconFile=D:\svn\fogbugzplugin\graphics\kiwi.ico
SourceDir=..\_bin
WizardImageFile=D:\svn\fogbugzplugin\graphics\install-logo.bmp
WizardImageBackColor=clWhite
WizardSmallImageFile=D:\svn\fogbugzplugin\graphics\install-logo-sma.bmp

[Files]
; Add-in dll
Source: FBPlugin.dll; DestDir: {app}; Flags: regserver
Source: gdiplus.dll; DestDir: {app}; Flags: ignoreversion
Source: libssl32.dll; DestDir: {app}
Source: libeay32.dll; DestDir: {app}
