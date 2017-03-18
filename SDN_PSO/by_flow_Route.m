function [G,Bl] = by_flow_Route(Bf,Bl,F,AvgDel,Del,G,theta)
% Bf:拓扑中每条链路总带宽
% Bl:拓扑中每条链路剩余的带宽
% F:所有流量需求的需求矩阵。为k个需求的k×4矩阵。
% AvgDel:代表整个网络的平均延迟
% Del:拓扑中每条链路的延时，N×N，邻接矩阵
% G：为待处理的子图
% theta:θ,允许的最大链路利用率
% 返回值g为更新（删除没被任何需求使用的链路）后的路由

% 需求个数
[k,ww] = size(F);

% 计算链路矩阵G的维数
num = length(G);

% 标记哪些路被用了
flag_path = zeros(num);

% 为k个需求选路
for i=1:k
%     [s,t,d,QoS] = F(i,:);
    s = F(i,1);
    t = F(i,2);
    d = F(i,3);
    W = Weight_matrix(G,Del,Bf,Bl,theta,AvgDel,d);
% W = G;
    [distance,path] = mydijkstra(W,s,t);
    % 标记选用的路径 和 剩余的链路带宽
    path_num = length(path);
    for j=1:path_num-1
        flag_path(path(j),path(j+1))=1;
        Bl(path(j),path(j+1)) = Bl(path(j),path(j+1))-d;
    end
end

% 剪枝（删除没被任何需求使用的链路）
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
Bf:拓扑中每条链路总带宽
Bl:拓扑中每条链路剩余的带宽
F:所有流量需求的需求矩阵。为k个需求的k×4矩阵。
AvgDel:代表整个网络的平均延迟
Del:拓扑中每条链路的延时，N×N，邻接矩阵
G：为待处理的子图
theta:θ,允许的最大链路利用率
返回值g为更新（删除没被任何需求使用的链路）后的路由
load('Bf.mat');
load('F.mat');
load('AvgDel.mat');
load('Del.mat');
load('G.mat');
load('theta.mat');
by_flow_Route(Bf,Bf,F,AvgDel,Del,G,theta)
%}
