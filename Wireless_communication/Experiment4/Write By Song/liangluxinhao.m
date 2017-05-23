clc
clear all
close all

n=7;                                         %m���н���
L=2^n-1;                                    %m���г���
L_source=50;%���͵��źų���
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

 m1=m;
 m2=circshift(m',16)';
 
b1=round(rand(1,L_source));%���������0��1����
 b2=round(rand(1,L_source));%���������0��1����
  figure
 subplot(2,1,1);
 plot(b1);
  axis([-1 L_source -0.5 1.5]);

 title('\bf �������ź�1');
  grid on;
  subplot(2,1,2);
   plot(b2);
  axis([-1 L_source -0.5 1.5]);

title('\bf �������ź�2');
 grid on;
pattern1=spring(b1,L);
 figure
plot(pattern1);
axis([0 3000  -0.1 1.1]);
ylabel('\bf ��Ƶ���ƺ��ź�2');
   grid on;
pattern2=spring(b2,L);

plot(pattern2);
axis([0 3000  -0.1 1.1]);
ylabel('\bf ��Ƶ���ƺ��ź�2');
   grid on;


 spread1=modu(pattern1,m1,L_source,L);
 figure
plot(spread1);
axis([0 3000  -0.1 1.1]);
ylabel('\bf ��m���е��ƺ��ź�1');

 spread2=modu(pattern2,m2,L_source,L);
 figure
plot(spread2);
axis([0 3000  -0.1 1.1]);
ylabel('\bf ��m���е��ƺ��ź�1');
   grid on;
% % Demodulation
  add=spread1+spread2;
   figure
  plot(add);
axis([0 3000  -0.1 2.1]);
  title('\bf ���Ӻ���ź�');
  grid on;
  
 despread1=modu(add,m1,L_source,L);
 despread2=modu(add,m2,L_source,L);
   

despr_b1=despring(despread1,L_source,L);
despr_b2=despring(despread2,L_source,L);
figure
 subplot(2,1,1);
 plot(despr_b1);
  axis([-1 L_source -0.5 1.5]);
  title('\bf ������ź�1');
  grid on;
  
    subplot(2,1,2);
   plot(despr_b2);
  axis([-1 L_source -0.5 1.5]);
 title('\bf ������ź�2');
 grid on;