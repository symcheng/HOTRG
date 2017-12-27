function [gauge,trunerror]=getgauge(T,D)

% T1=contract3(T,T,[1,3],[1,3]);
% T2=contract3(T,T,[1,4],[1,4]);
% ML=contract3(T1,T2,[2,4],[2,4]);
% ML=permute(ML,[1,3,2,4]);
% sizem=size(ML);
% ML=reshape(ML,[sizem(1)*sizem(2),sizem(3)*sizem(4)]);

d=size(T);
M=contract3(T,T,4,3);%M(1,2,y,1',2',y')
ML=permute(M,[1,4,2,5,3,6]);%M(1,1',2,2',y,y')
ML=reshape(ML,[d(1)*d(2),d(1)*d(2)*d(3)*d(4)]);%M(11',22'yy')

ML=ML*ML';
ML=0.5*(ML+ML');
[UL,L,~]=svd(ML);
L=diag(L);
L=L/L(1);
trunerrorl=sum(L(D+1:end))/sum(L);

% T1=contract3(T,T,[2,3],[2,3]);
% T2=contract3(T,T,[2,4],[2,4]);
% MR=contract3(T1,T2,[2,4],[2,4]);
% MR=permute(MR,[1,3,2,4]);
% sizem=size(MR);
% MR=reshape(MR,[sizem(1)*sizem(2),sizem(3)*sizem(4)]);

MR=permute(M,[2,5,1,4,3,6]);%M(2,2',1,1',y,y')
MR=reshape(MR,[d(1)*d(2),d(1)*d(2)*d(3)*d(4)]);%M(22',11'yy')

MR=MR*MR';
MR=0.5*(MR+MR');
[UR,R,~]=svd(MR);
R=diag(R);
R=R/R(1);
trunerrorr=sum(R(D+1:end))/sum(R);

if trunerrorl<=trunerrorr
    trunerror=trunerrorl;
    UL(:,D+1:end)=[];
    gauge=UL;%(11',X)
    D=min(D,d(1)*d(2));
    gauge=reshape(gauge,[d(1),d(1),D]);
else
    trunerror=trunerrorr;
    UR(:,D+1:end)=[];
    gauge=UR;%(22',X)
      D=min(D,d(1)*d(2));
    gauge=reshape(gauge,[d(1),d(1),D]);
end

%             y
%      1 ------ 2
%      1'------ 2'
%             y'
