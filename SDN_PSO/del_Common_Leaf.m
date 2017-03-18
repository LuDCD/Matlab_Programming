function newG = del_Common_Leaf(G,sd)
% 删除图G中非源节点和目标节点的终端节点（叶子节点）
% sd:源节点和目标节点的集合。
% 这里操作的邻接矩阵G是整个矩阵，务必保证邻接矩阵的完整性。

% 获取G的维数
num = length(G);

% 删除合适的链路(i,j)
M = 2*num;
for k=1:M   % 扫描整个拓扑M遍
    for i=1:num % 遍历所有节点
        if any(i==sd)==0  % 在不是源节点和目标节点的前提下，进行操作
            % 删除与 度为1的节点 相连的链路
            if sum(G(i,:)) == 1 % 找到了度为1的节点i
                for j = 1:num % 删除与节点i相连的那个节点
                    if G(i,j)==1 % 这条链路符合条件(是链路G(i,j)=1)&& any(j==sd)==0 
                        G(i,j)=0;   % 删除
                        G(j,i)=0;
                        break;  % 因为这个节点度为1，所以删除一个后就可以停下来了
                    end
                end
            end
        end
    end
end
newG = G;
end

%{
测试用例(结果没问题)
G = zeros(5);
G(1,2)=1;
G(1,5)=1;
G(2,4)=1;
G(3,4)=1;
G = ad_mat_inversion(G);
sd = [1,5];
del_Common_Leaf(G,sd)
%}