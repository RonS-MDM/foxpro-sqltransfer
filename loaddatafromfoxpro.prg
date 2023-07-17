*!*	Create table in SQL
clear
*!*	Define SQL Connection String
*!* Open foxpro table
local connectionString
connectionString = "Driver={SQL Server};Server=MDM0001L;Database=MDM;Uid=sa;Pwd=YgPz$123;"

use agency_commissions

*!* Define variables
local LoadData,length,DBName

DBName = "agency_commissions"

*!* dtart defining SQL Statement
LoadData = "insert into " +  dbName +  " values("

&& Get Number of records in DB
&&select count(*) from agency_commissions into array RowCount
RowCount  = 10
&& Load table into Array
select top 10 * from agency_commissions into array laTestArray order by agency

for i = 1 to RowCount
	for ii = 1 to afields(laTestArray1)
		do case
		case laTestArray1[ii,2] = "C" 
			LoadData = LoadData + "'" + rtrim(laTestArray(i,ii)) +"'" + ","
		case laTestArray1[ii,2] = "I" 
			LoadData= LoadData + ltrim(str(laTestArray(i,ii))) +  ","
		case laTestArray1[ii,2] = "N" 
			LoadData= LoadData + ltrim(str(laTestArray(i,ii),laTestArray1(ii,3),laTestArray1(ii,4))) + ","&&,ltrim(str(laTestArray1,4)))&&,ltrim(str(laFieldInfo[m.ix,4],4)) + "),"
		case laTestArray1[ii,2] = "D" or laTestArray1[ii,2] = "T"
			?laTestArray(i,ii)
			do case
				case laTestArray(i,ii) = 
					LoadData= LoadData + "'00/00/0000',"
					else
					LoadData= LoadData + "'" + transform(laTestArray(i,ii)) + "',"
				endcase
		case laTestArray1[ii,2] = "L" 
			&&LoadData= LoadData + "'" + rtrim(str(laTestArray(i,ii),1)) +"'" + ","
			LoadData= LoadData + "'" + substr(transform(laTestArray(i,ii)),2,1) + "',"
		case laTestArray1[ii,2] = "M" 
			LoadData= LoadData+ " '" + rtrim(laTestArray(i,ii)) +"'" + ","
		endcase
		
	next
	&& Add closing bracket and remove trailing comma
length = len(LoadData)

length1 = length - 1
SQL = left(LoadData,length1)
SQL = SQL + ")"
	?i
	?LoadData
	?SQL
	 &&Load Data into SQL 
	connHandle = SQLSTRINGCONNECT(connectionString)
	= SQLSETPROP(connHandle, 'asynchronous', .f.)
	= SQLEXEC(connHandle, SQL,DBName)
	= SQLDISCONNECT(connHandle)
	LoadData = "insert into " +  dbName +  " values("
	SQL = ""
next
	


&& Add closing bracket and remove trailing comma
*!*	length = len(LoadData)

*!*	length1 = length - 1
*!*	SQL = left(LoadData,length1)
*!*	SQL = SQL + ")"

*!*	scan

*!*	?sql
*!*	connHandle = SQLSTRINGCONNECT(connectionString)
*!*		= SQLSETPROP(connHandle, 'asynchronous', .f.)
*!*		= SQLEXEC(connHandle, sql,dbName)
*!*		= SQLDISCONNECT(connHandle)
*!*		sql = ""

*!*	endscan
