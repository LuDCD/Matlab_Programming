clc,clear;
SNRindB1=0:1:12;
SNRindB2=0:0.01:12;
for i=1:length(SNRindB1)
    smld_err_prd(i)=Fun_double_NRZ_Pe(SNRindB1(i));
end
semilogy(SNRindB1,smld_err_prd,'r*');
for i=1:length(SNRindB2)
    SNR=10^(SNRindB2(i)/10); 
        theo_err_prb(i)=(1/2)*erfc(sqrt(SNR/2));   
end
hold on;
semilogy(SNRindB2,theo_err_prb);
grid on;