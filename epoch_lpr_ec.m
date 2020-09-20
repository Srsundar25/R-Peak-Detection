function [gci]= epoch_lpr_ec(y,sig,fs)

clear gci

global  ms2 ms20


start_point =ms2+3;
gci(1) = start_point;
gcic(1)=gci(1);
i=0;
m=2;
while i< length(y)-2000
    gcim1= gci(m-1);
    yh= y(gcim1-ms2:gcim1+ms20);
    y2= sig(gcim1-ms2:gcim1+ms20);
    y2=hpf(y2,4,fs);
    pos= yh>=0;
    yh1=((1*yh.*pos))';
    yh1(length(yh1)-2:length(yh1))= [-.001 0 0.001];
    [gcix,~]= gci_next_fast1(yh1,y2);
    gci(m)= floor(gcix+gcim1-ms2);
    gci(m) = (abs(gci(m)-gcim1)<ms2)*200+ gci(m);
    i=gci(m);
    m=m+1;
    
end

return;