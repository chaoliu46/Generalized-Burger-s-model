function Aplotapp(app,J2,Period,x,m,b)


% Periodfit=[0.01 0.02 0.05 0.08 0.1 1 5 10 15 20 50 100 200 300 500 1000 1500 2000 5000 7000 1e4]; 
j=(-3):0.1:4;
Periodfit=10.^(j);
Temperaturefit=repmat([1373 1323 1273 1223]',[4,71]);
Waterfit=repmat([repmat(38,[1,4]) repmat(143,[1,4]) repmat(77,[1,4]) repmat(9,[1,4])]',[1,71]);
 Grainfit=repmat([repmat(6,[1,4]) repmat(12,[1,4]) repmat(11,[1,4]) repmat(6.2,[1,4])]',[1,71]);
%  Xfit=repmat(x,[16,1]);
% if i==11
%     fun=@ (PeriodTemperatureWaterGrainsize,X) BackPeakJ1function(PeriodTemperatureWaterGrainsize,X);
% elseif i==12
    fun=@(PeriodTemperatureWaterGrainsize,X)BackPeakJ2function(PeriodTemperatureWaterGrainsize,X,b);
% elseif i==71


% raw=zeros(71,16);
% c=zeros(71,16);
J2logfit=zeros(71,16);
% J2fit=zeros(71,16);
for i=1:4
    for j=1:4
J2logfit(:,(4*(i-1)+j))=(fun([Periodfit' Temperaturefit((4*(i-1)+j),:)' Waterfit((4*(i-1)+j),:)', Grainfit((4*(i-1)+j),:)'],x));
%  J2fit(:,(4*(i-1)+j))=J2function([Periodfit' Temperaturefit((4*(i-1)+j),:)' Waterfit((4*(i-1)+j),:)', Grainfit((4*(i-1)+j),:)'],x);
%  raw(:,(4*(i-1)+j))=((10.^J2logfit(:,(4*(i-1)+j))).^2+J2fit(:,(4*(i-1)+j)).^2).^(-0.5);
%  c(:,(4*(i-1)+j))=J2logfit(:,(4*(i-1)+j))-log(J2fit(:,(4*(i-1)+j))); 
 
    end
end




%  M2810
No=1;
r=8; % number of periods
j=0; %bottom

 semilogx(app.UIAxes,Periodfit,J2logfit(:,No), 'red',Period((1+j):(j+r)), J2((1+j):(j+r)),'red o')
 hold (app.UIAxes,'on')
 semilogx(app.UIAxes,Periodfit,J2logfit(:,(No+1)), 'magenta', Period((1+j+r):(j+2*r)), J2((1+j+r):(j+2*r)),'magenta o')
 hold (app.UIAxes,'on')
 semilogx(app.UIAxes,Periodfit,J2logfit(:,(No+2)), 'green',Period((1+j+2*r):(j+3*r)), J2((1+j+2*r):(j+3*r)),'green o')
 hold (app.UIAxes,'on')
 semilogx(app.UIAxes,Periodfit,J2logfit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r)), J2((1+j+3*r):(j+4*r)),'blue o')
 hold (app.UIAxes,'on')
 title(app.UIAxes,['M2810', ' (background+peak)'])
  xlabel(app.UIAxes,'period (s)')
ylabel(app.UIAxes,m)
axis(app.UIAxes,[1e-2 1e4 -6 -0.5])
% hold (app.UIAxes,'off')
% % 
%  subplot(2, 2, 2)
%  M2863

No=5;
r=10; % number of periods
j=32; %bottom
 semilogx(app.UIAxes2,Periodfit,J2logfit(:,No), 'red',Period((1+j):(j+r)), J2((1+j):(j+r)),'red o')
  hold (app.UIAxes2,'on')
 semilogx(app.UIAxes2,Periodfit,J2logfit(:,(No+1)), 'magenta', Period((1+j+r):(j+2*r)), J2((1+j+r):(j+2*r)),'magenta o')
  hold (app.UIAxes2,'on')
 semilogx(app.UIAxes2,Periodfit,J2logfit(:,(No+2)), 'green',Period((1+j+2*r):(j+3*r)), J2((1+j+2*r):(j+3*r)),'green o')
  hold (app.UIAxes2,'on')
 semilogx(app.UIAxes2,Periodfit,J2logfit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r)), J2((1+j+3*r):(j+4*r)),'blue o')
  hold (app.UIAxes2,'on')
 title(app.UIAxes2,['M2817', ' (background+peak)'])
xlabel(app.UIAxes2,'period (s)')
ylabel(app.UIAxes2,m)
axis(app.UIAxes2,[1e-2 1e4 -6 -0.5])
% hold (app.UIAxes2,'off')
% subplot(2, 2,3)
% %  M23093

