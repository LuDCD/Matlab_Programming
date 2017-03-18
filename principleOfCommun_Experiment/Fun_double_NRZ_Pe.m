function [p] = Fun_double_NRZ(snr_in_dB)
E=1;
SNR=10^(snr_in_dB/10);
sgma=E/sqrt(SNR);
N=10000;;
dsource=(sign(rand(1,N)-0.5+eps));
numoferr=0;
for i=1:N;
    if(dsource(i)==(-1))
        r=(-E)+sgma*randn;
    else
        r=E+sgma*randn;
    end
    if(r<0)
        decis=-1;
    else
        decis=1;
    end
    if(decis~=dsource(i))
       numoferr= numoferr+1;
    end 
end
p=numoferr/N;


