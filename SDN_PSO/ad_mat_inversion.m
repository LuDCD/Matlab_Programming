function g = ad_mat_inversion(G)
% �����Խ�������Ĳ�ȫ�ڽӾ���
% �ڽӾ���ת Adjacency Matrix inversion

% ��ȡG��ά��
num = length(G);

% ����
for i=1:num
    G(i,i) = 0;
    for j=i+1:num
        G(j,i) = G(i,j);
    end
end
g = G;
end
% �Ѳ��ԣ�û���� 
% ����������ad_mat_inversion(rand(5))