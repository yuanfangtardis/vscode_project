#! /usr/bin/env python 
from pylab import *
from numpy import *

def p(x):
    '''
    the target pdf
    example: the mixing of two gaussian distribution
    '''
    return 0.3*exp(-(x-0.3)**2)+0.7*exp(-(x-2.)**2/0.3)

def sampling(nsamples):
    M=0.72
    samples=zeros(nsamples)
    count=0
    for i in range(nsamples):
        accept=False
        while not accept:
            x=rand()*4
            u=random.rand()*M
            if u<p(x):
                accept=True
                samples[i]=x
            else:
                count+=1
    print count
    return samples

x=arange(0,4,0.01)
x2=arange(-0.5,4.5,0.1)
realdata=p(x)
box=ones(len(x2))*0.75
box[:5]=0
box[-5:]=0
plot(x,realdata,'r',lw=6)
plot(x2,box,'g--',lw=6)
# show()

import time
t0=time.time()
samples=sampling(10000)
t1=time.time()
print "Time=",t1-t0

hist(samples,15,normed=1,fc='b')
xlabel('x',fontsize=24)
ylabel('p(x)',fontsize=24)
axis([-0.5,4.5,0,1])
show()

