clc;clear all;
g = 9.8;
n = 2;  % 型号II
ds = [3.2 7 12.5 19.5 28.12];    % 型号长度
dm = [78 105 120 150 180];      % 型号对应的单位长度的质量

G0 = 10*g;  % 四个钢管
Gz = (1200+100)*g;  % 钢桶与重物球
G = [G0 G0 G0 G0 Gz];    % 等效的五个钢管的净重力

B1=19.71;
G1=98;
Bc=2245.22;
Gc=11760;
Bl=1935.59;
Gl=1512.63;
%Bf = 31541.3*h;   % 浮标的浮力
Gf = 9800;        % 浮标的重力
% Bf = Gf + G1 + G1*4 + Gl - B1*4 - Bc - Bl;
D = 2; % 浮标直径
t = 0.00001;
hmin = 0;
hmax = 2;
p = 1;

for hh = hmin:t:hmax
    v = 24;
	Bf = 31541.3*hh;
	Ff = 0.625*(2-hh)*D*v*v;   % 风的力
	Alpha(1) = atan((Bf-Gf)/Ff);
	for i = 1:5
        F(1) = sqrt((Bf-Gf)^2+Ff^2);
        if i ~= 1
            F(i) = ( F(i-1)*sin(Alpha(i-1)-G(i-1)) )/sin(Alpha(i)) ;
        end
        
        Theta(i) = atan( -0.5*G(i)/(F(i)*cos(Alpha(i)))+tan( Alpha(i) ) );
        
        if i ~= 5
            Alpha(i+1) = atan( sin(Theta(i))*(F(i)*sin(Alpha(i))-G(i))/(-0.5*G(i)*cos(Theta(i))+cos(Theta(i))*F(i)*sin(Alpha(i))) );     
        end
    end
       
	h1 = 1*sin(Alpha(1)) + 1*sin(Alpha(2)) + 1*sin(Alpha(3)) + 1*sin(Alpha(4)) + 1*sin(Alpha(5));
	H = 18 - h1;
	a = F(5)*cos(Alpha(5))/dm(n)/g;
% 	L = -a*tan(0.0017)+  sqrt( (H-a)^2 - a*a );
    if v <= 18.5
        Alpha0 = 0;
    else
        % 20 度 = 0.349 rad
       Alpha0 = 0.349/50*v;
    end
    L = -a*tan(Alpha0)+  sqrt( (H-a*sec(Alpha0))^2 - a*a );
%     L = -(tan(Alpha(5))-tan(Alpha0))/dm(n)*F(5)*cos(Alpha(5));
	% 0.0017rad = 0.1度
	if abs(L-22.05) <= 0.1
	Hh(p) = hh;
    hh
	Th(:,p) = Theta;
    -1.*Theta
    p = p+1;
    
    end    
end
Hh;
Th;