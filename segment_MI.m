function  [P]=segment_MI(x,fs)

% utlizes MLSP 2017 segmentation paper...added here
addpath('/home/d14003/Desktop/mlsp/MLSP2017_Seg/');
%% calculate spectrogram
[t,f,ps]=calculateSpectrogram(x,fs);
%% load SVD dictionary (left singular vectors)
load Dict;
Dict=U(:,1:5); %% choosing top 5 left singular vectors
%% compute features
cof=Dict'*ps';
cof=softmax(cof); %% obtaining categorical multinoulli distribution estimates for each column.
%% It represents the probability of similarity of a frame with each of the dictionary atom.

%% obtaining MI

[H]=MI(cof); 
H=normalize(1-H,0,1);
H=smooth(H,10);
H=[0;H];
ind=find(H>0.1);
[r c]=size(H);
res=zeros(r,1);
res(ind)=1;


  %% embedding temporal context
[T] = getps_temporal(ps,5); %% 5 is context size
ind=sort(ind);
ind=ind(1:end-5);
P=T(:,ind);
end

