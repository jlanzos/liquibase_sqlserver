echo off
cls
:choice
set c=N
set /P c=Do you want to create Liquibase tables [Y/N]?
if /I "%c%" EQU "Y" goto :do_init
if /I "%c%" EQU "N" goto :END
goto :choice
:do_init
liquibase --defaults-file=config\liquibase.properties --log-file=log\liquibase.log   update --changelog-file=config\init.sql

:END
 
