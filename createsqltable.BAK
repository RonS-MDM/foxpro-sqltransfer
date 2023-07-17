*!*	Create table in SQL
clear
*!*	Define SQL Connection String
*!* Open foxpro table
local connectionString
connectionString = "Driver={SQL Server};Server=MDM0001L;Database=MDM_Dev;Uid=sa;Pwd=YgPz$123;"

use cldentch

*!* Define variables
local CreateTable,length,DBName

DBName = "cldentch"

*!* dtart defining SQL Statement
CreateTable = "create table cldentch("

*!*Create loop to add filedls to table
for ix = 1 to afields(laFieldInfo)
	&& Define field name
	createtable = createtable + "[" + laFieldInfo[m.ix,1]+ "]"
	&& Define field type and size
	do case
	case laFieldInfo[m.ix,2] = "C" 
		createtable = createtable + " " + "varchar(" + ltrim(str(laFieldInfo[m.ix,3],4)) + "),"
	case laFieldInfo[m.ix,2] = "I" 
		createtable = createtable + " " + "int,"
	case laFieldInfo[m.ix,2] = "N" 
		createtable = createtable + " " + "numeric(" + ltrim(str(laFieldInfo[m.ix,3],4)) + "," + ltrim(str(laFieldInfo[m.ix,4],4)) + "),"
	case laFieldInfo[m.ix,2] = "D" or laFieldInfo[m.ix,2] = "T"
		createtable = createtable + " " + "datetime,"
	case laFieldInfo[m.ix,2] = "L" 
		createtable = createtable + " " + "varchar(1),"
	case laFieldInfo[m.ix,2] = "M" 
		createtable = createtable + " " + "varchar(max),"
	endcase
	

endfor
&& Add closing bracket and remove trailing comma
length = len(createtable)

length1 = length - 1
SQL = left(createtable,length1)
SQL = SQL + ")"

? SQL

*!*	Create Table in SQL
connHandle = SQLSTRINGCONNECT(connectionString)
	= SQLSETPROP(connHandle, 'asynchronous', .f.)
	= SQLEXEC(connHandle, sql,DBName)
	= SQLDISCONNECT(connHandle)
	sql = ""