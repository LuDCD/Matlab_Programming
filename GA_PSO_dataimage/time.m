clc;clear;
% y1��OSPF�㷨
x = 25:25:350;

load('y1.mat');
set(gca,'Yscale','log');
plot(x,y1,'-dr','linewidth',2)

hold on;
load('y2.mat');
load('y3.mat')

% y2��ʾ̰���㷨
set(gca,'Yscale','log');
plot(x,y2,':ok','linewidth',2);

% y3��ʾGA-PSO�㷨
set(gca,'Yscale','log');
plot(x,y3,'--+b','linewidth',2);

% title( '' ) %��дͼ��
% axis([-inf inf 0 1000000])
xlabel( 'Network Size(Number of nodes)' )  %   sΪ�ַ���
ylabel( 'Computing Time(ms)' )