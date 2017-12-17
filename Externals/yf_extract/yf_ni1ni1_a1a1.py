#!/usr/bin/env python

'''
  author: yuanfang,xiaofei
  notes:extract ~nI1 ~nI1 - -> A1 A1 cross section from omg.out
'''
import os
f = open('omg.out','r')
f_out=open('yf_results.txt','w')
my_string = f.readlines()[3]
data,comment=my_string.split('#')

print data
print comment
process=comment.split()
desired_process=['~nI1','~nI1','->','Ah2','Ah2']
if process==desired_process:
    print 'the ~nI1 ~nI1 -> A1 A1 FOUND!'
    f_out.write('1')
else:
    print 'the ~nI1 ~nI1 -> A1 A1 NOT FOUND!'
    f_out.write('0')

f.close()
f_out.close()

