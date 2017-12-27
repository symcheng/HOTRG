function [T,coef]=update(T0,T1,gauge,coef0)

d=size(T0);

M=contract3(T0,gauge,2,1);
M=contract3(M,T1,[3,4],[3,2]);
T=contract3(M,gauge,[1,4],[1,2]);
T=permute(T,[4,2,1,3]);

if nargin==3
coef=max(max(max(max(abs(T)))));
else
    coef=coef0;
end
T=T./coef;

