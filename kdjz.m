function M = kdjz(A)
% kdjz.m
% M为求得的可达矩阵
% 矩阵A为传进来的参数

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