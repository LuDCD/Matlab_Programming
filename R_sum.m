function [xm,fv] = R_sum(fitness,N,c1,c2,w,M,D)
% PSO ��������Ⱥ�Ż�����
% ���ø�ʽ��[xm,fv] = R_sum(fitness,N,c1,c2,M,D)
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
for i = 1:N
    for j = 1:D
        x(i,j) =  round( rand );   % Ҫ��������Ⱥ��һ����N�����ӣ�
        v(i,j) = rand ;         % x(i,j),v(i,j���У�i��ʾ������i; j��ʾ����i�ĵ�j������
    end
end
for i = 1:N
    p(i) = fitness( x(i,:) );   % p(i),������ŵ�i�������ҵ��������Ӧֵ
    y(i,:) = x(i,:);            % y(i,:),�����������i�Լ��ҵ������λ��
end
pg = x(N,:);    % pgΪȫ������
for i = 1:(N-1)
    if fitness( x(i,:) ) < fitness( pg )
        pg = x(i,:);
    end
end
for t = 1:M
    for i = 1:N    %�ٶȡ�λ�Ƹ���
        v(i,:) = w*v(i,:) + c1*rand*( y(i,:)-x(i,:) ) + c2*rand*( pg-x(i,:) );% �Լ���+�Լ���ǰ�ҵ��õ�+ȫ����õ�
        x(i,:) = x(i,:) + v(i,:);
        
        % ����һ���Գ���ΪD������x,v��01������
        % ������x 01������
        max_x = x(i,1);
        for k = 1:D
            if max_x < x(i,k)
                max_x = x(i,k);
            end
        end
        for k = 1:D
            x(i,k) = x(i,k)/max_x ;
            if x(i,k) > 0.5
                x(i,k) = round( x(i,k) );
            else
                x(i,k) = 0;
            end
        end
%         
%         % ������v 01������
%         max_vi = v(i,1);
%         for k = 1:D
%             if max_vi < v(i,k)
%                 max_vi = v(i,k);
%             end
%         end
%         for k = 1:D
%             v(i,k) = v(i,k)/max_vi ;
%             if v(i,k) > 0
%                 v(i,k) = round( v(i,k) );
%             else
%                 v(i,k) = 0;
%             end
%         end
        
        if fitness( x(i,:) ) < p(i)
            p(i) = fitness( x(i,:) );
            y(i,:) = x(i,:);
        end
        if p(i) < fitness( pg )%������ҵ��� p(i) ������Ŀǰȫ�����ţ������֮
            pg = y(i,:);
        end
    end
end
xm = pg';
fv = -fitness( pg );    % ��ȡ���������ֵ��

