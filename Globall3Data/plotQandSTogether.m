function plotQandSTogether(Shear,Qm1,Period,x,J2logtheta,resnorm,m,n,b)

Qm1=log10(Qm1);
% Periodfit=[0.01 0.02 0.05 0.08 0.1 1 5 10 15 20 50 100 200 300 500 1000 1500 2000 5000 7000 1e4]; 
j=(-2):0.1:4;
Periodfit=10.^(j);
num=numel(Periodfit);
Temperaturefit=repmat([1373 1323 1273 1223]',[4,num]);
Waterfit=repmat([repmat(48,[1,4]) repmat(143,[1,4]) repmat(77,[1,4]) repmat(9,[1,4])]',[1,num]);
 Grainfit=repmat([repmat(6,[1,4]) repmat(12,[1,4]) repmat(11,[1,4]) repmat(6.2,[1,4])]',[1,num]);

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

% txt02=['standard error \delta = ' num2str(J2logtheta) ];
%    txt1=['\alpha ='  num2str(x(3))]; 
%    txt3=[ 'Grain effect='  num2str(x(2))];
%   txt2=[ 'water effect='  num2str(x(1))];
%   txt4=['activation enthalpy='  num2str(x(4)/1000) ' KJ/mol'];
%   txt5=['resnorm='  num2str(resnorm)];
%     
% f1=figure;
% 
% %  M2810
% No=1;
% r=8; % number of periods
% j=0; %bottom
% 
%  semilogx(Periodfit,Qm1fit(:,No), 'red',Period((1+j):(j+r)), Qm1((1+j):(j+r)),'red o');hold on
%  semilogx(Periodfit,Qm1fit(:,(No+1)), 'magenta', Period((1+j+r):(j+2*r)), Qm1((1+j+r):(j+2*r)),'magenta o');hold on
%  semilogx(Periodfit,Qm1fit(:,(No+2)), 'green',Period((1+j+2*r):(j+3*r)), Qm1((1+j+2*r):(j+3*r)),'green o');hold on
%  semilogx(Periodfit,Qm1fit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r)), Qm1((1+j+3*r):(j+4*r)),'blue o');hold on
%  title(['M2810', ' (background+peak)'])
%   xlabel('period (s)')
% ylabel(m)
% ylim([-3 0.5])
% % 
f2=figure;
 subplot(2, 2,1)
%  M2817

No=5;
r=10; % number of periods
j=32; %bottom
 semilogx(Periodfit,Qm1fit(:,No), 'red --',Period((1+j):(j+r)), Qm1((1+j):(j+r)),'red o');hold on
 semilogx(Periodfit,Qm1fit(:,(No+1)), 'magenta--', Period((1+j+r):(j+2*r)), Qm1((1+j+r):(j+2*r)),'magenta o');hold on
 semilogx(Periodfit,Qm1fit(:,(No+2)), 'green--',Period((1+j+2*r):(j+3*r)), Qm1((1+j+2*r):(j+3*r)),'green o');hold on
 semilogx(Periodfit,Qm1fit(:,(No+3)), 'blue--',Period((1+j+3*r):(j+4*r)), Qm1((1+j+3*r):(j+4*r)),'blue o');hold on
%  title(['M2817', ' (background+peak)'])
title(['Grain size', ' (background+peak)'])
xlabel('period (s)')
ylabel(m)
ylim([-3 0.5])
subplot(2, 2,1)
% %  M23093

No=9;
r=10; % number of periods
j=72; %bottom
 semilogx(Periodfit,Qm1fit(:,No), 'red',Period((1+j):(j+r)), Qm1((1+j):(j+r)),'red o','MarkerFaceColor','r');hold on
 semilogx(Periodfit,Qm1fit(:,(No+1)), 'magenta', Period((1+j+r):(j+2*r)), Qm1((1+j+r):(j+2*r)),'magenta o','MarkerFaceColor','magenta');hold on
 semilogx(Periodfit,Qm1fit(:,(No+2)), 'green',Period((1+j+2*r):(j+3*r)), Qm1((1+j+2*r):(j+3*r)),'green o','MarkerFaceColor','green');hold on
 semilogx(Periodfit,Qm1fit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r)), Qm1((1+j+3*r):(j+4*r)),'blue o','MarkerFaceColor','blue');hold on
 title(['M2863', ' (background+peak)'])
xlabel('period (s)')
ylabel(m)


subplot(2, 2, 3)
% %  M2810

