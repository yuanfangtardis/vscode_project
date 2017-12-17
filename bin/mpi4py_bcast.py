#!/usr/bin/env python2.7
import os
from mpi4py import MPI

comm=MPI.COMM_WORLD
rank=comm.Get_rank()
size=comm.Get_size()

if rank==0:
    # yy={'a':1,'b':2}
    data=[1,2,3]
    comm.bcast(data,root=0)
    print 'rank',rank, 'sending data...',data
else:
    data=comm.bcast(None,root=0)
    print 'rank',rank,'has data',data