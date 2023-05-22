'''
   lqcrea.py
   Version SQL Server
   Decidir si los desarrolladores van a utilizar pipeline para lanzar updates
   o por ventana de comandos 
   Lo lógico es por pipeline, aunque preferirán lanzar manualmente y 
   al final la pipeline, en cuyo caso la pipeline sólo sería para el commit/push 
   pull request
'''
import time
import sys
import configparser
                
#
# Lectura de archivo de configuración       
#
def config():
  global user,labels,context,fsql,ID,fnamecl,url,dbuser,dbpass
  # Parámetros de fichero changelog
  config = configparser.ConfigParser()
  config.read('..\config\config.ini')
  user=(config['changelog']['user'])           # Nombre del desarrolador
  labels=(config['changelog']['labels'])       # Etiqueta de agrupación
  context=(config['changelog']['context'])     # Contexto : DEV/PRO
  fsql=(config['changelog']['fsql'])           # Fichero que contiene el script DDL/DML
  ID     =time.strftime("%Y%m%d-%H%M%S")       # ID delchangelog en base a fecha-hora
  fnamecl='..\\\scripts\\\changelog_'+ID+'.sql'               # Nombre del fichero changelog
  # Parámetros de fichero liquibase.properties
  server=(config['properties']['server'])      # Server
  port  =(config['properties']['port'])        # Port
  stype =(config['properties']['stype'])       # Server Type
  DDBB  =(config['properties']['DDBB'])        # BBDD
  schema=(config['properties']['schema'])      # schema
  dbuser=(config['properties']['dbuser'])      # Usuario de la BBDD
  dbpass=(config['properties']['dbpass'])      # Clave de la BBDD
  url="jdbc:"+stype+"://"+server+";databaseName="+DDBB+";queryTimeout=5;trustServerCertificate=true;integratedsecurity=False;defaultSchemaName="+schema
  
  #print (url)
 

#
# Generación de archivo liquibase.properties          
#
def properties():
  fname  = '..\config\liquibase.properties'
  with open(fname, 'w') as f:
     f.write('changeLogFile:'+fnamecl)
     f.write('\nliquibase.command.url:'+url)
     f.write('\nliquibase.command.username:'+dbuser)
     f.write('\nliquibase.command.password:'+dbpass)
     f.write('\nlogLevel: ERROR')
     f.write('\nlogFile: liquibase.log')  
     f.write('\nliquibase.showBanner:false')  
     f.write('\nliquibase.liquibaseSchemaName=dbo')    
  f.close() 
  print ('liquibase.properties:')
  file1 = open(fname, 'r')
  Lines = file1.readlines()
  for line in Lines: 
          print('  '+line.strip())     

#
# Generación de archivo changelog
#
def changelog():  
  try:
    comment=sys.argv[1]
  except:
    comment=' '
  file1 = open(fsql, 'r')
  Lines = file1.readlines()

  with open(fnamecl, 'w') as f:
     f.write('--liquibase formatted sql')
     f.write('\n\n--changeset '+user +':'+ID+' labels:'+labels+' context:' + context)  
     f.write('\n--comment:'+comment+'\n')
     for line in Lines: 
          f.write(line.strip()+'\n')

  file1.close()
  f.close()
  print ('\nchangelog:')
  file1 = open(fnamecl, 'r')
  Lines = file1.readlines()
  for line in Lines: 
          print('  '+line.strip())   
 
def main(): 
	config()
	properties()   
	changelog()
	    
if __name__ == "__main__":
   main()
