@echo off
mode con: cols=61 lines=22
title [v1.0]
set "filename=%~f0"
setlocal EnableDelayedExpansion
set "keywords=server arclight paper spigot bukkit glowstone sponge purpur pufferfish magma mohist cat playit"
set "searchDir=%~dp0"

:mainarea
powershell -NoProfile -Command ^
  "$size = $Host.UI.RawUI.WindowSize; $buffer = $Host.UI.RawUI.BufferSize; " ^
  "$buffer.Height = 1000; $buffer.Width = $size.Width; " ^
  "$Host.UI.RawUI.BufferSize = $Host.UI.RawUI.WindowSize"
cls

echo                   __    __     ______    
echo                  /\ "-./  \   /\  ___\   
echo                  \ \ \-./\ \  \ \ \____  
echo                   \ \_\ \ \_\  \ \_____\ 
echo                    \/_/  \/_/   \/_____/ 
echo      ______     __  __     __   __        __     ______  
echo     /\  == \   /\ \/\ \   /\ "-.\ \      /\ \   /\__  _\ 
echo     \ \  __-   \ \ \_\ \  \ \ \-.  \     \ \ \  \/_/\ \/ 
echo      \ \_\ \_\  \ \_____\  \ \_\\"\_\     \ \_\    \ \_\ 
echo       \/_/ /_/   \/_____/   \/_/ \/_/      \/_/     \/_/ 
echo.
echo  - Type "configarea" to configure the server to your liking.
echo  - Type "run" to run the server.
echo.
echo  ---------------------------Notes---------------------------
echo.
echo  - While running, type "help" for a list of all commands.
echo  - While running, type "stop" to save and stop the server.
echo  - You can't close all the windows with the "stop"
echo    command so you have to manually close them :P
echo.

set /p option1= ">> "
if %option1% == configarea goto configarea
if %option1% == mainarea goto mainarea
if %option1% == info goto info
if %option1% == run goto run
if %option1% == changeram goto changeram

goto mainarea
pause

:configarea
powershell -NoProfile -Command ^
  "$size = $Host.UI.RawUI.WindowSize; $buffer = $Host.UI.RawUI.BufferSize; " ^
  "$buffer.Height = 1000; $buffer.Width = $size.Width; " ^
  "$Host.UI.RawUI.BufferSize = $Host.UI.RawUI.WindowSize"
cls

echo.
echo          TYPE "mainarea" TO GO BACK TO THE MAIN AREA.
echo.
echo  - Type "changeram" to change the ammount of RAM you
echo    want to allocate for your server to use.
echo.

set /p option1= ">> "
if %option1% == configarea goto configarea
if %option1% == mainarea goto mainarea
if %option1% == info goto info
if %option1% == run goto run
if %option1% == changeram goto changeram

goto mainarea
pause

:changeram
powershell -NoProfile -Command ^
  "$size = $Host.UI.RawUI.WindowSize; $buffer = $Host.UI.RawUI.BufferSize; " ^
  "$buffer.Height = 1000; $buffer.Width = $size.Width; " ^
  "$Host.UI.RawUI.BufferSize = $Host.UI.RawUI.WindowSize"
cls

echo.
set /p input=Type "s2G"(Min RAM usable): 
echo.
set /p replacement=Type it again but with your desired number of RAM: 
echo.
powershell -Command "(Get-Content '%filename%') | Foreach-Object {$_ -replace '%input%', '%replacement%'} | Set-Content '%filename%'"
powershell -Command "Write-Host '1/2 steps done' -ForegroundColor Green"
echo.

echo.
set /p input2=Type "x2G"(Max RAM usable): 
echo.
set /p replacement2=Type it again but with your desired number of RAM: 
powershell -Command "(Get-Content '%filename%') | Foreach-Object {$_ -replace '%input2%', '%replacement2%'} | Set-Content '%filename%'"
echo.
powershell -Command "Write-Host '2/2 steps done, reloading...' -ForegroundColor Green"
echo.
timeout /t 2 /nobreak >nul
start /B /c "%~f0" & goto configarea

pause

:info
powershell -NoProfile -Command ^
  "$size = $Host.UI.RawUI.WindowSize; $buffer = $Host.UI.RawUI.BufferSize; " ^
  "$buffer.Height = 1000; $buffer.Width = $size.Width; " ^
  "$Host.UI.RawUI.BufferSize = $Host.UI.RawUI.WindowSize"
cls

echo.
echo          TYPE "mainarea" TO GO BACK TO THE MAIN AREA.
echo.
echo.
echo  - https://github.com/melomel07/mcrunit
echo.
echo.

set /p option1= ">> "
if %option1% == configarea goto configarea
if %option1% == mainarea goto mainarea
if %option1% == info goto info
if %option1% == run goto run
if %option1% == changeram goto changeram

goto mainarea
pause

:run
powershell -NoProfile -Command ^
  "$size = $Host.UI.RawUI.WindowSize; $buffer = $Host.UI.RawUI.BufferSize; " ^
  "$buffer.Height = 1000; $buffer.Width = $size.Width; " ^
  "$Host.UI.RawUI.BufferSize = $buffer"
cls

echo.
echo.
echo            Please be patient, this may take a bit!
echo.
echo.

if exist "dbot.py" (
	start "..\Python\Python311\python.exe" "dbot.py"
	echo.
) else (
	powershell -Command "Write-Host 'No Discord bot file found, continuing anyways...' -ForegroundColor Yellow"
	echo.
)

set "found=0"
for %%k in (%keywords%) do (
	for %%f in ("%searchDir%\*%%k*.exe") do (
		if exist "%%f" (
        set "found=1"
        start %%f
		)
	)
)
if !found! EQU 0 (
    powershell -Command "Write-Host 'No Playit app file found, continuing anyways...' -ForegroundColor Yellow"
    echo.
)

set "found2=0"
for %%k in (%keywords%) do (
	for %%f in ("%searchDir%\*%%k*.jar") do (
		if exist "%%f" (
        set "found2=1"
		java -Xmx2G -Xms2G -jar "%%f" nogui 
		)
	)
)
if !found2! EQU 0 (
    powershell -Command "Write-Host 'No server files found.' -ForegroundColor Red"
    echo.
)

echo.
echo          TYPE "mainarea" TO GO BACK TO THE MAIN AREA.
echo.

set /p option1= ">> "
if %option1% == configarea goto configarea
if %option1% == mainarea goto mainarea
if %option1% == info goto info
if %option1% == run goto run
if %option1% == changeram goto changeram

goto mainarea
pause
