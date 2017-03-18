clc;clear;
n = 2;  % 型号II
k = [3.2 7 12.5 19.5 28.12];    % 型号长度
ds = [78 105 120 150 180];      % 型号对应的单位长度的质量
ds = ds./1000;

g = 9.8;    

I = 210;
D = 4/100;  % D(m)
v = 12; % 水速(m/s)


Theta(1) = 0.1;
for j = 1:I-1
    Theta(j+1) = Theta(j) + log(1+j/I)*0.01;
end

sumE=374*D*v*v*sin( Theta(1) );
sumF=374*D*v*v*sin( Theta(1) );

x(1) = 0.5*ds(n)*sin(Theta(1));
y(1) = 0.5*ds(n)*cos(Theta(1));
for j = 1:I-1
    y(j+1) = x(j) + ds(n)*cos(Theta(j));
    % x(j+1) = x(j) + 0.5*ds(n)*sin(Theta(j)) + 0.5*ds(n)*sin(Theta(j+1));
    x(j+1) = x(j) +ds(n)*sin(Theta(j));
end
plot(x,y)

for j = 1:I
    newH = k(n)*Theta(j);
end

for j=1:I
    G(j) = ds(n)*g;
    
end

