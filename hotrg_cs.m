function hotrg_cs

 [D,Size,Temp,field]=coefinput;

 NT=numel(Temp);
 fenergy=zeros(NT,1);
 energy=zeros(NT,1);
 mag=zeros(NT,1);
 trunerror=zeros(Size,NT);

 for i=1:NT
      tem=Temp(i);
      [fenergy(i),energy(i),mag(i),trunerror(:,i)]=corsegrain(D,Size,tem,field);
      fprintf('T=%g,free_energy=%g,energy=%g,mag=%g\n',tem,fenergy(i),energy(i),mag(i));
 end

 capacity=zeros(NT,1);
 for i=1:NT-1
     capacity(i)=(energy(i+1)-energy(i))/0.01;
 end

save('j1j2_2ddate','fenergy','energy','mag','trunerror','capacity','Temp')
  hold on

 figure(1)
 plot(Temp,fenergy,'*')
 title('free energy')
 figure(2)
 plot(Temp,energy,'*')
  title('energy')
  figure(3)
 plot(Temp, abs(mag),'*')
  title('mag')
  figure(4)
 plot(Temp, capacity,'*')
  title('capacity')
