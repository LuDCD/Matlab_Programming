clc;clear;
% ���У�hatchfill()�����Ĳ����ֱ�Ϊ��
% par1�������
% par2������ʽ��'single'��  single line;
%                'cross'��   double cross;
%               'speckle'������������
% par3����״�����б�ȣ�����߶�Ӧ180�ȣ����߶�Ӧ0�ȣ�
% par4�������֮��ļ�ࣻ
% par5����ɫ

load('energy.mat')
h=bar(energy,1);  
hp = findobj(h,'type','patch');   
hatchfill(hp(1),'cross',45,4,'r');  
hatchfill(hp(2),'single',180,3,'w');  
hatchfill(hp(3),'single',135,4,'g');  

set(gca,'FontSize',12);  
% ����X��ļǺ�
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
xlabel( 'Traffic Demands' )  %   sΪ�ַ���
ylabel( 'Energy Consumption(W)' )  %   sΪ�ַ���
