function Vs=plotVelocity(Period,grainsize,water,x,b,mark)


%  str=num2str(Temperature);
 wat=num2str(water);
 Per=num2str(Period);
rol0=3.3;%g/cm3
% Temperature=(473):10:1573;
TemperaDepth=thermal();
Temperature=TemperaDepth(:,4)+273;
depth=TemperaDepth(:,1);
rol=rol0./(1-rol0*8.7*10^(-6).*depth);
% Periodfit=10.^(j);
num=numel(Temperature);
% Periodfit=[0.01 0.02 0.05 0.08 0.1 1 5 10 15 20 50 100 200 300 500 1000 1500 2000 5000 7000 1e4]; 
Temperaturefit=Temperature';
Waterfit=repmat(water,[1,num]);
 Grainfit=repmat(grainsize,[1,num]);
 Periodfit=repmat(Period,[1,num]);
 J2logfit=BackPeakJ2function([Periodfit',Temperaturefit',Waterfit',Grainfit'],x,b);
 J1fit=BackPeakJ1function([Periodfit',Temperaturefit',Waterfit',Grainfit'],x,b);
 name=['\leftarrow ' wat ' ppm Wt. H_{2}O'];
 Gra=num2str(grainsize./1000);
 tit=['Generalized Buregrs Model (Period=' Per 's grain=' Gra ' mm)'];
%  name=['\leftarrow ' wat ' K'];
%  Shearfit=((10.^J2logfit).^2+J1fit.^2).^(-0.5);
 Qm1fit=J2logfit-log10(J1fit); 
 J2fit=10.^(J2logfit);
%  Vs=(J1fit.*rol).^(-0.5);
Vs=(J1fit.*rol.*(0.5.*(1+(1+(J2fit./J1fit).^2).^(0.5)))).^(-0.5);
 Vs=Vs./4.70;
%  Vs=Vs./4.8940;
%  f=figure;
  plot(Vs,depth,mark);
%   plot(Vs,Temperature,mark);
%  semilogx(f2,Periodfit,Shearfit);
 hold on
 ax=gca;
ax.TickDir='out';
 if b==0
 text(Vs(5),depth(5),name)
 end
%  title('Generalized Buregrs Model (T=1373 K grain=1 mm)')
 title(tit)
%  xlabel('period (s)')
%  ylabel('Shear(GPa)')
%  xlabel('Velocity (km/s)')
xlabel('V/V_{reference}')
 ylabel('depth (km)')
 
%  ylim([0 0])

%  legend(['Temperauture' str 'K grian size' gra 'um'])

end