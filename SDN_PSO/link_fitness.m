function f = link_fitness(theta,AvgDel,Dele,Ble,Bfe,d)
% ������·e����Ӧֵ
% theta:��,����������·������
% AvgDel:�������������ƽ���ӳ�
% Dele:������·���ӳ�
% Ble:һ����·��ʣ�����
% Bfe:������·���ܴ���
% Bld:һ�����������л�û�б�·�ɵ�����,����һ������������

Bld = d;
alpha1 = 1;
alpha2 = 1;
t = alpha1*exp(-(Ble-Bld)/Bfe) + alpha2*exp(-Dele/AvgDel);

if Ble < Bfe
    f = 0;
else
    if Ble-Bld >= theta*Bfe
        f = t;
    else
        f = t*(Ble-Bld)/Bfe;
    end
end

end