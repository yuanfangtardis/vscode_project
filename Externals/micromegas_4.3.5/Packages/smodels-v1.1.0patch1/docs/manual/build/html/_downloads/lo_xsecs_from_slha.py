
# coding: utf-8

# # How To: Compute LO cross sections for a given SLHA file

# In[1]:

#Set up the path to SModelS installation folder if running on a different folder
import sys,os
sys.path.append(os.path.join(os.getenv("HOME"),"smodels/"))


# In[2]:

#Import those parts of smodels that are needed for this exercise
from smodels.tools import xsecComputer
from smodels.tools.physicsUnits import TeV, fb
from smodels.installation import installDirectory
from smodels.tools.xsecComputer import LO, NLL


# In[5]:

#Define the SLHA file name
filename="%s/inputFiles/slha/gluino_squarks.slha" % installDirectory()


# In[7]:

#Now lets compute the leading order (LO) cross sections for 8 TeV, simulating 1000
# events with pythia.
LO = 0
xsecs=xsecComputer.computeXSec(sqrts = 8*TeV, maxOrder=LO, nevts=1000, slhafile=filename )


# In[8]:

# the output is a XSectionList ...
type(xsecs)


# In[9]:

#Each entry in the list contains the cross-section value:
print(xsecs[0].value)
#The PDGs of the particles produced:
print(xsecs[0].pid)
#And some additional info
print("label =",xsecs[0].info.label,"Sqrts =",xsecs[0].info.sqrts, "QCD order =",xsecs[0].info.order)


# In[14]:

#It is also possible to convert everything to a dictionary, using the .getDictionary() method:
xsecDic=xsecs.getDictionary(groupBy="labels")["8 TeV (LO)"]
print xsecDic[(1000001,1000021)]


# In[15]:

# now lets make a simple bar chart of the first 12 cross sections, in fb
xsecPlot = dict(xsecDic.items()[:12])
from IPython import get_ipython
get_ipython().magic(u'matplotlib inline')
import pylab; import numpy; pylab.bar( range(len(xsecPlot)), map ( lambda x: float(x/fb), xsecPlot.values() ) )
pylab.xticks( .5+ numpy.arange(len(xsecPlot)), xsecPlot.keys(), rotation="vertical" ); pylab.ylabel( "xsec [fb]");


# In[16]:

#Finally, lets write the cross-sections back to the file 
#(will write only the cross-sections not overlapping the existing ones):
xsecComputer.addXSecToFile(xsecs,filename)


# In[ ]:



