function AppplotQandS(app,Shear,Qm1,Period,x,b,type)
% AppPlotMfile(app,Shear,Qm1,Period,xvalue,1,0);
Qm1=log10(Qm1);


m='log(Q^{-1})';
n='Shear modulus(GPa)';
j=(-1):0.1:4;
Periodfit=10.^(j);
num=numel(Periodfit);
Temperaturefit=repmat([1373 1323 1273 1223]',[4,num]);

Waterfit=repmat([ repmat(143,[1,4]) repmat(77,[1,4]) repmat(9,[1,4]) repmat(200,[1,4])]',[1,num]);
Grainfit=repmat([ repmat(12,[1,4]) repmat(11,[1,4]) repmat(6.2,[1,4]) repmat(123,[1,4])]',[1,num]);

up=70;
Qm1fit=zeros(num,16);
Shearfit=zeros(num,16);
J1fit=zeros(num,16);
J2logfit=zeros(num,16);

for i=1:4
    for j=1:4
J2logfit(:,(4*(i-1)+j))=(BackPeakJ2function([Periodfit' Temperaturefit((4*(i-1)+j),:)' Waterfit((4*(i-1)+j),:)', Grainfit((4*(i-1)+j),:)'],x,b));
 J1fit(:,(4*(i-1)+j))=BackPeakJ1function([Periodfit' Temperaturefit((4*(i-1)+j),:)' Waterfit((4*(i-1)+j),:)', Grainfit((4*(i-1)+j),:)'],x,b);
 Shearfit(:,(4*(i-1)+j))=((10.^J2logfit(:,(4*(i-1)+j))).^2+J1fit(:,(4*(i-1)+j)).^2).^(-0.5);
 Qm1fit(:,(4*(i-1)+j))=J2logfit(:,(4*(i-1)+j))-log10(J1fit(:,(4*(i-1)+j))); 
 
    end
end



%  M2817

No=1;
r=10; % number of periods
j=0; %bottom
Period1=log10(Periodfit);
Period=log10(Period);
if type==1||type==0
plot(app.UIAxes,Period1,Qm1fit(:,No), 'red',Period((1+j):(j+r)), Qm1((1+j):(j+r)),'red o','MarkerFaceColor','r');hold (app.UIAxes,'on')
end
% ax=gca;
% ax.TickDir='out';

 if type==2||type==0
 plot(app.UIAxes,Period1,Qm1fit(:,(No+1)), 'color',rgb('orange'));hold (app.UIAxes,'on')
  plot(app.UIAxes,Period((1+j+r):(j+2*r)), Qm1((1+j+r):(j+2*r)),'o','color',rgb('orange'),'MarkerFaceColor',rgb('orange')); hold (app.UIAxes,'on')
 end
 
 if type==3||type==0
 plot(app.UIAxes,Period1,Qm1fit(:,(No+2)), 'g',Period((1+j+2*r):(j+3*r)), Qm1((1+j+2*r):(j+3*r)),'g o','MarkerFaceColor','g');hold (app.UIAxes,'on')
 end
 
 if type==4||type==0
 plot(app.UIAxes,Period1,Qm1fit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r)), Qm1((1+j+3*r):(j+4*r)),'blue o','MarkerFaceColor','b');hold (app.UIAxes,'on')
 end
 title(app.UIAxes,['M2817', ' (background+peak)'])
xlabel(app.UIAxes,'period (s)')
ylabel(app.UIAxes,m)
ylim(app.UIAxes,[-2.5 0])

% subplot(2, 2,2)
% %  M23093

No=5;
r=10; % number of periods
j=40; %bottom
if type==1||type==0
 plot(app.UIAxes3,Period1,Qm1fit(:,(No+0)), 'red',Period((1+j):(j+r)), Qm1((1+j):(j+r)),'red o','MarkerFaceColor','r');hold (app.UIAxes3,'on')
end
 %  ax=gca;
% ax.TickDir='out';
if type==2||type==0
 plot(app.UIAxes3,Period1,Qm1fit(:,(No+1)), 'color',rgb('orange'));hold (app.UIAxes3,'on')
 plot(app.UIAxes3,Period((1+j+r):(j+2*r)), Qm1((1+j+r):(j+2*r)),'o','color',rgb('orange'),'MarkerFaceColor',rgb('orange')); hold (app.UIAxes3,'on')
end
if type==3||type==0
 plot(app.UIAxes3,Period1,Qm1fit(:,(No+2)), 'g',Period((1+j+2*r):(j+3*r)), Qm1((1+j+2*r):(j+3*r)),'g o','MarkerFaceColor','g');hold (app.UIAxes3,'on')
end
if type==4||type==0
 plot(app.UIAxes3,Period1,Qm1fit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r)), Qm1((1+j+3*r):(j+4*r)),'blue o','MarkerFaceColor','b');hold (app.UIAxes3,'on')
end
 title(app.UIAxes3,['M2863', ' (background+peak)'])
