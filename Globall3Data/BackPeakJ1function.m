function BackPeakJ1=BackPeakJ1function(PeriodTemperatureWaterGrainsize,X,a)

%fit Burgers model with only background
%X is the fitting parameter a=1 PeakBackfit, a=2 Backfit, a=3 Peakfit
% result the fitting parameter

Period=PeriodTemperatureWaterGrainsize(:,1);
Temperature=PeriodTemperatureWaterGrainsize(:,2);
Water=PeriodTemperatureWaterGrainsize(:,3);
Grainsize=PeriodTemperatureWaterGrainsize(:,4);
%-----------------------------------------------------------------------------
rWater=X(1);
% Et=X(2);
alpha=X(3);
E=X(4);
ita=X(5);
high0=X(6);
low0=X(7);
JuT=X(8);
Ju0=X(9);
strengthBack=X(10);
% EP=X(16);
Ek=X(12);
peak0=X(13);
theta=0.04;
deltaPeak=X(14);
rWaterP=X(11);
% rWaterP=1.0;
% Ets=X(17);
mGrain=1;
rWaters=X(2);
% Es=X(18);
% mGraink=X(18);
%------------------------------------------------------------------------------

FunBackground=@ (tol,alpha2,Period2)alpha2.*tol.^(alpha2-1)./(Period2.^2+4.*pi.^2.*tol.^2);
FunPeak=@(tol,Period2,theta2,peak2) 1./(theta2.*tol.*(2.*pi).^0.5).*exp(-0.5.*(-log(tol/peak2)/theta2).^2)./(Period2.^2+4.*pi.^2.*tol.^2);

%---------------------------------------------------------------------------------------
Tolhigh=zeros(numel(Period),1);
Tollow=zeros(numel(Period),1);
Tolita=zeros(numel(Period),1);
delta=zeros(numel(Period),1);
InterBackground=zeros(numel(Period),1);

BackPeakJ1=zeros(numel(Period),1);
Peak=zeros(numel(Period),1);
InterPeak=zeros(numel(Period),1);
E0=zeros(numel(Period),1);
deltaPeak1=zeros(numel(Period),1);
% strengthBack1=zeros(numel(Period),1);
J1=zeros(numel(Period),1);
% deltaJu=zeros(numel(Period),1);
%-----------------------------------------------------------------------------------------
for i=1:numel(Period)

     E0(i)=E-Ek.*log(Water(i)/200);
     
Tolhigh(i)=Tol(Temperature(i),Water(i),Grainsize(i),[high0,E0(i),0,mGrain]);
Tollow(i)=Tol(Temperature(i),Water(i),Grainsize(i),[low0,E0(i),0,mGrain]);
Tolita(i)=Tol(Temperature(i),Water(i),Grainsize(i),[ita,E0(i),rWaters,3]);

% strengthBack1(i)=deltafunction(Temperature(i),Water(i),Grainsize(i),strengthBack,0,0,Et);
% strengthBack1(i)=deltafunction(Water(i),Grainsize(i),strengthBack,mGrainP,0);
delta(i)=strengthBack./((Tolhigh(i)).^alpha-(Tollow(i).^alpha)).*(Water(i)/200)^rWater;

% Peak(i)=Tol(Temperature(i),Water(i),Grainsize(i),[peak0,EP,rWaterPt,0]);
% Peak(i)=peak0+rWaterPt.*0.96332.^Water(i)+Epk.*(Temperature(i)-1073)*0.01;

% if Temperature(i)>1073
%     Peak(i)=peak0+EP*(Temperature(i)-1073)*0.01;
% else
     Peak(i)=peak0;
% end

% deltaJu(i)=deltaJuFun(Temperature(i),Grainsize(i),0, Water(i),0,Et);
% deltaPeak1(i)=deltafunction(Water(i),Grainsize(i),deltaPeak,rWaterP,0);
% deltaPeak1(i)=Tol(Temperature(i),Water(i),Grainsize(i),[deltaPeak,E0(i),-rWaterP,0]);
% deltaPeak1(i)=Tol(Temperature(i),Water(i),Grainsize(i),[deltaPeak,Es,-rWaterP,Es]);

deltaPeak1(i)=deltaPeak.*(Water(i)/200)^rWaterP;
% ------------------------------------------------------------------------------------------------------
 if a==1
     InterPeak(i)=deltaPeak1(i).*integral(@(tol)FunPeak(tol,Period(i),theta,Peak(i)),0,inf);
%      syms tol1
%      g=FunPeak(tol1,Period(i),theta1(i),Peak(i));
%      g=@(tol)FunPeak(tol,Period(i),theta1(i),Peak(i));
%      InterPeak(i)=deltaPeak1(i).*vpaintegral(g,0,inf);  
%      InterPeak(i)=deltaPeak1(i).*integral(@(tol)FunPeak(tol,Period(i),theta1(i),Peak(i)),1e-5,1e3);
     InterBackground(i)=delta(i).*integral(@(tol) FunBackground(tol,alpha,Period(i)),Tollow(i),Tolhigh(i));

 elseif a==2
     InterPeak(i)=0;
     InterBackground(i)=delta(i).*integral(@(tol) FunBackground(tol,alpha,Period(i)),Tollow(i),Tolhigh(i));

 elseif a==3
           
    InterPeak(i)=deltaPeak1(i).*integral(@(tol)FunPeak(tol,Period(i),theta,Peak(i)),0,inf);
     InterBackground(i)=0;
     

 end
%  --------------------------------------------------------------------------------------------------------
%     J1(i)=Ju(Temperature(i),JuT,Ju0)+Period(i).^2.*(InterBackground(i)+InterPeak(i))+0*ita;
J1(i)=Ju(Temperature(i),JuT,Ju0)+Ju(Temperature(i),JuT,Ju0).*Period(i).^2.*(InterBackground(i)+InterPeak(i))+0*ita;
       BackPeakJ1(i)=J1(i);

end
% ----------------------------------------------------------------------------------------- 
end