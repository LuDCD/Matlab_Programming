function newg = del_link(g,sd)
% 删除图g中非直接连接s-d的一条链路
% 我们操作的是邻接矩阵的上面部分
% sd:源节点和目标节点的集合。

% 获取g的维数
D = length(g);

% 根据图中路的多少选择删路算法
% D个节点一共最多有D*(D-1)/2条路
MaxLink = D*(D-1)/2;

% 计算路的条数
numLink = sum((g(:)))/2;

if numLink < MaxLink/2  % 如果边比较少的话，不再随机选路，选择有的路
    for i=1:D
        if any(i==sd)==0  %i既不是源节点也不是目标节点
            for j=i:D 
                if g(i,j)==1 && any(j==sd)==0    % 这条链路存在
                    g(i,j)=0;
                end
            end
        end
    end
else % 随机选路
    t = randperm(D); % 随机删除的链路t(1)-t(2)
    t = sort(t(1:2));   % 我们操作的是邻接矩阵的上面部分
    if g(t(1),t(2))==1 % 删除的链路（g(i,j)=1）存在
        if any(t(1)==sd)==0 && any(t(2)==sd)==0 % 任何一端都不能是源节点和目标节点
            g(t(1),t(2)) = 0;   % 先删，再判断是否连通
            if connected(g) ~= 1    % 如果不连通
                g(t(1),t(2)) = 1;   % 路补上
            end
    %             if g(t(1),t(2))==0  %确实被删了
    %                 DeleCont = DeleCont+1; % DeleCont增加1
    %             end
        end
    end
end

% 更新邻接矩阵的下半部分
g = ad_mat_inversion(g);

newg = g;
end