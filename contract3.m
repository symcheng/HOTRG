function T=contract3(A,B,Ac,Bc)%for example A(x,i,y,j),B(i,z,j)
%Ac means the contracted indexes of A

Asize=size(A);
Bsize=size(B);
Aorder=numel(Asize);
Border=numel(Bsize);

Arest=[1:Aorder];
Brest=[1:Border];
Arest([Ac])=[];
Brest([Bc])=[];
A=permute(A,[Arest,Ac]);%A(x,y,i,j)
B=permute(B,[Bc,Brest]);%B(i,j,z)

A=reshape(A,prod(Asize([Arest])),prod(Asize([Ac])));%A(yx,ji)
B=reshape(B,prod(Bsize(Bc)),prod(Bsize([Brest])));%B(ji,z)
T=A*B;%T(yx,z)

T=reshape(T,[Asize([Arest]),Bsize([Brest])]);%T(x,y,z)
%toc