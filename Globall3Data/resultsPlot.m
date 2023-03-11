function resultsPlot(app,Temperature, grainsize, water,x,type,b)
% type is 1 for shear and 2 for Q-1
%b if 1 for backgorund and 2 for back and other for peak
j=(-3):0.1:4;
Periodfit=10.^(j);
Temperaturefit=repmat(Temperature,[1,71]);
Waterfit=repmat(water,[1,71]);
 Grainfit=repmat(grainsize,[1,71]);

 J2logfit=BackPeakJ2function([Periodfit',Temperaturefit',Waterfit',Grainfit'],x,b);
 J1fit=BackPeakJ1function([Periodfit',Temperaturefit',Waterfit',Grainfit'],x,b);
 txtgra=num2str(grainsize);
 textwat=num2str(water);
 txtTem=num2str(Temperature-273);
 name=['\leftarrow grain ' txtgra ' um water ' textwat ' ppm Temperature ' txtTem '^{0}C' ];
 color=rand(3,1);
 
 Shearfit=((10.^J2logfit).^2+J1fit.^2).^(-0.5);
 Qm1fit=J2logfit-log(J1fit); 
%  k=Periodfit(60)
% semilogx(Periodfit,J1)
if type==1
 semilogx(app,Periodfit,Shearfit,'color',color)
 
 text(app,Periodfit(40),Shearfit(40),name,'color',color)
 ylabel(app,'Shear(GPa)')
   hold (app,'on')
   
else
    
   semilogx(app,Periodfit,Qm1fit,'-','color',color)
   text(app,Periodfit(40),Qm1fit(40),name,'color',color)
   
 ylabel(app,'log(Q^{-1})')
   hold (app,'on')
end
 if b==1
 title(app,['Model', ' (background+peak)'])
 elseif b==2
     title(app,['Model', ' (background)'])
  end
 xlabel(app,'period (s)')
 

end