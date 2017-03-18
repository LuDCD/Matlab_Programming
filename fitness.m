%% 粒子群算法 【例13-1】p273
% function F = fitness(x)
% F = 0;
% for i = 1:30
%     F = F + x(i)^2;
% end 
%[xm,fv] = PSO(@fitness,40,2,2,0.5,1000,30)
%% 粒子群算法 【例13-2】p278
% function F = fitness(x)
% F = 0;
% for i = 1:2
%     F = F + x(i)^2 - cos(18*x(i));
% end
%% 蚁群算法
% c= [1304 2312;3639 1315;4177 2244;3712 1399;3488 1535;3326 1556;3238 1229;4196 1004;4312 790;4386 570;3007 1970;2562 1756;2788 1491;2381 1676;1332 695;3715 1678;3918 2179;4061 2370;3780 2212;3676 2578;4029 2838;4263 2931;3429 1908;3507 2367;3394 2643;3439 3201;2935 3240;3140 3550;2545 2357;2778 2826;2370 2975];
% m=31;Alpha=1;Beta=5;Rho=0.1;NC_max=200;Q=100;
% ACATSP(C,NC_max,m,Alpha,Beta,Rho,Q)
%% 遗传算法 【例14-1】p317
% function F = fitness(x)
% F = x^3-60*x^2+900*x+100;
%[xm,fv] = myGA(@fitness,0,30,50,100,0.9,0.04,0.01)
%% 遗传算法 【例13-2】p321
% function F = fitness(x)
% F = -1*x*sin(x);
%[xm,fv] = SBOGA(@fitness,0,4,50,500,0.2,0.9,0.05,0.01)
%% 通信优化题,用的是修改过得SPO
% function y = fitness( x )
% % 传进来的 x 为一个向量
% B = [5 1.2 1.7 0.9;1 4 0.5 1.1;0.8 0.2 6 1;0.1 0.9 0.5 4];
% % B = magic(4);
% Nq = 0.2;
% y1 = 0; % 代表下面的求和
% [Q,N] = size(B); %如果B是二维数组，返回行数和列数;
% y = 0;
% for i = 1:Q
%     for j = 1:N
%         if(i ~= j)
%             y1 = y1 + x(j)*B(i,j);
%         end
%         y = y + log2( 1 + x(i)*B(i,i)/(y1 + Nq) );
%     end
% end
% y = -y; % 由于PSO算的是最小值。
% [xm,fv] = R_sum(@fitness,40,2,2,0.5,1000,20)  % 把前面的输入command window中

%% 优化h&m
function y = fitness(x)
% x = [h,m]
h = x(1);
m = x(2);
% 计算Theta5>=90-5度
%{
分析：
知道了h,就知道了初始的Alpha1、F1就可以依次计算出来Theta5了。
%}
g = 9.8;
n = 2;  % 型号II
k = [3.2 7 12.5 19.5 28.12];    % 型号长度
dm = [78 105 120 150 180];      % 型号对应的单位长度的质量
D = 2; % 浮标直径

G0 = 10*g;              % 四个钢管
Gz = (1200+m)*g;      % 钢桶与重物球
G = [G0 G0 G0 G0 Gz];   % 等效的五个钢管的净重力

B1=19.71;   % 一根钢管的浮力
G1=10*g;    % 一根钢管的重力
Bc=1025*g*(1*pi*1.5*1.5+m/7850); % 钢桶与重物球的浮力
Gc=(1200+m)*g;   % 钢桶与重物球的重力
Bl=1935.59; % 浮标的浮力
Gl=1512.63; % 浮标的重力
Bf = 31541.3*h;   % 浮标的浮力
Gf = 9800;	% 浮标的重力
v = 36;
Ff = 0.625*(2-h)*D*v*v;   % 风的力
Alpha(1) = atan((Bf-Gf)/Ff);
for i = 1:5
	F(1) = sqrt((Bf-Gf)^2+Ff^2);
	if i ~= 1
        F(i) = ( F(i-1)*sin(Alpha(i-1)-G(i-1)) )/sin(Alpha(i)) ;
    end
	Theta(i) = atan( -0.5*G(i)/(F(i)*cos(Alpha(i)))+tan( Alpha(i) ) );
    Alpha(i+1) = atan( sin(Theta(i))*(F(i)*sin(Alpha(i))-G(i))/(-0.5*G(i)*cos(Theta(i))+cos(Theta(i))*F(i)*sin(Alpha(i))) );
end
 L = -(tan(Alpha(5))-tan(0))/dm(n)*F(5)*cos(Alpha(5));
 
% 5 度 = 0.0873 rad
% 85 度 = 1.484 rad
if Theta(5) > 1.484 
    for m = 1:5
        if F(i)<0 || Theta(i)<0 || Alpha(i)<0 || abs(L-22.05) > 0.1
            y = Inf;
            break;
        end
    end
    Th5 = (0.5*pi-Theta(5)); 
    y = Th5;
%     Th5 = (0.5*pi-Theta(5))/0.0873;
else
    y = Inf;
end
% 计算锚链与海床的夹角

end