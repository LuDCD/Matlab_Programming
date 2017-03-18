k=20000;          %k表示产生的随机数的个数?
E=1;                %E表示比特能量，进行归一化，设为1?for?j=1:50
for j=1:50        %产生30个不同的N
    N(j)=1/(10^(0.1*j));     %设定N的值
    d(j)=sqrt(E*N(j)/2);     %标准差
    count=0;
    m=rand(1,k);   %产生k个（0,1）之间均匀分布的随机数
    for i=1:k
        if (m(i)>0)&&(m(i)<0.5)
            s(i)=-1;
        else
            s(i)=1;
        end
    end
    s;
    n=random('Normal',0,d(j),1,k); %产生k个均值为0标准差d(j）高斯分布随机数
    r=s+n;    %r为检测数据输入
    for i=1:k
        if r(i)>0
            t(i)=1;
        else
            t(i)=-1;
        end
    end      %对检测器输出的数据进行判决，输出t
    for i=1:k
        if s(i)~=t(i)
            count=count+1;
        end
    end     %将检测器输出的数据t与数据源数据s比较，计算错误比特个数
    p1(j)=count/k;  %计算误码率
    x(j)=10*log10(1/(2*d(j)^2));  %?将信噪比表示为对数形式，单位为db
    p2(j)=0.5*erfc(1/(sqrt(2)*d(j)))  %理论上计算单极性信号误码率的公式
end
semilogy(x,p1,'*');  %绘制实验中测得的误码率与信噪比的曲线图
hold on
semilogy(x,p2,'r'); %绘制理论上的误码率与信噪比的曲线图
axis([0 10,1e-6 1]);
xlabel('信噪比/db');
ylabel('误码率');
legend('仿真数据','理论曲线');
title('蒙特卡洛仿真双极性误码率波形');
grid on