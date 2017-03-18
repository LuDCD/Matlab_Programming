function [S,Q] = connected(G)
% function S = connected(G)
% 判断G中含有几个通路域
% S表示连通路的个数
% Q表示没懂
n = size(G,1);   %n是列数

m=sum(sum(G))/2;    %求出边数m
S=0;
j=1;
C=1;

Q=zeros(n,1); %定义Q为一个n行的列，便于储存每个块
for i=1:n
    for j=(i+1):n
        if G(i,j)==1%两者之间有边?
            if Q(i)==Q(j)%若两者之间有边，则属于同一块
                if Q(i)==0
                    Q(i) = C;
                    Q(j) = C;
                    C = C+1;
                    S = S+1;
                end
             else

            if Q(i)==0  %若为标记i，则与j在同一块
                Q(i) = Q(j);
            elseif Q(j)==0  %若为标记j,则与i在同一块
                Q(j)= Q(i);
            else    %若两者相连，但标记为不同的块，则进行块合并
                for k =1:n
                    if Q(k)==Q(i)
                        Q(k)=Q(j);%将两块合并
                    end
                end
            S=S-1;%?块合并，向标号小的块合并
            end
            end
        end
    end
end
% S;
% Q;
end

%{
测试用例，G为5个节点的图，2-4通，1-3-5通
clc;clear;
G = zeros(5);
% G(1,2)=1;
G(1,3)=1;
G(2,4)=1;
G(3,5)=1;
G = ad_mat_inversion(G);
S = connected(G)
%}