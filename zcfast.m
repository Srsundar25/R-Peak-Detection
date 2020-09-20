function [indn,indp]=zcfast(der,th)
l=length(der);

pos= (1:length(der)-1);
d=der(1:l-1).*der(2:l)<=0 ;
p=der>th;
n=der<-th;
p=p(1:l-1);
n=n(1:l-1);
indp=d.*p.*pos;
indn=d.*n.*pos;

pp= indp>0;
pn=indn>0;

indp1= (sort(indp,'descend'));

indp = wrev(indp1((1:sum(pp))));

indn1= (sort(indn,'descend'));

indn=wrev(indn1((1:sum(pn))));

return;