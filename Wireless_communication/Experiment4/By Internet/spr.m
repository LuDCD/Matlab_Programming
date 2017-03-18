clc
clear all
close all

b=round(rand(1,20));
pattern=[];
for k=1:20
    if(b(1,k)==0);
        sig=zeros(1,6);
    else
        sig=ones(1,6);
    end
    pattern=[pattern sig];
end

b1=b;
subplot(3,2,1);
plot(pattern)
axis([-1 120 -0.5 1.5]);
ylabel('\bf original bit sequence');
title('\bf Transmitted message');

% Generation of Gold code 1

G=20;
k=1;
seq1=randsrc(1,20,[0 1]);
pn1=[];
for j=1:G
    pn1=[pn1 seq1(1)];
    temp1=xor(seq1(4),seq1(1));
    temp2=xor(seq1(6),temp1);
    temp3=xor(seq1(7),temp2);
    temp4=xor(seq1(13),temp3);
    temp5=xor(seq1(19),temp4);
    for i=1:G-1
        seq1(i)=seq1(i+1);
    end
    seq1(20)=temp5;
end

% Generation of second gold code sequence
seq2=randsrc(1,20,[0 1]);
pn2=[];
for j=1:G
    pn2=[pn2 seq2(1)];
    temp1=xor(seq2(2),seq2(1));
    temp2=xor(seq2(3),temp1);
    temp3=xor(seq2(5),temp2);
    temp4=xor(seq2(7),temp3);
    temp5=xor(seq2(9),temp4);
    temp6=xor(seq2(10),temp5);
    temp7=xor(seq2(13),temp6);
    temp8=xor(seq2(14),temp7);
    temp9=xor(seq2(16),temp8);
    temp10=xor(seq2(17),temp9);
    temp11=xor(seq2(19),temp10);
    
    for i=1:G-1
        seq2(i)=seq2(i+1);
    end
    seq2(20)=temp11;
end

% Generation of gold code

code_matrix=[];
for codes=1:k
    code=[];
    for j=1:G
        code=[code xor(pn1(j),pn2(j))];
    end
    code_matrix=[code_matrix code'];
end
    
gold_1=code_matrix';
gold_code=gold_1;
pattern=[];
for K=1:20
    if gold_1(1,K)==0
        sig=zeros(1,6);
    else
        sig=ones(1,6);
    end
    pattern=[pattern sig];
end

gold= pattern;

subplot(3,2,2);
plot(gold);
axis([-1 120 -.5 1.5]);
ylabel('\bf Gold Code');
title('\bf Gold Code');

% Spreading the pattern with the gold code

k=1;
for i=1:20
    for j=1:20
        spread(1,k)=xor(b1(1,i),gold_1(1,j));
        k=k+1;
    end
end
spread;
subplot(3,2,3);
plot(spread);
axis([-1 400 -0.5 1.5]);
ylabel('\bf Spreaded Sequence');

% Demodulation

gold_1inv=xor(1,gold_1);
i=1;
k=1;
while k<400
    s=0;
    for j=1:20
        temp(1,j)=xor(spread(1,k),gold_1(1,j));
        k=k+1;
        s=s+temp(1,j);
    end
    if(s==0)
        b2(1,i)=0;
    else
        b2(1,i)=1;
    end
    i=i+1;
end

despreaded_signal=b2;

pattern=[];
for k=1:20
    if b2(1,k)==0
        sig=zeros(1,6);
    else
        sig=ones(1,6);
    end
    pattern=[pattern sig];
end
subplot(3,2,4);
plot(pattern);
axis([-1 120 -0.5 1.5]);
ylabel('\bf Despreaded Sequence');

%plot the fft of the dsss signal


figure
plot([1:400],abs(fft(spread)),[1:20],abs(fft(b2)))