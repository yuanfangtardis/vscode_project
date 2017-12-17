
# coding: utf-8

# # How To: Print out the theoretical decomposition

# In[1]:

#Set up the path to SModelS installation folder if running on a different folder
import sys,os
sys.path.append(os.path.join(os.getenv("HOME"),"smodels/"))


# In[2]:

#Import those parts of smodels that are needed for this exercise
#(We will assume the input is a SLHA file. For LHE files, use the lheDecomposer instead)
from smodels.theory import slhaDecomposer
from smodels.installation import installDirectory
from smodels.tools.physicsUnits import fb, GeV


# In[3]:

#Define the SLHA file name
filename="%s/inputFiles/slha/gluino_squarks.slha" % installDirectory()


# In[4]:

#Perform the decomposition:
listOfTopologies = slhaDecomposer.decompose(filename, sigcut = 0.5 * fb, 
                                            doCompress=True, doInvisible=True,minmassgap = 5* GeV)


# In[6]:

#Print a summary of all the topologies generated:
for top in listOfTopologies:
    print top.describe()


# In[7]:

#To print specific information about othe i-th topology:
i = 3
top = listOfTopologies[i]
print "Number of vertices = ",top.vertnumb
print "Number of final states = ",top.vertparts
print "Number of elements = ",len(top.elementList)


# In[11]:

#We can also print information for each element in the topology:
for iel,element in enumerate(top.elementList):
    print 'Element',iel,':',element.getParticles()
    print 'masses=',element.getMasses()
    print 'weight=',element.weight,'\n'

