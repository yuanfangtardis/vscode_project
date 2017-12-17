#!/usr/bin/env python
#########################################################################
#                                                                       #
#    Some usefull functions.                                            #
#                                                                       #
#########################################################################
# External modules.
import os
import sys
import optparse
import logging
import logging.config
import time

print '\033[1;36;2m'
print '''
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
____ ____ ____ _   _ ____ ____ ____ _  _ _  _ ____ ___
|___ |__| [__   \_/  [__  |    |__| |\ | |__| |___ |__]
|___ |  | ___]   |   ___] |___ |  | | \| |  | |___ |

                                       Version: beta 1.1
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'''
print '\033[0m'

## Add debug option
usage = "usage: %prog [options] [FILE] "
parser = optparse.OptionParser(usage=usage)
parser.add_option("-l", "--logging", default='INFO',
        help="logging level (DEBUG|INFO|WARNING|ERROR|CRITICAL) [%default]")
parser.add_option("-d","--debug", action="store_true", default=False,
        dest='debug', help='force to launch debug mode')
(options, args) = parser.parse_args()
if len(args) == 0:
    args = ''

## Configure logging info
if options.debug and options.logging == 'INFO':
    options.logging = 'DEBUG'

logging.config.fileConfig('.easyscan_logging.conf',
        defaults={'logfilename': 'EASYSCAN.LOG'})
logging.root.setLevel(vars(logging)[options.logging])
logging.getLogger('easyscan').setLevel(vars(logging)[options.logging])
                              
logger=logging.getLogger('easyscan.main')

##check whether the configure file exists
try:
    open(sys.argv[1],'r')
except IndexError:
    logger.error('No configfile for the script easyscan')
    print 'Usage: ./easyscan configfile'
    sys.exit(1)
except IOError:
    logger.error('Configfile not exist')
    sys.exit(1)

## initialize par
log_zero = -1e+100
NaN = float('NaN')
CurrentPath = os.getcwd()

## some useful futions

def ColorText(i,text,j=1):
    return '\033[%i;3%i;2m %s\033[0m' %(j,i,text)

def GotoWeb():
    print ColorText(1,'# Goto ') + ColorText(1,'http://easyscanhep.hepforge.org',4) + ColorText(1,' for detail.')

def WarningWait(warinfo):
    logger.warning(ColorText(1,warinfo))
    GotoWeb()
    print ColorText(1,'# Waiting 3 seconds for WARNING.')
    time.sleep(3)

def WarningNoWait(warinfo):
    logger.warning(ColorText(1,warinfo))
    GotoWeb()

def ErrorStop(errinfo):
    logger.error( ColorText(1,errinfo) )
    GotoWeb()
    print ColorText(1,'# Exiting with ERROR.')
    sys.exit(1)

def Info(debinfo):
    logger.info( ColorText(2,debinfo) )

def Debug(debinfo,debvalue=''):
    if debvalue=='':
        logger.debug( ColorText(5, str(debinfo) ) )
    else:
        logger.debug( ColorText(5, str(debinfo)+': '+str(debvalue) ) )
def autotype(s):
    if type(s) is not str:
        return s
    if s.isdigit():
        return int(s)
    try:
        return float(s)
    except ValueError:
        return s

def string2list(s):
    s = [ autotype(ss.strip()) for ss in s.split('\n') ]
    return s

def string2nestlist(s):
    s = map( lambda x: x.split(','), s.split('\n') )
    s = [[autotype(x.strip()) for x in ss] for ss in s]
    return s

def WriteResultInf(InPar,OutPar,Path,File,ScanMethod):
    file_inf = open(os.path.join(Path,'ScanInf.txt'),'w')
    file_inf.write(    '\t'.join([Path, File])     +'\n')
    i   = 0
    for name in InPar:
        file_inf.write('\t'.join([name,str(i)])+'\n')
        i += 1
    for name in OutPar :
        file_inf.write('\t'.join([name,str(i)])+'\n')
        i += 1
    file_inf.write('\t'.join(['loglike',str(i)])+'\n')
    if ScanMethod == 'MCMC':
        file_inf.write('\t'.join(['mult',str(i+1)])+'\n')
    file_inf.close()











