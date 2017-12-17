#!/usr/bin/env python
import os,sys
from mpi4py import MPI
import configparser
comm=MPI.COMM_WORLD
rank=comm.Get_rank()
from random import random 
# cf=configparser.ConfigParser()
# cf.read(sys.argv[1])
# scan_method=cf.get('scan','Scan method')
# print 'scan_method=',scan_method
print 'rank',rank,' has random number',random()
