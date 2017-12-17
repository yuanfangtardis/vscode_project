#!/usr/bin/env python
import os,sys
import re,shutil
import subprocess
import linecache
import random
import time
import math

import subfun as sf

class program:
    def __init__(self):
        self._ProgName  =''
        self._Command   =''
        self._ComPath   =''
        self._InputFile ={}
        self._InputVar  =[]
        self._OutputFile={}
        self._OutputVar ={}
        
        self._InFileID =[]
        self._OuFileID =[]

        self._InFilVar  ={}
        self._InRepVar  ={}
        self._InPosVar  ={}
        self._InLabVar  ={}
        self._InSLHAVar ={}
        
        self._OuFilVar  ={}
        self._OuPosVar  ={}
        self._OuLabVar  ={}
        self._OuSLHAVar ={}
    
        self.outvar = {}
            
        self._Count   = 0
        self._runflag = 'True'
        
        #yuanfang added for parallel polychord and multinest 
        self._parallel_flag=False
        self._parallel_path='parallel_test'

    def setParallel_flag(self):
        '''Author: yuanfang
           Date:2017.12.5
           Function: set parallel run flag'''
        self._parallel_flag=True
    
    def getParallel_flag(self):
        '''Author: yuanfang
           Date:2017.12.5
           Function: set parallel run flag'''
        return self._parallel_flag

    def setProgName(self, name):
        self._ProgName=name
        sf.Info('...............................................')
        sf.Info('...............................................')
        sf.Info('Program name    = %s'% self._ProgName)
    def setCommand(self, command):
        self._Command=sf.string2nestlist(command)
        sf.Info('Execute command = %s'% self._Command)
    def setComPath(self, cpath):
        if cpath.startswith('/home') or cpath.startswith('~'):
            self._ComPath=cpath
        else:
            self._ComPath=os.path.join(sf.CurrentPath, cpath)
        if not os.path.exists(self._ComPath):
            sf.ErrorStop('Command path "%s" do not exist.'%self._ComPath)
        sf.Info('Command path    = %s'% self._ComPath)
    def setInputFile(self, inputfile):
        inputfile=sf.string2nestlist(inputfile)
        self._InFileID = [x[0] for x in inputfile ]
        sf.Info('Input file      = ')
        for ii in inputfile:
            if len(ii) != 2:
                if ii[0] == '':
                    break
                sf.ErrorStop('The input file of %s need two items (File ID, File path).'%self._ProgName)
            if not (ii[1].startswith('/home') or ii[1].startswith('~')):
                ii[1]=os.path.join(sf.CurrentPath, ii[1])
            self._InputFile[ii[0]]=ii[1]
            sf.Info('  fID= %s \tFile= %s'%(ii[0],ii[1]))

    def setInputVar(self, inputvar):
        self._InputVar=sf.string2nestlist(inputvar)
        
        for ii in self._InputVar:
            if len(ii) <4:
                if ii[0] == '': ## Program can have zero input parameters
                    return
                sf.ErrorStop( 'The input variables in program "%s" must have at least 4 items ( Name ID,  Input file ID,  Method, Note ).'%self._ProgName )
            if not ii[1] in self._InFileID:
                sf.ErrorStop( 'For input variable "%s" in program "%s", There is no input file with ID "%s"'%(ii[0],self._ProgName, ii[1]) )
        sf.Info('Input variable = ')
        file_flag = True
        for ii in self._InFileID:
            ## For 'File' method
            self._InFilVar[ii]  = [x for x in self._InputVar if (x[1] == ii) and (x[2].lower() == 'file')]
            for jj in self._InFilVar[ii]:
                if len(jj) != 4 :
                    sf.ErrorStop( 'For input variable "%s" in program "%s" with "Position" method, 4 items ( Name ID,  Input file ID,  Method, Replace/Add ) need to be provived.'%(jj[0],self._ProgName) )
                file_flag = False
                sf.Info( 'Becasue file (ID=%s) in program "%s" is obtained from prior program(s), the check of this file is ignored.')
                sf.Info('  varID= %s \tfID= %s \tMethod= %s by %s'%(jj[0],jj[1],jj[2],jj[3]))
        
            ## if the input file is not obtained from prior program(s), open the file and check it.
            if file_flag:
                try :
                    infile = open(self._InputFile[ii]).read()
                    ## if the last run of the same program stop by accident and 'Replace' method is used, there will exist a ESbackup file, and the input file do not contain the replaced item.
                    ## if this happened, BackupFlag = True
                    if os.path.exists(self._InputFile[ii]+'.ESbackup'):
                        try:
                            infile_bk = open(self._InputFile[ii]+'.ESbackup').read()
                            BackupFlag = True
                        except:
                            BackupFlag = False
                    else:
                        BackupFlag = False
                except:
                    sf.ErrorStop('Can not find/open the input file "%s" in program "%s".'%(self._InputFile[ii],self._ProgName))
                    
            ## For 'Replace' method
            ## save the input vars that use 'Replace' method
            self._InRepVar[ii] = [x for x in self._InputVar if (x[1] == ii) and (x[2].lower() == 'replace')]
            
            for jj in self._InRepVar[ii]:
                if len(jj) != 4 :
                    sf.ErrorStop( 'For input variable "%s" in program "%s" with "Replace" method, 4 items ( Name ID,  Input file ID,  Method, Name of replaced parameter ) need to be provived.'%(jj[0],self._ProgName) )
                sf.Info('  varID= %s \tfID= %s \tMethod= %s \tName= %s'%(jj[0],jj[1],jj[2],jj[3]))
                
                if file_flag:
                    match = re.findall(jj[3],infile)
                    if len(match)==0:
                        if not BackupFlag:
                            sf.ErrorStop( 'For input variable "%s" in program "%s" with "Replace" method, can not find "%s" in coressponding input file "%s" nor ESbackup file.'%(jj[0],self._ProgName,jj[3],self._InputFile[ii]) )
                        else:
                            bk_match = re.findall(jj[3],infile_bk)
                            if len(bk_match)==0:
                                sf.ErrorStop( 'For input variable "%s" in program "%s" with "Replace" method, can not find "%s" in coressponding input file "%s" nor ESbackup file.'%(jj[0],self._ProgName,jj[3],self._InputFile[ii]) )
                            else:
                                ## the input file is wrong, use the ESbackup file
                                infile = infile_bk
                                match = re.findall(jj[3],infile)
                                ## there is no backup file for the following par
                                BackupFlag = False
                                sf.WarningNoWait( 'For input variable "%s" in program "%s" with "Replace" method, the input file "%s" does not contain "%s", and ESbackup file exist. In the following, ESbackup file will take the part of input file.'%(jj[0],self._ProgName,self._InputFile[ii],jj[3]) )
                    if len(match)>1:
                        sf.WarningNoWait( 'For input variable "%s" in program "%s" with "Replace" method, find %i "%s" in coressponding input file "%s". They will all be replaced by variable "%s" in the following program.'%(jj[0],self._ProgName,len(match),jj[3],self._InputFile[ii],jj[0]) )
                    ## if the fist var do not use Backup file, the next var can not use
                    ## if the fist var use Backup, BackupFlag is already False
                    BackupFlag = False
                        
            if file_flag:
                if len(self._InRepVar[ii])>0:
                    open(self._InputFile[ii]+'.ESbackup','w').write(infile)
                    open(self._InputFile[ii],'w').write(infile)

                inlines = open(self._InputFile[ii]).readlines()
                invar = [ss.split() for ss in inlines]
            
            ## For 'Position' method
            ## save the input vars that use 'Position' method
            self._InPosVar[ii] = [x for x in self._InputVar if (x[1] == ii) and (x[2].lower() == 'position')]

            for jj in self._InPosVar[ii]:
                if len(jj) != 5 :
                    sf.ErrorStop( 'For input variable "%s" in program "%s" with "Position" method, 5 items ( Name ID,  Input file ID,  Method, Line number,  Column number ) need to be provived.'%(jj[0],self._ProgName) )
                sf.Info('  varID= %s \tfID= %s \tMethod= %s \tLine num= %s \tColumn num= %s'%(jj[0],jj[1],jj[2],jj[3],jj[4]))
                
                if file_flag:
                    sf.Debug('Position len(invar)',len(invar))
                    sf.Debug('Position line num',jj[3])
                    if len(invar) < jj[3]:
                        sf.ErrorStop( 'For input variable "%s" in program "%s" with "Position" method, the line number is larger than the lines of inoput file "%s". Please check your input file.'%(jj[0],self._ProgName,self._InputFile[ii]) )
                    sf.Debug('Position len(invar[line num])',len(invar[jj[3]-1]))
                    sf.Debug('Position Column number',jj[4])
                    if len(invar[jj[3]-1]) < jj[4]:
                        sf.ErrorStop( 'For input variable "%s" in program "%s" with "Position" method, the column number is larger than the columns in line %s of input file "%s". Please check your input file.'%(jj[0],self._ProgName,jj[3],self._InputFile[ii]) )
                         
            ## For 'Lable' method
            ## save the input vars that use 'Lable' method
            self._InLabVar[ii] = [x for x in self._InputVar if (x[1] == ii) and (x[2].lower() == 'lable')]
            
            for jj in self._InLabVar[ii]:
                if len(jj) != 5 :
                    sf.ErrorStop( 'For input variable "%s" in program "%s" with "Lable" method, 5 items ( Name ID,  Input file ID,  Method, Label name,  Input variable column number ) need to be provived.'%(jj[0],self._ProgName) )
                sf.Info('  varID= %s \tfID= %s \tMethod= %s \tLable= %s \tColumn= %s'%(jj[0],jj[1],jj[2],jj[3],jj[4]))
                
                if file_flag:
                    lablinum = [xxi for xxi,xx in enumerate(inlines) if jj[3] in xx]
                    if len(lablinum)==0:
                        sf.ErrorStop( 'For input variable "%s" in program "%s" with "Lable" method, there is no "%s" in input file "%s". Please check your input file.'%(jj[0],self._ProgName,jj[3],self._InputFile[ii]) )
                    for kk in lablinum:
                        sf.Debug('Labled line',inlines[kk].strip('\n'))
                        if len(invar[kk]) < jj[4]:
                            sf.ErrorStop( 'For input variable "%s" in program "%s" with "Lable" method, there is only %i columns in corresponding labled line "%s".'%(jj[0],self._ProgName,len(invar[lablinum[0]]),invar[lablinum[0]]) )
                        if invar[kk][jj[4]-1] == jj[3]:
                            sf.ErrorStop( 'For input variable "%s" in program "%s" with "Lable" method, the corresponding var is the label.'%(jj[0],self._ProgName) )
                                
            ## For 'SLHA' method
            ## save the input vars that use 'Lable' method
            self._InSLHAVar[ii] = [x for x in self._InputVar if (x[1] == ii) and (x[2].lower() == 'slha')]

            for jj in self._InSLHAVar[ii]:
                if len(jj) < 6 :
                    sf.ErrorStop( 'For input variable "%s" in program "%s" with "SLHA" method, at least 6 items ( Name ID,  Input file ID,  Method, BLOCK/DECAY, Block name/PDG, Keys) need to be provived.'%(jj[0],self._ProgName) )
                if not jj[3].upper() in ['BLOCK','DECAY']:
                    sf.ErrorStop( 'For input variable "%s" in program "%s" with "SLHA" method, the 4th item must be "BLOCK" or "DECAY". If you can to used other formats, please contact with the authors.'%(jj[0],self._ProgName) )
                sf.Info('  varID= %s \tfID= %s \tMethod= %s \tB/D= %s \tName= %s \tKeys= %s'%(jj[0],jj[1],jj[2],jj[3],jj[4],jj[5]))

                if file_flag:
                    blk = str(jj[4]).split()
                    blk_flag = False
                    ks  = str(jj[5]).split()
                    ks_flag  = False
                    for kk in invar:
                        if kk[0].startswith('#'): continue

                        if blk_flag:
                            if kk[0].upper() in ['BLOCK','DECAY']:
                                break
                            if len(kk) < len(jj)-4:
                                continue
                            if jj[3].upper() == 'BLOCK' and ''.join(ks) ==  ''.join(kk[0:len(ks)]):
                                ks_flag  = True
                                sf.Debug('SLHA data line', kk)
                            if jj[3].upper() == 'DECAY' and ''.join(ks) ==  ''.join(kk[1:len(ks)+1]):
                                ks_flag  = True
                                sf.Debug('SLHA data line', kk)
                        if jj[3].upper() == kk[0].upper() and ''.join(blk) == ''.join(kk[1:len(blk)+1]) :
                            blk_flag = True
                            sf.Debug('SLHA line',kk)
                            if jj[3].upper() == 'DECAY' and jj[5] == 0:
                                if len(kk) < 3 :
                                    sf.ErrorStop( 'For input variable "%s" in program "%s" with "SLHA" method, there are only %i column is the head line of "%s %s" in the input file.'%(jj[0],self._ProgName,len(kk),jj[3],jj[4],self._InputFile[ii]) )
                                else:
                                    sf.Debug('SLHA data line', kk)
                                    ks_flag  = True
                                break
                        
                    if not blk_flag:
                        sf.ErrorStop( 'For input variable "%s" in program "%s" with "SLHA" method, can not find "%s %s" in input file "%s".'%(jj[0],self._ProgName,jj[3],jj[4],self._InputFile[ii]) )

                    if not ks_flag:
                        sf.ErrorStop( 'For input variable "%s" in program "%s" with "SLHA" method, can not find corresponding line in "%s %s" of input file "%s".'%(jj[0],self._ProgName,jj[3],jj[4],self._InputFile[ii]) )
                    
                    

    def setOutputFile(self, outputfile):
        outputfile=sf.string2nestlist(outputfile)
        self._OuFileID = [x[0] for x in outputfile ]
        sf.Debug('OuFileID',self._OuFileID)
        sf.Info('Output file     = ')
        for ii in outputfile:
            if not (ii[1].startswith('/home') or ii[1].startswith('~')):
                ii[1] = os.path.join(sf.CurrentPath, ii[1])
            self._OutputFile[ii[0]]=ii[1]
            sf.Info('  ID= %s \tFile= %s'%(ii[0],ii[1]))
    def setOutputVar(self, outputvar):
        outputvar=sf.string2nestlist(outputvar)
        for ii in outputvar:
            if not ii[1] in self._OuFileID:
                sf.ErrorStop( 'For output variable "%s" in program "%s", There is no output file with ID "%s"'%(ii[0],self._ProgName, ii[1]) )
            self.outvar[ii[0]] = sf.NaN
        sf.Info('Output variable = ')
        for ii in self._OuFileID:
            self._OutputVar[ii] = [x for x in outputvar if (x[1] == ii) and (x[2].lower() != 'file')]
            ## For 'File' method
            self._OuFilVar[ii] = [x for x in outputvar if (x[1] == ii) and (x[2].lower() == 'file')]
            if len(self._OuFilVar[ii])>1:
                sf.ErrorStop( 'In program "%s", there is no need to use more than one vars to stand the output file "%s" where you use %s.'%(self._ProgName, self._OutputFile[ii],' '.join(self._OuFilVar[ii])) )
            for jj in self._OuFilVar[ii]:
                if len(jj) < 3 :
                    sf.ErrorStop( 'For output variable "%s" in program "%s" with "File" method, at least 3 items ( Name ID,  Input file ID,  Method ) need to be provived.'%(jj[0],self._ProgName) )
                if len(jj) == 3 :
                    jj.append('Not Save')
                sf.Info('  varID= %s \tfID= %s \tMethod= %s and %s'%(jj[0],jj[1],jj[2],jj[3]))
            ## For 'Position' method
            self._OuPosVar[ii]  = [x for x in outputvar if (x[1] == ii) and (x[2].lower() == 'position')]
            for jj in self._OuPosVar[ii]:
                if len(jj) != 5 :
                    sf.ErrorStop( 'For output variable "%s" in program "%s" with "Position" method, 5 items ( Name ID,  Input file ID,  Method, Line number,  Column number ) need to be provived.'%(jj[0],self._ProgName) )
                sf.Info('  varID= %s \tfID= %s \tMethod= %s \tLine num= %s \tColumn num= %s'%(jj[0],jj[1],jj[2],jj[3],jj[4]))
        
            self._OuLabVar[ii]  = [x for x in outputvar if (x[1] == ii) and (x[2].lower() == 'lable')]
            for jj in self._OuLabVar[ii]:
                if len(jj) != 5 :
                    sf.ErrorStop( 'For output variable "%s" in program "%s" with "Lable" method, 5 items ( Name ID,  Input file ID,  Method, Label name,  Input variable column number ) need to be provived.'%(jj[0],self._ProgName) )
                sf.Info('  varID= %s \tfID= %s \tMethod= %s \tLable= %s \tColumn= %s'%(jj[0],jj[1],jj[2],jj[3],jj[4]))

            self._OuSLHAVar[ii] = [x for x in outputvar if (x[1] == ii) and (x[2].lower() == 'slha')]
            for jj in self._OuSLHAVar[ii]:
                if len(jj) < 6 :
                    sf.ErrorStop( 'For output variable "%s" in program "%s" with "SLHA" method, at least 6 items ( Name ID,  Input file ID,  Method, BLOCK/DECAY, Block name/PDG, Keys) need to be provived.'%(jj[0],self._ProgName) )
                if not jj[3].upper() in ['BLOCK','DECAY']:
                    sf.ErrorStop( 'For input variable "%s" in program "%s" with "SLHA" method, the 4th item must be "BLOCK" or "DECAY". If you can to used other formats, please contact with the authors.'%(jj[0],self._ProgName) )
                sf.Info('  varID= %s \tfID= %s \tMethod= %s \tB/D= %s \tName= %s \tKeys= %s'%(jj[0],jj[1],jj[2],jj[3],jj[4],jj[5]))
            
    def setRunFlag(self, name):
        self._runflag = name
        sf.Info('Run this program if '+name)


    def getProgName(self):
        return self._ProgName
    def getCommand(self):
        return self._Command
    def getComPath(self):
        return self._ComPath
    def getInputFile(self):
        return self._InputFile
    def getInputVar(self):
        return self._InputVar
    def getOutputFile(self):
        return self._OutputFile
    def getOutputVar(self):
        return self._OutputVar
    def getRunFlag(self,par):
        try:
          return eval(self._runflag)
        except:
          sf.ErrorStop('The Run Flag "'+self._runflag+'" is wrong for program '+ self._ProgName)

    def WriteInputFile(self,par):
        if self._InFileID ==['']:
            return
        for ii in self._InFileID:
            ## For 'File' method
            file_flag = False
            for jj in self._InFilVar[ii]:
                file_flag = True
                if jj[3].lower()=='replace':
                    sf.Debug("For program",self._ProgName)
                    sf.Debug("Copied file",par[jj[0]])
                    sf.Debug("Copy file",self._InputFile[ii])
                    shutil.copy(par[jj[0]],self._InputFile[ii])
                else:
                    try:
                        open(self._InputFile[ii],'a').write( open(par[jj[0]].read()) )
                    except:
                        sf.ErrorStop('Can not find/open the input file "%s" in program "%s, wihch is obtained from prior program(s)".'%(self._InputFile[ii],self._ProgName))

            ## Open the input file
            if file_flag:
                try:
                    infile = open(self._InputFile[ii],'r').read()
                except:
                    sf.ErrorStop('Can not find/open the input file "%s" in program "%s, wihch is obtained from prior program(s)".'%(self._InputFile[ii],self._ProgName))
            else:
                try:
                    if len(self._InRepVar[ii])>0:
                        infile = open(self._InputFile[ii]+'.ESbackup','r').read()
                    else:
                        infile = open(self._InputFile[ii],'r').read()
                except:
                    sf.ErrorStop('Can not find/open the input file "%s" in program "%s, wihch is obtained from prior program(s)".'%(self._InputFile[ii],self._ProgName))
        
            ## For 'Replace' method
            for jj in self._InRepVar[ii]:
                if file_flag:
                    match = re.findall(jj[3],infile)
                    if len(match)==0:
                        sf.ErrorStop( 'For input variable "%s" in program "%s" with "Replace" method, can not find "%s" in coressponding input file "%s", wihch is obtained from prior program(s).'%(jj[0],self._ProgName,jj[3],self._InputFile[ii]) )
                infile = re.sub(jj[3],str(par[jj[0]]),infile)
            if len(self._InRepVar[ii])>0:
                open(self._InputFile[ii],'w').write(infile)
                
            inlines = open(self._InputFile[ii]).readlines()
            invar = [ss.split() for ss in inlines]

            return
    
            ## For 'Position' method
            for jj in self._InPosVar[ii]:
                
                if file_flag:
                    if len(invar) < jj[3]:
                        sf.ErrorStop( 'For input variable "%s" in program "%s" with "Position" method, the line number is larger than the lines of inoput file "%s", wihch is obtained from prior program(s).'%(jj[0],self._ProgName,self._InputFile[ii]) )
                    if len(invar[jj[3]-1]) < jj[4]:
                        sf.ErrorStop( 'For input variable "%s" in program "%s" with "Position" method, the column number is larger than the columns in line %s of input file "%s", wihch is obtained from prior program(s).'%(jj[0],self._ProgName,jj[3],self._InputFile[ii]) )
                invar[jj[3]-1][jj[4]-1] = str(par[jj[0]])

            ## For 'Lable' method
            for jj in self._InLabVar[ii]:
                
                lablinum = [xxi for xxi,xx in enumerate(inlines) if jj[3] in xx]

                if file_flag:
                    if len(lablinum)==0:
                        sf.ErrorStop( 'For input variable "%s" in program "%s" with "Lable" method, there is no "%s" in input file "%s", wihch is obtained from prior program(s).'%(jj[0],self._ProgName,jj[3],self._InputFile[ii]) )
                    for kk in lablinum:
                        if len(invar[kk]) < jj[4]:
                            sf.ErrorStop( 'For input variable "%s" in program "%s" with "Lable" method, there is only %i columns in corresponding labled line "%s".'%(jj[0],self._ProgName,len(invar[lablinum[0]]),invar[lablinum[0]]) )
                        if invar[kk][jj[4]-1] == jj[3]:
                            sf.ErrorStop( 'For input variable "%s" in program "%s" with "Lable" method, the corresponding var is the label.'%(jj[0],self._ProgName) )
            
                for kk in lablinum:
                    invar[kk][jj[4]-1] = str(par[jj[0]])

            ## For 'SLHA' method
            for jj in self._InSLHAVar[ii]:
                
                blk = str(jj[4]).split()
                blk_flag = False
                ks  = str(jj[5]).split()
                ks_flag  = False
                for kki, kk in enumerate( invar ):
                    if kk[0].startswith('#'): continue
                    if blk_flag:
                        if kk[0].upper() in ['BLOCK','DECAY']:
                            break
                        if len(kk) < len(jj)-4:
                            continue
                        if jj[3].upper() == 'BLOCK' and ''.join(ks) ==  ''.join(kk[0:len(ks)]):
                            ks_flag  = True
                            invar[kki][len(ks)]=str(par[jj[0]])
                        if jj[3].upper() == 'DECAY' and ''.join(ks) ==  ''.join(kk[1:len(ks)+1]):
                            ks_flag  = True
                            invar[kki][0]=str(par[jj[0]])
                    if jj[3] == kk[0] and ''.join(blk) == ''.join(kk[1:len(blk)+1]) :
                        blk_flag = True
                        if jj[3].upper() == 'DECAY' and jj[5] == 0:
                            if len(kk) < 3 :
                                sf.ErrorStop( 'For input variable "%s" in program "%s" with "SLHA" method, there are only %i column is the head line of "%s %s" in the input file, wihch is obtained from prior program(s).'%(jj[0],self._ProgName,len(kk),jj[3],jj[4],self._InputFile[ii]) )
                            else:
                                invar[kki][3]=str(par[jj[0]])
                                ks_flag  = True
                            break
            
                if file_flag:
                    if not blk_flag:
                        sf.ErrorStop( 'For input variable "%s" in program "%s" with "SLHA" method, can not find "%s %s" in input file "%s", wihch is obtained from prior program(s).'%(jj[0],self._ProgName,jj[3],jj[4],self._InputFile[ii]) )
                    
                    if not ks_flag:
                            sf.ErrorStop( 'For input variable "%s" in program "%s" with "SLHA" method, can not find corresponding line in "%s %s" of input file "%s", wihch is obtained from prior program(s).'%(jj[0],self._ProgName,jj[3],jj[4],self._InputFile[ii]) )

            outlines = [ ' '.join(ss)+'\n' for ss in invar]
            open(self._InputFile[ii],'w').writelines(outlines)

    def RunProgram(self): 
        cwd=self._ComPath
        #timeout = 60*2   # if the program run more than 2 hour, it may be killed
        #liang
        #timeout = 60*20   # if the program run more than 2 hour, it may be killed
        print 'self._Command=',self._Command
        timeout=120  # yuanfang set
        for cmd in self._Command:
            sf.Debug('Runing Program %s with command'%self._ProgName,cmd)
            try:
                p=subprocess.Popen(cmd, stdout=subprocess.PIPE,
                         stderr=subprocess.STDOUT, cwd=cwd,
                         shell=True)
                start = time.time()
                timepassed = 0
                while p.poll() is None:
                     time.sleep(0.1)
                     now = time.time()
                     timepassed = int((now-start)/60)
                     if timepassed > timeout:
                         sf.WarningWait("Program %s has run more than 1 hour, It will be kiled ")
                         try:
                             p.terminate()
                         except Exception,e:
                             return
                         return
                (out, err) = p.communicate()
                if p.stdin:  p.stdin.close()
                if p.stdout: p.stdout.close()
                if p.stderr: p.stderr.close()
                try:
                    p.kill()
                except OSError:
                    pass
                sf.Debug('Program %s done in %s minutes, corresponding output:'%(self._ProgName,timepassed),out)
            except OSError as error:
                if cwd and not os.path.exists(cwd):
                    raise Exception('Directory %s doesn\'t exist. Impossible to run' % cwd)
                else:
                    error_text = 'Impossible to run \'%s\'\n' % cmd
                    error_text += '    in the directory \'%s\'\n' % cwd
                    error_text += 'Trying to recover from:\n'
                    error_text += '    %s\n' % str(error)
                    raise Exception(err)
     #        print p.returncode
     #
     #        if p.returncode:
     #            error_msg = 'The run \'%s\' fails with following message:\n' % cmd
     #            error_msg += '    '+out.replace('\n','\n    ')+'\n'
     #            error_msg += 'Please try to fix this issue and retry.\n'
     #            error_msg += 'Help might be found at mail@mail.com\n'
     #
     #            raise Exception(error_msg)
     #
     #        return p.returncode
    
    def analyze_cmd(self,cmd):
        '''
        Author:yuanfang
        Date:2017.12.7
        Function:analyze the cmd for the parallel
        Parameters:
           cmd: lists containing the command lists
           cmd_lists=[[cmd1],[cmd2],[cmd3]...]
           cmd_results=[
                         ['interter1':${'interter1'},'program1':${program1},...],
                         ['interter1':${'interter1'},'program1':${program1},...],
                         ...
                        ] 
           return lists containing the analyzed results   
        '''
        # cmd_lists = cmd.split()
        # print 'type(cmd)=',type(cmd)
        cmd_lists=[[] for ii in range(len(cmd))]
        cmd_result=[{} for ii in range(len(cmd))]
        for i in range(len(cmd)):
            from compiler.ast import flatten
            cmd_lists[i].append(cmd[i].split())
            cmd_lists[i]=flatten(cmd_lists[i])

            # cmd_result = dict()
            if len(cmd_lists[i]) == 1:  # ll, ls, ./cal.py
                if cmd_lists[i][0] in ['ll', 'ls', 'ps', 'top']:
                    cmd_result[i]['shell_cmd'] = cmd_lists[i][0]
                else:
                    cmd_result[i]['program'] = cmd_lists[i][0]
            elif len(cmd_lists[i]) == 2:
                if cmd_lists[i][0] in ['python']:
                    cmd_result[i]['interpreter'] = cmd_lists[i][0]
                    cmd_result[i]['program'] = cmd_lists[i][1]
                elif cmd_lists[i][0] in ['bash', 'sh']:
                    cmd_result[i]['interpreter'] = cmd_lists[i][0]
                    cmd_result[i]['shell_cmd'] = cmd_lists[i][1]
                elif cmd_lists[i][0] in ['rm', 'cat']:
                    cmd_result[i]['shell_cmd'] = cmd_lists[i][0]
                    cmd_result[i]['inputfile'] = cmd_lists[i][1]
                else:
                    cmd_result[i]['program'] = cmd_lists[i][0]
                    cmd_result[i]['inputfile'] = cmd_lists[i][1]
            elif len(cmd_lists[i]) == 3:
                if cmd_lists[i][0] in ['rm', 'cat']:
                    cmd_result[i]['shell_cmd'] = cmd_lists[i][0]
                if cmd_lists[i][1].startswith('-'):
                    cmd_result[i]['option'] = cmd_lists[i][1]
                    cmd_result[i]['inputfile'] = cmd_lists[i][2]
            # weired case: e.g. HiggsBound and HiggsSignal
            else:
                cmd_result[i]['weired_cmd']=cmd_lists[i]

            # print 'cmd_lists=',cmd_lists
            return cmd_result
    
    def cmd_reorganize(self,cmd,rank):
        '''
        Author:yuanfang
        Date: 2017.12.7
        Function: To re-organize the cmd for the convention of parallelation
        parametr:
            cmd_new should have the same structure as cmd
        '''
        cmd_result=self.analyze_cmd(cmd)
        # print 'before reorganize:cmd_results=',cmd_result
        cmd_new=list()
        cmd_inputfiles=list()
        for i in range(len(cmd_result)):
            if cmd_result[i].has_key('inputfile'):
                # cmd_result[i]['inputfile']='./'+str(rank)+'/'+cmd_result[i]['inputfile']
                cmd_result[i]['inputfile']=cmd_result[i]['inputfile']
                cmd_inputfiles.append(cmd_result[i]['inputfile'])
            if cmd_result[i].has_key('program'):
                cmd_result[i]['program']='../'+cmd_result[i]['program']
                 
            cmd_new.append(cmd_result[i].get('interpreter','')+' '+cmd_result[i].get('shell_cmd','')+\
              ' '+cmd_result[i].get('program','')+' '+cmd_result[i].get('option','')+' '+\
              os.path.split(cmd_result[i].get('inputfile',''))[-1])

            if cmd_result[i].has_key('weired_cmd'):
                from compiler.ast import flatten
                # print '''cmd_result[i]['weired_cmd']=''',cmd_result[i]['weired_cmd']
                last_item=cmd_result[i]['weired_cmd'][-1]
                first_item=cmd_result[i]['weired_cmd'][0]

                # print 'first item=',first_item,'last item=',last_item
                new_first_item='../'+first_item
                new_last_item='./'
                cmd_result[i]['weired_cmd'][-1]=new_last_item
                cmd_result[i]['weired_cmd'][0]=new_first_item
                # print 'weired_cmd no joined=',cmd_result[i]['weired_cmd']
                cmd_new.append(' '.join(cmd_result[i]['weired_cmd']))
                del cmd_new[0] # delete the first space
                # print 'weired_cmd, joined results',cmd_new
        return cmd_new,cmd_inputfiles

    def Parallel_RunProgram(self,rank):
        '''
           Author:yuanfang
           Email:yuanfang405@gmail.com
           Date:2017.12.4  
           Function: parallel run polychord and multinest
        '''
        print 'parallel_run: rank %s with program %s is running...'%(rank,self._ProgName)
        run_path=self.getComPath()
        run_path=run_path+'/'+str(rank)
        self._parallel_path=run_path
        # create new directory ${rank};copy input file into it
        if not os.path.exists(run_path):os.mkdir(run_path)
        # for id,name in self.getInputFile().iteritems():
        #     print 'parallel program:self.getInputFile():',self.getInputFile()
        #     os.system('cp '+name+' '+run_path)
        
        # run program in parallel path
        import time
        timeout=2*60
        for cmd in self._Command:
            print 'parallel_run:runing program %s with old command %s'%(self._ProgName,cmd)
            cmd_new,cmd_inputfiles=self.cmd_reorganize(cmd,rank)
            # cmd='../'+''.join(cmd):
            print 'parallel_run:Runing Program %s with new command %s in run_path %s'%(self._ProgName,cmd_new,run_path)
            # print "Parallel_run: copy real cmd_input file into parallel run path..."
            # for file in cmd_inputfiles:
            #     print 'parallel_run:file=',file,'  run_path=',run_path
            #     os.system('pwd;cp  ../Externals/'+file+' '+run_path)
            
            try:
                p=subprocess.Popen(cmd_new, stdout=subprocess.PIPE,
                     stderr=subprocess.STDOUT,
                     cwd=run_path,
                     shell=True)
                start = time.time()
                timepassed = 0
                while p.poll() is None:
                     time.sleep(0.1)
                     now = time.time()
                     timepassed = int((now-start)/60)
                     if timepassed > timeout:
                         print "Program %s has run more than 1 hour, It will be kiled "
                         try:
                             p.terminate()
                         except Exception,e:
                             return
                         return
                (out, err) = p.communicate()
                if p.stdin:  p.stdin.close()
                if p.stdout: p.stdout.close()
                if p.stderr: p.stderr.close()
                try:
                    p.kill()
                except OSError:
                    pass
                print 'Program %s done in %s minutes, corresponding output:%s' %(self._ProgName,timepassed,out)
            except OSError as error:
                if cwd and not os.path.exists(cwd):
                    raise Exception('Directory %s doesn\'t exist. Impossible to run' % cwd)
                else:
                    error_text = 'Impossible to run \'%s\'\n' % cmd
                    error_text += '    in the directory \'%s\'\n' % run_path
                    error_text += 'Trying to recover from:\n'
                    error_text += '    %s\n' % str(error)
                    raise Exception(error_text)
 
   # yuanfang added two functions begin in 11.7
    def get_OutFileVars(self):
        return self._OuFilVar
    
    def get_OutFileID(self):
        return self._OuFileID
   # yuanfang added two functions end in 11.7

    def ReadOutputFile(self,par,path):
        # print 'ReadOutputFile:self._OutputFile=',self._OutputFile
        # yy=raw_input('In ReadOutputFile...')
        
        for ii in self._OuFileID:
            if not os.path.exists(self._OutputFile[ii]):
                sf.Debug('No output file for program %s'%self._ProgName)
                sf.Debug('output file name is %s'%self._OutputFile[ii])
                return False
            ## For 'File' method
            for jj in self._OuFilVar[ii]:
                # a=raw_input( "yuanfang in manfun begin...") 
                # print self._OuFilVar
                # print 'ii=',ii
                # print jj 
                # a=raw_input( "yuanfang in manfun end...")
                if jj[3].lower() == 'save' :
                    self._Count += 1
                    path = os.path.join(path,"SavedFile")
                    SavePath = os.path.join(path, os.path.basename(self._OutputFile[ii]))+"."+str(self._Count)
                    shutil.copy(self._OutputFile[ii],SavePath)
                par[jj[0]] = self._OutputFile[ii]
            
            if len(self._OuPosVar[ii])+ len(self._OuLabVar[ii]) + len(self._OuSLHAVar[ii])>0 :
                oulines = open(self._OutputFile[ii]).readlines()
                ouvar = [ss.split() for ss in oulines]
            
            ## For 'Position' method
            for jj in self._OuPosVar[ii]:
                try:
                    par[jj[0]] = float(ouvar[jj[3]-1][jj[4]-1])
                except:
                    sf.Info('Can not read the output var %s'%jj)
                    return False

            ## For 'Lable' method
            for jj in self._OuLabVar[ii]:
                #lablinum = [xxi for xx,xxi in enumerate(oulines) if jj[3] in xx]
                labline = [xx for xx in oulines if jj[3] in xx]
                if len(labline)>1:
                    sf.ErrorStop( 'For output variable "%s" in program "%s" with "Lable" method, there is %s "%s" in output file "%s". Please choose other method.'%(jj[0],self._ProgName,len(lablinum),jj[3],self._OutputFile[ii]) )

                try:
                    par[jj[0]] = float(labline[0].split()[jj[4]-1])
                except:
                    sf.Debug('Can not read the output var',jj[0])
                    return False
                        
            ## For 'SLHA' method
            for jj in self._OuSLHAVar[ii]:
                blk = str(jj[4]).split()   # Block name
                blk_flag = False
                ks = [ str(x) for x in jj[5:] ]
                #ks  = str(jj[5:]).split()   # keys name
		         #sf.WarningNoWait('test0:%s'%jj)
		         #sf.WarningNoWait('test0:%s'%ks)
                ks_flag  = False
                for kki, kk in enumerate( ouvar ):
                    if kk[0].startswith('#'): continue

                    if blk_flag:
                        if kk[0].upper() in ['BLOCK','DECAY']:
                            break
                        if len(kk) < len(jj)-4:
                            continue
                        if jj[3].upper() == 'BLOCK' and ''.join(ks) ==  ''.join(kk[0:len(ks)]):
                            ks_flag  = True
                            par[jj[0]] = float(ouvar[kki][len(ks)])
		            #sf.WarningNoWait('test1:%s'%ouvar[kki])
		            #sf.WarningNoWait('test2:%s'%len(ks))
		            #sf.WarningNoWait('test3:%s'%jj[0])
                        if jj[3].upper() == 'DECAY' and ''.join(ks) ==  ''.join(kk[1:len(ks)+1]):
                            ks_flag  = True
                            par[jj[0]] = float(ouvar[kki][0])
                    if jj[3].upper() == kk[0].upper() and ''.join(blk) == ''.join(kk[1:len(blk)+1]) :
                        blk_flag = True
                        if jj[3].upper() == 'DECAY' and jj[5] == 0:
                            if len(kk) < 3 :
                                sf.Debug('Can not read the output var',jj)
                                return False
                            else:
                                par[jj[0]]=float(ouvar[kki][3])
                                ks_flag  = True
                            break

                if not ks_flag:
                    sf.Debug('Can not read the output var',jj)
                    return False

        return True

    def parallel_ReadOutputFile(self,par,path,rank):
        '''
           Author:yanfang
           Email:yuanfang405@gmail.com
           Date:2017.12.5  
           Function: parallelly run polychord and multinest
        '''
        print 'paralle read:self._OutputFile=',self._OutputFile
        print 'parallel read:par=',par
        print 'parallel read:path=',path
        print 'parallel read:rank=',rank
        para_path=dict()
        for key,keyvalue in self._OutputFile.iteritems():
            paths=os.path.split(self._OutputFile[key])
            para_path[key]=paths[0]+'/'+str(rank)+'/'+paths[1]

        print 'parallel read:my_path=',para_path
        
        for ii in self._OuFileID:
            print '**************yuanfang break detect 1****************'
            # if not os.path.exists(self._OutputFile[ii]):
            if not os.path.exists(para_path[ii]):

                print '**************yuanfang break detect 2****************'
                sf.Debug('No output file for program %s'%self._ProgName)
                sf.Debug('output file name is %s'%para_path[ii])
                # sf.Debug('output file name is %s'%self._OutputFile[ii])
                return False
            ## For 'File' method
            for jj in self._OuFilVar[ii]:
                print '**************yuanfang break detect 3****************'
                # a=raw_input( "yuanfang in manfun begin...") 
                # print self._OuFilVar
                # print 'ii=',ii
                # print jj 
                # a=raw_input( "yuanfang in manfun end...")
                if jj[3].lower() == 'save' :
                    self._Count += 1
                    path = os.path.join(path,"SavedFile")
                    SavePath = os.path.join(path, os.path.basename(self._OutputFile[ii]))+"."+str(self._Count)
                    shutil.copy(para_path[ii],SavePath)
                    # shutil.copy(self._OutputFile[ii],SavePath)
                par[jj[0]] = self._OutputFile[ii]
            print '**************yuanfang break detect 4****************'
            if len(self._OuPosVar[ii])+ len(self._OuLabVar[ii]) + len(self._OuSLHAVar[ii])>0 :
                # oulines = open(self._OutputFile[ii]).readlines()
                oulines=open(para_path[ii]).readlines()  # yuanfang
                ouvar = [ss.split() for ss in oulines]
                # print 'parallell_read:ouvar=',ouvar
            ## For 'Position' method
            for jj in self._OuPosVar[ii]:
                try:
                    par[jj[0]] = float(ouvar[jj[3]-1][jj[4]-1])
                except:
                    sf.Info('Can not read the output var %s'%jj)
                    return False

            ## For 'Lable' method
            for jj in self._OuLabVar[ii]:
                #lablinum = [xxi for xx,xxi in enumerate(oulines) if jj[3] in xx]
                labline = [xx for xx in oulines if jj[3] in xx]
                if len(labline)>1:
                    sf.ErrorStop( 'For output variable "%s" in program "%s" with "Lable" method, there is %s "%s" in output file "%s". Please choose other method.'%(jj[0],self._ProgName,len(lablinum),jj[3],self._OutputFile[ii]) )

                try:
                    par[jj[0]] = float(labline[0].split()[jj[4]-1])
                except:
                    sf.Debug('Can not read the output var',jj[0])
                    return False
            print '**************yuanfang break detect 5****************'            
            ## For 'SLHA' method
            print 'self._OuSLHAVar[ii]=',self._OuSLHAVar[ii]
            for jj in self._OuSLHAVar[ii]:
                print '**************yuanfang break detect 6****************'
                print 'jj=',jj
                blk = str(jj[4]).split()   # Block name
                blk_flag = False
                ks = [ str(x) for x in jj[5:] ]
                print '**************yuanfang break detect 7****************'
                #ks  = str(jj[5:]).split()   # keys name
		        #sf.WarningNoWait('test0:%s'%jj)
		        #sf.WarningNoWait('test0:%s'%ks)
                ks_flag  = False
                for kki, kk in enumerate( ouvar ):
                    if kk[0].startswith('#'): continue

                    if blk_flag:
                        if kk[0].upper() in ['BLOCK','DECAY']:
                            break
                        if len(kk) < len(jj)-4:
                            continue
                        if jj[3].upper() == 'BLOCK' and ''.join(ks) ==  ''.join(kk[0:len(ks)]):
                            ks_flag  = True
                            par[jj[0]] = float(ouvar[kki][len(ks)])
		            #sf.WarningNoWait('test1:%s'%ouvar[kki])
		            #sf.WarningNoWait('test2:%s'%len(ks))
		            #sf.WarningNoWait('test3:%s'%jj[0])
                        if jj[3].upper() == 'DECAY' and ''.join(ks) ==  ''.join(kk[1:len(ks)+1]):
                            ks_flag  = True
                            par[jj[0]] = float(ouvar[kki][0])
                    if jj[3].upper() == kk[0].upper() and ''.join(blk) == ''.join(kk[1:len(blk)+1]) :
                        blk_flag = True
                        if jj[3].upper() == 'DECAY' and jj[5] == 0:
                            if len(kk) < 3 :
                                sf.Debug('Can not read the output var',jj)
                                return False
                            else:
                                par[jj[0]]=float(ouvar[kki][3])
                                ks_flag  = True
                            break
                print '**************yuanfang break detect 8****************'
                if not ks_flag:
                    sf.Debug('Can not read the output var',jj)
                    return False
        print '**************yuanfang break detect 9****************'
        return True
        


    def SetOutput(self,par):
        for ii in self._OuFileID:
            for jj in self._OutputVar[ii]:
                par[jj[0]] = float("nan")
        return True

    def Recover(self):
        for ii in self._InFileID:
            if (ii!= '') and os.path.isfile(self._InputFile[ii]+".ESbackup"):
                os.system("mv %s.ESbackup %s" %(self._InputFile[ii],self._InputFile[ii]))

    def __str__(self):
        return '\
## [program] #############################################################\n\
Name    : %(name)s\n\
Command :\n~~~~ %(command)s\n\
Command Path:\n~~~~ %(cpath)s\n\
Input File: \n~~~~ %(inputfile)s\n\
Input: \n~~~~ %(inputvar)s\n\
Output File: \n~~~~ %(outputfile)s\n\
Output: \n~~~~ %(outputvar)s'\
%{'name':self._ProgName, 'command':self._Command, 'cpath':self._ComPath,
'inputfile': self._InputFile, 'inputvar': self._InputVar,
'outputfile': self._OutputFile, 'outputvar': self._OutputVar}


