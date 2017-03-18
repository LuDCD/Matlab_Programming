function [xm,fv] = R_sum(fitness,N,c1,c2,w,M,D)
% PSO 基本粒子群优化函数
% 调用格式：[xm,fv] = R_sum(fitness,N,c1,c2,M,D)
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
for i = 1:N
    for j = 1:D
        x(i,j) =  round( rand );   % 要明白粒子群中一共有N个粒子，
        v(i,j) = rand ;         % x(i,j),v(i,j）中，i表示是粒子i; j表示粒子i的第j个变量
    end
end
for i = 1:N
    p(i) = fitness( x(i,:) );   % p(i),用来存放第i个粒子找到的最好适应值
    y(i,:) = x(i,:);            % y(i,:),用来存放粒子i自己找到的最好位置
end
pg = x(N,:);    % pg为全局最优
for i = 1:(N-1)
    if fitness( x(i,:) ) < fitness( pg )
        pg = x(i,:);
    end
end
for t = 1:M
    for i = 1:N    %速度、位移更新
        v(i,:) = w*v(i,:) + c1*rand*( y(i,:)-x(i,:) ) + c2*rand*( pg-x(i,:) );% 自己的+自己以前找到好的+全局最好的
        x(i,:) = x(i,:) + v(i,:);
        
        % 增加一个对长度为D的数组x,v的01化操作
        % 对数组x 01话操作
        max_x = x(i,1);
        for k = 1:D
            if max_x < x(i,k)
                max_x = x(i,k);
            end
        end
        for k = 1:D
            x(i,k) = x(i,k)/max_x ;
            if x(i,k) > 0.5
                x(i,k) = round( x(i,k) );
            else
                x(i,k) = 0;
            end
        end
%         
%         % 对数组v 01话操作
%         max_vi = v(i,1);
%         for k = 1:D
%             if max_vi < v(i,k)
%                 max_vi = v(i,k);
%             end
%         end
%         for k = 1:D
%             v(i,k) = v(i,k)/max_vi ;
%             if v(i,k) > 0
%                 v(i,k) = round( v(i,k) );
%             else
%                 v(i,k) = 0;
%             end
%         end
        
        if fitness( x(i,:) ) < p(i)
            p(i) = fitness( x(i,:) );
            y(i,:) = x(i,:);
        end
        if p(i) < fitness( pg )%如果新找到的 p(i) 还优于目前全局最优，则更新之
            pg = y(i,:);
        end
    end
end
xm = pg';
fv = -fitness( pg );    % 再取负，得最大值。

