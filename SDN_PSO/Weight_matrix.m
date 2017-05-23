function W = Weight_matrix(G,Del,Bf,Bl,theta,AvgDel,d)
% �������ܣ��������·���˵�Ȩ��
% theta,AvgDel,Ble,Bfe,Bld��link_fitness()����
% link_fitness()��Ҫ��Deleͨ��Del(i,j)��
% G����ʾ��·����
% Del:������ÿ����·����ʱ��N��N���ڽӾ���
% Bf:������ÿ����·�ܴ���
% Bl:������ÿ����·��ʣ�����
% W������õ���Ȩ�ؾ���
% theta:��,����������·������
% ��ȡg��ά��
D = length(G);

W = zeros(D);

% ����Ȩ�ؾ���W
for i=1:D
    for j=i+1:D
        if G(i,j) == 1
            t = link_fitness(theta,AvgDel,Del(i,j),Bl(i,j),Bf(i,j),d);
% t = 1;
            if t == 0
                W(i,j) = Inf;
            else
                W(i,j) = t;
            end
        else
            W(i,j) = Inf;
        end
    end
end

W = ad_mat_inversion(W);

end