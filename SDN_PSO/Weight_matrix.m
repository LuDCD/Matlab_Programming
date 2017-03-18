function W = Weight_matrix(G,Del,Bf,Bl,theta,AvgDel,d)
% 函数功能：计算出链路拓扑的权重
% theta,AvgDel,Ble,Bfe,Bld给link_fitness()函数
% link_fitness()需要地Dele通过Del(i,j)给
% G：表示链路矩阵
% Del:拓扑中每条链路的延时，N×N，邻接矩阵
% Bf:拓扑中每条链路总带宽
% Bl:拓扑中每条链路的剩余带宽
% W：计算得到的权重矩阵
% theta:θ,允许的最大链路利用率
% 获取g的维数
D = length(G);

W = zeros(D);

% 计算权重矩阵W
for i=1:D
    for j=i+1:D
        if G(i,j) == 1
            t = link_fitness(theta,AvgDel,Del(i,j),Bl(i,j),Bf(i,j),d);
% t = 1;
            if t == 0
                W(i,j) = Inf;
            else
                W(i,j) = t;
            end
        else
            W(i,j) = Inf;
        end
    end
end

W = ad_mat_inversion(W);

end