No=13;
r=10; % number of periods
j=112; %bottom
 semilogx(Periodfit,Qm1fit(:,No), 'red',Period((1+j):(j+r)), Qm1((1+j):(j+r)),'red o','MarkerFaceColor','r');hold on
 semilogx(Periodfit,Qm1fit(:,(No+1)), 'magenta', Period((1+j+r):(j+2*r)), Qm1((1+j+r):(j+2*r)),'magenta o','MarkerFaceColor','magneta');hold on
 semilogx(Periodfit,Qm1fit(:,(No+2)), 'green',Period((1+j+2*r):(j+3*r)), Qm1((1+j+2*r):(j+3*r)),'green o','MarkerFaceColor','green');hold on
 semilogx(Periodfit,Qm1fit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r-4)), Qm1((1+j+3*r):(j+4*r-4)),'blue o','MarkerFaceColor','blue');hold on
%  title(['M3093', ' (background+peak)'])
xlabel('period (s)')
ylabel(m)
ylim([-3 0.5])
%  text(4, max(Qm1fit(:,1))-1.5,txt1)
%  text(4, max(Qm1fit(:,1))-2,txt3)
%  text(4, max(Qm1fit(:,1))-2.5,txt2)
%  text(4, max(Qm1fit(:,1))-3,txt4)
%  text(4, max(Qm1fit(:,1))-4,txt5)
% text(10,(min(Qm1fit(:,1)))-1,txt02)
% legend('Qm1-1100C-fitting','Qm1-1100C','Qm1-1050C-fitting','Qm1-1050C','Qm1-1000C-fitting','Qm1-1000C','Qm1-950C-fitting','Qm1-950C','Location','northwest');


subplot(2, 2,3)

% Periodfit=[0.01 0.02 0.05 0.08 0.1 1 5 10 15 20 50 100 200 300 500 1000 1500 2000 5000 7000 1e4]; 
j=(-2):0.1:4;
Periodfit=10.^(j);
Temperaturefit=repmat([1373 1273 1223]',[1,num]);
Waterfit=repmat([50 50 50]',[1,num]);
 Grainfit=repmat([6.0 6.0 6.0]',[1,num]);
 for i=1:3
 J2logfit(:,i)=BackPeakJ2function([Periodfit',Temperaturefit(i,:)',Waterfit(i,:)',Grainfit(i,:)'],x,b);
  J1fit(:,i)=BackPeakJ1function([Periodfit' Temperaturefit(i,:)' Waterfit(i,:)', Grainfit(i,:)'],x,b);
%  Qm1fit(:,i)=((10.^J2logfit(:,i)).^2+J1fit(:,i).^2).^(-0.5);
 Qm1fit(:,i)=J2logfit(:,i)-log10(J1fit(:,i)); 
 end
% No=17;
r=10; % number of periods
j=148; %bottom
 semilogx(Periodfit,Qm1fit(:,1), 'red--',Period((1+j):(j+r)), Qm1((1+j):(j+r)),'red o');hold on
 semilogx(Periodfit,Qm1fit(:,2), 'magenta--', Period((1+j+r):(j+2*r)), Qm1((1+j+r):(j+2*r)),'magenta o');hold on
 semilogx(Periodfit,Qm1fit(:,3), 'green--',Period((1+j+2*r):(j+3*r)), Qm1((1+j+2*r):(j+3*r)),'green o');hold on
%  semilogx(Periodfit,Qm1fit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r-4)), Qm1((1+j+3*r):(j+4*r-4)),'blue o');hold on
 title(['M3097', ' (background+peak)'])
xlabel('period (s)')
ylabel(m)
ylim([-3 0.5])


%----------------------------------------------------------------------------------------------------------------------------------
% f5=figure;

 
% %  M2810
% No=1;
% r=8; % number of periods
% j=0; %bottom
% 
%  semilogx(Periodfit,Shearfit(:,No), 'red',Period((1+j):(j+r)), Shear((1+j):(j+r)),'red o');hold on
%  semilogx(Periodfit,Shearfit(:,(No+1)), 'magenta', Period((1+j+r):(j+2*r)), Shear((1+j+r):(j+2*r)),'magenta o');hold on
%  semilogx(Periodfit,Shearfit(:,(No+2)), 'green',Period((1+j+2*r):(j+3*r)), Shear((1+j+2*r):(j+3*r)),'green o');hold on
%  semilogx(Periodfit,Shearfit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r)), Shear((1+j+3*r):(j+4*r)),'blue o');hold on
%  title(['M2810', ' (background+peak)'])
%   xlabel('period (s)')
% ylabel(n)
% ylim([0 up])
% % 
% f6=figure;
 subplot(2, 2, 2)
%  M2817

No=5;
r=10; % number of periods
j=32; %bottom
 semilogx(Periodfit,Shearfit(:,No), 'red--',Period((1+j):(j+r)), Shear((1+j):(j+r)),'red o');hold on
 semilogx(Periodfit,Shearfit(:,(No+1)), 'magenta--', Period((1+j+r):(j+2*r)), Shear((1+j+r):(j+2*r)),'magenta o');hold on
 semilogx(Periodfit,Shearfit(:,(No+2)), 'green--',Period((1+j+2*r):(j+3*r)), Shear((1+j+2*r):(j+3*r)),'green o');hold on
 semilogx(Periodfit,Shearfit(:,(No+3)), 'blue--',Period((1+j+3*r):(j+4*r)), Shear((1+j+3*r):(j+4*r)),'blue o');hold on
