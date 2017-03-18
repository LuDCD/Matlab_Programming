function flag = is_loop(G)
% 传入的是一个邻接矩阵G
% 有环路flag=1； 没环路flag=0；

% 获取G的维数
num = length(G);
for k=1:5
    for i=1:num
        % 1.将度为1的节点删除与其相连的链路
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