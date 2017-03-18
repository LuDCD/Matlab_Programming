% clc;clear;
% y=-exp(10.5*(x+0.5)) x<-0.5 
% y =exp(3.51*(x0.5))-2*exp(-3.51*(x+0.5))   (-0.5,0.5) 
% y=-exp(10.5*(x+0.5))    x>0.5
% matlab
x=0:0.02:100;
y=(0.064*x.^2).*( x<60 )+...
    (-0.034*(x-80).^2+4.0625*x).*(x>60&x<80)...
    +(0.0015*(x-80).^2+4.06*x).*(x>80);
plot(x,y)
% semilogy(x,y)
% xlabel( 'Installed capacity (MW)' );  %   sÎª×Ö·û´®
xlabel( 'Budget(10^{6}/$)' );
ylabel( 'annual Benefit (10^{8}/$)' );
title('Relationship of Budget and annual Benefit ');
% title('fontsize{16}y(omega)=int^{infty}_{0}y(t)e^{-jomegat}dt')
save fit1 fit1
%{
    load(fit1.mat);
    y = fit1.coeff(1)*x.^5+...
    fit1.coeff(2)*x.^4+...
    fit1.coeff(3)*x.^3+...
    fit1.coeff(4)*x.^2+...
    fit1.coeff(5)*x.^1+...
    fit1.coeff(6)*x.^0;
plot(x,y)
xlabel( 'Budget(10^{6}/$)' );
ylabel( 'annual Benefit (10^{8}/$)' );
title('Relationship of Budget and annual Benefit ');
%}
