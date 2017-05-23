function [xm,fv] = LinWPSO(fitness,N,c1,c2,wmax,wmin,M,D)
% LinWPSO ���Եݼ�Ȩ������Ⱥ�Ż�����������Ҫ�Ƕ�Ȩ��w������
% ʹ�� w = wmax - (t-1)*(wmax-wmin)/(M-1)
% ���ø�ʽ��[xm,fv] = LinWPSO(fitness,N,c1,c2,M,D)
% fitness:���Ż���Ŀ�꺯����
% N:������Ŀ�� 
% c1:ѧϰ����1��
% c2��ѧϰ����2��
% wmax��wmin�������СȨ��
% M��������������
% D:�Ա����ĸ�����
% xm��Ŀ�꺯��ȡ��Сֵʱ���Ա�����ֵ��
% fv��Ŀ�꺯������Сֵ��

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
pg = x(N,:);    %pgΪȫ�����ţ���ʼ��Ϊx(N,:)��ֵ
for i = 1:(N-1)
    if fitness(x(i,:)) < fitness(pg)
        pg = x(i,:);
    end
end
%���϶����ڳ�ʼ���������������濪ʼ�ɻ�

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
%   ����Ȩ�ػ����������£����硰����ӦȨ������Ⱥ�㷨�������Ȩ�ط���
%   1������ӦȨ������Ⱥ�㷨��p283-285
%   2�����Ȩ�ط���p286-288
%   ���顿��ͨMATLAB ���Ż�����   �����������ֱ࣬���ӹ�ҵ������
