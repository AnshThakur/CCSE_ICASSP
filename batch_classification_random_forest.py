
# coding: utf-8

# In[9]:


import scipy.io 
from sklearn import preprocessing
from scipy import stats
import h5py
import numpy as np

train = scipy.io.loadmat('/home/d14003/simplex_projections/species_id_unsup/train_features_50Dict.mat')

T=train['CCSE']
L=train['labels']
print(L.shape)
print(T.shape)


# In[10]:


#T=T.transpose()
#L=L.transpose()
from sklearn.ensemble import RandomForestClassifier
clf = RandomForestClassifier(n_estimators=500,random_state=0)
clf.fit(T,L)


# In[39]:


from sklearn.ensemble import RandomForestClassifier
clf_50 = RandomForestClassifier(n_estimators=100,random_state=0)
clf_50.fit(T,L)


# In[20]:


from sklearn.svm import LinearSVC
clf = LinearSVC(random_state=0)
clf.fit(T,L)


# In[4]:


import scipy.io 
fold = scipy.io.loadmat('/home/d14003/simplex_projections/species_id_unsup/folds.mat')
fold=fold['folds']


# In[11]:


import numpy as np
num=len(fold)
count=0
result=0.0
path='/home/d14003/simplex_projections/species_id_unsup/'
labels=[]
res=[]
for i in range(0,26):
    f=fold[i,0]
    f=f[0]
    f1=path+f
    f=path+f+'/test_cells_50.mat'
    
    print(f)
    t = scipy.io.loadmat(f)
    t=t['ccse_test']
    [r,c]=t.shape
    #print(r)
    for j in range(0,r):
        a=t[j,0]
        p1=clf.predict(a)
        p1=p1.astype(int)
        p=np.bincount(p1)
        p=np.argmax(p)
        res.append(p)
        labels.append(i+1)
        print(p)
        if p==i+1:
           result=result+1
        count=count+1
print(result/count)

