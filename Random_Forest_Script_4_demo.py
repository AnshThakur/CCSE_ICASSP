
# coding: utf-8

# In[4]:


## script to classify CCSE obtained from demo.m //example 
import scipy.io 
from sklearn import preprocessing
from scipy import stats
import h5py
import numpy as np
import pickle
train = scipy.io.loadmat('train_features_128Dict.mat')

T=train['CCSE']
L=train['labels']
print(L.shape)
print(T.shape)


# In[3]:


from sklearn.ensemble import RandomForestClassifier
clf = RandomForestClassifier(n_estimators=500,random_state=0)
clf.fit(T,L)


# In[26]:


# storing trained object 
with open('rand_forest.pkl', 'wb') as output:
    pickle.dump(clf, output, pickle.HIGHEST_PROTOCOL)


# In[28]:


#load the stored model
#with open('/home/d14003/simplex_projections/species_id_unsup/CCSE_ICASSP/rand_forest.pkl', 'rb') as input:
 #   clf= pickle.load(input)


# In[29]:


#load the ccse obtained from demo.m
test = scipy.io.loadmat('temp_ccse_25.mat')
test=test['ccse']
print(test.shape)
p1=clf.predict(test)
p1=p1.astype(int)
p=np.bincount(p1)
p=np.argmax(p)
print(p)

