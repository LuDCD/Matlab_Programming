clc;clear;
% ���У�hatchfill()�����Ĳ����ֱ�Ϊ��
% par1�������
% par2������ʽ��'single'��  single line;
%                'cross'��   double cross;
%               'speckle'������������
% par3����״�����б�ȣ�����߶�Ӧ180�ȣ����߶�Ӧ0�ȣ�
% par4�������֮��ļ�ࣻ
% par5����ɫ

load('a.mat');

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
xlabel( 'Network Size(Number of nodes)' )  %   sΪ�ַ���
ylabel( 'Energy Consumption(W)' )  %   sΪ�ַ���
