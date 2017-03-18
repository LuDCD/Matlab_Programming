function y = FitFun( x )
%B = [5 1.2 1.7 0.9;1 4 0.5 1.1;0.8 0.2 6 2];
B = magic(20);
Nq = 0.2;
y1 = 0;
[Q,N] = size(B); %如果B是二维数组，返回行数和列数;
y = 0;
for i = 1:Q
    for j = 1:N
        if(i ~=  j)
            y1 = y1 + x(j)*B(i,j);
        end
        y = y + log2(1 + x(i)*B(i,i)/(y1 + Nq));
    end
end
y = -y;
%optimtool 'gamultiobj'