class EasyScanInput:
    def __init__(self):
        self._FileName   = 'test'
        self._PointNum   = 100
        self._ScanMethod = 'random'
        self._RandomSeed = -1
        self._PrintNum   = 10
        self._AccepRate  = 0.25
        self._FalgTuneR  = False

        self.InputPar = {}
        
        self._Prog    = {}
        self.AllPar   = {}
        self.InPar    = {}
        self.OutPar   = {}
        
        self.GridBin = {}
        self.MCMCsw = {}  # Step width
        self.MCMCiv = {}  # Initial value

        self.MNOutputFile = 'test/MultiNestData/'
        self.PolyOutputFile='test/PolyChordData/'   # yuanfang 
        self._Count   = 0
    
    def setFileName(self, name):
        # turn the result file path into absolute path
        if name.startswith('/home') or name.startswith('~'):
            self._FileName = name
        else:
            self._FileName = os.path.join(sf.CurrentPath, name)
        if self._ScanMethod not in ['READ','PLOT']:
        #    deal with the satuation that the result file path already exists.
            # if os.path.exists(self._FileName):
            if os.path.exists(self._FileName) and self._ScanMethod !='PolyChord'.upper():
                print("* The Result file [%s] already exists." % name )
                while True:
                    c = raw_input("Choose: (r)replace, (b)backup, (s)stop\n")
                    if c == "r":
                         os.system(r"rm -r %s" %self._FileName)
                         break
                    elif c == "b":
                        if not (os.path.exists(sf.CurrentPath+"/Backup")):
                            os.mkdir(sf.CurrentPath+"/Backup")
                        BackupTime = time.strftime("_%Y_%m_%d_%H_%M_%S", time.localtime())
                        BackupPath = os.path.join(sf.CurrentPath, 'Backup/'+name+BackupTime)
                        os.system(r"mv %s %s" %(self._FileName, BackupPath))
                        break
                    elif c == "s":
                        exit(1)
                    else:
                        print("Wrong input! Please type in one of ('r','b','s')")
            elif os.path.exists(self._FileName) and self._ScanMethod =='PolyChord'.upper():  # yuanfang
                pass

