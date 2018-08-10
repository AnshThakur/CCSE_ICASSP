clc;
clear;
%% load dict and random gaussian random matrix
load rand_gauss_matrix
load con_Dicts_128_26classes

%% obtain CCSE for input file 

file='class25.wav';
[ccse] = obtain_CCSE_file(file,Dict,P);

%% save ccse in a temp file
ccse=ccse';
save('temp_ccse_25','ccse');



