#!/usr/bin/env python
from mpi4py import MPI
comm=MPI.COMM_WORLD
rank=comm.Get_rank()

a=raw_input('waiting for the input...')
f=open('mpi_input.txt','r')
lines=f.readlines()

print 'rank',rank,' has lines ',lines
