

% 
% 
% 
% 
clc 
clear

% Tol(Temperature(i),Water(i),Grainsize(i),[peak0,Et,rWaterP,mGrainP]);
peak0=0.2;
% Tol(1373,10,6,[peak0,1e4,0.6,0.6])
FunPeak=@(tol,Period2,theta2,peak2) 1./(theta2.*(2.*pi).^0.5).*exp(-0.5.*(-log(tol/peak2)/theta2).^2)./(Period2.^2+4.*pi.^2.*tol.^2);
% strengthBack1(i)=deltafunction(Temperature(i),Water(i),Grainsize(i),strengthBack,rWaterk,0,Ek);
% strengthBa=deltafunction(1473,10,6,150,0.6,1.1,-0.022)
Period=1000;
theta=2;
Peak=100;
m=integral(@(tol)FunPeak(tol,Period,theta,Peak),0,inf);
% InterPeak=strengthBa.*m;
% J2=2*pi*Period*InterPeak
water=[1 10 50 100 150 200];
Temperature=[1173 1273 1373];
grain=5;
f1=figure;
strengthBa=zeros(numel(water));
for j=1:numel(Temperature)
    strengthBa=zeros(numel(water),1);
for i=1:numel(water)
    strengthBa(i)=m.*deltafunction(Temperature(j),water(i),grain,20,2,0,-0.04);
end
plot(water, strengthBa')
legend(num2str(Temperature(j)))
hold on
end
legend(num2str(Temperature(1)), num2str(Temperature(2)),num2str(Temperature(3)))
