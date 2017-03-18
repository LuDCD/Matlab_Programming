function g = init_particle_PSO_SDN(G,sd,beta)
% g 为返回值，是一个D×D的邻接矩阵(一个粒子,由原始拓扑进化而来，不改变其连通性)
% G是原始拓扑
% 我们操作的是邻接矩阵的上面部分,操作完了之后更新下半部分，
% 凡是操作了矩阵的上半部分的函数，在操作完成之后就更新下半部分
% s为源节点集合
% d为目标节点集合 si<di
% sd：源节点和目标节点的集合sd
% 完成初始化函数里的各种操作

% 获取方阵G的维数
D = length(G);

% 停止策略
    % 1、已删除链路数大于beta。(delCont计数)
    % 2、连续delNUM次没删除失败（连着源节点 或者目标节点 或者破坏连通性）。

% 记录已经删除的链路数
delCont = 0;
% 记录删除失败的次数
delFail = 0;
delNUM = 100;

while delCont<beta && delFail<delNUM
    % 随机删除一条已经存在的链路，我们转化为随机选点，再删边
    % 随机选点m。R = unidrnd(N)：产生一个最大值为N的随机正整数R，R为1到N之间
    m = unidrnd(D);
    % any(x==a)：如果x中有一个或多个数值为a,则返回1;否则返回0.
    if any(m==sd)==0 % 这个点不在sd中
        for i=unidrnd(D):D % 排查与m相连的链路，unidrnd(D)增加随机性
            if G(m,i)==1 && any(i==sd)==0 % 与点m相连，且不再sd中
                G(m,i)=0;
                G(i,m)=0;
                delCont = delCont+1;
                if connected(G) ~= 1    % 如果边m-i删除破坏连通性，则取消删除
                    G(m,i)=1;
                    G(i,m)=1;
                    delFail = delFail+1;
                    delCont = delCont-1;
                end
            else
                if any(i==sd)
                     delFail = delFail+1;
                end
            end 
        end
    else
        delFail = delFail+1;
    end
end

% G = ad_mat_inversion(G);

% 删除非源节点和目标节点的终端节点（叶子节点）
for i=1:D
    G = del_Common_Leaf(G,sd);
end

g = G;
% 测试：去掉分号，输出感觉没问题。

end
