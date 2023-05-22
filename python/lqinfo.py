'''
   lqinfo.py
   Version SQL Server
'''
import configparser
import pymssql


def config():
    global server,DDBB,schema,dbuser,dbpass,n_clog
    config = configparser.ConfigParser()
    config.read('..\config\config.ini')
    # Parámetros de conexión
    server=(config['properties']['server'])      # Server
    dbuser=(config['properties']['dbuser'])      # Usuario de la BBDD
    dbpass=(config['properties']['dbpass'])      # Clave de la BBDD
    DDBB  =(config['properties']['DDBB'])        # DDBB
    schema=(config['properties']['schema'])      # Schema
    n_clog=(config['info']['n_clog'])            # Número de changelog a mostrar
    
def create_connection():   
    conn = None
    try:
        conn = pymssql.connect(server, dbuser, dbpass, DDBB)  
    except:
        print("Error in conex")
    return conn


def select_lock(conn):   
    cur = conn.cursor()
    cur.execute("SELECT * FROM "+schema+".DATABASECHANGELOGLOCK  ")
    rows = cur.fetchall()
    print("Lock:")
    print(' ID Locked Lock Granted Locked By')
    print(' -- ------ ------------ ---------')
    for row in rows:
        print(" ",row[0],row[1],row[2],row[3] )


def select_changelogs(conn):   
    cur = conn.cursor()
    cur.execute("SELECT top "+n_clog+" * FROM "+schema+".DATABASECHANGELOG  order by dateexecuted  DESC")
    rows = cur.fetchall()
    print("\nChangelogs")
    print(' ------------------+---------------+------------------------------+----------------+----------+-------------------------------+-----------+-------------')
    print(' ID                 Author          Filename                       Date Executed    Exec Type  Comments                        Context     Labels')
    print(' ------------------+---------------+------------------------------+----------------+----------+-------------------------------+-----------+-------------')
    for row in rows:
        print("",row[0].ljust(18),row[1].ljust(15),row[2].ljust(30),row[3].strftime('%m/%d/%Y %H:%M'),row[5].ljust(10),row[8].ljust(31),row[11],row[12])
    
    print(' ------------------+---------------+------------------------------+----------------+----------+-------------------------------+-----------+-------------')
   


def main():
    config()
    print ("Info:")
    print (" Server:",server, "  DDBB:",DDBB,"  Schema:",schema,"  User:",dbuser,"\n")
    conn = create_connection()
    with conn:
        select_lock(conn)                        
        select_changelogs(conn)


if __name__ == '__main__':
    main()
