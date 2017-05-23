function newg = del_link(g,sd)
% ɾ��ͼg�з�ֱ������s-d��һ����·
% ���ǲ��������ڽӾ�������沿��
% sd:Դ�ڵ��Ŀ��ڵ�ļ��ϡ�

% ��ȡg��ά��
D = length(g);

% ����ͼ��·�Ķ���ѡ��ɾ·�㷨
% D���ڵ�һ�������D*(D-1)/2��·
MaxLink = D*(D-1)/2;

% ����·������
numLink = sum((g(:)))/2;

if numLink < MaxLink/2  % ����߱Ƚ��ٵĻ����������ѡ·��ѡ���е�·
    for i=1:D
        if any(i==sd)==0  %i�Ȳ���Դ�ڵ�Ҳ����Ŀ��ڵ�
            for j=i:D 
                if g(i,j)==1 && any(j==sd)==0    % ������·����
                    g(i,j)=0;
                end
            end
        end
    end
else % ���ѡ·
    t = randperm(D); % ���ɾ������·t(1)-t(2)
    t = sort(t(1:2));   % ���ǲ��������ڽӾ�������沿��
    if g(t(1),t(2))==1 % ɾ������·��g(i,j)=1������
        if any(t(1)==sd)==0 && any(t(2)==sd)==0 % �κ�һ�˶�������Դ�ڵ��Ŀ��ڵ�
            g(t(1),t(2)) = 0;   % ��ɾ�����ж��Ƿ���ͨ
            if connected(g) ~= 1    % �������ͨ
                g(t(1),t(2)) = 1;   % ·����
            end
    %             if g(t(1),t(2))==0  %ȷʵ��ɾ��
    %                 DeleCont = DeleCont+1; % DeleCont����1
    %             end
        end
    end
end

% �����ڽӾ�����°벿��
g = ad_mat_inversion(g);

newg = g;
end