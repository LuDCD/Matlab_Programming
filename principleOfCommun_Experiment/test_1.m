%% 1 (1)-(5)
% Ctrl+Enter����С��
% ���Է�С�ڣ��� CTRL+ENTER ���Է�С������
clc;clear;
a1 = (3+5+8)/5*10;

a2 = sin(3*pi)/sqrt(9/5);

A3 = [1 2 3; 4 5 6; 7 8 9];
B3 = [7 8 9; 4 5 6; 1 2 3];
C3 = A3*B3;    D3 = A3+B3;    E3 = A3\C3;    F3 = C3/B3;

A4 = [3 1.2 4; 7.5 6.6 3.1; 5.4 3.4 6.1];
B4 = A4';   %ת��
C4 = A4^-1; %����inv(A).inv��Ӣ�ﵥ��inverse(����)����д��
D4 = det(A4);    % det��Ӣ�ĵ���determinant������ʽ������д��

Z = [1+2i 3+4i;5+6i 7+8i];

%% 2
clc;clear;
K = 5;  % ����Ĵ�С
for i = 1:K
    for j = 1:K
        A(i,j) = i+j-1;
    end
end

% ˮƽ��ת
for i = 1:K
    for j = 1:K
        B(K+1-i,j) = A(i,j);
    end
end

% ��ֱ��ת
for i = 1:K
    for j = 1:K
        C(i,K+1-j) = A(i,j);
    end
end

% A,B,C

D = A;
% ��ǰ���У�Ǩ���и�Ϊ��
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
    

%fprintf('��������Ϊ%i��\n', i);

%% 3
clc;clear;
A = 0+(225-0)*rand(5);  % ����0-225�������
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
u = 0.1; % ����

% ��������[a,b]
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
NUM = 800; % �����ĸ���
n = linspace(0,2*N-1,NUM); % ����a-b�ĵȼ�������飬�������ΪNUM.
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
title( 'M = 7' ); %��дͼ��
xlabel('n');
ylabel('x[n]');
% hold on;  % ������ͼͬʱ������һ������ϵ���棬��"hold on"����

%% 6
% test1_5.slx

