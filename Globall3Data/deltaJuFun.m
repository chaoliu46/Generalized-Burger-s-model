function deltaJu=deltaJuFun(temperature,grainsize,m, watercontent,r,JuT)
k=JuT;

 T0=1173;
 dR=76;
 cR=840;
deltaJu=k.*(temperature-T0).*(grainsize./dR).^(-m).*(watercontent./cR).^r;
if lt(deltaJu,0) 
    deltaJu=0;
end
% deltaJu=log(deltaJu);
end