
function qrs=dpi_qrs(y,fs,sw,p)

%load HR_01.mat



if mod(length(y),2) ~= 0
    
    y=y(1:end-1);
    
end

sig=y;

freq_res= fs/length(y);
nn1= floor(8/freq_res);
h1= 0.5-0.5*cos(pi.*(1:nn1)/(nn1));
h2= ones( 1, floor(length(y)/2)-length(h1));
h3= [ h1 h2];
h4= wrev(h3);
h5= [ h3 h4];
h5=h5.^4;
g3= fft(y);

sig_hp1= h5.*g3;
sig_hp1 = ifft (sig_hp1);
y= real(sig_hp1);
qrs=dpi_ecg(y,sig,fs,sw,p);










