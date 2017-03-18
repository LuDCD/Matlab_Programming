function power_G = PN(G)
% 一个子图的能耗

% 计算交换机数量
D = length(G);
% 使用的交换机数量
usedSwitch_num = 0;
% 一个交换机底座的能耗值
PC = 100;
% 使用的线卡数量
usedLineCard_num = 0;
% 一个线卡的能耗值
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