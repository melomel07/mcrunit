@echo off
title ARE YOU DREAMING? [v2.0]
set "filename=%~f0"
setlocal
set "keywords=server arclight paper spigot bukkit glowstone sponge purpur pufferfish magma mohist cat playit"
set "searchDir=%~dp0"

:mainarea
cls

echo                 __    __     ______    
echo                /\ "-./  \   /\  ___\   
echo                \ \ \-./\ \  \ \ \____  
echo                 \ \_\ \ \_\  \ \_____\ 
echo                  \/_/  \/_/   \/_____/ 
echo    ______     __  __     __   __        __     ______  
echo   /\  == \   /\ \/\ \   /\ "-.\ \      /\ \   /\__  _\ 
echo   \ \  __-   \ \ \_\ \  \ \ \-.  \     \ \ \  \/_/\ \/ 
echo    \ \_\ \_\  \ \_____\  \ \_\\"\_\     \ \_\    \ \_\ 
echo     \/_/ /_/   \/_____/   \/_/ \/_/      \/_/     \/_/ 
echo.
echo  - Type "configarea" to configure the server to your liking.
echo  - Type "runarea" to run this server.
echo.
echo  -----------------------Notes-----------------------
echo.
echo  - While running, type "help" for a list of all commands.
echo  - While running, type "exit" to save and stop the server.
echo  - You can't close all the windows with the "stop"
echo    command so you have to manually close them :P
echo.

set /p option1= [%username%]~ 
if %option1% == configarea goto configarea
if %option1% == runarea goto runarea
if %option1% == mainarea goto mainarea
if %option1% == info goto info
if %option1% == runall goto runall
if %option1% == run goto run
if %option1% == runproxy goto runproxy
if %option1% == runbot goto runbot
if %option1% == changeram goto changeram

goto mainarea
pause

:configarea
cls

echo.
echo      TYPE "mainarea" TO GO BACK TO THE MAIN AREA.
echo.
echo  - Type "changeram" to change the ammount of ram you
echo    want to allocate to your server
echo.

set /p option1= [%username%]~ 
if %option1% == configarea goto configarea
if %option1% == runarea goto runarea
if %option1% == mainarea goto mainarea
if %option1% == info goto info
if %option1% == runall goto runall
if %option1% == run goto run
if %option1% == runproxy goto runproxy
if %option1% == runbot goto runbot
if %option1% == changeram goto changeram

goto mainarea
pause

:changeram
cls

echo.

set /p input=Type "Xms5G"(Min Ram usable):
set /p replacement=Type it again but with your desired number of RAM:

powershell -Command "(Get-Content '%filename%') | Foreach-Object {$_ -replace '%input%', '%replacement%'} | Set-Content '%filename%'"

set /p input2=Type "Xmx6G"(Max Ram usable):
set /p replacement2=Type it again but with your desired number of RAM:

powershell -Command "(Get-Content '%filename%') | Foreach-Object {$_ -replace '%input2%', '%replacement2%'} | Set-Content '%filename%'"
echo.
echo Done, reloading...
echo.
timeout /t 2 /nobreak >nul
start /B /c "%~f0" & goto configarea

pause

:runarea
cls

echo.
echo      TYPE "mainarea" TO GO BACK TO THE MAIN AREA.
echo.
echo  - To run all the stuff needed for the server, Type "runall"
echo    (If you don't have a discord bot or playit proxy
echo    you might get errors, it's OK. The server will
echo    still work :D )
echo  - To run only the local server, Type "run"
echo  - To run only the playit proxy, Type "runproxy"
echo  - To run only the discord bot, Type "runbot"
echo.

set /p option1= [%username%]~ 
if %option1% == configarea goto configarea
if %option1% == runarea goto runarea
if %option1% == mainarea goto mainarea
if %option1% == info goto info
if %option1% == runall goto runall
if %option1% == run goto run
if %option1% == runproxy goto runproxy
if %option1% == runbot goto runbot
if %option1% == changeram goto changeram

goto mainarea
pause

:info
cls

echo    TYPE "mainarea" TO GO BACK TO THE MAIN AREA.
echo.
echo.
echo  - https://github.com/melomel07/mcrunit
echo.
echo.

set /p option1= [%username%]~ 
if %option1% == configarea goto configarea
if %option1% == runarea goto runarea
if %option1% == mainarea goto mainarea
if %option1% == info goto info
if %option1% == runall goto runall
if %option1% == run goto run
if %option1% == runproxy goto runproxy
if %option1% == runbot goto runbot
if %option1% == changeram goto changeram

goto mainarea
pause

:runall
cls

echo.
echo   Please be patient, this may take a bit!
echo.

start "..\Python\Python311\python.exe" "dbot.py"

for %%k in (%keywords%) do (
	for %%f in ("%searchDir%\*%%k*.exe") do (
		start %%f
	)
)

for %%k in (%keywords%) do (
	for %%f in ("%searchDir%\*%%k*.jar") do (
		java -Xmx6G -Xms5G -jar "%%f" nogui 
	)
)

echo.

echo   TYPE "mainarea" TO GO BACK TO THE MAIN AREA.
echo.

set /p option1= [%username%]~ 
if %option1% == configarea goto configarea
if %option1% == runarea goto runarea
if %option1% == mainarea goto mainarea
if %option1% == info goto info
if %option1% == runall goto runall
if %option1% == run goto run
if %option1% == runproxy goto runproxy
if %option1% == runbot goto runbot
if %option1% == changeram goto changeram

goto mainarea
pause

:run
cls

echo.
echo   Please be patient, this may take a bit!
echo.

for %%k in (%keywords%) do (
	for %%f in ("%searchDir%\*%%k*.jar") do (
		java -Xmx6G -Xms5G -jar "%%f" nogui 
	)
)

echo.

echo   TYPE "mainarea" TO GO BACK TO THE MAIN AREA.
echo.

set /p option1= [%username%]~ 
if %option1% == configarea goto configarea
if %option1% == runarea goto runarea
if %option1% == mainarea goto mainarea
if %option1% == info goto info
if %option1% == runall goto runall
if %option1% == run goto run
if %option1% == runproxy goto runproxy
if %option1% == runbot goto runbot
if %option1% == changeram goto changeram

goto mainarea
pause

:runproxy
cls

for %%k in (%keywords%) do (
	for %%f in ("%searchDir%\*%%k*.exe") do (
		start %%f
	)
)

echo   TYPE "mainarea" TO GO BACK TO THE MAIN AREA.
echo.

set /p option1= [%username%]~ 
if %option1% == configarea goto configarea
if %option1% == runarea goto runarea
if %option1% == mainarea goto mainarea
if %option1% == info goto info
if %option1% == runall goto runall
if %option1% == run goto run
if %option1% == runproxy goto runproxy
if %option1% == runbot goto runbot
if %option1% == changeram goto changeram

goto mainarea
pause

:runbot
cls

echo.

start "..\Python\Python311\python.exe" "dbot.py"

echo   TYPE "mainarea" TO GO BACK TO THE MAIN AREA.
echo.

set /p option1= [%username%]~ 
if %option1% == configarea goto configarea
if %option1% == runarea goto runarea
if %option1% == mainarea goto mainarea
if %option1% == info goto info
if %option1% == runall goto runall
if %option1% == run goto run
if %option1% == runproxy goto runproxy
if %option1% == runbot goto runbot
if %option1% == changeram goto changeram

goto mainarea
pause