%% 1 (1)-(5)
% Ctrl+Enter运行小块
% 可以分小节，按 CTRL+ENTER 可以分小节运行
clc;clear;
a1 = (3+5+8)/5*10;

a2 = sin(3*pi)/sqrt(9/5);

A3 = [1 2 3; 4 5 6; 7 8 9];
B3 = [7 8 9; 4 5 6; 1 2 3];
C3 = A3*B3;    D3 = A3+B3;    E3 = A3\C3;    F3 = C3/B3;

A4 = [3 1.2 4; 7.5 6.6 3.1; 5.4 3.4 6.1];
B4 = A4';   %转置
C4 = A4^-1; %或者inv(A).inv是英语单词inverse(逆向)的缩写。
D4 = det(A4);    % det是英文单词determinant（行列式）的缩写。

Z = [1+2i 3+4i;5+6i 7+8i];

%% 2
clc;clear;
K = 5;  % 矩阵的大小
for i = 1:K
    for j = 1:K
        A(i,j) = i+j-1;
    end
end

% 水平翻转
for i = 1:K
    for j = 1:K
        B(K+1-i,j) = A(i,j);
    end
end

% 垂直翻转
for i = 1:K
    for j = 1:K
        C(i,K+1-j) = A(i,j);
    end
end

% A,B,C

D = A;
% 把前三行，迁三列搞为零
for i = 1:3
    for j = 1:K
        D(i,j) = 0;
    end
end

for i = 1:K
    for j = 1:3
        D(i,j) = 0;
    end
end
    

%fprintf('及格人数为%i人\n', i);

%% 3
clc;clear;
A = 0+(225-0)*rand(5);  % 生成0-225的随机数
B = A;

for i = 1:5
    for j = 1:5
        if A(i,j) >= 128
            A(i,j) = 225;
        else
            A(i,j) = 0;
        end
    end
end

%% 4
clc;clear;
u = 0.1; % 精度

% 搜索区间[a,b]
a = 0;  b = 3;

while( 1 )
    t1 = a + 0.382*(b-a);
    t2 = a + 0.618*(b-a);
   
    % t*t*t-2*t+1
    if t1*t1*t1-2*t1+1 <= t2*t2*t2-2*t2+1
        if t2-a <= u
            t=t1;
            return;
        else
            b = t2;
        end
        
    else
        if b-t1 <= u
            t=t2;
            return;
        else
            a = t1;
        end
    end
end
%% 5
clc;clear;
N = 12;
M = 10;
%{
NUM = 800; % 抽样的个数
n = linspace(0,2*N-1,NUM); % 生成a-b的等间隔的数组，数组个数为NUM.
for i=1:NUM
    x(i) = sin(2*pi*M*n(i)/N);
end
%}
NUM = 200;
u = ( 2*N-1 - 0 )/NUM;
n = 0:u:2*N-1;
x = sin(2*pi*M*n/N);

% plot(n,x);
stem(n,x);
title( 'M = 7' ); %书写图名
xlabel('n');
ylabel('x[n]');
% hold on;  % 让两个图同时出现在一个坐标系里面，用"hold on"命令

%% 6
% test1_5.slx

