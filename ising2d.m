function [T,TE,TM]=ising2d(Tem,field)
%Hbond=-J*sz(i)*sz(i+1)+field*(sz(i)+sz(i+1))

J=1;
%field=0;
betaj=J/Tem;
betaf=field/Tem;
expbetaH=[exp(betaj-betaf) exp(-betaj); exp(-betaj) exp(betaj+betaf)];
E=[(-J+field)*exp(betaj-betaf) J*exp(-betaj); J*exp(-betaj) (-J-field)*exp(betaj+betaf)];
M=[exp(betaj-betaf) 0; 0 -exp(betaj+betaf)];

[u,s]=eig(expbetaH);
w=u*sqrt(s);
Ew=E*u/sqrt(s);
Mw=M*u/sqrt(s);
T=zeros(2,2,2,2);
TE=zeros(2,2,2,2);
TM=zeros(2,2,2,2);

aa=[1,-1];
for i=1:2
    for j=1:2
        for k=1:2
            for l=1:2
                for a=1:2
                T(i,j,k,l)=w(a,i)*w(a,j)*w(a,k)*w(a,l)+T(i,j,k,l);
                TE(i,j,k,l)=Ew(a,i)*w(a,j)*w(a,k)*w(a,l)+TE(i,j,k,l);
                TM(i,j,k,l)=Mw(a,i)*w(a,j)*w(a,k)*w(a,l)+TM(i,j,k,l);

                end
            end
        end
    end
end

T=(T+permute(T,[4,1,2,3])+permute(T,[3,4,1,2])+permute(T,[2,3,4,1]))./4;
TE=(TE+permute(TE,[4,1,2,3])+permute(TE,[3,4,1,2])+permute(TE,[2,3,4,1]))./4;
TM=(TM+permute(TM,[4,1,2,3])+permute(TM,[3,4,1,2])+permute(TM,[2,3,4,1]))./4;

