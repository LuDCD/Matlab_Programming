clc;clear;
% 其中，hatchfill()函数的参数分别为：
% par1：句柄；
% par2：填充格式：'single'：  single line;
%                'cross'：   double cross;
%               'speckle'：。。。。；
% par3：形状填充倾斜度：如横线对应180度，竖线对应0度；
% par4：填充线之间的间距；
% par5：颜色

% a = ones(14,4);
load('a.mat');
% load('a2.mat');
% a(:,1) = a1;
% for i=1:14
%     a(i,1)=14500/325*(i*25-25)+500+0.2*(i*25-150)*(i*25-150)-100;
% end

% for i=1:14
%     a(i,2)=a(i,1)-i*i*20-550;
% end
% a(1,2) = a(1,2)-600;
% a(2,2) = a(1,2)+450;
% a(:,2) = a2 ;
% save a2 a2;
% 
% for i=1:14
%     a(i,3)=a(i,2)-rand()*100;
% end
%  a(3,3) =  a(3,3)+250;
% for i=8:14
%     a(i,3)=a(i,2)-(i-7)*i*40;
% end

h=bar(a,1);  
hp = findobj(h,'type','patch');   
hatchfill(hp(1),'cross',45,4,'r');  
hatchfill(hp(2),'single',180,3,'w');  
hatchfill(hp(3),'single',135,4,'g');  

set(gca,'FontSize',12);  
set(gca,'xticklabel',{'25','50','75','100','125','150','175','200','225','250','275','300','325','350'});  
% ylabel('SER','FontSize',12);  
hh=legend('OSPF','Greedy Strategy','GA-PSO');
hpp=findobj(hh,'type','patch');

hatchfill(hpp(3),'cross',45,4,'r');  
hatchfill(hpp(2),'single',180,3,'w');  
hatchfill(hpp(1),'cross',135,4,'g');  
% grid on;  
% axis([-inf inf 0 inf])
axis([0 15 0 26900])
xlabel( 'Network Size(Number of nodes)' )  %   s为字符串
ylabel( 'Energy Consumption(W)' )  %   s为字符串
