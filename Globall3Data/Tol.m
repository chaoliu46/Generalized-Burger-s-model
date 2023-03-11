function Tol=Tol(Temperature,watercontent,grainsize,X)

R=8.3;
% cR=840;
cR=840;
TR=1173;
% k=X(8);
% dR=76;
% dR=56;
dR=76;
tol0=X(1);
 E=X(2);
 m=X(4);
 r=X(3);

 d=grainsize;
 C=watercontent;

% Tol=tol0.*(grainsize/dR)^(m).*(water/cR)^r.*exp(E/R(1/Temperature-1/TR));
% Tol=tol0.*((d./dR).^m).*((C./cR).^r).*exp(E./R.*(1/Temperature-1/TR));
Tol=tol0.*((d./dR).^(m)).*((C./cR).^(-r)).*exp(E./R.*(1/Temperature-1/TR));
end