#            generate the result file path
            if not os.path.exists(self._FileName):
                os.mkdir(self._FileName)
            if not os.path.exists(os.path.join(self._FileName,'SavedFile')):
                os.mkdir(os.path.join(self._FileName,'SavedFile'))
            
            if self._ScanMethod == 'MULTINEST':
                self.MNOutputFile = os.path.join(self._FileName, "MultiNestData/")
                os.mkdir(self.MNOutputFile)
            
            #yuanfang added in 2017.11.15 for PolyChord
            
            if self._ScanMethod == 'PolyCHord'.upper():
                if not os.path.exists(os.path.join(self._FileName, "PolyChordData/")):
                    self.PolyOutputFile = os.path.join(self._FileName, "PolyChordData/") 
                    os.mkdir(self.PolyOutputFile)
            sf.Info('...............................................')
            sf.Info('...............................................')
            sf.Info('Result file name  = %s'%self._FileName)
        else:
            if not os.path.exists(self._FileName):
                sf.ErrorStop("The result file %s doesn't exist."%self._FileName)
            if not os.path.exists(os.path.join(self._FileName,'ScanInf.txt')):
                sf.ErrorStop("The info file %s/ScanInf.txt doesn't exist. This file is necessary for methods \"READ\" or \"PLOT\"."%self._FileName)
            if self._ScanMethod == 'READ':
                print("* Now you are in READ mode. All files in \n* %s\n* would be delete." % os.path.join(self._FileName, "SavedFile") )
                while True:
                    c = raw_input("Choose: (c)continue, (s)stop\n")
                    if c == "s":
                        exit(1)
                    elif c == "c":
                        print os.path.join(self._FileName,'SavedFile')
                        os.system(r"find %s -type f -name '*' | xargs rm" %os.path.join(self._FileName,'SavedFile'))
                        break
                    else:
                        print("Wrong input! Please type in one of ('c', 's')")
            sf.Info('...............................................')
            sf.Info('...............................................')
            sf.Info('Result file name  = %s'%self._FileName)

    def setPointNum(self, ntot):
        if int(ntot) < 1 :
            sf.ErrorStop('"Points number" should larger than 0')
        self._PointNum = int(ntot)
        sf.Info('Points number     = %s'%self._PointNum)

    def setScanMethod(self, method):
        #if method.upper() not in ['RANDOM', 'MCMC', 'MULTINEST','GRID','READ','PLOT','ONEPOINT']:
        if method.upper() not in ['RANDOM', 'MCMC', 'MULTINEST','GRID','READ','PLOT','ONEPOINT','POLYCHORD']:  #yuanfang
            sf.ErrorStop('%s is not in supported methods'%method)
        self._ScanMethod = method.upper()
        sf.Info('Scan method       = %s'%self._ScanMethod)

    def setRandomSeed(self, iseed):
        self._RandomSeed = int(iseed)
        ## If iseed is provided in the input file, initialize the basic random number generator
        ## Otherwise, it will be initialized by current system time, and self._RandomSeed = -1,
        ## which means also initialized by current system time in MultiNest
        random.seed( self._RandomSeed )
        sf.Info('Random seed       = %s'%self._RandomSeed)

    def setAccepRate(self, AccepRate):
        AccepRate = float(AccepRate)
        if AccepRate >= 1 or AccepRate <= 0:
            sf.ErrorStop('The acceptance rate must be in [0,1]. The suggest value is 0.5 for d<=2, 0.25 otherwise.')
        self._AccepRate = AccepRate
        self._FalgTuneR = True
        sf.Info('Acceptance rate   = %s'%self._AccepRate)

    def setPrintNum(self, nprint):
        if int(nprint) < 1 :
            sf.ErrorStop('Nprint should larger than 0')
        self._PrintNum = int(nprint)
        sf.Info('Interval of print = %s'%self._PrintNum)

    def setInputPar(self, inputvar):
        inputvar = sf.string2nestlist(inputvar)
        
        #if self._ScanMethod in ['PLOT','READ']:
        if False:
            if len(inputvar) == 1 :
                if inputvar[0][0].startswith('/home') or inputvar[0][0].startswith('~'):
                    inputfolder = inputvar[0][0]
                else:
                    inputfolder = os.path.join(sf.CurrentPath, inputvar[0][0])
                if not os.path.exists(inputfolder):
                    sf.ErrorStop('Input folder "%s" do not exist.'%inputfolder)
            else:
                sf.ErrorStop( 'For the scan method you choosed, [Plot,READ], only need one parameter.' )
            sf.Info('Input parametes   = %s'%inputfolder)

        sf.Info('Input parametes   =  ')
        # print 'yuanfang in setinput: inputvar=',inputvar
        # print 'yuanfang in setinput:type(inputvar=',type(inputvar)
        # a=raw_input('yuanfang in setinput..')
        for ii in inputvar:
            self.AllPar[ii[0]]=sf.NaN
            self.InPar[ii[0]]=sf.NaN
            self.InputPar[ii[0]] = ii
            lenii = len(ii)
            # if self._ScanMethod in ['RANDOM', 'MULTINEST','GRID','MCMC']:
            if self._ScanMethod in ['RANDOM', 'MULTINEST','GRID','MCMC','POLYCHORD']:  #yuanfang in 2017.11.15
                if lenii < 4 :
                    sf.ErrorStop( 'For the scan method you choosed, the items of each input parameter should include at least 4 items ( ID, Prior fution, Minimum, Maximum ). But the paramter [%s] missed %i of them.'%(ii[0],4-lenii) )
                # elif lenii > 4 and (self._ScanMethod in ['RANDOM', 'MULTINEST']):
                elif lenii > 4 and (self._ScanMethod in ['RANDOM', 'MULTINEST','POLYCHORD']):
                    sf.WarningWait( 'For the scan method you choosed, only 4 items ( ID, Prior fution, Minimum, Maximum ) are needed for each input parameter. But the parameter [%s] has %i items. The last %i will be ignored.'%(ii[0],lenii,4-lenii) )
                    continue
                elif self._ScanMethod == 'GRID':
                    if   lenii == 4 :
                        self.GridBin[ii[0]]=20
                        sf.WarningNoWait( 'As the scan method "Grid", the bins number of the parameter [%s] is not provided, which will be set to default value, %i, in this run.'%(ii[0],self.GridBin[ii[0]]) )
                    elif lenii == 5:
                        self.GridBin[ii[0]]=ii[4]
                    else :
                        sf.WarningWait( 'For the scan method you choosed, only 5 items ( ID, Prior fution, Minimum, Maximum, Bins number ) are needed for each input parameter. But the parameter [%s] has %i items. The last %i will be ignored.'%(ii[0],lenii,5-lenii) )
                    continue
                elif self._ScanMethod == 'MCMC':
                    if   lenii < 6 :
                        sf.WarningWait( 'As the scan method "MCMC", for the parameter [%s], the step width and/or initial value is not provided. \nBoth of them will be set to default values, "step width = (Max-Min)/30" and "initial value = (Max-Min)/2", in this run.'%ii[0] )
                        self.MCMCsw[ii[0]] = 1.0/30.0
                        self.MCMCiv[ii[0]] = 1.0/2.0
                    elif lenii == 6:
                        # print ii[1]
                        self.MCMCsw[ii[0]] = 1.0/float(ii[4])      
                        if ii[1].lower() == 'flat':
                            self.MCMCiv[ii[0]] = float(ii[5]-ii[2])/float(ii[3]-ii[2])
                        elif ii[1].lower() == 'log':
                            self.MCMCiv[ii[0]] = (math.log10(ii[5])-math.log10(ii[2]))/(math.log10(ii[3]) - math.log10(ii[2]))
                    else :
                        sf.WarningWait( 'For the scan method you choosed, only 6 items ( ID, Prior fution, Minimum, Maximum, Step width, Initial value) are needed for each input parameter. But the parameter [%s] has %i items. The last %i will be ignored.'%(ii[0],lenii,5-lenii) )
                    continue
                sf.Info('  ID= %s\tPrior= %s\tMin= %f\tMax= %f'%(ii[0],ii[1],ii[2],ii[3]))

            if self._ScanMethod == 'OnePoint':
                if lenii < 2 :
                    print '* For the scan method you choosed, the items of each input parameter should include at least 2 items ( ID, Value). But the paramter [%s] missed %i of them.'%(ii[0],2-lenii)
                    exit(1)
                elif lenii > 2:
                    print '# Warning: For the scan method you choosed, only 2 items ( ID, Value) are needed for each input parameter. But the parameter [%s] has %i items. The last %i will be ignored.'%(ii[0],linii,2-lenii)
                    time.sleep(5)
                continue

    # not used for now
    def setProgID(self,progID):
        self._ProgID = progID
        print progID
    
    def setProgram(self,prog):
        self._Prog = prog
        ## copy input vars into  allvars
        for ii in prog:
            sf.Debug('Programe ID', ii)
            sf.Debug('Corresponding output vars', prog[ii].outvar)
            # deep copy
            for jj in prog[ii].outvar:
                self.AllPar[jj] = prog[ii].outvar[jj]
                self.OutPar[jj] = prog[ii].outvar[jj]

        sf.Debug('All vars:   ',self.AllPar)
        sf.Debug('Input Pars: ',self.InPar)
        sf.Debug('Output Pars:',self.OutPar)
                
    def getFileName(self):
        return self._FileName
    def getPointNum(self):
        return self._PointNum
    def getScanMethod(self):
        return self._ScanMethod
    def getRandomSeed(self):
        return self._RandomSeed
    def getPrintNum(self):
        return self._PrintNum
    def getDebugFlag(self):
        return self._DebugFlag
    
    def getStepSize(self):
        return self.MCMCsw
    def getInitialValue(self):
        return self.MCMCiv

    def getFalgTuneR(self):
        return self._FalgTuneR
    def getAccepRate(self):
        return self._AccepRate

    def ScreenPrint(self,par,loglike):
        self._Count +=1
        if self._Count%self._PrintNum == 0:
            print '------------ Num: %i ------------'%self._Count
            for ii in par:
                print ii+' : '+ str(par[ii])
            print 'LogLike = '+str(loglike)
    
    
    def __str__(self):
        return '\
## [scan] ################################################################\n\
Name   : %(name)s\n\
Ntot   : %(ntot)d\n\
Method : %(method)s\n\
Iseed  : %(iseed)d\n\
Debug  : %(debug)r\n\
Input  :\n~~~~ %(inputvar)s'\
%{'name':self._FileName,'ntot':self._PointNum, 'method':self._ScanMethod,
'iseed':self._RandomSeed,'debug': self._DebugFlag,}


