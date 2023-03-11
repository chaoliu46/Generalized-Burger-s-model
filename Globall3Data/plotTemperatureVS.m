function plotTemperatureVS(Period,grainsize,water,x,b,mark)


%  str=num2str(Temperature);
 wat=num2str(water);

% Temperature=(473):10:1573;
TemperaDepth=thermal();
Temperature=TemperaDepth(:,1)+273;
depth=TemperaDepth(:,1);
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
 Gra=num2str(grainsize);
 tit=['Generalized Buregrs Model (Period=100 s grain=' Gra ' um)'];
%  name=['\leftarrow ' wat ' K'];
%  Shearfit=((10.^J2logfit).^2+J1fit.^2).^(-0.5);
 Qm1fit=J2logfit-log10(J1fit); 
%  Q=Qm1fit;
%  f=figure;
  semilogx(Qm1fit,depth,mark);
%  semilogx(f2,Periodfit,Shearfit);
 hold on
 if b==1
 text(Qm1fit(30),depth(30),name)
 end
%  title('Generalized Buregrs Model (T=1373 K grain=1 mm)')
 title(tit)
%  xlabel('period (s)')
%  ylabel('Shear(GPa)')
 ylabel('depth (km)')
 xlabel('log(Q^{-1})')
 ax=gca;
% ax.XDir = 'reverse';
ax.YDir = 'reverse';
ylim([40 140])
%  ylim([-50 0])

%  legend(['Temperauture' str 'K grian size' gra 'um'])

end