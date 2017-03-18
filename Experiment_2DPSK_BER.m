%----------------------------------
%2DPSK信号的误码性能瀑布曲线
%----------------------------------

clc;
clear all;
close all;

%----------------------------------
%信号的产生与调制
%----------------------------------
tx = randi([0,1], 50000, 1);              % 产生随机序列
M = 2;                                   % 进制位数
hMod = modem.dpskmod ('M',M);            % 创建DPSK调制器
dpsksig = modulate(hMod, tx);            % DPSK信号


%----------------------------------
%过信道
%----------------------------------
Ts = 1/1000;                             % 采样时间间隔
Fd = 10;                                % 最大多普勒频移
chan = rayleighchan(Ts, Fd);             % 单径瑞利型衰落信道
fadedsig = filter(chan, dpsksig);        % 通过信道

%----------------------------------
%计算理论误码率和实际误码率
%----------------------------------
SNR = 0:2:20;                            % 信噪比SNR的取值范围，单位dB
hDemod = modem.dpskdemod(hMod);          % DPSK解调器
for n = 1:length(SNR)
    rxsig = awgn(fadedsig, SNR(n));      % 添加高斯白噪声
    rx = demodulate(hDemod,rxsig);       % 解调
    reset(hDemod);                       % 解调器复位   
    [nErrors, BER(n)] = biterr(tx, rx);  % 计算实际误码率
end
BERtheory = berfading(SNR, 'dpsk', M, 1);%计算理论误码率，用于比较

%----------------------------------
%绘制瀑布曲线
%----------------------------------
semilogy(SNR, BERtheory, 'b-', SNR, BER, 'r-x');
legend('理论BER', '实际BER');
xlabel('SNR(dB)')
ylabel('BER');
title('瑞利型衰落信道上传输2DPSK信号的BER');
grid on;
