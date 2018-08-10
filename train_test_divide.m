clc;
clear;
%% list class-wise folders in data source

path='/data/'; %% path to the data
d = dir(path);
isub = [d(:).isdir]; %# returns logical vector
folds = {d(isub).name}';
folds(ismember(folds,{'.','..'})) = [];
% assumes each subfolder containes wave files of one class

%%
for i=1:numel(folds)
    f=folds(i);
    f=cell2mat(f);
    f=strcat(path,f);
    addpath(f);
    disp(f);
    files=dir(strcat(f,'/*.wav'));
    files={files.name};
    ratio=ceil(0.5*numel(files)); %% ratio of train_test
    trainFiles=datasample(files,ratio,'replace',false);
    testFiles=setdiff(files,trainFiles);
    save(strcat(f,'/train_test_distribution'),'trainFiles','testFiles');
    %% stores file names for train-test distribution in each subfolder of data
end
    


