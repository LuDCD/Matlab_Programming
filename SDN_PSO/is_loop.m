function flag = is_loop(G)
% �������һ���ڽӾ���G
% �л�·flag=1�� û��·flag=0��

% ��ȡG��ά��
num = length(G);
for k=1:5
    for i=1:num
        % 1.����Ϊ1�Ľڵ�ɾ��������������·
        if sum(G(i,:)) == 1
            for j = 1:num
                if G(i,j)==1
                    G(i,j)=0;
                    G(j,i)=0;
                    break;
                end
            end
        end
    end
end

flag = 0;
for i=1:num
    if sum(G(i,:)) ~= 0
        flag = 1;
        break;
    end
end
% t = G;
% for i = 2:size(G, 1)
%     t = t | (t*G);
% end
%  
% if any(diag(t))
%     flag = 1;
% else
%     flag = 0;
%     
end