cls
echo Esquemas generados: dbo,FI
echo ..
liquibase generate-changelog  --defaults-file=config\liquibase.properties --output-file-encoding=UTF-8 --changelog-file=scripts\changelog.mssql.sql --overwrite-output-file=True --include-schema=True --schemas=dbo,FI
	