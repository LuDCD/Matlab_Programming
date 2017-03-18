N=100;
dsource=(sign(rand(1,N)-0.5+eps)+1)/2;
n=8;
temp1=ones(1,n);
temp0=zeros(1,n);
new_dsource=[];
for i=1:length(dsource)
    if dsource(i) == 0
        new_dsource=[new_dsource temp0];
    else
        new_dsource=[new_dsource temp1];
    end
end
T=0.10;
t=0:T/n:T/n*(length(new_dsource)-1);
plot(t,new_dsource);
axis([min(t)-0.01,max(t)+0.01,min(new_dsource)-0.01,max(new_dsource)+0.01]);