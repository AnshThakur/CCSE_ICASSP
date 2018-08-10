%% learning class-wise archetypal dictionary
clc;
clear;
%%

path='/data/';
d = dir(path);
isub = [d(:).isdir]; %# returns logical vector
folds = {d(isub).name}';
folds(ismember(folds,{'.','..'})) = [];
%% loading dict
load con_Dicts_128_26classes; %% concatenated dictionary of 26 classes
[r1 c1]=size(Dict);
param.p=c1;  % learns a dictionary with K elements
param.robust=true;
param.epsilon=1e-3;  % width for Huber loss
param.computeXtX=true;
param.stepsFISTA=0;
param.stepsAS=15;
param.numThreads=-1;
%%
load rand_gauss_matrix;
CCSE=[];
    labels=[];
for i=2:numel(folds)
    f=folds(i);
    f=cell2mat(f);
    f=strcat(path,f);
    addpath(f);
    disp(f);
    load train_test_distribution;
    
    [r c]=size(trainFiles);
    train=[];
    
    for j=1:c
        file=trainFiles{1,j};
        [x fs]=audioread(file);
        
        %% extract vocalization regions
        [ps]=segment_MI(x,fs);
     
        %%  compress using random projections
         T=ps'*P';
        %%
         cof=full(mexDecompSimplex(T',Dict,param));
        CCSE=[CCSE;cof'];
        [r2 c2]=size(cof');
        labels=[labels;repmat(i-1,r2,1)];
    end
   save('train_features_128Dict','labels','CCSE');
 
    
end
    