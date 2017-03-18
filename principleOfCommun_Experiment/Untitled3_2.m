N=10;
a=(sign(rand(1,N)-0.5+eps)+1)/2;
a
b=a;
n=length(b);
y=1;
for k=1:n
    if b(k)==1
        if mod(y,2)==1 %求模二加
            b(k)=1;
        else
            b(k)=-1;
        end
        y=y+1;
    end
end
AMI=b;
AMI

encode=HDB3_code(a);
HDB3=encode;
HDB3
%Manchester码
k=1;
for i=1:length(a)
    if a(i)==1
        c(k)=1;
        k=k+1;
        c(k)=0;
        k=k+1;
    else
        c(k)=0;
        k=k+1;
        c(k)=1;
        k=k+1;
    end
end
Manchester=c;
Manchester
%CMI码
k=1;
y=1;
for i=1:length(a)
    if a(i)==0;
        d(k)=0;
        k=k+1;
        d(k)=1;
        k=k+1;
    end
    if a(i)==1
        if mod(y,2)==1
            d(k)=1;
            k=k+1;
            d(k)=1;
            k=k+1;
        else
            d(k)=0;
            k=k+1;
            d(k)=0;
            k=k+1;
        end
        y=y+1;
    end
end
CMI=d;
CMI            
            














        
        