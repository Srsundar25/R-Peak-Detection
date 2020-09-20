function [gci_n,fff1] = gci_next_fast1(yh,yh1)


global ms ff_op fs pre ms2 ms20 ms15 ms1


[~, plc1]= max(yh(10:ms2));


le=10+plc1-2;
tz1=yh(le:le+ms15)';
fff= 1/(ff_op*tz1);


l=length(fff);

fff1=smooth(fff);

fff(1:length(fff)-2)= fff1(3:length(fff));

fff(l:l+8)=fff(l-1);

der=-1*(fff(5:length(fff))-fff(1:length(fff)-4))';
der=[der,zeros(1,length(fff)-length(der))];

der(l:l+8)= [ -0.001, 0.001, 0.001, 0 , 0,0,0,0,0];


[indn indp]= zcfast(der(ms2:length(der)-5),0);



indp=indp+ms2;

indn=indn+ms2;

if indp(1) < indn(1)
    
    indp=indp(2:length(indp));
    
end;
for q=1:min(length(indp),length(indn))
    
    [val1 indm]= max(fff(indn(q)-4:indn(q)+4)) ;
    
    indm= indn(q)-4+indm-1;
    
    
    [val2 indmi]= min(fff(indp(q)-4:indp(q)+4)) ;
    
    indmi= indp(q)-4+indmi-1;
    
    swing(q) = val1-val2;
    
    loca(q) = indm;
    
    locb(q)=indmi;
    
end;


[s, uu]= max(swing);
gci_n= locb(uu) +le-2;


[d loc] = max(abs((yh1(gci_n-ms2:gci_n+ms2))));
%
gci_n= gci_n-ms2+loc-1;

return;
