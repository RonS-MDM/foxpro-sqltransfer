*!*	Work with data in foxpr table (ron_foxpro)

clear
close databases
use ron_foxpro

*!*	? afields(lafieldinfo)
sql1 = "insert into ron_test values ("
for ix = 1 to afields(laFieldInfo)
sql1 = sql1 + laFieldInfo[m.ix,1] + ","

FieldName = laFieldInfo[m.ix,1]

endfor

sql1 = sql1 + ")"


?sql1





