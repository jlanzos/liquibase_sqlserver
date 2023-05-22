cls
echo Esquemas generados: dbo,FI
echo ..
liquibase snapshot  --defaults-file=config\liquibase.properties --output-file-encoding=UTF-8 --output-file=snapshot\snapshot.json  --snapshot-format=json --schemas=dbo,FI
	