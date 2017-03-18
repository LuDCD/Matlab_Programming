clc
clear all
close all

n=7;                                         %m序列阶数
L=2^n-1;                                    %m序列长度
L_source=50;%发送的信号长度
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

 m1=m;
 m2=circshift(m',16)';
 
b1=round(rand(1,L_source));%产生随机的0，1序列
 b2=round(rand(1,L_source));%产生随机的0，1序列
  figure
 subplot(2,1,1);
 plot(b1);
  axis([-1 L_source -0.5 1.5]);

 title('\bf 产生的信号1');
  grid on;
  subplot(2,1,2);
   plot(b2);
  axis([-1 L_source -0.5 1.5]);

title('\bf 产生的信号2');
 grid on;
pattern1=spring(b1,L);
 figure
plot(pattern1);
axis([0 3000  -0.1 1.1]);
ylabel('\bf 扩频调制后信号2');
   grid on;
pattern2=spring(b2,L);

plot(pattern2);
axis([0 3000  -0.1 1.1]);
ylabel('\bf 扩频调制后信号2');
   grid on;


 spread1=modu(pattern1,m1,L_source,L);
 figure
plot(spread1);
axis([0 3000  -0.1 1.1]);
ylabel('\bf 加m序列调制后信号1');

 spread2=modu(pattern2,m2,L_source,L);
 figure
plot(spread2);
axis([0 3000  -0.1 1.1]);
ylabel('\bf 加m序列调制后信号1');
   grid on;
% % Demodulation
  add=spread1+spread2;
   figure
  plot(add);
axis([0 3000  -0.1 2.1]);
  title('\bf 叠加后的信号');
  grid on;
  
 despread1=modu(add,m1,L_source,L);
 despread2=modu(add,m2,L_source,L);
   

despr_b1=despring(despread1,L_source,L);
despr_b2=despring(despread2,L_source,L);
figure
 subplot(2,1,1);
 plot(despr_b1);
  axis([-1 L_source -0.5 1.5]);
  title('\bf 解调的信号1');
  grid on;
  
    subplot(2,1,2);
   plot(despr_b2);
  axis([-1 L_source -0.5 1.5]);
 title('\bf 解调的信号2');
 grid on;