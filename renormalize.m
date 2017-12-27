function [T,TE,TM,trunerror,coef]=renormalize(D,T0,TE0,TM0)
[gauge,trunerror]=getgauge(T0,D);
[T,coef]=update(T0,T0,gauge);
TE=update(TE0,T0,gauge,coef);
TM=update(TM0,T0,gauge,coef);