clear
close databases
use pharmchn

*!*	? afields(lafieldinfo)
for ix = 1 to afields(laFieldInfo)


?laFieldInfo[m.ix,1]  &&Filed Name
?laFieldInfo[m.ix,2]  &&Field Type
?laFieldInfo[m.ix,3]  &&Field Length
?laFieldInfo[m.ix,4]  &&Decimal Places


endfor