function M = kdjz(A)
% kdjz.m
% MΪ��õĿɴ����
% ����AΪ�������Ĳ���

num =  length(A);
I = eye(num);
T = (A+I);

MAXNUM = 1000000000000;

for k=1:MAXNUM
    T = T^k;
    if T==T*T
        M = T;
        break;
    end
end

end