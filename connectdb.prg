local connectionString
connectionString = "Driver={SQL Server};Server=MDM0001L;Database=MDM;Uid=sa;Pwd=YgPz$123;"

use
clear

LOCAL connHandle,dbName
Local sql

&& Define Database
dbName = "ron_foxpro"

use (dbName)

sql = "truncate table " + dbName

connHandle = SQLSTRINGCONNECT(connectionString)
= SQLSETPROP(connHandle, 'asynchronous', .f.)
= SQLEXEC(connHandle, sql,dbName)
= SQLDISCONNECT(connHandle)
sql = ""

scan
	&&IDInsert = ID
	&&Data1Insert = Data1
	&&Data2Insert = Data2
	

	
		sql = "insert into " + dbName + " values(" + (str(ID,2)) + ",'" + Data1 + "'," + str(Data2,15,3) + ")" 
?sql
	connHandle = SQLSTRINGCONNECT(connectionString)
	= SQLSETPROP(connHandle, 'asynchronous', .f.)
	= SQLEXEC(connHandle, sql,dbName)
	= SQLDISCONNECT(connHandle)
	sql = ""
endscan

sql = "select * from ron_test"

connHandle = SQLSTRINGCONNECT(connectionString)
= SQLSETPROP(connHandle, 'asynchronous', .f.)
= SQLEXEC(connHandle, sql,dbName)
= SQLDISCONNECT(connHandle)

browse



