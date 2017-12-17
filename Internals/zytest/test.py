#!/usr/bin/env python
# For test ES
# by ZY
from numpy import *

data = loadtxt(r"inp.dat")

x = data[0]
y = data[1]
m=data[2]
# z = x**2+(y-(x**2)**(1.0/3.0))**2
# z=x**2+y**2
z=x+y+m

open("output.txt",'w').write(str(z))
print "I am runing..."
print "z=",z