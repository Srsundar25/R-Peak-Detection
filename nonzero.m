function [locs vals]= nonzero(a)

loca=1:length(a);
ff_loc1= loca.* (a>0);

pp=sort(ff_loc1);

locs= pp(length(pp)-(sum(pp>0))+1:length(pp));


vals= a(locs);

return;
