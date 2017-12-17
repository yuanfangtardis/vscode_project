from numpy import *

limits = loadtxt(r"d_lux_300.txt")

x = log10(limits[:,0])
y = log10(limits[:,1])

test = log10(loadtxt(r"testpoint2.dat"))

if test[1] < interp(test[0], x, y) :
    open("AllowFlag2015.txt",'w').write('2015')
else:
    open("AllowFlag2015.txt",'w').write('-2015')
