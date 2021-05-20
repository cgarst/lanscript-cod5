@ECHO OFF
CLS
COLOR 60

cd bin\

IF EXIST lan_cfg.bat (
    call lan_cfg.bat
) ELSE (
    SET name=Unknown LANer
)

GOTO Menu

:Menu
TYPE banner.txt

ECHO Current player name: %name%

ECHO.
ECHO Select an action:
ECHO 1. Launch COD WaW for Zombies/Coop
ECHO 2. Launch COD WaW for Deathmatch/Objectives
ECHO 3. Change player name
ECHO 4. Browse hidden game files directory
ECHO 5. Exit

ECHO.

CHOICE /C 12345 /M "Enter your choice:"

:: Note - list ERRORLEVELS in decreasing order
IF ERRORLEVEL 5 GOTO End
IF ERRORLEVEL 4 GOTO OpenProfileDir
IF ERRORLEVEL 3 GOTO Name
IF ERRORLEVEL 2 GOTO LaunchVs
IF ERRORLEVEL 1 GOTO LaunchCoop

:OpenProfileDir
explorer.exe %localappdata%\Activision\CoDWaW\
GOTO Menu

:Name
set /p name= Enter Player Name: 
echo SET name=%name% > lan_cfg.bat
GOTO Menu

:LaunchVs
start CoDWaWmp.exe ^
 +set name "%name%" ^
 +set com_startupIntroPlayed "1" ^
 +set com_maxfps "0" ^
 +set fs_game mods/mp_custommaps
GOTO End

:LaunchCoop
start CoDWaW.exe ^
 +set name "%name%" ^
 +set com_startupIntroPlayed "1" ^
 +set com_maxfps "0"
GOTO End

:End