xlabel(app.UIAxes3,'period (s)')
ylabel(app.UIAxes3,m)
ylim(app.UIAxes3,[-2.5 0])

% subplot(2, 2, 4)



No=9;
r=10; % number of periods
j=80; %bottom
if type==1||type==0
plot(app.UIAxes5,Period1,Qm1fit(:,(No+0)), 'red',Period((1+j):(j+r)), Qm1((1+j):(j+r)),'red o','MarkerFaceColor','r');hold (app.UIAxes5,'on')
end
%  ax=gca;
% ax.TickDir='out';
if type==2||type==0
 plot(app.UIAxes5,Period1,Qm1fit(:,(No+1)), 'color',rgb('orange'));hold (app.UIAxes5,'on')
 plot(app.UIAxes5,Period((1+j+r):(j+2*r)), Qm1((1+j+r):(j+2*r)),'o','color',rgb('orange'),'MarkerFaceColor',rgb('orange'));hold (app.UIAxes5,'on')
end
if type==3||type==0
 plot(app.UIAxes5,Period1,Qm1fit(:,(No+2)), 'g',Period((1+j+2*r):(j+3*r)), Qm1((1+j+2*r):(j+3*r)),'g o','MarkerFaceColor','g');hold (app.UIAxes5,'on')
 end
if type==4||type==0
 plot(app.UIAxes5,Period1,Qm1fit(:,(No+3)), 'blue',Period((1+j+3*r):(116)), Qm1((1+j+3*r):(116)),'blue o','MarkerFaceColor','b');hold (app.UIAxes5,'on')
end
 title(app.UIAxes5,['M3093', ' (background+peak)'])
xlabel(app.UIAxes5,'period (s)')
ylabel(app.UIAxes5,m)
ylim(app.UIAxes5,[-2.5 0])


%  text(4, max(Qm1fit(:,1))-2,txt3)



No=13;
r=10; % number of periods
j=116; %bottom

if type==1||type==0
plot(app.UIAxes7,Period1,Qm1fit(:,(No+0)), 'red',Period((1+j):(j+r-1)), Qm1((1+j):(j+r-1)),'red o','MarkerFaceColor','r');hold (app.UIAxes7,'on')

end
if type==2||type==0
 plot(app.UIAxes7,Period1,Qm1fit(:,(No+1)), 'color',rgb('orange'));hold (app.UIAxes7,'on')
 plot(app.UIAxes7,Period((j+r):(j+2*r-3-1)), Qm1((j+r):(j+2*r-3-1)),'o','color',rgb('orange'),'MarkerFaceColor',rgb('orange')); hold (app.UIAxes7,'on')
end
if type==3||type==0
 plot(app.UIAxes7,Period1,Qm1fit(:,(No+2)), 'g',Period((j+2*r-2-1):(j+3*r-3-1)), Qm1((j+2*r-2-1):(j+3*r-3-1)),'g o','MarkerFaceColor','g');hold (app.UIAxes7,'on')

end
if type==4||type==0
 plot(app.UIAxes7,Period1,Qm1fit(:,(No+3)), 'blue',Period((j+3*r-2-1):(end)), Qm1((j+3*r-2-1):(end)),'blue o','MarkerFaceColor','b');hold (app.UIAxes7,'on')
end
 title(app.UIAxes7,['M3356', ' (background+peak)'])
xlabel(app.UIAxes7,'period (s)')
ylabel(app.UIAxes7,m)
ylim(app.UIAxes7,[-2.5 0])



%----------------------------------------------------------------------------------------------------------------------------------


% % 


%  subplot(2, 2, 1)
%  M2817

No=1;
r=10; % number of periods
j=0; %bottom

if type==1||type==0
plot(app.UIAxes2,Period1,Shearfit(:,No), 'red',Period((1+j):(j+r)), Shear((1+j):(j+r)),'red o','MarkerFaceColor','r');hold (app.UIAxes2,'on')
end
if type==2||type==0 
plot(app.UIAxes2,Period1,Shearfit(:,(No+1)),'color', rgb('orange'));hold (app.UIAxes2,'on')
 plot(app.UIAxes2,Period((1+j+r):(j+2*r)), Shear((1+j+r):(j+2*r)),'o','color',rgb('orange'),'MarkerFaceColor',rgb('orange')); hold (app.UIAxes2,'on')
 end
if type==3||type==0
 plot(app.UIAxes2,Period1,Shearfit(:,(No+2)), 'g',Period((1+j+2*r):(j+3*r)), Shear((1+j+2*r):(j+3*r)),'g o','MarkerFaceColor','g');hold (app.UIAxes2,'on')
end
if type==4||type==0
 plot(app.UIAxes2,Period1,Shearfit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r)), Shear((1+j+3*r):(j+4*r)),'blue o','MarkerFaceColor','b');hold (app.UIAxes2,'on')
end
 title(app.UIAxes2,['M2817', ' (background+peak)'])
