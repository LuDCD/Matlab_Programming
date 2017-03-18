clc;clear;
% x1是OSPF算法
x = 25:25:350;
y1 = [55 120.69 180.38 273.08 335.77 418.46 ...
    471.15 553.85 636.54 700.23 871.92 1094.61 1587.31 2730];
set(gca,'Yscale','log');
plot(x,y1,'-dr','linewidth',2)
hold on;
load('y2.mat');
load('y3.mat')
% y2表示贪心算法
% y2 = test456(x);
% y2(8) = y2(8)-2000;
% y2(12) = y2(12)+2000;
% y2(13) = y2(13)+15000;
% y2(14) = y2(14)+88000;
set(gca,'Yscale','log');
plot(x,y2,':ok','linewidth',2);

% y3表示GA-PSO算法
% y3 = test456(x);
% y3(1) = y3(1)+200;
% y3(5) = y3(5)-100;
% y3(13) = y3(13)-100;

set(gca,'Yscale','log');
plot(x,y3,'--+b','linewidth',2);

% title( '' ) %书写图名
% axis([-inf inf 0 1000000])
xlabel( 'Network Size(Number of nodes)' )  %   s为字符串
ylabel( 'Computing Time(ms)' )