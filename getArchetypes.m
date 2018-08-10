function Dict=getArchetypes(train,K)

%% utilizes spams toolbox

%% parameter setting
param.p=K;  % learns a dictionary with K elements
param.robust=true;
param.epsilon=1e-3;  % width for Huber loss
param.computeXtX=true;
param.stepsFISTA=0;
param.stepsAS=15;
param.numThreads=-1;

%%
train=train';
[Dict A B] = mexArchetypalAnalysis(train,param); 


end

