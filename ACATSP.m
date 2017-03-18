function [R_best,L_best,L_ave,Shortest_Route,Shortest_Length] = ACATSP(C,NC_max,m,Alpha,Beta,Rho,Q)
% ACATSP ��Ⱥ�㷨
% ʹ����Ⱥ�㷨��������
% 1���ܹ���һ��ͼ��������Ҫ���������
% 2���ܹ�����һ������������
% 3�����Ȿ�����ṩ�����õ�����ʽ��Ϣ
% 4���ܹ�����Լ������
% ��Ҫ����˵��
% C��n�����е����꣬n��2�ľ���
% NC_max������������
% m�����ϸ���
% Alpha��������Ϣ����Ҫ�̶ȵĲ���
% Beta����������ʽ������Ҫ�̶ȵĲ���
% Rho����Ϣ������ϵ��
% Q����Ϣ������ǿ��ϵ��
% R_best���������·��
% L_best���������·�ߵĳ���


%��һ����������ʼ��

n=size(C,1);    % n��ʾ����Ĺ�ģ�����и�����
D=zeros(n,n);   % D��ʾ��ȫͼ�ĸ�Ȩ�ڽӾ���.��ȨֵD(i,j)��ʾCi��Cj֮��ľ���

% ��ʼ����ȫͼ�ĸ�Ȩ�ڽӾ���
for i = 1:n
    for j = i:n
        if i ~= j
            D(i,j) = ( (C(i,1)-C(j,1))^2 + (C(i,2)-C(j,2))^2 )^0.5; 
        else
            D(i,j) = eps;   % i=jʱ�����㣬Ӧ��Ϊ0�����������������Ҫȡ��������eps��������Ծ��ȣ���ʾ
        end
        D(j,i) = D(i,j);    % �Գƾ���
    end
end

Eta = 1./D;          % EtaΪ�������ӣ�������Ϊ����ĵ���
Tau = ones(n,n);     % TauΪ��Ϣ�ؾ���
Tabu = zeros(m,n);   % �洢����¼·��������
NC = 1;              % ��������������¼��������
R_best = zeros(NC_max,n);       % �������·��
L_best = inf.*ones(NC_max,1);   % �������·�ߵĳ���
L_ave = zeros(NC_max,1);        % ����·�ߵ�ƽ������

while NC <= NC_max        % ֹͣ����֮һ���ﵽ������������ֹͣ
    
     % �ڶ�������mֻ���Ϸŵ�n��������
     Randpos = [];   % �����ȡ
     for i = 1:( ceil(m/n) )
         Randpos = [Randpos,randperm(n)];% randperm(n),����1��n������е�nά����
     end
     Tabu(:,1) = ( Randpos(1,1:m) )';
     
     %��������mֻ���ϰ����ʺ���ѡ����һ�����У���ɸ��Ե�����
     for j = 2:n     %���ڳ��в�����
         for i = 1:m           
             visited = Tabu( i,1:(j-1) ); %��¼�ѷ��ʵĳ��У������ظ�����     
             J = zeros( 1,(n-j+1) );       %�����ʵĳ���
             P = J;                      %�����ʳ��е�ѡ����ʷֲ�
             Jc = 1;
             for k = 1:n
                 if length( find(visited == k) ) == 0   %��ʼʱ��0
                     J(Jc) = k;
                     Jc = Jc+1;   %���ʵĳ��и����Լ�1
                 end        
             end
             
      %��������ѡ���еĸ��ʷֲ�      
      for k = 1:length(J)
          P(k) = ( Tau(visited(end),J(k))^Alpha )*( Eta(visited(end),J(k))^Beta );
      end
      P = P/(sum(P));
      %������ԭ��ѡȡ��һ������
      Pcum = cumsum(P);     %cumsum��Ԫ���ۼӼ����
      Select = find(Pcum>=rand); %������ĸ��ʴ���ԭ���ľ�ѡ������·��
      to_visit = J(Select(1));
      Tabu(i,j) = to_visit; 
         end   
     end
     if NC >= 2
         Tabu(1,:) = R_best(NC-1,:);
     end
     
     
     %%���Ĳ�����¼���ε������·��
     L = zeros(m,1);     %��ʼ����Ϊ0��m*1��������
     for i = 1:m
         R = Tabu(i,:);
         for j = 1:(n-1)
             L(i) = L(i)+D(R(j),R(j+1));    %ԭ������ϵ�j�����е���j+1�����еľ���
         end  
         L(i) = L(i)+D(R(1),R(n));      %һ���������߹��ľ���
     end    
     L_best(NC) = min(L);           %��Ѿ���ȡ��С
     pos = find(L == L_best(NC));
      
     R_best(NC,:) = Tabu(pos(1),:); %���ֵ���������·��
     L_ave(NC) = mean(L);           %���ֵ������ƽ������
     NC = NC+1                      % ��������
      
     
     % ���岽��������Ϣ��
     Delta_Tau = zeros(n,n);        % ��ʼʱ��Ϣ��Ϊn*n��0����
     for i = 1:m
         for j = 1:(n-1)
             Delta_Tau(Tabu(i,j),Tabu(i,j+1))=Delta_Tau(Tabu(i,j),Tabu(i,j+1))+Q/L(i);  
             % �˴�ѭ����·����i��j���ϵ���Ϣ������
         end       
         Delta_Tau(Tabu(i,n),Tabu(i,1))=Delta_Tau(Tabu(i,n),Tabu(i,1))+Q/L(i);
         % �˴�ѭ��������·���ϵ���Ϣ������
     end  
     Tau = (1-Rho).*Tau+Delta_Tau; % ������Ϣ�ػӷ������º����Ϣ��
     
     
     %�����������ɱ�����
     Tabu = zeros(m,n);             % ֱ������������
end
 
 
 %���߲���������
 Pos=find(L_best == min(L_best)); %�ҵ����·������0Ϊ�棩     
 Shortest_Route = R_best(Pos(1),:) %���������������·��      
 Shortest_Length = L_best(Pos(1)) %��������������̾���      
 subplot(1,2,1)                  %���Ƶ�һ����ͼ��            
 DrawRoute(C,Shortest_Route)     %��·��ͼ���Ӻ���      
 subplot(1,2,2)                  %���Ƶڶ�����ͼ��      
 plot(L_best)      
 hold on                         %����ͼ��     
 plot(L_ave,'r')      
 title('ƽ���������̾���')     % ����
 
 function DrawRoute(C,R)    
% DrawRoute.m
% ��·��ͼ���Ӻ���
% C Coordinate �ڵ����꣬��һ��N��2�ľ���洢
% R Route ·��

N=length(R);
scatter(C(:,1),C(:,2));
hold on
plot([C(R(1),1),C(R(N),1)],[C(R(1),2),C(R(N),2)],'g')
hold on
for j = 2:N
    plot([C(R(j-1),1),C(R(j),1)],[C(R(j-1),2),C(R(j),2)],'g')
    hold on
end
title('�����������Ż���� ')