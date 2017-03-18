clc;clear all;
g = 9.8;
n = 2;                          % 型号II
k = [3.2 7 12.5 19.5 28.12];    % 型号长度
dm = [78 105 120 150 180];      % 型号对应的单位长度的质量
D = 2;                          % 浮标直径

G0 = 10*g;              % 四个钢管
Gz = (1200+100)*g;      % 钢桶与重物球
G = [G0 G0 G0 G0 Gz];   % 等效的五个钢管的净重力

B1=19.71; % 一根钢管的浮力
G1=10*g;            % 一根钢管的重力
Bc=2245.22;         % 钢桶与重物球的浮力
Gc=11760;           % 钢桶与重物球的重力
Bl=1935.59;         % 浮标的浮力
Gl=1512.63;         % 浮标的重力
%Bf = 31541.3*h;    % 浮标的浮力
Gf = 9800;          % 浮标的重力
Bf = Gf + G1 + G1*4 + Gl - B1*4 - Bc - Bl;
hh = Bf/31541.3;

p = 1;
t = 0.1;
vmin = 2;
vmax = 40;
for v = vmin:t:vmax
    Ff = 0.625*(2-hh)*D*v*v;   % 风的力
    Alpha(1) = atan((Bf-Gf)./Ff);
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
     L = -(tan(Alpha(5))-tan(0))/dm(n)*F(5)*cos(Alpha(5));
     X1 = -( log(sec(Theta(5))+tan(Theta(5)))-log(sec(0)+tan(0.0017)) )/dm(n)*F(5)*cos(Alpha(5));
     x1 = 1*cos(Alpha(1)) + 1*cos(Alpha(2)) + 1*cos(Alpha(3)) + 1*cos(Alpha(4)) + 1*cos(Alpha(5));
     if abs(L-22.05) <= 0.08
     	v 
        Theta.*(-1)
      end
   vt(p) = v;
   LL(p) = L;
   X(p) = X1+x1;
   Th(:,p) = Theta.*(-1);
   Al(:,p) = Alpha.*(-1);
   p = p+1;
end

X=X*0.16;
vt = vt*0.501;
plot(X,vt);
title( '游动区域最大直径Rmax与风速的关系'); %书写图名
xlabel( '风速v(m/s)' );	% 	s为字符串
ylabel( '浮动区域最大直径R(m)' );
axis( [0,35,0,25] );%设定坐标的范围，可以取inf，-inf
grid on; %显示分格线
hold on;


% =================================================================
% p = Th(5,:);
% plot(vt,p);
% title( 'θ5（钢桶与水平方向的夹角）与风速的关系') %书写图名
% xlabel( '风速v' )	% 	s为字符串
% ylabel( 'θ5 / rad' );
% grid on; %显示分格线
% hold on;

% ===================================================================
% plot(vt,LL);
% title( '锚链长度为22.05m时的临界风速'); %书写图名
% xlabel( '风速v' );	% 	s为字符串
% ylabel( '锚链长度L' );
% axis( [2,36,10,120] );%设定坐标的范围，可以取inf，-inf
% hold on;
% 
% yy=line([2 18.5],[22.05 22.05]);
% set(yy,'linestyle',':');