%  title(['M2817', ' (background+peak)'])
xlabel('period (s)')
ylabel(n)
ylim([0 up])
subplot(2, 2,2)
% %  M23093

No=9;
r=10; % number of periods
j=72; %bottom
 semilogx(Periodfit,Shearfit(:,No), 'red',Period((1+j):(j+r)), Shear((1+j):(j+r)),'red o','MarkerFaceColor','r');hold on
 semilogx(Periodfit,Shearfit(:,(No+1)), 'magenta', Period((1+j+r):(j+2*r)), Shear((1+j+r):(j+2*r)),'magenta o','MarkerFaceColor','magneta');hold on
 semilogx(Periodfit,Shearfit(:,(No+2)), 'green',Period((1+j+2*r):(j+3*r)), Shear((1+j+2*r):(j+3*r)),'green o','MarkerFaceColor','green');hold on
 semilogx(Periodfit,Shearfit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r)), Shear((1+j+3*r):(j+4*r)),'blue o','MarkerFaceColor','blue');hold on
%  title(['M2863', ' (background+peak)'])
xlabel('period (s)')
ylabel(n)
ylim([0 up])

subplot(2, 2, 4)
% %  M2810

No=13;
r=10; % number of periods
j=112; %bottom
 semilogx(Periodfit,Shearfit(:,No), 'red',Period((1+j):(j+r)), Shear((1+j):(j+r)),'red o','MarkerFaceColor','r');hold on
 semilogx(Periodfit,Shearfit(:,(No+1)), 'magenta', Period((1+j+r):(j+2*r)), Shear((1+j+r):(j+2*r)),'magenta o','MarkerFaceColor','magneta');hold on
 semilogx(Periodfit,Shearfit(:,(No+2)), 'green',Period((1+j+2*r):(j+3*r)), Shear((1+j+2*r):(j+3*r)),'green o','MarkerFaceColor','green');hold on
 semilogx(Periodfit,Shearfit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r-4)), Shear((1+j+3*r):(j+4*r-4)),'blue o','MarkerFaceColor','blue');hold on
%  title(['M3093', ' (background+peak)'])
xlabel('period (s)')
ylabel(n)

ylim([0 up])
%  text(4, max(Shearfit(:,1))-1.5,txt1)
%  text(4, max(Shearfit(:,1))-6,txt3)
%  text(4, max(Shearfit(:,1))-10.5,txt2)
%  text(4, max(Shearfit(:,1))-15,txt4)
%  text(4, max(Shearfit(:,1))-20,txt5)
% text(10,(min(Shearfit(:,1)))-25,txt02)
% legend('Shear-1100C-fitting','Shear-1100C','Shear-1050C-fitting','Shear-1050C','Shear-1000C-fitting','Shear-1000C','Shear-950C-fitting','Shear-950C','Location','northwest');
subplot(2, 2, 4)



% Periodfit=[0.01 0.02 0.05 0.08 0.1 1 5 10 15 20 50 100 200 300 500 1000 1500 2000 5000 7000 1e4]; 
j=(-2):0.1:4;
Periodfit=10.^(j);
Temperaturefit=repmat([1373 1273 1223]',[1,num]);
Waterfit=repmat([50 50 50]',[1,num]);
 Grainfit=repmat([6.0 6.0 6.0]',[1,num]);
 for i=1:3
     
 J2logfit(:,i)=BackPeakJ2function([Periodfit',Temperaturefit(i,:)',Waterfit(i,:)',Grainfit(i,:)'],x,b);
  J1fit(:,i)=BackPeakJ1function([Periodfit' Temperaturefit(i,:)' Waterfit(i,:)', Grainfit(i,:)'],x,b);
 Shearfit(:,i)=((10.^J2logfit(:,i)).^2+J1fit(:,i).^2).^(-0.5);

 
 
 end
% No=17;
r=10; % number of periods
j=148; %bottom
 semilogx(Periodfit,Shearfit(:,1), 'red--',Period((1+j):(j+r)), Shear((1+j):(j+r)),'red o');hold on
 semilogx(Periodfit,Shearfit(:,2), 'magenta--', Period((1+j+r):(j+2*r)), Shear((1+j+r):(j+2*r)),'magenta o');hold on
 semilogx(Periodfit,Shearfit(:,3), 'green--',Period((1+j+2*r):(j+3*r)), Shear((1+j+2*r):(j+3*r)),'green o');hold on
%  semilogx(Periodfit,Shearfit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r-4)), Shear((1+j+3*r):(j+4*r-4)),'blue o');hold on
%  title(['M3097', ' (background+peak)'])
xlabel('period (s)')
ylabel(n)
ylim([0 up])

end
