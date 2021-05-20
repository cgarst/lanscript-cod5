@ECHO OFF
for %%i in ("%~dp0.") do SET "mypath=%%~fi"
rd %localappdata%\Activision\CoDWaW
mkdir %localappdata%\Activision
mklink /D %localappdata%\Activision\CoDWaW %mypath%\..\userdata