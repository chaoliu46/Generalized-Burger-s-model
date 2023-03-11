clc
clear
FunPeak=@(tol,Period2,theta2,peak2) 1./(theta2.*(2.*pi).^0.5).*exp(-0.5.*(-log(tol/peak2)/theta2).^2)./(Period2.^2+4.*pi.^2.*tol.^2);
% FunPeak=@(tol,Period2,theta2,peak2) 1./(theta2.*tol.*(2.*pi).^0.5).*exp(-0.5.*(-log(tol/(peak2))/theta2).^2);
FunBackground=@ (tol,alpha2,Period2)alpha2.*tol.^(alpha2)./(Period2.^2+4.*pi.^2.*tol.^2);
j=(-6):0.1:5;
Period=10.^(j);
y=zeros(numel(Period),1);
z=zeros(numel(Period),1);
k=zeros(numel(Period),1);
Peak=zeros(numel(Period),1);
Peak1=zeros(numel(Period),1);
for i=1:numel(Period)
    Peak(i)=1;
%     Peak(i)=1./Period(i);
    d=1;
    e=3;
y(i)=log10(integral(@(tol)FunPeak(tol,Period(i),d,Peak(i)),0,inf));
% y(i)=(integral(@(tol)FunPeak(tol,Period(i),d,Peak(i)),0,inf));
% z(i)=log10(integral(@(tol)FunPeak(tol,Period(i),e,Peak(i)),0,inf));
% z(i)=log(integral(@(tol)FunPeak(tol,Period(i),2,Peak1(i)),0,inf));
%  k(i)=integral(@(tol) FunBackground(tol,0.3,Period(i)),1,10);
end
% hold on
figure
semilogx(Period,y)
% % hold off
title(d);