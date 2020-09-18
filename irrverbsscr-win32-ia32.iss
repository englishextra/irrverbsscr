;https://gist.github.com/englishextra/b70fd64ec0d2db49ca78d2621e2256b7
; -- Components.iss --
; Demonstrates a components-based installation.

; SEE THE DOCUMENTATION FOR DETAILS ON CREATING .ISS SCRIPT FILES!

;http://www.jrsoftware.org/ispphelp/index.php?topic=define
#define APPID "{{21838ED2-0C77-455F-8779-D391270D14E8}"
#define APPNAME "Irregular Verbs Screensaver"
#define VERSION "0.1.1"
#define ABOUTURL "https://irrverbsscr.codeplex.com/"
#define HELPURL "https://irrverbsscr.codeplex.com/documentation"
#define UPDATEURL "https://irrverbsscr.codeplex.com/releases"
#define PUBLISHER "englishextra.github.io"
#define COPYRIGHT "© 2016 englishextra.github.io <englishextra@mail.ru>"

[Setup]
;http://www.jrsoftware.org/ishelp/index.php?topic=setup_appname
AppId="{#APPID}"
AppName="{#APPNAME}"
AppVersion="{#VERSION}"
AppVerName="{#APPNAME}"
AppPublisher="{#PUBLISHER}"
AppCopyright="{#COPYRIGHT}"
AppPublisherURL="{#ABOUTURL}"
AppSupportURL="{#HELPURL}"
AppUpdatesURL="{#UPDATEURL}"
;http://www.jrsoftware.org/ishelp/index.php?topic=32vs64bitinstalls
DefaultDirName="{pf32}\{#APPNAME}"
DefaultGroupName="{#APPNAME}"
DisableDirPage=yes
DisableProgramGroupPage=yes
SetupIconFile="insticon.ico"
UninstallDisplayIcon="{app}\favicon.ico"
WizardImageFile="WizModernImage.bmp"
WizardSmallImageFile="WizModernSmallImage.bmp"
OutputDir="./"
OutputBaseFilename="irrverbsscr-win32-ia32-setup"
;PrivilegesRequired=poweruser

[Dirs]
;http://stackoverflow.com/questions/643547/how-to-configure-inno-setup-to-uninstall-everything
Name: "{app}"; Flags: uninsalwaysuninstall

[Files]
Source: "IrregularVerbs.scr"; DestDir: "{sys}"; Check: "not IsWin64"; Flags: ignoreversion
Source: "IrregularVerbs.scr"; DestDir: "{syswow64}"; Check: IsWin64; Flags: ignoreversion
Source: "favicon.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "win-uninstall.ico"; DestDir: "{app}"; Flags: ignoreversion
;Source: "Website.URL"; DestDir: "{app}"
; Flags: uninsneveruninstall

[Registry]
;http://www.jrsoftware.org/ishelp/index.php?topic=registrysection
Root: HKCU; Subkey: "Control Panel\Desktop"; ValueType: string; ValueName: "ScreenSaveActive"; ValueData: "1"; Flags: uninsdeletekeyifempty uninsdeletevalue
Root: HKCU; Subkey: "Control Panel\Desktop"; ValueType: string; ValueName: "SCRNSAVE.EXE"; ValueData: "{sys}\IRREGU~1.SCR"; Check: "not IsWin64"; Flags: uninsdeletekeyifempty uninsdeletevalue
Root: HKCU; Subkey: "Control Panel\Desktop"; ValueType: string; ValueName: "SCRNSAVE.EXE"; ValueData: "{syswow64}\IRREGU~1.SCR"; Check: IsWin64; Flags: uninsdeletekeyifempty uninsdeletevalue
; Flags: uninsneveruninstall

[Languages]
;Name: "english"; MessagesFile: "compiler:Default.isl"
;Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"
;Name: "ukrainian"; MessagesFile: "compiler:Languages\Ukrainian.isl"
Name: "english"; MessagesFile: "Default.isl"
Name: "russian"; MessagesFile: "Russian.isl"
Name: "ukrainian"; MessagesFile: "Ukrainian.isl"

;[Messages]
;dont use quotes here
;SetupAppTitle = {#APPNAME} Setup
;SetupWindowTitle = {#APPNAME} Setup
;UninstallAppTitle = {#APPNAME} Uninstall
;UninstallAppFullTitle = {#APPNAME} Uninstall

[Run]
Filename: "{sys}\IrregularVerbs.scr"; Check: "not IsWin64"; Description: "Launch {#APPNAME}"; Flags: postinstall nowait skipifsilent
Filename: "{syswow64}\IrregularVerbs.scr"; Check: IsWin64; Description: "Launch {#APPNAME}"; Flags: postinstall nowait skipifsilent

[Icons]
;http://www.jrsoftware.org/ishelp/index.php?topic=iconssection
Name: "{userdesktop}\{#APPNAME}"; Filename: "{sys}\IrregularVerbs.scr"; Check: "not IsWin64"; IconFilename: "{app}\favicon.ico"
Name: "{userdesktop}\{#APPNAME}"; Filename: "{syswow64}\IrregularVerbs.scr"; Check: IsWin64; IconFilename: "{app}\favicon.ico"
Name: "{group}\{#APPNAME}"; Filename: "{sys}\IrregularVerbs.scr"; Check: "not IsWin64"; IconFilename: "{app}\favicon.ico"
Name: "{group}\{#APPNAME}"; Filename: "{syswow64}\IrregularVerbs.scr"; Check: IsWin64; IconFilename: "{app}\favicon.ico"
Name: "{group}\Uninstall {#APPNAME}"; Filename: "{app}\Unins000.exe"; IconFilename: "{app}\win-uninstall.ico"
Name: "{group}\Website"; Filename: "{#ABOUTURL}"
; Flags: uninsneveruninstall
