from numpy import *

limits = loadtxt(r"LUX201608_Psi_pb.txt")

x = log10(limits[:,0])
y = log10(limits[:,1])

test = log10(loadtxt(r"testpoint.dat"))


if test[1] < interp(test[0], x, y) :
    open("AllowFlag2016_psi.txt",'w').write('2016')
else:
    open("AllowFlag2016_psi.txt",'w').write('-2016')
