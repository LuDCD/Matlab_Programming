%----------------------------------
%2DPSK�źŵ����������ٲ�����
%----------------------------------

clc;
clear all;
close all;

%----------------------------------
%�źŵĲ��������
%----------------------------------
tx = randi([0,1], 50000, 1);              % �����������
M = 2;                                   % ����λ��
hMod = modem.dpskmod ('M',M);            % ����DPSK������
dpsksig = modulate(hMod, tx);            % DPSK�ź�


%----------------------------------
%���ŵ�
%----------------------------------
Ts = 1/1000;                             % ����ʱ����
Fd = 10;                                % ��������Ƶ��
chan = rayleighchan(Ts, Fd);             % ����������˥���ŵ�
fadedsig = filter(chan, dpsksig);        % ͨ���ŵ�

%----------------------------------
%�������������ʺ�ʵ��������
%----------------------------------
SNR = 0:2:20;                            % �����SNR��ȡֵ��Χ����λdB
hDemod = modem.dpskdemod(hMod);          % DPSK�����
for n = 1:length(SNR)
    rxsig = awgn(fadedsig, SNR(n));      % ��Ӹ�˹������
    rx = demodulate(hDemod,rxsig);       % ���
    reset(hDemod);                       % �������λ   
    [nErrors, BER(n)] = biterr(tx, rx);  % ����ʵ��������
end
BERtheory = berfading(SNR, 'dpsk', M, 1);%�������������ʣ����ڱȽ�

%----------------------------------
%�����ٲ�����
%----------------------------------
semilogy(SNR, BERtheory, 'b-', SNR, BER, 'r-x');
legend('����BER', 'ʵ��BER');
xlabel('SNR(dB)')
ylabel('BER');
title('������˥���ŵ��ϴ���2DPSK�źŵ�BER');
grid on;
