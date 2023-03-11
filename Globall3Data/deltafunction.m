function delta=deltafunction(watercontent,grainsize,delta0,r,m)


% cR=874;
cR=100;

TR=1173;
% TR=973;

dR=100;
k=8.3;


% delta=1./(deltaT.*(temperature-TR)+delta0.*(grainsize./dR).^(m).*(watercontent./cR).^(-r));
% delta=delta0.*(grainsize./dR).^(-m).*(watercontent./cR).^(r).*exp(E./k.*(1./T-1./TR ));
delta=delta0.*(grainsize./dR).^(-m).*(watercontent./cR).^(r);
if lt(delta,0) 
    delta=1e-20;
end

end