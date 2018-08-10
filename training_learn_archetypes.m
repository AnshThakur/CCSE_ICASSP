%% learning class-wise archetypal dictionary
clc;
clear;
%%

path='/data/';
d = dir(path);
isub = [d(:).isdir]; %# returns logical vector
folds = {d(isub).name}';
folds(ismember(folds,{'.','..'})) = [];
%%

%% Random Gaussian matrix

m=500;n=1285;
rng('default');rng(1);
P=full(sprand(m,n,.3));
save('rand_gauss_matrix','P');
%%
Dicts=cell(26,1);
for i=1:numel(folds)
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
        train=[train;T];
    end
    
    %% learning archetypes
    Dict=getArchetypes(train,50); %% number of archetypes=256
    Dicts(i-1,1)={Dict};
    
end  
         
         
        
