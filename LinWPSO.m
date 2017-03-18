function [xm,fv] = LinWPSO(fitness,N,c1,c2,wmax,wmin,M,D)
% LinWPSO 线性递减权重粒子群优化函数——主要是对权重w做文章
% 使得 w = wmax - (t-1)*(wmax-wmin)/(M-1)
% 调用格式：[xm,fv] = LinWPSO(fitness,N,c1,c2,M,D)
% fitness:待优化的目标函数；
% N:粒子数目； 
% c1:学习因子1；
% c2：学习因子2；
% wmax、wmin：最大、最小权重
% M：最大迭代次数；
% D:自变量的个数；
% xm：目标函数取最小值时的自变量的值；
% fv：目标函数的最小值；

format long;
for i = 1:N
    for j = 1:D
        x(i,j) = randn;
        v(i,j) = randn;
    end
end
for i = 1:N
    p(i) = fitness(x(i,:));
    y(i,:) = x(i,:);
end
pg = x(N,:);    %pg为全局最优，初始化为x(N,:)的值
for i = 1:(N-1)
    if fitness(x(i,:)) < fitness(pg)
        pg = x(i,:);
    end
end
%以上都属于初始化各个变量，下面开始干活

for t = 1:M
    for i = 1:N   
        w = wmax - (t-1)*(wmax-wmin)/(M-1);
        v(i,:) = w*v(i,:) + v(i,:)+c1*rand*(y(i,:)-x(i,:))+c2*rand*(pg-x(i,:));
        x(i,:) = x(i,:) + v(i,:);
        
        if fitness(x(i,:)) < p(i)
            p(i) = fitness(x(i,:));
            y(i,:) = x(i,:);
        end
        if p(i) < fitness(x(i,:))
            pg = y(i,:);
        end
    end
end
xm = pg';
fv = fitness(pg);
%   对于权重还可以做文章，比如“自适应权重粒子群算法”“随机权重法”
%   1、自适应权重粒子群算法。p283-285
%   2、随机权重法。p286-288
%   【书】精通MATLAB 最优化计算   龚纯，王正林编，电子工业出版社
