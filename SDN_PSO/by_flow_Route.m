function [G,Bl] = by_flow_Route(Bf,Bl,F,AvgDel,Del,G,theta)
% Bf:������ÿ����·�ܴ���
% Bl:������ÿ����·ʣ��Ĵ���
% F:��������������������Ϊk�������k��4����
% AvgDel:�������������ƽ���ӳ�
% Del:������ÿ����·����ʱ��N��N���ڽӾ���
% G��Ϊ���������ͼ
% theta:��,����������·������
% ����ֵgΪ���£�ɾ��û���κ�����ʹ�õ���·�����·��

% �������
[k,ww] = size(F);

% ������·����G��ά��
num = length(G);

% �����Щ·������
flag_path = zeros(num);

% Ϊk������ѡ·
for i=1:k
%     [s,t,d,QoS] = F(i,:);
    s = F(i,1);
    t = F(i,2);
    d = F(i,3);
    W = Weight_matrix(G,Del,Bf,Bl,theta,AvgDel,d);
% W = G;
    [distance,path] = mydijkstra(W,s,t);
    % ���ѡ�õ�·�� �� ʣ�����·����
    path_num = length(path);
    for j=1:path_num-1
        flag_path(path(j),path(j+1))=1;
        Bl(path(j),path(j+1)) = Bl(path(j),path(j+1))-d;
    end
end

% ��֦��ɾ��û���κ�����ʹ�õ���·��
for i=1:num
    for j=i+1:num
        if G(i,j)~=0
            if flag_path(i,j)~=1
                 G(i,j) = 0;
            end
        end
    end
end

% g = ad_mat_inversion(flag_path);
G = ad_mat_inversion(G);
% flag_path;
save W W;

end

%{
function [g,Bl] = by_flow_Route(Bf,Bl,F,AvgDel,Del,G,theta)
Bf:������ÿ����·�ܴ���
Bl:������ÿ����·ʣ��Ĵ���
F:��������������������Ϊk�������k��4����
AvgDel:�������������ƽ���ӳ�
Del:������ÿ����·����ʱ��N��N���ڽӾ���
G��Ϊ���������ͼ
theta:��,����������·������
����ֵgΪ���£�ɾ��û���κ�����ʹ�õ���·�����·��
load('Bf.mat');
load('F.mat');
load('AvgDel.mat');
load('Del.mat');
load('G.mat');
load('theta.mat');
by_flow_Route(Bf,Bf,F,AvgDel,Del,G,theta)
%}
