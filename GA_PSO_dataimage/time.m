clc;clear;
% y1是OSPF算法
x = 25:25:350;

load('y1.mat');
set(gca,'Yscale','log');
plot(x,y1,'-dr','linewidth',2)

hold on;
load('y2.mat');
load('y3.mat')

% y2表示贪心算法
set(gca,'Yscale','log');
plot(x,y2,':ok','linewidth',2);

% y3表示GA-PSO算法
set(gca,'Yscale','log');
plot(x,y3,'--+b','linewidth',2);

% title( '' ) %书写图名
% axis([-inf inf 0 1000000])
xlabel( 'Network Size(Number of nodes)' )  %   s为字符串
ylabel( 'Computing Time(ms)' )