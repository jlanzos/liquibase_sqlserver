echo off
cls
liquibase --defaults-file=config\liquibase.properties --log-file=log\liquibase.log --search-path=scripts  validate
pause