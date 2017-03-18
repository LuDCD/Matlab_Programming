function [xm,fv] = PSO_SDN(G,F,Bf,AvgDel,Del,theta,rho,N,c1,r1,c2,r2,w,M)
% PSO_SDN 基本粒子群优化函数
% 一个粒子是一个由 N×N 的邻接矩阵表示的子图。
% 调用格式：[xm,fv] = PSO_SDN(fitness,N,c1,c2,M,D)
% fitness:待优化的目标函数(能耗)
% G:原始拓扑
% F:所有流量需求的需求矩阵。为k个需求的k×4矩阵。
%       第i行，即为第i个需求，这一行依次
%       源节点si、目标节点ti、流量大小di、QoSi-选时延为代表
% Bf:拓扑中每条链路总带宽。N×N,邻接矩阵
% AvgDel:代表整个网络的平均延迟
% Del:拓扑中每条链路的延时，N×N,邻接矩阵
% theta:θ,允许的最大链路利用率
% rho:ρ，一个阈值，用来控制合并后新子图的密集程度
% N:粒子数目； 
% c1:学习因子1；
% c2：学习因子2；
% w：惯性权重；
% M：最大迭代次数；
% D:自变量的个数(拓扑中节点的总数)；
% xm：目标函数取最小值时的自变量的值(最优子图Ggb)；
% fv：目标函数的最小值(最小能耗)；

format long;    % 设置输出格式

% 源节点和目标节点的集合st。
st = unique([F(:,1),F(:,2)]);

% ----------------------初始化------------------
%   粒子群（三维向量H）N个粒子
%   记录每个粒子的当前最优值的向量 p(i)
%   记录当前全局最优值的的变量 pg
%   存放粒子i自己找到的最好位置的向量M

beta = sum((G(:)))/4; % 现有链路数的一半


% 使用init_particle_PSO_SDN()函数初始化N个粒子
for i=1:N
    H(:,:,i) = init_particle_PSO_SDN(G,st,beta);
    save H H;
    % init_particle_PSO_SDN(G,st,beta) 返回的是处理过的和G一样大的矩阵
end
%----------------------初始化 结束------------------

% 链路剩余流量矩阵
Bl = Bf;
% 根据所有的k个流量需求来进一步处理粒子（Step2）
for i=1:N
%     a1 = H(:,:,i)
    [H(:,:,i),Bl] = by_flow_Route(Bf,Bl,F,AvgDel,Del,H(:,:,i),theta);
%     a2 = H(:,:,i)
%     H(:,:,i) 问题出在这！
end

% 计算粒子的适应度
for i=1:N
    p(i) = graph_fitness(H(:,:,i),Del);
    % 存放每个粒子目前的最优能耗
end

Y = H;% 用来存放每个粒子找到的最好位置（解=子图）
[min_power,num]=min(p);
best_graph = H(:,:,num);

% -------------更新粒子群--------------
for k=1:M
    for i=1:N
        H(:,:,i) = update_particle(rho,w,H(:,:,i),c1,r1,Y(:,:,i),c2,r2,best_graph);
        [H(:,:,i),Bl] = by_flow_Route(Bf,Bl,F,AvgDel,Del,H(:,:,i),theta);
        t = graph_fitness(H(:,:,i),Del);
        if t<p(i)
            p(i) = t;
            Y(:,:,i) = H(:,:,i);
        end
        
        min_power = graph_fitness(best_graph,Del);
        if p(i)<min_power
            best_graph = Y(:,:,i);
        end            
    end
end

xm = best_graph;
fv = graph_fitness(best_graph,Del);
end