function [I] = MI(C)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
[r c]=size(C);
I=[];
R=[];
X=[];
p=.9;

for i=1:c-1
    MI = MutualInformation(C(:,i),C(:,i+1));
    I=[I;MI];
end

% for i=1:c-1
%     r = p/(1-p)*log(norm(softmax(C(:,i)),p));
%     R=[R;r];
% end
% 
% 
% for i=2:c
%     x = ConditionalEntropy(softmax(C(:,i)),softmax(C(:,i-1)));
%     X=[X;x];
% end



end

