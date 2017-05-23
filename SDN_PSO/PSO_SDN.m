function [xm,fv] = PSO_SDN(G,F,Bf,AvgDel,Del,theta,rho,N,c1,r1,c2,r2,w,M)
% PSO_SDN ��������Ⱥ�Ż�����
% һ��������һ���� N��N ���ڽӾ����ʾ����ͼ��
% ���ø�ʽ��[xm,fv] = PSO_SDN(fitness,N,c1,c2,M,D)
% fitness:���Ż���Ŀ�꺯��(�ܺ�)
% G:ԭʼ����
% F:��������������������Ϊk�������k��4����
%       ��i�У���Ϊ��i��������һ������
%       Դ�ڵ�si��Ŀ��ڵ�ti��������Сdi��QoSi-ѡʱ��Ϊ����
% Bf:������ÿ����·�ܴ���N��N,�ڽӾ���
% AvgDel:�������������ƽ���ӳ�
% Del:������ÿ����·����ʱ��N��N,�ڽӾ���
% theta:��,����������·������
% rho:�ѣ�һ����ֵ���������ƺϲ�������ͼ���ܼ��̶�
% N:������Ŀ�� 
% c1:ѧϰ����1��
% c2��ѧϰ����2��
% w������Ȩ�أ�
% M��������������
% D:�Ա����ĸ���(�����нڵ������)��
% xm��Ŀ�꺯��ȡ��Сֵʱ���Ա�����ֵ(������ͼGgb)��
% fv��Ŀ�꺯������Сֵ(��С�ܺ�)��

format long;    % ���������ʽ

% Դ�ڵ��Ŀ��ڵ�ļ���st��
st = unique([F(:,1),F(:,2)]);

% ----------------------��ʼ��------------------
%   ����Ⱥ����ά����H��N������
%   ��¼ÿ�����ӵĵ�ǰ����ֵ������ p(i)
%   ��¼��ǰȫ������ֵ�ĵı��� pg
%   �������i�Լ��ҵ������λ�õ�����M

beta = sum((G(:)))/4; % ������·����һ��


% ʹ��init_particle_PSO_SDN()������ʼ��N������
for i=1:N
    H(:,:,i) = init_particle_PSO_SDN(G,st,beta);
    save H H;
    % init_particle_PSO_SDN(G,st,beta) ���ص��Ǵ�����ĺ�Gһ����ľ���
end
%----------------------��ʼ�� ����------------------

% ��·ʣ����������
Bl = Bf;
% �������е�k��������������һ���������ӣ�Step2��
for i=1:N
%     a1 = H(:,:,i)
    [H(:,:,i),Bl] = by_flow_Route(Bf,Bl,F,AvgDel,Del,H(:,:,i),theta);
%     a2 = H(:,:,i)
%     H(:,:,i) ��������⣡
end

% �������ӵ���Ӧ��
for i=1:N
    p(i) = graph_fitness(H(:,:,i),Del);
    % ���ÿ������Ŀǰ�������ܺ�
end

Y = H;% �������ÿ�������ҵ������λ�ã���=��ͼ��
[min_power,num]=min(p);
best_graph = H(:,:,num);

% -------------��������Ⱥ--------------
for k=1:M
    for i=1:N
        H(:,:,i) = update_particle(rho,w,H(:,:,i),c1,r1,Y(:,:,i),c2,r2,best_graph);
        [H(:,:,i),Bl] = by_flow_Route(Bf,Bl,F,AvgDel,Del,H(:,:,i),theta);
        t = graph_fitness(H(:,:,i),Del);
        if t<p(i)
            p(i) = t;
            Y(:,:,i) = H(:,:,i);
        end
        
        min_power = graph_fitness(best_graph,Del);
        if p(i)<min_power
            best_graph = Y(:,:,i);
        end            
    end
end

xm = best_graph;
fv = graph_fitness(best_graph,Del);
end