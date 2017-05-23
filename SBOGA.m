function [xm,fv] = SBOGA(fitness,a,b,NP,NG,q,Pc,Pm,eps)
% SBOGA ˳��ѡ���Ŵ��㷨
% fitness�����Ż���Ŀ�꺯��
% a���Ա����½�
% b���Ա����Ͻ�
% NP����Ⱥ������
% NG������������
% q����ø����ѡ�����
% Pc���ӽ�����
% Pm���������
% eps���Ա�����ɢ����
% xm��Ŀ�꺯��ȡ��Сֵʱ���Ա���ֵ
% fv��Ŀ�꺯������Сֵ

L = ceil(log2((b-a)/eps+1));% ������ɢ���ȣ�ȷ�������Ʊ�����Ҫ���볤L
x = zeros(NP,L);

for i = 1:NP
    x(i,:) = Initial(L);    % �Զ����Ӻ�������Ⱥ�����ʼ����
    fx(i) = fitness(Dec(a,b,x(i,:),L)); % �Զ����Ӻ�������ʼ��������Ӧֵ��
end

for k =1:NG             % ���Ƶ���������NG������������
    
    [sortf,sortx] = sort(fx);   % ��Ӧֵ����
    x = x(sortx,:);
    fx = fx(sortx);
    for i = 1:NP                % �̶�ѡ�����
        Px(i) = (1-q)^(NP-i)*q/(1-(1-q)^NP);
    end
   
    PPx = 0;
    PPx(1) = Px(1);
    for j = 2:NP        % �������̶Ĳ��Եĸ����ۼ�
        PPx(j) = PPx(j-1)+Px(j);
    end
    for i = 1:NP                % NP����Ⱥ������
        sita = rand();
        SelFather = 1;
        for n = 1:NP
            if sita <= PPx(i)
                SelFather = n;  % �������̶Ĳ���ȷ���ĸ���
                break;          % �˳�ѭ�������ǽ�������ѭ��(continue)��
            end
        end
        Selmother = floor(rand()*(NP-1)) + 1; % ���ѡ��ĸ��
        posCut = floor(rand()*(L-2)) + 1;     % ���ȷ�������
                                              % floor(A),ȡ��
        r1 = rand();
        if r1 <= Pc                           % ���档Pc���ӽ�����
             % ����i�Ļ�����뽻���posCut֮ǰ���������׵ģ�֮������ĸ�׵�
            nx(i,1:posCut) = x(SelFather,1:posCut);        
            nx(i,(posCut+1):L) = x(Selmother,(posCut+1):L); 
            r2 = rand();
            if r2 <= Pm                     % ���졣Pm���������
                posMut = round(rand()*(L-1)+1); % ȷ��������һλ
                nx(i,posMut) = ~nx(i,posMut);   % ���졣1��0,0��1
            end
        else
            nx(i,:) = x(SelFather,:);
        end
    end
    x = nx;     % �þ����ӽ��������newx����x
    for i = 1:NP
        fx(i) = fitness(Dec(a,b,x(i,:),L)); % ������Ӧֵ����fx
    end
end

fv = -inf;              % ��ʼ��fvΪ��Сֵ
for i = 1:NP            % ����NP�����塣NP����Ⱥ������
    fitx(i) = fitness(Dec(a,b,x(i,:),L));
    if fitx > fv        % ѡ���������ֵ��Ϊ���ս����
        fv = fitx;
        xm = Dec(a,b,x(i,:),L);
    end
end

% һ�㺯�������н�β�ǲ���Ҫר�ű�����end����
function result = Initial(length)   % ��ʼ�������Ʊ��뺯�������ص���һ��������
for i = 1:length
    r = rand();
    result(i) = round(r);   %   round(r),��ʾ�� r ������������ȡ����
                            %            eg.round(-1.800) = -2
end  %  �����end���ǿ���forѭ����

function y = Dec(a,b,x,L)   % �����Ʊ���ת��Ϊʮ���Ʊ��뺯��
% ���ص���һ��ʮ���Ƶ�����Ŀ���ǰѶ����Ʊ������ת��Ϊʮ����������������û������ĵ���Ӧֵ
base = 2.^((L-1):-1:0);     % �õ�һ��������
y = dot(base,x);            % ����base������x,�õ�����һ������
y = a+y*(b-a)/(2^L- 1);  