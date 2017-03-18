 function [YY]=Binary(Z1)
z=zeros(1,7);
z(l)=mod(Z1,2);
a=floor(Z1/2);
for ll=1 :6
    z(ll+l)=mod(a,2);
    a=floor(a/2);
    if a==0
        break;
    end
end
YY=z;