clc;clear all;
g = 9.8;
n = 2;                          % �ͺ�II
k = [3.2 7 12.5 19.5 28.12];    % �ͺų���
dm = [78 105 120 150 180];      % �ͺŶ�Ӧ�ĵ�λ���ȵ�����
D = 2;                          % ����ֱ��

G0 = 10*g;              % �ĸ��ֹ�
Gz = (1200+100)*g;      % ��Ͱ��������
G = [G0 G0 G0 G0 Gz];   % ��Ч������ֹܵľ�����

B1=19.71; % һ���ֹܵĸ���
G1=10*g;            % һ���ֹܵ�����
Bc=2245.22;         % ��Ͱ��������ĸ���
Gc=11760;           % ��Ͱ�������������
Bl=1935.59;         % ����ĸ���
Gl=1512.63;         % ���������
%Bf = 31541.3*h;    % ����ĸ���
Gf = 9800;          % ���������
Bf = Gf + G1 + G1*4 + Gl - B1*4 - Bc - Bl;
hh = Bf/31541.3;

p = 1;
t = 0.1;
vmin = 2;
vmax = 40;
for v = vmin:t:vmax
    Ff = 0.625*(2-hh)*D*v*v;   % �����
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
title( '�ζ��������ֱ��Rmax����ٵĹ�ϵ'); %��дͼ��
xlabel( '����v(m/s)' );	% 	sΪ�ַ���
ylabel( '�����������ֱ��R(m)' );
axis( [0,35,0,25] );%�趨����ķ�Χ������ȡinf��-inf
grid on; %��ʾ�ָ���
hold on;


% =================================================================
% p = Th(5,:);
% plot(vt,p);
% title( '��5����Ͱ��ˮƽ����ļнǣ�����ٵĹ�ϵ') %��дͼ��
% xlabel( '����v' )	% 	sΪ�ַ���
% ylabel( '��5 / rad' );
% grid on; %��ʾ�ָ���
% hold on;

% ===================================================================
% plot(vt,LL);
% title( 'ê������Ϊ22.05mʱ���ٽ����'); %��дͼ��
% xlabel( '����v' );	% 	sΪ�ַ���
% ylabel( 'ê������L' );
% axis( [2,36,10,120] );%�趨����ķ�Χ������ȡinf��-inf
% hold on;
% 
% yy=line([2 18.5],[22.05 22.05]);
% set(yy,'linestyle',':');