function results=plotMfile(Shear,Qm1,Period,x,b)



% Periodfit=[0.01 0.02 0.05 0.08 0.1 1 5 10 15 20 50 100 200 300 500 1000 1500 2000 5000 7000 1e4]; 
j=(-1):0.1:4;
Period1=10.^(j);
num=numel(Period1);
Periodfit=repmat(Period1,[1,4]);
% Temperaturefit=repmat([1373 1323 1273 1223],[1,num]);
Temperaturefit=[repmat(1373,[1,num]) repmat(1323,[1,num]) repmat(1273,[1,num]) repmat(1223,[1,num])];
Grain=repmat(repmat(6,[1,4]),[1,num]);
Water=repmat(repmat(9,[1,4]),[1,num]);
PTWG=[Periodfit' Temperaturefit' Water' Grain'];
J2logfit=BackPeakJ2function(PTWG,x,b);
J1fit=BackPeakJ1function(PTWG,x,b);
Shearfit=((10.^J2logfit.^2+J1fit.^2)).^(-0.5);
 Qm1fit=J2logfit-log10(J1fit); 

 f1=figure;
%  No=1;
r=10; % number of periods
j=0; %bottom
Qm1=log10(Qm1);
Period1=log10(Period1);
Period=log10(Period);
 plot(Period1,Qm1fit(1:num), 'red',Period((1+j):(j+r)), Qm1((1+j):(j+r)),'red o','MarkerFaceColor','r');hold on
 plot(Period1,Qm1fit((num+1):(2*num)), 'color',rgb('orange'));hold on
 plot(Period((1+j+r):(j+2*r)), Qm1((1+j+r):(j+2*r)),'o','color',rgb('orange'),'MarkerFaceColor',rgb('orange')); hold on
 plot(Period1,Qm1fit((2*num+1):(3*num)), 'g',Period((1+j+2*r):(j+3*r)), Qm1((1+j+2*r):(j+3*r)),'g o','MarkerFaceColor','g');hold on
 plot(Period1,Qm1fit((3*num+1):(4*num)), 'blue',Period((1+j+3*r):(end)), Qm1((1+j+3*r):(end)),'blue o','MarkerFaceColor','b');hold on
 title(['M2817', ' (background+peak)'])
  xlabel('log(Period (s))')
  set(gca,'XMinorTick','Off')
% ylabel(m)
ylabel('log(Q^{-1})')
ylim([-2.5 0.5])

%  f2=figure;
%  semilogx(Periodfit,Shearfit, Period, Shear,'red o');
f1=figure;
%  No=1;
r=10; % number of periods
j=0; %bottom
Qm1=log10(Qm1);
 plot(Period1,Shearfit(1:num), 'red',Period((1+j):(j+r)), Shear((1+j):(j+r)),'red o','MarkerFaceColor','r');hold on
 plot(Period1,Shearfit((num+1):(2*num)),'color', rgb('orange'));hold on
 plot(Period((1+j+r):(j+2*r)), Shear((1+j+r):(j+2*r)),'o','color',rgb('orange'),'MarkerFaceColor',rgb('orange')); hold on
  plot(Period1,Shearfit((2*num+1):(3*num)), 'g',Period((1+j+2*r):(j+3*r)), Shear((1+j+2*r):(j+3*r)),'g o','MarkerFaceColor','g');hold on
  plot(Period1,Shearfit((3*num+1):(4*num)), 'blue',Period((1+j+3*r):(end)), Shear((1+j+3*r):(end)),'blue o','MarkerFaceColor','b');hold on
 title(['M2817', ' (background+peak)'])
   xlabel('log(Period (s))')
  set(gca,'XMinorTick','Off')
  ylabel('Shear Modulus (GPa)')
ylim([0 70])
results=[Periodfit' Temperaturefit'  Qm1fit Shearfit];
end