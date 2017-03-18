N=100;
dsource=(sign(rand(1,N)-0.5+eps)+1)/2;
n=8;5
temp1=ones(1,n);
temp0=zeros(1,n);
new_dsource=[];
for i=1:length(dsource)
    if dsource(i)==0
        new_dsource=[new_dsource temp0];
    else
        new_dsource=[new_dsource temp1];
    end
end
T=0.10;
t=0:T/n:T/n*(length(new_dsource)-1);
subplot(2,1,1);
plot(t,new_dsource);
title('双极性NRZ码');
axis([min(t)-0.01,max(t)+0.01,min(new_dsource)-0.01,max(new_dsource)+0.01]);


y=new_dsource;
Nf=length(t);
Y=fft(y,Nf);
Pyy=abs(Y).^2/Nf;
dt=t(2)-t(1);
df=1/dt;
f=df*(0:(Nf-1)/2)/Nf;
subplot(2,1,2);
plot(f,10*log10(Pyy(1:((Nf-1)/2+1))));
title('功率谱密度');
xlabel('频率（Hz）');
grid;







