function [xm,fv] = PSO(fitness,N,c1,c2,w,M,D)
% PSO ��������Ⱥ�Ż�����
% ���ø�ʽ��[xm,fv] = YSPSO(fitness,N,c1,c2,M,D)
% fitness:���Ż���Ŀ�꺯����
% N:������Ŀ�� 
% c1:ѧϰ����1��
% c2��ѧϰ����2��
% w������Ȩ�أ�
% M��������������
% D:�Ա����ĸ�����
% xm��Ŀ�꺯��ȡ��Сֵʱ���Ա�����ֵ��
% fv��Ŀ�꺯������Сֵ��


format long;

% ----------------��ʼ��----------------
for i = 1:N
    for j = 1:D
        x(i,j) = randn; % Ҫ��������Ⱥ��һ����N�����ӣ�x(i,j),v(i,j����
        v(i,j) = randn; % i��ʾ���ĸ����ӣ�j��ʾ����i�ĵ�j������
    end
end
for i = 1:N
    p(i) = fitness(x(i,:)); % p(i),������ŵ�i�������ҵ��������Ӧֵ
    y(i,:) = x(i,:);    % y(i,:),�����������i�Լ��ҵ������λ��
end
pg = x(N,:);    %pgΪȫ������
for i = 1:(N-1)
    if fitness(x(i,:)) < fitness(pg)
        pg = x(i,:);
    end
end


% ------------------------����-------------------
for t = 1:M
    for i = 1:N    %�ٶȡ�λ�Ƹ���
        v(i,:) = w*v(i,:) + c1*rand*(y(i,:)-x(i,:)) + c2*rand*(pg-x(i,:));
        x(i,:) = x(i,:) + v(i,:);
        if fitness(x(i,:)) < p(i)
            p(i) = fitness(x(i,:));
            y(i,:) = x(i,:);
        end
        if p(i) < fitness(pg)
            pg = y(i,:);
        end
    end
    %Pbest(t) = fitness(pg);
end
xm = pg';
fv = fitness(pg);