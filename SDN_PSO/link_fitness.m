function f = link_fitness(theta,AvgDel,Dele,Ble,Bfe,d)
% 计算链路e的适应值
% theta:θ,允许的最大链路利用率
% AvgDel:代表整个网络的平均延迟
% Dele:代表链路的延迟
% Ble:一条链路的剩余带宽
% Bfe:这条链路的总带宽
% Bld:一个流量需求中还没有被路由的流量,就是一个流量的需求

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