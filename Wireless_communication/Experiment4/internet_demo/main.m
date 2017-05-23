% main.m
clc;
clear;
r=round(rand(1,5000));   %����5000�������Ԫ
r=2*r-1;               %�����б�Ϊ˫����
SNR=-10:1:10;            % ����� 
L=length(r);
Err = 0;

for m=10:20:50              %��Ƶ���������
    
    a=repmat(r,1,m);           
    b=(reshape(a,L,m))';       
    x=reshape(b,1,L*m);       
    len=length(x);   
  
             
    x_code=sign(mgen(19,11,len)-0.5);
    msout=x.* x_code;          % ����Ƶ�ź�
 
  %�ŵ�����
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
    
    msint=sig.* x_code;   %��ʼ����
    err=0;
    for j=1:L 
    y=0;                
    for pp=1:m     
       y=y+msint(m*j+pp-m);
    end
    z=y/m;  %�����õ��û�����    
    if z>0        
        z=1;
    else
        z=-1;
    end
     if z~=r(j)           %�û��������
        Err=Err+1;
     end
   end
   BER(m,SNR1)=Err/L ;     % ������ʵ��ֵ
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
title('��Ƶ�����������ʹ�ϵ����');                  
xlabel('�����/dB');
ylabel('������');
grid on;