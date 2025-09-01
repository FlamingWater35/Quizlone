; ===================================================================
; Quizlone Inno Setup Script
; ===================================================================

#define MyAppName "Quizlone"
#define MyAppVersion "1.1.1"
#define MyAppPublisher "FlamingWater"
#define MyAppURL "https://github.com/FlamingWater35/Quizlone"
#define MyAppExeName "quizlone.exe"
#define SourcePath "..\build\windows\x64\runner\Release"

[Setup]
AppId={{A2744763-0808-44B5-9AEA-5A8BC8A7C016}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultUserInfoName={#MyAppPublisher}

PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog
DefaultDirName={localappdata}\{#MyAppName}
UninstallDisplayIcon={app}\{#MyAppExeName}
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
DisableProgramGroupPage=yes

OutputDir=.\output
OutputBaseFilename=Quizlone-{#MyAppVersion}-Windows-Setup
SetupIconFile=.\icon_transparent.ico
LicenseFile=..\LICENSE.md
WizardStyle=modern
SolidCompression=yes
WizardImageFile=.\wizard-image.bmp
; WizardSmallImageFile=.\wizard-small-image.bmp

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "finnish"; MessagesFile: "compiler:Languages\Finnish.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"
Name: "swedish"; MessagesFile: "compiler:Languages\Swedish.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "{#SourcePath}\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#SourcePath}\*.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#SourcePath}\data\*"; DestDir: "{app}\data"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
Type: filesandordirs; Name: "{userdocs}\{#MyAppName}"