function plotModelPaper(Temperature,grainsize,water,x,b,mark,type)


%  str=num2str(Temperature);
 wat=num2str(water);
 
 j=(-2):0.1:3;
Periodfit=10.^(j);
% Periodfit=[0.5 1 2 5 10 20 50 100 1000];
num=numel(Periodfit);
% Periodfit=[0.01 0.02 0.05 0.08 0.1 1 5 10 15 20 50 100 200 300 500 1000 1500 2000 5000 7000 1e4]; 
Temperaturefit=repmat(Temperature,[1,num]);
Waterfit=repmat(water,[1,num]);
 Grainfit=repmat(grainsize,[1,num]);
 J2logfit=BackPeakJ2function([Periodfit',Temperaturefit',Waterfit',Grainfit'],x,b);
 J1fit=BackPeakJ1function([Periodfit',Temperaturefit',Waterfit',Grainfit'],x,b);
 name=['\leftarrow ' wat ' ppm Wt. H_{2}O'];
 Gra=num2str(grainsize./1000);
 tit=['Generalized Buregrs Model (T=1273 K grain=' Gra ' mm)'];
%  name=['\leftarrow ' wat ' K'];
 Shearfit=((10.^J2logfit).^2+J1fit.^2).^(-0.5);
 Qm1fit=J2logfit-log10(J1fit);
%  Qm1fit=exp(Qm1fit);
%  f=figure;
if type==1
  semilogx(Periodfit,Qm1fit,mark);
 ylim([-4 0])
 ylabel('log(Q^{-1})')
  if b==1
 text(Periodfit(40),Qm1fit(40),name)
 end
else
  semilogx(Periodfit,Shearfit,mark);
   text(Periodfit(30),Shearfit(30),name)
   ylabel('Shear modulus )GPa')
end
%  semilogx(f2,Periodfit,Shearfit);
 hold on
 ax=gca;
ax.TickDir='out';
 title(tit)
%  title('Generalized Buregrs Model (water=100 ppm.Wt% grain=1 um)')
%  xlabel('period (s)')
%  ylabel('Shear(GPa)')
  xlabel('Period (s)')
 
 xlim([1e-1 1e3])
%  ylim([1e-4 0])
%  legend(['Temperauture' str 'K grian size' gra 'um'])

end