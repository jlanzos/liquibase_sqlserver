:MENU_START
@echo off
cls
set INPUT=false
set "MENU_OPTION="
set "OPTION1_INPUT="
set "OPTION2_INPUT="
echo .
echo +===============================================+
echo .        Liquibase - Developer Menu             .
echo +===============================================+
echo .                                               .
echo .  1) Liquibase Status                          .
echo .  2) liquibase Info                            .
echo .  3) liquibase Validate                        .
echo .  4) liquibase Check Update                    .
echo .  -------------------------------------------  .
echo .  5) liquibase Execute Update                  .
echo .  -------------------------------------------  .
echo .  0) Exit                                      .
echo .                                               .
echo +===============================================+
echo .
set /p MENU_OPTION="  Enter number (0-5) : "

IF %MENU_OPTION%==1 GOTO OPTION1
IF %MENU_OPTION%==2 GOTO OPTION2
IF %MENU_OPTION%==3 GOTO OPTION3
IF %MENU_OPTION%==4 GOTO OPTION4
IF %MENU_OPTION%==5 GOTO OPTION5
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
call validate.bat
pause
GOTO MENU_START 
 

:OPTION4
set INPUT=true
call update-sql.bat
pause
GOTO MENU_START

:OPTION5
set INPUT=true
call update.bat
pause
GOTO MENU_START

:OPTION0
set INPUT=true
echo Bye
exit /b

:DEFAULT
 
 
GOTO MENU_START