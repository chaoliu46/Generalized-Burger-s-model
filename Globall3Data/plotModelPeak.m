function plotModelPeak(app1,app2,Temperature,grainsize,water,x)

%  str=num2str(Temperature);
%  gra=num2str(grainsize);

 j=(-3):0.1:4;
Periodfit=10.^(j);
% Periodfit=[0.01 0.02 0.05 0.08 0.1 1 5 10 15 20 50 100 200 300 500 1000 1500 2000 5000 7000 1e4]; 
Temperaturefit=repmat(Temperature,[1,71]);
Waterfit=repmat(water,[1,71]);
 Grainfit=repmat(grainsize,[1,71]);

 J2logfit=BackPeakJ2function([Periodfit',Temperaturefit',Waterfit',Grainfit'],x,3);
 J1fit=BackPeakJ1function([Periodfit',Temperaturefit',Waterfit',Grainfit'],x,3);
 
Shearfit=((10.^J2logfit).^2+J1fit.^2).^(-0.5);
 Qm1fit=J2logfit-log(J1fit); 
 semilogx(app1,Periodfit,Qm1fit)
  hold (app1,'on')
  title(app1,['Model', ' (peak)'])
 xlabel(app1,'period (s)')
 ylabel(app1,'log(Q^{-1}')
 semilogx(app2,Periodfit,Shearfit)
  hold (app2,'on')
 
 title(app2,['Model', ' (peak)'])
 xlabel(app2,'period (s)')
 ylabel(app2,'Shear (GPa)')
%  legend(['Temperauture' str 'K grian size' gra 'um'])

end