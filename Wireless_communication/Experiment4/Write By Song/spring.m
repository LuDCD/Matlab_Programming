function [pattern]=spring(b,m)
 pattern=[];
for k=1:length(b)
    if(b(1,k)==-1);
        sig=-ones(1,m);
    else
        sig=ones(1,m);
    end
    pattern=[pattern sig];
end

