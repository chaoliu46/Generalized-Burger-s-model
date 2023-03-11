function plotModel(app,Temperature,grainsize,water,x,b)

 str=num2str(Temperature);
 gra=num2str(grainsize);
 j=(-3):0.1:4;
Periodfit=10.^(j);
Temperaturefit=repmat(Temperature,[1,71]);
Waterfit=repmat(water,[1,71]);
 Grainfit=repmat(grainsize,[1,71]);

 J2logfit=BackPeakJ2function([Periodfit',Temperaturefit',Waterfit',Grainfit'],x,b);
 J1fit=BackPeakJ1function([Periodfit',Temperaturefit',Waterfit',Grainfit'],x,b);
 
% Shearfit=((10.^J2logfit).^2+J1fit.^2).^(-0.5);
 Qm1fit=J2logfit-log(J1fit); 
 semilogx(app,Periodfit,Qm1fit)
  hold (app,'on')
 
 
 title(app,['Model', ' (background+peak)'])
 xlabel(app,'period (s)')
 ylabel(app,'log(Q^{-1}')
%  legend(['Temperauture' str 'K grian size' gra 'um'])

end