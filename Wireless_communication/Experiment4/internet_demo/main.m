% main.m
clc;
clear;
r=round(rand(1,5000));   %产生5000个随机码元
r=2*r-1;               %码序列变为双极性
SNR=-10:1:10;            % 信噪比 
L=length(r);
Err = 0;

for m=10:20:50              %扩频增益的类型
    
    a=repmat(r,1,m);           
    b=(reshape(a,L,m))';       
    x=reshape(b,1,L*m);       
    len=length(x);   
  
             
    x_code=sign(mgen(19,11,len)-0.5);
    msout=x.* x_code;          % 已扩频信号
 
  %信道噪声
  for SNR1=1:21
 
    Eb = 1;  
    N0= Eb/(10^((SNR1-11)/10));
    sig=msout+sqrt(N0)*randn(size(msout));
    
    for i=1:L
        A= randint(1,1,[1,3]);
%         A= randi(1,1,[1,3]);
        for g=1:m
            t=(i-1)*m+g;
            sig(t)=sig(t)+A*sin(t);     
        end
    end
    
    msint=sig.* x_code;   %开始解扩
    err=0;
    for j=1:L 
    y=0;                
    for pp=1:m     
       y=y+msint(m*j+pp-m);
    end
    z=y/m;  %解扩得到用户信码    
    if z>0        
        z=1;
    else
        z=-1;
    end
     if z~=r(j)           %用户错误计数
        Err=Err+1;
     end
   end
   BER(m,SNR1)=Err/L ;     % 误码率实际值
  end 
 
end

figure;
semilogy([-10:10],BER(10,:),'b-*');
text(0,5.000000e-004,' \leftarrow Gain=10','FontSize',10);
hold on;
semilogy([-10:10],BER(30,:),'y-*');
text(-6,3.000000e-003,' \leftarrow Gain=30','FontSize',10);
hold on;
semilogy([-10:10],BER(50,:),'r-*');
text(-9,5.750000e-003,' \leftarrow Gain=50','FontSize',10);
title('扩频增益与误码率关系曲线');                  
xlabel('信噪比/dB');
ylabel('误码率');
grid on;