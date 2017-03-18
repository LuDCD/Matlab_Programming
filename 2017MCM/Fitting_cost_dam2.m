clc;clear;
x=200:2000;
y = 1.6.^(x/1000-1);
x1=-3;
x2=2.5*10000;
plot(y);
grid on;
% axis( [x1,x2,0,45] );
% xlabel( 'Installed capacity (MW)' );  %   sÎª×Ö·û´®
xlabel( 'Flood discharge capacity(m^{3}/s)' );
ylabel( 'Cost (10^{6}/$)' );
title('Fitting a curve for cost of dam');
% title('fontsize{16}y(omega)=int^{infty}_{0}y(t)e^{-jomegat}dt')
