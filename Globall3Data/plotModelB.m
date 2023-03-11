function plotModelB(app,Temperature,grainsize,water,x,b)

 str=num2str(Temperature);
 gra=num2str(grainsize);
 j=(-3):0.1:4;
Periodfit=10.^(j);
% Periodfit=[0.01 0.02 0.05 0.08 0.1 1 5 10 15 20 50 100 200 300 500 1000 1500 2000 5000 7000 1e4]; 
Temperaturefit=repmat(Temperature,[1,71]);
Waterfit=repmat(water,[1,71]);
 Grainfit=repmat(grainsize,[1,71]);

 J2logfit=BackPeakJ2function([Periodfit',Temperaturefit',Waterfit',Grainfit'],x,b);
 J1fit=BackPeakJ1function([Periodfit',Temperaturefit',Waterfit',Grainfit'],x,b);
 
 Shearfit=((10.^J2logfit).^2+J1fit.^2).^(-0.5);
%  Qm1fit=J2logfit-log(J1fit); 
 
% semilogx(Periodfit,J1)
 semilogx(app,Periodfit,Shearfit)
  hold (app,'on')
 
 
 title(app,['Model', ' (background+peak)'])
 xlabel(app,'period (s)')
 ylabel(app,'Shear(GPa)')


%  legend(['Temperauture' str 'K grian size' gra 'um'])

end