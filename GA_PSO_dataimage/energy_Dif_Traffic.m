clc;clear;
% 其中，hatchfill()函数的参数分别为：
% par1：句柄；
% par2：填充格式：'single'：  single line;
%                'cross'：   double cross;
%               'speckle'：。。。。；
% par3：形状填充倾斜度：如横线对应180度，竖线对应0度；
% par4：填充线之间的间距；
% par5：颜色

load('energy.mat')
h=bar(energy,1);  
hp = findobj(h,'type','patch');   
hatchfill(hp(1),'cross',45,4,'r');  
hatchfill(hp(2),'single',180,3,'w');  
hatchfill(hp(3),'single',135,4,'g');  

set(gca,'FontSize',12);  
% 设置X轴的记号
set(gca,'xticklabel',{'5','10','15','20','25','30','35','40','45','55','65'});  
% ylabel('SER','FontSize',12);  
hh=legend('OSPF','Greedy Strategy','GA-PSO');
hpp=findobj(hh,'type','patch');

hatchfill(hpp(3),'cross',45,4,'r');  
hatchfill(hpp(2),'single',180,3,'w');  
hatchfill(hpp(1),'cross',135,4,'g');  
% grid on;  
% axis([-inf inf 0 inf])
axis([0 12 0 12300])
xlabel( 'Traffic Demands' )  %   s为字符串
ylabel( 'Energy Consumption(W)' )  %   s为字符串
