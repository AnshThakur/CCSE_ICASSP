function [ccse] = obtain_CCSE_file(file,Dict,P)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

[x fs]=audioread(file);
%% extract vocalization regions
[ps]=segment_MI(x,fs);

%%  compress using random projections
T=ps'*P';
%% obtain CCSE
[r1 c1]=size(Dict);
param.p=c1;  % learns a dictionary with K elements
param.robust=true;
param.epsilon=1e-3;  % width for Huber loss
param.computeXtX=true;
param.stepsFISTA=0;
param.stepsAS=15;
param.numThreads=-1;

ccse=full(mexDecompSimplex(T',Dict,param));
        


end

