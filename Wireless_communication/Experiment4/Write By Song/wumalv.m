clc
clear all
close all

n=7;                                         %m序列阶数
L=2^n-1;                                    %m序列长度
L_source=500;%发送的信号长度
g=dec2bin(base2dec('203',8));%八进制的反馈系数转成二进制
temp=fliplr(g);                            %将系数行向量反向
t=temp(1:length(g)-1);          % 去掉反馈系数最后一位
G=str2num(t(:))';                   % 将二进制数换成行向量
m=zeros(1,L);                            %初始化m序列，全部设为零
for i=1:n
    m(i)=1;               %从m=(1,1,...1)状态开始转移
end
 
  for j=1:L-n 
        A=m(j:j+n-1).*G;        % 根据反馈系数获得反馈项
        for i=1:n-1
            te=bitxor(A(i),A(i+1));
            A(i+1)=te;
        end 
        m(j+n)=te;
  end

%  m1=m;
  m1=1-2*m;
  b=round(rand(1,L_source));%产生随机的0，1序列
 b1=1-2*b;
pattern1=spring(b1,L);
 spread1=modu(pattern1,m1,L_source,L);
    
  t=1:1:L*L_source;
 noise=2*sin(2*pi*(1/50)*t);
%  figure
% plot(t,abs(fft(noise)));
% grid on;

 snr_in_dB=0:50;
 for n=1:length(snr_in_dB)
%      
%      SNR=exp((snr_in_dB(n)/10)*log(10));	%将dB转为倍数
%      y = awgn(spread1,SNR);
   y = awgn(spread1,snr_in_dB(n));
      add=spread1+y+noise;
      despread1=modu(add,m1,L_source,L);
      despr_b1=despring(despread1,L_source,L);
   
      [nErrors, BER(n)] = biterr(b, despr_b1);  % 计算实际误码率
 end
%  chek1=b1-despr_b1;
figure
 plot(snr_in_dB,BER);
% semilogy( snr_in_dB, BER);
grid on;
  

%    chek1=b1-despr_b1;
