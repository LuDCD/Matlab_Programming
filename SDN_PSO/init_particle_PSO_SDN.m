function g = init_particle_PSO_SDN(G,sd,beta)
% g Ϊ����ֵ����һ��D��D���ڽӾ���(һ������,��ԭʼ���˽������������ı�����ͨ��)
% G��ԭʼ����
% ���ǲ��������ڽӾ�������沿��,��������֮������°벿�֣�
% ���ǲ����˾�����ϰ벿�ֵĺ������ڲ������֮��͸����°벿��
% sΪԴ�ڵ㼯��
% dΪĿ��ڵ㼯�� si<di
% sd��Դ�ڵ��Ŀ��ڵ�ļ���sd
% ��ɳ�ʼ��������ĸ��ֲ���

% ��ȡ����G��ά��
D = length(G);

% ֹͣ����
    % 1����ɾ����·������beta��(delCont����)
    % 2������delNUM��ûɾ��ʧ�ܣ�����Դ�ڵ� ����Ŀ��ڵ� �����ƻ���ͨ�ԣ���

% ��¼�Ѿ�ɾ������·��
delCont = 0;
% ��¼ɾ��ʧ�ܵĴ���
delFail = 0;
delNUM = 100;

while delCont<beta && delFail<delNUM
    % ���ɾ��һ���Ѿ����ڵ���·������ת��Ϊ���ѡ�㣬��ɾ��
    % ���ѡ��m��R = unidrnd(N)������һ�����ֵΪN�����������R��RΪ1��N֮��
    m = unidrnd(D);
    % any(x==a)�����x����һ��������ֵΪa,�򷵻�1;���򷵻�0.
    if any(m==sd)==0 % ����㲻��sd��
        for i=unidrnd(D):D % �Ų���m��������·��unidrnd(D)���������
            if G(m,i)==1 && any(i==sd)==0 % ���m�������Ҳ���sd��
                G(m,i)=0;
                G(i,m)=0;
                delCont = delCont+1;
                if connected(G) ~= 1    % �����m-iɾ���ƻ���ͨ�ԣ���ȡ��ɾ��
                    G(m,i)=1;
                    G(i,m)=1;
                    delFail = delFail+1;
                    delCont = delCont-1;
                end
            else
                if any(i==sd)
                     delFail = delFail+1;
                end
            end 
        end
    else
        delFail = delFail+1;
    end
end

% G = ad_mat_inversion(G);

% ɾ����Դ�ڵ��Ŀ��ڵ���ն˽ڵ㣨Ҷ�ӽڵ㣩
for i=1:D
    G = del_Common_Leaf(G,sd);
end

g = G;
% ���ԣ�ȥ���ֺţ�����о�û���⡣

end
