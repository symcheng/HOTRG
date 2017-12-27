function [fenergy,energy,mag,trunerror]=corsegrain(D,Size,tem,field)


[T,TE,TM]=ising2d(tem,field);
%    [T,TE,TM]=ising2d_tnr(tem,field);
%    [T,TE,TM]=J1J2_2d(1,0.6,tem,field);%0.55(0.7722)
%    [T,TE,TM]=J1J2_beta(1,0.6,tem,field);

 fenergy=0;
 trunerror=zeros(Size,1);
 for i=1:Size
      [T,TE,TM,trunerror(i),coef]=renormalize(D,T,TE,TM);
      fenergy=fenergy-tem*log(coef)*2^(-i);
     energy=trace(contract42(TE))/trace(contract42(T));
     mag=trace(contract42(TM))/trace(contract42(T));
     T=permute(T,[3,4,2,1]);
     TE=permute(TE,[3,4,2,1]);
     TM=permute(TM,[3,4,2,1]);
 end

