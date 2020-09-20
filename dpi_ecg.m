function [gci]= dpi_ecg(y,sig,fs,sw,f)

global ms ff_op ms20 ms15 ms2

ms=(0.001*fs);
ms2 =floor(285*ms);
ms20=floor((sw+320)*ms);
ms15=floor(sw*ms);
ff_op= ff_mat(ms15,f);
[gci]=epoch_lpr_ec(y,sig,fs);

return;