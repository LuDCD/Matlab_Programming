% clc;clear;
% ƽ����·��Դ������

load('xx.mat');

% x1��OSPF�㷨
load('yy1.mat');
plot(xx,yy1,'-dr','linewidth',2)
hold on;

% yy2��ʾ̰���㷨Greedy Strategy
load('yy2.mat');
plot(xx,yy2,':ok','linewidth',2);
hold on;

% yy3��ʾGA-PSO�㷨
load('yy3.mat');
plot(xx,yy3,'--+b','linewidth',2);

% title( '' ) %��дͼ��
xlabel( 'Traffic Demands' )  %   sΪ�ַ���
ylabel( 'Average Link Resource Utilization(%)' )
set(gca,'YGrid','on');       % X�������
axis([0 70 0 109])