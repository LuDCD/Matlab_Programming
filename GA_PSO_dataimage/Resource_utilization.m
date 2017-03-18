% clc;clear;
% 平均链路资源利用率

load('xx.mat');

% x1是OSPF算法
load('yy1.mat');
plot(xx,yy1,'-dr','linewidth',2)
hold on;

% yy2表示贪心算法Greedy Strategy
load('yy2.mat');
plot(xx,yy2,':ok','linewidth',2);
hold on;

% yy3表示GA-PSO算法
load('yy3.mat');
plot(xx,yy3,'--+b','linewidth',2);

% title( '' ) %书写图名
xlabel( 'Traffic Demands' )  %   s为字符串
ylabel( 'Average Link Resource Utilization(%)' )
set(gca,'YGrid','on');       % X轴的网格
axis([0 70 0 109])