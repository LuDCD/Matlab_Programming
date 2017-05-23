% clc;clear;
% ƽ����·��Դ������
% x1��OSPF�㷨
xx = [5,10,15,20,25,30,35,40,45,55,65];  % 11��
yy1 = [35 32 41 48 35 39 28 35 47 34 49];
% set(gca,'Yscale','log');
plot(xx,yy1,'-dr','linewidth',2)
hold on;

% yy2��ʾ̰���㷨Greedy Strategy
yy2 = [60 50 56 58 46 62 57 60 65 61 66];% ���65
% set(gca,'Yscale','log');
plot(xx,yy2,':ok','linewidth',2);
hold on;

% yy3��ʾGA-PSO�㷨
% set(gca,'Yscale','log');
yy3 = [65 61 72 65 67 70 62 75 70.5 68.4 75]; % ���75
plot(xx,yy3,'--+b','linewidth',2);

% title( '' ) %��дͼ��
xlabel( 'Traffic Demands' )  %   sΪ�ַ���
ylabel( 'Average Link Resource Utilization(%)' )
set(gca,'YGrid','on');       % X�������
axis([0 70 0 109])
save xx xx;
save yy1 yy1;
save yy2 yy2;
save yy3 yy3;