clc
clear all
close all

n=7;                                         %m���н���
L=2^n-1;                                    %m���г���
L_source=500;%���͵��źų���
g=dec2bin(base2dec('203',8));%�˽��Ƶķ���ϵ��ת�ɶ�����
temp=fliplr(g);                            %��ϵ������������
t=temp(1:length(g)-1);          % ȥ������ϵ�����һλ
G=str2num(t(:))';                   % ��������������������
m=zeros(1,L);                            %��ʼ��m���У�ȫ����Ϊ��
for i=1:n
    m(i)=1;               %��m=(1,1,...1)״̬��ʼת��
end
 
  for j=1:L-n 
        A=m(j:j+n-1).*G;        % ���ݷ���ϵ����÷�����
        for i=1:n-1
            te=bitxor(A(i),A(i+1));
            A(i+1)=te;
        end 
        m(j+n)=te;
  end

%  m1=m;
  m1=1-2*m;
  b=round(rand(1,L_source));%���������0��1����
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
%      SNR=exp((snr_in_dB(n)/10)*log(10));	%��dBתΪ����
%      y = awgn(spread1,SNR);
   y = awgn(spread1,snr_in_dB(n));
      add=spread1+y+noise;
      despread1=modu(add,m1,L_source,L);
      despr_b1=despring(despread1,L_source,L);
   
      [nErrors, BER(n)] = biterr(b, despr_b1);  % ����ʵ��������
 end
%  chek1=b1-despr_b1;
figure
 plot(snr_in_dB,BER);
% semilogy( snr_in_dB, BER);
grid on;
  

%    chek1=b1-despr_b1;
