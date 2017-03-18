% clc;clear;
% 平均链路资源利用率
% x1是OSPF算法
xx = [5,10,15,20,25,30,35,40,45,55,65];  % 11个
yy1 = [35 32 41 48 35 39 28 35 47 34 49];
% set(gca,'Yscale','log');
plot(xx,yy1,'-dr','linewidth',2)
hold on;

% yy2表示贪心算法Greedy Strategy
yy2 = [60 50 56 58 46 62 57 60 65 61 66];% 最大65
% set(gca,'Yscale','log');
plot(xx,yy2,':ok','linewidth',2);
hold on;

% yy3表示GA-PSO算法
% set(gca,'Yscale','log');
yy3 = [65 61 72 65 67 70 62 75 70.5 68.4 75]; % 最大75
plot(xx,yy3,'--+b','linewidth',2);

% title( '' ) %书写图名
xlabel( 'Traffic Demands' )  %   s为字符串
ylabel( 'Average Link Resource Utilization(%)' )
set(gca,'YGrid','on');       % X轴的网格
axis([0 70 0 109])
save xx xx;
save yy1 yy1;
save yy2 yy2;
save yy3 yy3;