function AplotappPeak(app,x,m,i,k)

j=(-3):0.1:4;
Periodfit=10.^(j);
% Periodfit=[0.001:0.009:1 1.1:1:10.1 10:1:100 101:100:10000 ]; 
Temperaturefit=repmat([1373 1323 1273 1223]',[4,71]);
Waterfit=repmat([repmat(25,[1,4]) repmat(143,[1,4]) repmat(77,[1,4]) repmat(9,[1,4])]',[1,71]);
 Grainfit=repmat([repmat(6,[1,4]) repmat(12,[1,4]) repmat(11,[1,4]) repmat(6.2,[1,4])]',[1,71]);
%  Xfit=repmat(x,[16,1]);
% if i==1
    fun=@ (PeriodTemperatureWaterGrainsize,X) BackPeakJ2function(PeriodTemperatureWaterGrainsize,X,i);
% elseif i==0
%     fun=@(PeriodTemperatureWaterGrainsize,X)BackPeakJ2function(PeriodTemperatureWaterGrainsize,X,3);
% else
%     fun=@ (PeriodTemperatureWaterGrainsize,X) BackPeakJ2function(PeriodTemperatureWaterGrainsize,X,1);
% end

% raw=zeros(21,16);
% c=zeros(21,16);
J2logfit=zeros(71,16);
% J2fit=zeros(21,16);
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
% r=8; % number of periods
% j=0; %bottom

 semilogx(app.UIAxes12,Periodfit,J2logfit(:,No),[ 'red' k])
 hold (app.UIAxes12,'on')
 semilogx(app.UIAxes12,Periodfit,J2logfit(:,(No+1)), ['magenta' k])
 hold (app.UIAxes12,'on')
 semilogx(app.UIAxes12,Periodfit,J2logfit(:,(No+2)), ['green' k])
 hold (app.UIAxes12,'on')
 semilogx(app.UIAxes12,Periodfit,J2logfit(:,(No+3)), ['blue' k])
 hold (app.UIAxes12,'on')
 title(app.UIAxes12,['M2810', ' (Peak)'])
  xlabel(app.UIAxes12,'period (s)')
ylabel(app.UIAxes12,m)
% axis(app.UIAxes,[1e-2 1e4 -10 -2])
% hold (app.UIAxes,'off')
% % 
%  subplot(2, 2, 2)
%  M2863

No=5;
% r=10; % number of periods
% j=32; %bottom
 semilogx(app.UIAxes13,Periodfit,J2logfit(:,No), ['red' k])
  hold (app.UIAxes13,'on')
 semilogx(app.UIAxes13,Periodfit,J2logfit(:,(No+1)), ['magenta' k])
  hold (app.UIAxes13,'on')
 semilogx(app.UIAxes13,Periodfit,J2logfit(:,(No+2)), ['green' k])
  hold (app.UIAxes13,'on')
 semilogx(app.UIAxes13,Periodfit,J2logfit(:,(No+3)), ['blue' k])
  hold (app.UIAxes13,'on')
 title(app.UIAxes13,['M2817', ' (Peak)'])
xlabel(app.UIAxes13,'period (s)')
ylabel(app.UIAxes13,m)
% axis(app.UIAxes13,[1e-2 1e4 -10 -2])
% hold (app.UIAxes2,'off')
% subplot(2, 2,3)
% %  M23093

No=9;
% r=10; % number of periods
% j=72; %bottom
 semilogx(app.UIAxes14,Periodfit,J2logfit(:,No), ['red' k])
 hold (app.UIAxes14,'on')
 semilogx(app.UIAxes14,Periodfit,J2logfit(:,(No+1)), ['magenta' k] )
 hold (app.UIAxes14,'on')
 semilogx(app.UIAxes14,Periodfit,J2logfit(:,(No+2)), ['green' k])
 hold (app.UIAxes14,'on')
 semilogx(app.UIAxes14,Periodfit,J2logfit(:,(No+3)), ['blue' k])
 hold (app.UIAxes14,'on')
 title(app.UIAxes14,['M2863', ' (Peak)'])
xlabel(app.UIAxes14,'period (s)')
ylabel(app.UIAxes14,m)
% axis(app.UIAxes14,[1e-2 1e4 -10 -2])
% hold (app.UIAxes3,'off')

% subplot(2, 2, 4)
% %  M2810

No=13;
% r=8; % number of periods
% j=112; %bottom
 semilogx(app.UIAxes15,Periodfit,J2logfit(:,No), ['red' k])
 hold (app.UIAxes15,'on')
 semilogx(app.UIAxes15,Periodfit,J2logfit(:,(No+1)), ['magenta' k])
  hold (app.UIAxes15,'on')
 semilogx(app.UIAxes15,Periodfit,J2logfit(:,(No+2)), ['green' k])
  hold (app.UIAxes15,'on')
 semilogx(app.UIAxes15,Periodfit,J2logfit(:,(No+3)), ['blue' k])
  hold (app.UIAxes15,'on')
 title(app.UIAxes15,['M3093', ' (Peak)'])
xlabel(app.UIAxes15,'period (s)')
ylabel(app.UIAxes15,m)
% axis(app.UIAxes15,[1e-2 1e4 -10 -2])
% hold (app.UIAxes4,'off')
%  text(4, max(J2logfit(:,1))-1.5,txt1)
%  text(4, max(J2logfit(:,1))-2,txt3)
%  text(4, max(J2logfit(:,1))-2.5,txt2)
%  text(4, max(J2logfit(:,1))-3,txt4)
%  text(4, max(J2logfit(:,1))-3.5,txt5)
% text(10,(min(J2logfit(:,1)))-1,txt02)
% legend('J2-1100C-fitting','J2-1100C','J2-1050C-fitting','J2-1050C','J2-1000C-fitting','J2-1000C','J2-950C-fitting','J2-950C','Location','northwest');

% Periodfit=[0.01 0.02 0.05 0.08 0.1 1 5 10 15 20 50 100 200 300 500 1000 1500 2000 5000 7000 1e4]; 
Temperaturefit=repmat([1373 1273 1223]',[1,71]);
Waterfit=repmat([50 50 50]',[1,71]);
 Grainfit=repmat([6.0 6.0 6.0]',[1,71]);
 for i=1:3
 J2logfit(:,i)=fun([Periodfit',Temperaturefit(i,:)',Waterfit(i,:)',Grainfit(i,:)'],x);
 end
% No=17;
% r=10; % number of periods
% j=148; %bottom
 semilogx(app.UIAxes16,Periodfit,J2logfit(:,1),  ['magenta' k])
  hold (app.UIAxes16,'on')
 semilogx(app.UIAxes16,Periodfit,J2logfit(:,2), ['green' k])
  hold (app.UIAxes16,'on')
 semilogx(app.UIAxes16,Periodfit,J2logfit(:,3), ['blue' k])
  hold (app.UIAxes16,'on')
%  semilogx(Periodfit,J2logfit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r-4)), J2((1+j+3*r):(j+4*r-4)),'blue o');hold on
 title(app.UIAxes16,['M3097', ' (Peak)'])
xlabel(app.UIAxes16,'period (s)')
ylabel(app.UIAxes16,m)


end
