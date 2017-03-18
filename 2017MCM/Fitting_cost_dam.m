clc;clear;
x=2000:25500;
y = 1.2.^(x/1000-5)-1;
x1=-3;x2=2.5*10000;
plot(y);
grid on;
axis( [x1,x2,0,45] );
% xlabel( 'Installed capacity (MW)' );  %   sÎª×Ö·û´®
xlabel( 'Library capacity(10^{4}/m^{3})' );
ylabel( 'Cost (10^{8}/$)' );
title('Fitting a curve for cost of dam');
% title('fontsize{16}y(omega)=int^{infty}_{0}y(t)e^{-jomegat}dt')