class constraint:
    def __init__(self):
        self.Gaussian=[]
        self.Limit=[]
        self.Loglike=[]
    
    
    def setGaussian(self,var):
        var = sf.string2nestlist(var)
        sf.Info('Gaussian Constraint:')
        for ii in var:
            if len(ii) in [3,4]:
                if len(ii) == 3: ii.append('sym')
                if not ii[3] in ['sym','lower','upper']:
                    sf.ErrorStop( 'For the "Gaussian" constraint on "%s", the "Type" can only be "upper"/"lower", not "%s".'%(ii[0],ii[3]) )
                self.Gaussian.append(ii)
                sf.Info('  varID= %s\tMean= %e\tDeviation= %e\tType= %s'%(ii[0],ii[1],ii[2],ii[3]))
            else:
                sf.ErrorStop( 'The "Gaussian" constraint on "%s" need 3 or 4 items( ID, Mean, Deviation [, Type] ).'%(ii[0]) )

    def setLimit(self,var):
        var = sf.string2nestlist(var)
        sf.Info('Upper/Lower limit:')
        for ii in var:
            if len(ii) == 4:
                self.Limit.append(ii)
                sf.Info('  varID(X)= %s\tvarID(Y)= %s\tConstraintFile= %s\tType= %s'%(ii[0],ii[1],ii[2],ii[3]))
        ## add check the ConstraintFile exist
        ## add check the ConstraintFile has two columns and >1 lines
        ## very useful, you can simply let a>b
            else:
                sf.ErrorStop( 'The "Limit" constraint on "(%s,%s)" need 4 items( X ID, Y ID, ConstraintFile, Type ).'%(ii[0],ii[1]) )

    def setLoglike(self,var):
        var = sf.string2nestlist(var)
        sf.Info('Log(likelihood):')
        for ii in var:
            if len(ii) == 1:
                self.Loglike.append(ii)
                sf.Info('  varID= %s'%(ii[0]))
            else:
                sf.ErrorStop( 'The "Log(likelihood)" constraint on "%s" only need 1 item, "var ID".'%(ii[0]) )


    def getChisq(self,par):
        chisq = 0.0
        #yuanfang debug
        # yy=raw_input('yuanfang in getChisq,hit the button to begin...')
        for ii in self.Gaussian:
            # print 'ii=',ii
            if   ii[3] == 'sym':
                ichisq =     (ii[1] - par[ii[0]])**2/ii[2]**2
            elif ii[3] == 'upper':
                if ii[1] > par[ii[0]]:
                    ichisq = (ii[1] - par[ii[0]])**2/ii[2]**2
            elif ii[3] == 'lower':
                if ii[1] < par[ii[0]]:
                    ichisq = (ii[1] - par[ii[0]])**2/ii[2]**2
            #print "chi("+ii[0]+")^2 = "+str(ichisq)
            chisq += ichisq

        for ii in self.Limit:
            sf.ErrorStop('Line limit constraint is not ready.')
        for ii in self.Loglike:
            chisq += par[ii[0]]


        return chisq



