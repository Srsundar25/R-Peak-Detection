function [ffm]= ff_mat(siz1,f)


l1=(length(1:1+siz1));
ff_op=tril(ones(l1,l1));

w=(1:l1).^(1/f);

div=(ones(l1,l1)*(diag(w)))';

ffm=ff_op./div;

return;