No=9;
r=10; % number of periods
j=72; %bottom
 semilogx(app.UIAxes3,Periodfit,J2logfit(:,No), 'red',Period((1+j):(j+r)), J2((1+j):(j+r)),'red o')
 hold (app.UIAxes3,'on')
 semilogx(app.UIAxes3,Periodfit,J2logfit(:,(No+1)), 'magenta', Period((1+j+r):(j+2*r)), J2((1+j+r):(j+2*r)),'magenta o')
 hold (app.UIAxes3,'on')
 semilogx(app.UIAxes3,Periodfit,J2logfit(:,(No+2)), 'green',Period((1+j+2*r):(j+3*r)), J2((1+j+2*r):(j+3*r)),'green o')
 hold (app.UIAxes3,'on')
 semilogx(app.UIAxes3,Periodfit,J2logfit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r)), J2((1+j+3*r):(j+4*r)),'blue o')
 hold (app.UIAxes3,'on')
 title(app.UIAxes3,['M2863', ' (background+peak)'])
xlabel(app.UIAxes3,'period (s)')
ylabel(app.UIAxes3,m)
axis(app.UIAxes3,[1e-2 1e4 -6 -0.5])
% hold (app.UIAxes3,'off')

% subplot(2, 2, 4)
% %  M2810

No=13;
r=10; % number of periods
j=112; %bottom
 semilogx(app.UIAxes4,Periodfit,J2logfit(:,No), 'red',Period((1+j):(j+r)), J2((1+j):(j+r)),'red o')
 hold (app.UIAxes4,'on')
 semilogx(app.UIAxes4,Periodfit,J2logfit(:,(No+1)), 'magenta', Period((1+j+r):(j+2*r)), J2((1+j+r):(j+2*r)),'magenta o')
  hold (app.UIAxes4,'on')
 semilogx(app.UIAxes4,Periodfit,J2logfit(:,(No+2)), 'green',Period((1+j+2*r):(j+3*r)), J2((1+j+2*r):(j+3*r)),'green o')
  hold (app.UIAxes4,'on')
 semilogx(app.UIAxes4,Periodfit,J2logfit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r-4)), J2((1+j+3*r):(j+4*r-4)),'blue o')
  hold (app.UIAxes4,'on')
 title(app.UIAxes4,['M3093', ' (background+peak)'])
xlabel(app.UIAxes4,'period (s)')
ylabel(app.UIAxes4,m)
axis(app.UIAxes4,[1e-2 1e4 -6 -0.5])
% hold (app.UIAxes4,'off')
%  text(4, max(J2logfit(:,1))-1.5,txt1)
%  text(4, max(J2logfit(:,1))-2,txt3)
%  text(4, max(J2logfit(:,1))-2.5,txt2)
%  text(4, max(J2logfit(:,1))-3,txt4)
%  text(4, max(J2logfit(:,1))-3.5,txt5)
% text(10,(min(J2logfit(:,1)))-1,txt02)
% legend('J2-1100C-fitting','J2-1100C','J2-1050C-fitting','J2-1050C','J2-1000C-fitting','J2-1000C','J2-950C-fitting','J2-950C','Location','northwest');

% Periodfit=[0.01 0.02 0.05 0.08 0.1 1 5 10 15 20 50 100 200 300 500 1000 1500 2000 5000 7000 1e4]; 
j=(-3):0.1:4;
Periodfit=10.^(j);
Temperaturefit=repmat([1373 1273 1223]',[1,71]);
Waterfit=repmat([50 50 50]',[1,71]);
 Grainfit=repmat([6.0 6.0 6.0]',[1,71]);
 for i=1:3
 J2logfit(:,i)=fun([Periodfit',Temperaturefit(i,:)',Waterfit(i,:)',Grainfit(i,:)'],x);
 end
% No=17;
r=10; % number of periods
j=148; %bottom
 semilogx(app.UIAxes5,Periodfit,J2logfit(:,1), 'red',Period((1+j):(j+r)), J2((1+j):(j+r)),'red o')
  hold (app.UIAxes5,'on')
 semilogx(app.UIAxes5,Periodfit,J2logfit(:,2), 'magenta', Period((1+j+r):(j+2*r)), J2((1+j+r):(j+2*r)),'magenta o')
  hold (app.UIAxes5,'on')
 semilogx(app.UIAxes5,Periodfit,J2logfit(:,3), 'green',Period((1+j+2*r):(j+3*r)), J2((1+j+2*r):(j+3*r)),'green o')
  hold (app.UIAxes5,'on')
%  semilogx(Periodfit,J2logfit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r-4)), J2((1+j+3*r):(j+4*r-4)),'blue o');hold on
 title(app.UIAxes5,['M3097', ' (background+peak)'])
xlabel(app.UIAxes5,'period (s)')
ylabel(app.UIAxes5,m)
axis(app.UIAxes5,[1e-2 1e4 -6 -0.5])

end
