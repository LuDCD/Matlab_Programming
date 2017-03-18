function [xm,fv] = YSPSO(fitness,N,c1,c2,w,M,D)
% YSPSO 带压缩因子粒子群优化函数——主要是做学习因子c1、c2的文章
% 调用格式：[xm,fv] = YSPSO(fitness,N,c1,c2,w,M,D)
% fitness:待优化的目标函数；
% N:粒子数目； 
% c1:学习因子1；
% c2：学习因子2；
% w：惯性权重；
% M：最大迭代次数；
% D:自变量的个数；
% xm：目标函数取最小值时的自变量的值；
% fv：目标函数的最小值；

phi = c1 + c2;
if phi <= 4
    disp('c1和c2的和必须大于4！');
    xm = NaN;
    fv = NaN;
    return;
end
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
pg = x(N,:);    %pg为全局最优
for i = 1:(N-1)
    if fitness(x(i,:)) < fitness(pg)
        pg = x(i,:);
    end
end
%以上都属于初始化各个变量，下面开始干活

for t = 1:M
    for i = 1:N    
        ksi = 2/abs(2 - phi -sqrt(phi^2 - 4*phi));   %ksi压缩因子
        v(i,:) = w*v(i,:) + c1*rand*(y(i,:)-x(i,:)) + c2*rand*(pg-x(i,:));
        v(i,:) = ksi*v(i,:);    %也就是在原PSO的基础上给更新算子v(i,:)压缩一下
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

%   还可以对学习因子做文章，如“同步变化的学习因子”“异步变化的学习因子”