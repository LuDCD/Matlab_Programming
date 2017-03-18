function g = ad_mat_inversion(G)
% 用主对角线上面的补全邻接矩阵
% 邻接矩阵翻转 Adjacency Matrix inversion

% 获取G的维数
num = length(G);

% 动手
for i=1:num
    G(i,i) = 0;
    for j=i+1:num
        G(j,i) = G(i,j);
    end
end
g = G;
end
% 已测试，没问题 
% 测试用例：ad_mat_inversion(rand(5))