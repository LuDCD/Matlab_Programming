function power_G = PN(G)
% һ����ͼ���ܺ�

% ���㽻��������
D = length(G);
% ʹ�õĽ���������
usedSwitch_num = 0;
% һ���������������ܺ�ֵ
PC = 100;
% ʹ�õ��߿�����
usedLineCard_num = 0;
% һ���߿����ܺ�ֵ
PL = 20;

for i=1:D
    if sum(G(i,:)) ~= 0
        usedSwitch_num = usedSwitch_num+1;
    end
end
power1 = usedSwitch_num*PC;

for i=1:D
    t = ceil((sum(G(i,:))+sum(G(:,i)))/2);
    usedLineCard_num = usedLineCard_num+t;
end
power2 = usedLineCard_num*PL;

power_G = power1 + power2;
end