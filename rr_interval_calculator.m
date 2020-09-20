function rr_interval_calculator
%x=ECG;
mV=ecg;

 plot(mV);
hold on 
plot(mV,'ro');
beatcount=0;
i=0;
rr=0;
hold off

RRinterval=zeros(6000,1);
for k=2:length(mV)-1;
    if mV(k)>mV(k-1) && mV(k)>mV(k+1)&&mV(k)>1
        beatcount=beatcount+1;
        if beatcount==1;
            rr=0;
        else
            rr=k-i;
            RRinterval(k)=rr;
            i=k;
        end
    else
        RRinterval(k)=rr;
    end
end
   
   
   
figure(2), plot(RRinterval);
xlabel('Time in sec*10^-2'), ylabel('Distance betweeen 2 Heatbeats (R-R) in sec*10^-2'), title('R-R intervals');