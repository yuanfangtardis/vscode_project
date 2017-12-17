#!/usr/bin/env python
cmd1='python GsphenoInput.py'     # length=2
cmd2='rm SPheno.spc.seesaw1nmssm' # length=2
cmd3='./SPheno-4.0.3/bin/SPhenoseesaw1nmssm SPheno-4.0.3/GsphenoInput.txt'  #length=2
cmd4='rm -rf yf_results.txt'  #length=3
cmd5='./cal.py'    # length=1

def analyze_cmd(cmd):
    '''
    Author:yuanfang
    Date:2017.12.7
    Function:analyze the cmd for the parallel 
    '''
    cmd_lists=cmd.split()

    # cmd_result={'interpreter':{},'shell_cmd':{},'program':{},'inputfile':{}}
    cmd_result=dict()
    if len(cmd_lists)==1:  # ll, ls, ./cal.py
        if cmd_lists[0] in ['ll','ls','ps','top']:
            cmd_result['shell_cmd']=cmd_lists[0]
        else:
            cmd_result['program']=cmd_lists[0]
    elif len(cmd_lists)==2:
        if cmd_lists[0] in ['python']:
            cmd_result['interpreter']=cmd_lists[0]
            cmd_result['program']=cmd_lists[1]
        elif cmd_lists[0] in ['bash','sh']:
            cmd_result['interpreter']=cmd_lists[0]
            cmd_result['shell_cmd']=cmd_lists[1]
        elif cmd_lists[0] in ['rm','cat']:
            cmd_result['shell_cmd']=cmd_lists[0]
            cmd_result['inputfile']=cmd_lists[1]
        else:
            cmd_result['program']=cmd_lists[0]
            cmd_result['inputfile']=cmd_lists[1]
    elif len(cmd_lists)==3:
        if cmd_lists[0] in ['rm','cat']:
            cmd_result['shell_cmd']=cmd_lists[0]
            if cmd_lists[1].startswith('-'):
                cmd_result['option']=cmd_lists[1]
            cmd_result['inputfile']=cmd_lists[2]
    return cmd_result

def cmd_reorganize(cmd,rank):
    '''
    Author:yuanfang
    Date: 2017.12.7
    Function: To re-organize the cmd for the convention of parallelation
    '''
    cmd_result=analyze_cmd(cmd)
    # print 'before:cmd_results=',cmd_result

    if cmd_result.has_key('inputfile'):
        cmd_result['inputfile']='./'+str(rank)+'/'+cmd_result['inputfile']
    if cmd_result.has_key('program'):
        cmd_result['program']='../'+cmd_result['program']
    
    cmd_new=cmd_result.get('interpreter',' ')+cmd_result.get('shell_cmd',' ')+\
       cmd_result.get('program',' ')+cmd_result.get('inputfile',' ')
    # return cmd_new
    # print 'rephrased='
    return cmd_new

    

print 'cmd1=',cmd1,'\n cmd_new=',cmd_reorganize(cmd1,1)
print '******************************'
print 'cmd2=',cmd2,'\n cmd_new=',cmd_reorganize(cmd2,1)
print '******************************'
print 'cmd3=',cmd3,'\n cmd_new=',cmd_reorganize(cmd3,1)
print '******************************'
print 'cmd4=',cmd4,'\n cmd_new=',cmd_reorganize(cmd4,1)
print '******************************'
print 'cmd5=',cmd5,'\n cmd_new=',cmd_reorganize(cmd5,1)

