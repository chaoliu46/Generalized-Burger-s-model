







Temperature=1373;
Water=9;
Grainsize=6;
% theta=0.3;
EP=1e4;
rWaterP=0;
peak0=1e1;
mGrain=1.0;
% deltaPeak=600;
% rWaterk=1.5;
% Et=-0.5;
% % k=Tol(Temperature,Water,Grainsize,[theta,-EP,rWaterP,-mGrain])
% k=deltafunction(Temperature,Water,Grainsize,deltaPeak,rWaterk,0,Et)
Peak=Tol(Temperature,Water,Grainsize,[peak0,-EP,rWaterP,mGrain])
% E=350;
% Ek=0.4;
% Water=143;
% k=E-Ek.*Water