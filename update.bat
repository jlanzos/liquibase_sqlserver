echo off
cls
:choice
set c=N
set /P c=Deseas ejecutar update de cambios[Y/N]?
if /I "%c%" EQU "Y" goto :do_update
if /I "%c%" EQU "N" goto :END
goto :choice
:do_update
liquibase --defaults-file=config\liquibase.properties --log-file=log\liquibase.log --search-path=scripts update-sql

:END

