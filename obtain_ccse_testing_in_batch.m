%% obtain ccse for each example in subfolders and stores them in a cell
clc;
clear;
%%

path='/data/';
d = dir(path);
isub = [d(:).isdir]; %# returns logical vector
folds = {d(isub).name}';
folds(ismember(folds,{'.','..'})) = [];
%% loading dict
load con_Dicts_50_26classes;
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

for i=2:numel(folds)
    f=folds(i);
    f=cell2mat(f);
    f=strcat(path,f);
    addpath(f);
    disp(f);
    load train_test_distribution;
    
    [r c]=size(testFiles);
    ccse_test=cell(c,1);
    
    for j=1:c
        file=trainFiles{1,j};
        [x fs]=audioread(file);
        
        %% extract vocalization regions
        [ps]=segment_MI(x,fs);
        
        %%  compress using random projections
         T=ps'*P';
        %%
         cof=full(mexDecompSimplex(T',Dict,param));
         ccse_test(j,1)={cof'};
         save(strcat(f,'/test_cells_50'),'ccse_test');
    end
    rmpath(f);    
end
    