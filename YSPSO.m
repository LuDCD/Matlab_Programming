function [xm,fv] = YSPSO(fitness,N,c1,c2,w,M,D)
% YSPSO ��ѹ����������Ⱥ�Ż�����������Ҫ����ѧϰ����c1��c2������
% ���ø�ʽ��[xm,fv] = YSPSO(fitness,N,c1,c2,w,M,D)
% fitness:���Ż���Ŀ�꺯����
% N:������Ŀ�� 
% c1:ѧϰ����1��
% c2��ѧϰ����2��
% w������Ȩ�أ�
% M��������������
% D:�Ա����ĸ�����
% xm��Ŀ�꺯��ȡ��Сֵʱ���Ա�����ֵ��
% fv��Ŀ�꺯������Сֵ��

phi = c1 + c2;
if phi <= 4
    disp('c1��c2�ĺͱ������4��');
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
pg = x(N,:);    %pgΪȫ������
for i = 1:(N-1)
    if fitness(x(i,:)) < fitness(pg)
        pg = x(i,:);
    end
end
%���϶����ڳ�ʼ���������������濪ʼ�ɻ�

for t = 1:M
    for i = 1:N    
        ksi = 2/abs(2 - phi -sqrt(phi^2 - 4*phi));   %ksiѹ������
        v(i,:) = w*v(i,:) + c1*rand*(y(i,:)-x(i,:)) + c2*rand*(pg-x(i,:));
        v(i,:) = ksi*v(i,:);    %Ҳ������ԭPSO�Ļ����ϸ���������v(i,:)ѹ��һ��
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

%   �����Զ�ѧϰ���������£��硰ͬ���仯��ѧϰ���ӡ����첽�仯��ѧϰ���ӡ