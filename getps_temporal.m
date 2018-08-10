function [temporal_features] = getps_temporal(ps,T)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


[r c]=size(ps);
ad=floor(r/T)*T;
temporal_features=[];
% %left_over=r-add;
parfor i=1:ad
    if (T+i-1)<=r
     temp=ps(i:T+i-1,:);
     temp=temp';
     temp=temp(:);
     temporal_features=[temporal_features temp];
    end
end
end
