function T=contract42(T0)

Tsize=size(T0,4);
T=zeros(Tsize);
 for i=1:Tsize
for j=1:Tsize
for k=1:Tsize
T(i,j)=T(i,j)+T0(i,j,k,k);
end
end
end