import matplotlib.pyplot as plt
import numpy as np
from matplotlib.mlab import griddata

histconf={'bins':50, 'normed':False, 'facecolor':'green', 'alpha':0.7}
colorconf={'s':40, 'edgecolors':'None',
             'cmap':plt.get_cmap('Reds')}
figconf={'figsize':(12,7), 'dpi':80}
labelconf={'fontsize':20}


class plot():
    def __init__(self):
        self._Histogram=[]
        self._Scatter=[]
        self._Color=[]
        self._Contour=[]
    
        self._data = {}
        self._path = {}

    def setHistogram(self, hist):
        hist=sf.string2nestlist(hist)
        for ii in hist:
            if len(ii)==1 :
                self._Histogram.append([ii[0],'fig_%s.png'%ii[0]])
            elif len(ii)==2 :
                self._Histogram.append(ii)
  
    def setScatter(self, scatter):
        scatter = sf.string2nestlist(scatter)
        for ii in scatter:
            if len(ii)==2 :
                self._Scatter.append([ii[0],ii[1],'fig_%s_%s.png'%(ii[0],ii[1])])
            elif len(ii)==3 :
                self._Scatter.append(ii)

    def setColor(self, color):
        color = sf.string2nestlist(color)
        for ii in color:
            if len(ii)==3 :
                self._Color.append([ii[0],ii[1],ii[2],'fig_%s_%s_%s.png'%(ii[0],ii[1],ii[2])])
            elif len(ii)==4 :
                self._Color.append(ii)

    def setContour(self, Contour):
        Contour = sf.string2nestlist(Contour)
        for ii in Contour:
            if len(ii)==3 :
                self._Contour.append([ii[0],ii[1],ii[2],'[]','fig_%s_%s_%s_contour.png'%(ii[0],ii[1],ii[2])])
            elif len(ii)==4 :
                self._Contour.append([ii[0],ii[1],ii[2],ii[3],'fig_%s_%s_%s_contour.png'%(ii[0],ii[1],ii[2])])
            elif len(ii)==5 :
                self._Contour.append(ii)

    def setPlotPar(self,path):
        ## try this
        # self._data =  np.loadtxt(path)
        
        f_data = open(os.path.join(path,'ScanInf.txt'),'r')
        path   = map(str,f_data.readline().split())
        # print "setPlotPar() in manfun.py 02llllllllllllllllllllllll"
        # print path[0]
        # print path[1] 
        # a=raw_input('yuanfang in setPlotPar path[0],path[1]')
        var    = {}
        while True:
            plot_line = f_data.readline()
            if not plot_line :
                break
            plot_line = map(str,plot_line.split())
            var["+".join(plot_line[:-1])] = int(plot_line[-1])

        self._path = os.path.join(path[0],'Figures')
        if not os.path.exists(self._path):
            os.mkdir(self._path)

        for ii in var:
            self._data[ii] = []
       
        f_data = open(os.path.join(path[0],path[1]),'r')
        while True:
            line = f_data.readline()
            if not line :
                break
            line_par = map(str,line.split())
            # print 'yuanfang in setplot,var=',var
            for ii in var:
                # a=raw_input('yuanang in setplot var begin...')
                # print 'ii=',ii
                # print 'line_par[var[ii]]=',line_par[var[ii]] 
                # a=raw_input('yuanang in setplot var end...') 
                try:
                    self._data[ii].append(float( line_par[var[ii]] ))
                except:
                    # print 'yuanfang in manfun setplot() exception,,ii=',ii
                    # print 'yuanang in manfun setplot exception,line_par[var[ii]]=',line_par[var[ii]]
                    # print 'yuanfang float( line_par[var[ii]])=',line_par[var[ii]]
                    sf.Debug('Skip parameter %s'%ii)
                
    def checkpar(self,par,num):                
            for jj in range(num):
                print "checkpar() in manfun.py 01llllllll" 
                print par[jj]
                print self._data[par[jj]]
                if max(self._data[par[jj]]) == min(self._data[par[jj]]):
                    sf.WarningNoWait("The parameter %s is a cosntant, can not creat plot for it."%par[jj])
                    return False 
            return True

    def get_contour_verts(self,cn):
        contours = []
        # for each contour line
        for cc in cn.collections:
            paths = []
            # for each separate section of the contour line
            for pp in cc.get_paths():
                xy = []
                # for each segment of that section
                for vv in pp.iter_segments():
                    xy.append(vv[0])
                paths.append(np.vstack(xy))
            contours.append(paths)
    
        return contours

    def getPlot(self):
        sf.Info('Start to plot the result ... ')
        for ii in self._Histogram :
            sf.Info('Generate histogram plot of parameter %s'%ii[0])
            if not self.checkpar(ii,2): continue
            f=plt.figure(**figconf)
            subplot=f.add_subplot(111)
            subplot.hist(self._data[ii[0]], **histconf)
            subplot.set_xlabel(ii[0], **labelconf)
            subplot.set_ylabel('Count', **labelconf)
            subplot.tick_params(which = 'both', direction = 'out')
            plt.savefig(os.path.join(self._path, ii[1]))
        for ii in self._Scatter :
            sf.Info('Generate scatter plot of parameter %s and %s'%(ii[0],ii[1]))
            if not self.checkpar(ii,2): continue
            f=plt.figure(**figconf)
            subplot=f.add_subplot(111)
            #print ii
            #print self._data[ii[0]]
            #print self._data[ii[1]]
            subplot.plot(self._data[ii[0]],self._data[ii[1]],'.')
            subplot.set_xlabel(ii[0], **labelconf)
            subplot.set_ylabel(ii[1], **labelconf)
            subplot.tick_params(which = 'both', direction = 'out')
            plt.savefig(os.path.join(self._path, ii[2]))
        for ii in self._Color :
            sf.Info('Generate color plot of parameter %s and %s with color %s'%(ii[0],ii[1],ii[2]))
            if not self.checkpar(ii,3): continue
            f=plt.figure(**figconf)
            subplot=f.add_subplot(111)
            z = [ abs(x) for x in self._data[ii[2]] ]
            sc1=subplot.scatter(self._data[ii[0]],self._data[ii[1]], c= self._data[ii[2]], **colorconf)
            cb1=plt.colorbar(sc1)
            cb1.set_label(ii[2], **labelconf)
            subplot.set_xlabel(ii[0], **labelconf)
            subplot.set_ylabel(ii[1], **labelconf)
            subplot.tick_params(which = 'both', direction = 'out')
            plt.savefig(os.path.join(self._path, ii[3]))
        for ii in self._Contour :
            sf.Info('Generate color plot of parameter %s and %s with color %s'%(ii[0],ii[1],ii[2]))
            if not self.checkpar(ii,3): continue
            f=plt.figure(**figconf)
            subplot=f.add_subplot(111)

            x = self._data[ii[0]]
            X = np.linspace(min(x),max(x),100)
            y = self._data[ii[1]]
            Y = np.linspace(min(y),max(y),100)
            # z = [ np.log10(abs(u)) for u in self._data[ii[2]] ]  # log10
            z = self._data[ii[2]] 
            Z = griddata(x,y,z,X,Y,interp='linear')

            C = subplot.contour(X,Y,Z, [3.1,7],linewidths=2)

            #Cpoint = self.get_contour_verts(C)  # delete
            #np.savetxt(os.path.join(self._path, "contour_1_1.dat"),Cpoint[0][0])   # delete

            C = subplot.contourf(X,Y,Z,[1,2,3,4,5,6,7,8,9,10], cmap=plt.cm.rainbow)
            
            cb1=plt.colorbar(C)
            cb1.set_label(ii[2], **labelconf)

            subplot.set_xlabel(ii[0], **labelconf)
            subplot.set_ylabel(ii[1], **labelconf)
            subplot.tick_params(which = 'both', direction = 'out')
            plt.savefig(os.path.join(self._path, ii[4]))





