function [S,Q] = connected(G)
% function S = connected(G)
% �ж�G�к��м���ͨ·��
% S��ʾ��ͨ·�ĸ���
% Q��ʾû��
n = size(G,1);   %n������

m=sum(sum(G))/2;    %�������m
S=0;
j=1;
C=1;

Q=zeros(n,1); %����QΪһ��n�е��У����ڴ���ÿ����
for i=1:n
    for j=(i+1):n
        if G(i,j)==1%����֮���б�?
            if Q(i)==Q(j)%������֮���бߣ�������ͬһ��
                if Q(i)==0
                    Q(i) = C;
                    Q(j) = C;
                    C = C+1;
                    S = S+1;
                end
             else

            if Q(i)==0  %��Ϊ���i������j��ͬһ��
                Q(i) = Q(j);
            elseif Q(j)==0  %��Ϊ���j,����i��ͬһ��
                Q(j)= Q(i);
            else    %�����������������Ϊ��ͬ�Ŀ飬����п�ϲ�
                for k =1:n
                    if Q(k)==Q(i)
                        Q(k)=Q(j);%������ϲ�
                    end
                end
            S=S-1;%?��ϲ�������С�Ŀ�ϲ�
            end
            end
        end
    end
end
% S;
% Q;
end

%{
����������GΪ5���ڵ��ͼ��2-4ͨ��1-3-5ͨ
clc;clear;
G = zeros(5);
% G(1,2)=1;
G(1,3)=1;
G(2,4)=1;
G(3,5)=1;
G = ad_mat_inversion(G);
S = connected(G)
%}