xlabel(app.UIAxes2,'period (s)')
ylabel(app.UIAxes2,n)
ylim(app.UIAxes2,[0 up])
% ax=gca;
% ax.TickDir='out';
% subplot(2, 2,2)
% %  M23093

No=5;
r=10; % number of periods
j=40; %bottom

if type==1||type==0
plot(app.UIAxes4,Period1,Shearfit(:,No), 'red',Period((1+j):(j+r)), Shear((1+j):(j+r)),'red o','MarkerFaceColor','r');hold (app.UIAxes4,'on')
end
if type==2||type==0
plot(app.UIAxes4,Period1,Shearfit(:,(No+1)),'color', rgb('orange'));hold (app.UIAxes4,'on')
 plot(app.UIAxes4,Period((1+j+r):(j+2*r)), Shear((1+j+r):(j+2*r)),'o','color',rgb('orange'),'MarkerFaceColor',rgb('orange')); hold (app.UIAxes4,'on')
 end
if type==3||type==0
 plot(app.UIAxes4,Period1,Shearfit(:,(No+2)), 'g',Period((1+j+2*r):(j+3*r)), Shear((1+j+2*r):(j+3*r)),'g o','MarkerFaceColor','g');hold (app.UIAxes4,'on')
 end
if type==4||type==0
 plot(app.UIAxes4,Period1,Shearfit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r)), Shear((1+j+3*r):(j+4*r)),'blue o','MarkerFaceColor','b');hold (app.UIAxes4,'on')
end
 title(app.UIAxes4,['M2863', ' (background+peak)'])
xlabel(app.UIAxes4,'period (s)')
ylabel(app.UIAxes4,n)
ylim(app.UIAxes4,[0 up])
% ax=gca;
% ax.TickDir='out';
% subplot(2, 2, 4)
% %  M2810


No=9;
r=10; % number of periods
j=80; %bottom

if type==1||type==0
plot(app.UIAxes6,Period1,Shearfit(:,No), 'red',Period((1+j):(j+r)), Shear((1+j):(j+r)),'red o','MarkerFaceColor','r');hold (app.UIAxes6,'on')
end
if type==2||type==0
plot(app.UIAxes6,Period1,Shearfit(:,(No+1)),'color', rgb('orange'));hold (app.UIAxes6,'on')
 plot(app.UIAxes6,Period((1+j+r):(j+2*r)), Shear((1+j+r):(j+2*r)),'o','color',rgb('orange'),'MarkerFaceColor',rgb('orange')); hold (app.UIAxes6,'on')
 end
if type==3||type==0
 plot(app.UIAxes6,Period1,Shearfit(:,(No+2)), 'g',Period((1+j+2*r):(j+3*r)), Shear((1+j+2*r):(j+3*r)),'g o','MarkerFaceColor','g');hold (app.UIAxes6,'on')
end
if type==4||type==0
 plot(app.UIAxes6,Period1,Shearfit(:,(No+3)), 'blue',Period((1+j+3*r):(116)), Shear((1+j+3*r):(116)),'blue o','MarkerFaceColor','b');hold (app.UIAxes6,'on')
end
 title(app.UIAxes6,['M3093', ' (background+peak)'])
xlabel(app.UIAxes6,'period (s)')
ylabel(app.UIAxes6,n)
% ax=gca;
% ax.TickDir='out';
ylim(app.UIAxes6,[0 up])
%  text(4, max(Shearfit(:,1))-1.5,txt1)


No=13;
r=10; % number of periods
j=116; %bottom

if type==1||type==0
plot(app.UIAxes8,Period1,Shearfit(:,No), 'red',Period((1+j):(j+r-1)), Shear((1+j):(j+r-1)),'red o','MarkerFaceColor','r');hold (app.UIAxes8,'on')
end
if type==2||type==0
plot(app.UIAxes8,Period1,Shearfit(:,(No+1)),'color', rgb('orange'));hold (app.UIAxes8,'on')
 plot(app.UIAxes8,Period((j+r):(j+2*r-3-1)), Shear((j+r):(j+2*r-3-1)),'o','color',rgb('orange'),'MarkerFaceColor',rgb('orange')); hold (app.UIAxes8,'on')
 end
if type==3||type==0
 plot(app.UIAxes8,Period1,Shearfit(:,(No+2)), 'g',Period((j+2*r-2-1):(j+3*r-3-1)), Shear((j+2*r-2-1):(j+3*r-3-1)),'g o','MarkerFaceColor','g');hold (app.UIAxes8,'on')
 end
if type==4||type==0
 plot(app.UIAxes8,Period1,Shearfit(:,(No+3)), 'blue',Period((j+3*r-2-1):(end)), Shear((j+3*r-2-1):(end)),'blue o','MarkerFaceColor','b');hold (app.UIAxes8,'on')
end
 title(app.UIAxes8,['M3356', ' (background+peak)'])
xlabel(app.UIAxes8,'period (s)')
ylabel(app.UIAxes8,n)
% ax=gca;
% ax.TickDir='out';
ylim(app.UIAxes8,[0 up])



end
