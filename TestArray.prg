clear
use ron_foxpro

select count(*)  from ron_foxpro into array RowCount
?RowCount

select * from ron_foxpro into array laTestArray

for i = 1 to RowCount
	for ii = 1 to alen(laTestArray,1)
		?laTestArray(i,ii)
	next
next

close database