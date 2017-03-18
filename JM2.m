function [xm,fv] = JM2(fitness,N,c1,c2,w,M,D)
% PSO 基本粒子群优化函数
% 调用格式：[xm,fv] = YSPSO(fitness,N,c1,c2,M,D)
% fitness:待优化的目标函数；
% N:粒子数目； 
% c1:学习因子1；
% c2：学习因子2；
% w：惯性权重；
% M：最大迭代次数；
% D:自变量的个数；
% xm：目标函数取最小值时的自变量的值；
% fv：目标函数的最小值；

format long;
% 粒子初始化
for i = 1:N
    for j = 1:D
%         x(i,j) = randn; % 要明白粒子群中一共有N个粒子，x(i,j),v(i,j）中
        if j == 1
            x(i,j) = 0+(2-(0))*rand(1,1);
        else
            x(i,j) = (-1+(1-(-1))*rand(1,1))*100+1200;
        end
        v(i,j) = randn; % i表示哪个粒子，j表示粒子i的第j个变量
%         v(i,j) = (-1+(1-(-1))*rand(1,1))*100+1000;
    end
end

for i = 1:N
    p(i) = fitness(x(i,:)); % p(i),用来存放第i个粒子找到的最好适应值
    y(i,:) = x(i,:);    % y(i,:),用来存放粒子i自己找到的最好位置
end
pg = x(N,:);    %pg为全局最优
for i = 1:(N-1)
    if fitness(x(i,:)) < fitness(pg)
        pg = x(i,:);
    end
end
for t = 1:M
    for i = 1:N    %速度、位移更新
        v(i,:) = w*v(i,:) + c1*rand*(y(i,:)-x(i,:)) + c2*rand*(pg-x(i,:));
        x(i,:) = x(i,:) + v(i,:);
        if fitness(x(i,:)) < p(i)
            p(i) = fitness(x(i,:));
            y(i,:) = x(i,:);
        end
        if p(i) < fitness(pg)
            pg = y(i,:);
        end
%         plot3(p,x(:,1),x(:,2));
%         hold on;
    end
    %Pbest(t) = fitness(pg);
end
xm = pg';
fv = fitness(pg);