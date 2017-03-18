function [xm,fv] = SBOGA(fitness,a,b,NP,NG,q,Pc,Pm,eps)
% SBOGA 顺序选择遗传算法
% fitness：待优化的目标函数
% a：自变量下界
% b：自变量上界
% NP：种群个体数
% NG：最大进化代数
% q：最好个体的选择概率
% Pc：杂交概率
% Pm：变异概率
% eps：自变量离散精度
% xm：目标函数取最小值时的自变量值
% fv：目标函数的最小值

L = ceil(log2((b-a)/eps+1));% 根据离散精度，确定二进制编码需要的码长L
x = zeros(NP,L);

for i = 1:NP
    x(i,:) = Initial(L);    % 自定义子函数。种群编码初始化。
    fx(i) = fitness(Dec(a,b,x(i,:),L)); % 自定义子函数。初始化个体适应值。
end

for k =1:NG             % 控制迭代次数。NG：最大进化代数
    
    [sortf,sortx] = sort(fx);   % 适应值排序
    x = x(sortx,:);
    fx = fx(sortx);
    for i = 1:NP                % 固定选择概率
        Px(i) = (1-q)^(NP-i)*q/(1-(1-q)^NP);
    end
   
    PPx = 0;
    PPx(1) = Px(1);
    for j = 2:NP        % 用于轮盘赌策略的概率累加
        PPx(j) = PPx(j-1)+Px(j);
    end
    for i = 1:NP                % NP：种群个体数
        sita = rand();
        SelFather = 1;
        for n = 1:NP
            if sita <= PPx(i)
                SelFather = n;  % 根据轮盘赌策略确定的父亲
                break;          % 退出循环。不是进入下轮循环(continue)。
            end
        end
        Selmother = floor(rand()*(NP-1)) + 1; % 随机选择母亲
        posCut = floor(rand()*(L-2)) + 1;     % 随机确定交叉点
                                              % floor(A),取整
        r1 = rand();
        if r1 <= Pc                           % 交叉。Pc：杂交概率
             % 个体i的基因编码交叉点posCut之前的是他父亲的，之后是他母亲的
            nx(i,1:posCut) = x(SelFather,1:posCut);        
            nx(i,(posCut+1):L) = x(Selmother,(posCut+1):L); 
            r2 = rand();
            if r2 <= Pm                     % 变异。Pm：变异概率
                posMut = round(rand()*(L-1)+1); % 确定变异哪一位
                nx(i,posMut) = ~nx(i,posMut);   % 变异。1变0,0变1
            end
        else
            nx(i,:) = x(SelFather,:);
        end
    end
    x = nx;     % 用经过杂交、变异的newx更新x
    for i = 1:NP
        fx(i) = fitness(Dec(a,b,x(i,:),L)); % 更新适应值向量fx
    end
end

fv = -inf;              % 初始化fv为最小值
for i = 1:NP            % 找完NP个个体。NP：种群个体数
    fitx(i) = fitness(Dec(a,b,x(i,:),L));
    if fitx > fv        % 选个体中最好值作为最终结果。
        fv = fitx;
        xm = Dec(a,b,x(i,:),L);
    end
end

% 一般函数代码中结尾是不需要专门标明“end”的
function result = Initial(length)   % 初始化二进制编码函数，返回的是一个行向量
for i = 1:length
    r = rand();
    result(i) = round(r);   %   round(r),表示对 r 进行四舍五入取整。
                            %            eg.round(-1.800) = -2
end  %  这个“end”是控制for循环的

function y = Dec(a,b,x,L)   % 二进制编码转换为十进制编码函数
% 返回的是一个十进制的数，目的是把二进制编码基因转换为十进制数用来来计算该基因编码的的适应值
base = 2.^((L-1):-1:0);     % 得到一个行向量
y = dot(base,x);            % 向量base乘向量x,得到的是一个数。
y = a+y*(b-a)/(2^L- 1);  