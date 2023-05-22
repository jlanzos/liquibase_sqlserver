:MENU_START
@echo off
cls
set INPUT=false
echo    .
echo    +===============================================+
echo    .          Liquibase - Admin Menu               .
echo    +===============================================+
echo    .                                               .
echo    .  ---------------- Information --------------  .
echo    .  1) Status                                    .
echo    .  2) Info                                      .
echo    .  3) History                                   .
echo    .                                               .
echo    .  ------------- Changelog Schema ------------  .
echo    .  4) Create Schema                             .
echo    .  5) Show Schema                               .
echo    .  6) Create Snapshot                           .
echo    .  7) Show Snapshot                             .
echo    .                                               .
echo    .  ----------- Liquibase DDBB Init -----------  .
echo    .  8) Create Liquibase Tables                   .
echo    .                                               .
echo    .  -------------------------------------------  .
echo    .  0) Exit                                      .
echo    .                                               .
echo    +===============================================+
echo    .
set /p MENU_OPTION="     Enter number (0-6) : "

IF %MENU_OPTION%==1 GOTO OPTION1
IF %MENU_OPTION%==2 GOTO OPTION2
IF %MENU_OPTION%==3 GOTO OPTION3
IF %MENU_OPTION%==4 GOTO OPTION4
IF %MENU_OPTION%==5 GOTO OPTION5
IF %MENU_OPTION%==6 GOTO OPTION6
IF %MENU_OPTION%==7 GOTO OPTION7
IF %MENU_OPTION%==8 GOTO OPTION8
IF %MENU_OPTION%==0 GOTO OPTION0
IF %MENU_OPTION%==x GOTO OPTION0
IF %INPUT%==false GOTO DEFAULT

:OPTION1
set INPUT=true
call status.bat
pause
GOTO MENU_START

:OPTION2
set INPUT=true
call info.bat
GOTO MENU_START

:OPTION3
set INPUT=true
call history.bat
pause
GOTO MENU_START 

:OPTION4
set INPUT=true
call generate-cl.bat
pause
GOTO MENU_START 

:OPTION5
set INPUT=true
"C:\Program Files\Notepad++\notepad++.exe" scripts\changelog.mssql.sql
pause
GOTO MENU_START

:OPTION6
set INPUT=true
call snapshot.bat
pause
GOTO MENU_START 

:OPTION7
set INPUT=true
"C:\Program Files\Notepad++\notepad++.exe" snapshot\snapshot.json
pause
GOTO MENU_START

:OPTION8
set INPUT=true
call init.bat
pause
GOTO MENU_START

:OPTION0
set INPUT=true
echo Bye
exit /b

:DEFAULT
 
 
GOTO MENU_START