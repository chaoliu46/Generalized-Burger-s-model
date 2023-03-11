function plotQandSPaper(Shear,Qm1,Period,x,J2logtheta,resnorm,m,n,b)

Qm1=log10(Qm1);
% Periodfit=[0.01 0.02 0.05 0.08 0.1 1 5 10 15 20 50 100 200 300 500 1000 1500 2000 5000 7000 1e4]; 
j=(-1.5):0.1:3.5;
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


f2=figure;
 
%  M2817

No=5;
r=10; % number of periods
j=32; %bottom
 semilogx(Periodfit,Qm1fit(:,No), 'red -.',Period((1+j):(j+r)), Qm1((1+j):(j+r)),'red d');hold on
 semilogx(Periodfit,Qm1fit(:,(No+1)), 'magenta -.', Period((1+j+r):(j+2*r)), Qm1((1+j+r):(j+2*r)),'magenta d');hold on
 semilogx(Periodfit,Qm1fit(:,(No+2)), 'green -.',Period((1+j+2*r):(j+3*r)), Qm1((1+j+2*r):(j+3*r)),'green d');hold on
%  semilogx(Periodfit,Qm1fit(:,(No+3)), 'blue -.',Period((1+j+3*r):(j+4*r)), Qm1((1+j+3*r):(j+4*r)),'blue d');hold on
 title(['M2817', ' (background+peak)'])
xlabel('period (s)')
ylabel(m)
ylim([-3 0.5])



% %  M2810

No=13;
r=10; % number of periods
j=112; %bottom
 semilogx(Periodfit,Qm1fit(:,No), 'red',Period((1+j):(j+r)), Qm1((1+j):(j+r)),'red o','MarkerFaceColor','r');hold on
 semilogx(Periodfit,Qm1fit(:,(No+1)), 'magenta', Period((1+j+r):(j+2*r)), Qm1((1+j+r):(j+2*r)),'magenta o','MarkerFaceColor','magenta');hold on
 semilogx(Periodfit,Qm1fit(:,(No+2)), 'green',Period((1+j+2*r):(j+3*r)), Qm1((1+j+2*r):(j+3*r)),'green o','MarkerFaceColor','green');hold on
%  semilogx(Periodfit,Qm1fit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r-4)), Qm1((1+j+3*r):(j+4*r-4)),'blue o','MarkerFaceColor','blue');hold on
% %  title(['M3093', ' (background+peak)'])
% xlabel('period (s)')
% ylabel(m)
% ylim([-4 1])
%  text(4, max(Qm1fit(:,1))-1.5,txt1)
%  text(4, max(Qm1fit(:,1))-2,txt3)
%  text(4, max(Qm1fit(:,1))-2.5,txt2)
%  text(4, max(Qm1fit(:,1))-3,txt4)
%  text(4, max(Qm1fit(:,1))-4,txt5)
% text(10,(min(Qm1fit(:,1)))-1,txt02)
% legend('Qm1-1100C-fitting','Qm1-1100C','Qm1-1050C-fitting','Qm1-1050C','Qm1-1000C-fitting','Qm1-1000C','Qm1-950C-fitting','Qm1-950C','Location','northwest');





%----------------------------------------------------------------------------------------------------------------------------------

f6=figure;
 
%  M2817

No=5;
r=10; % number of periods
j=32; %bottom
 semilogx(Periodfit,Shearfit(:,No), 'red .',Period((1+j):(j+r)), Shear((1+j):(j+r)),'red d');hold on
 semilogx(Periodfit,Shearfit(:,(No+1)), 'magenta .', Period((1+j+r):(j+2*r)), Shear((1+j+r):(j+2*r)),'magenta d');hold on
 semilogx(Periodfit,Shearfit(:,(No+2)), 'green .',Period((1+j+2*r):(j+3*r)), Shear((1+j+2*r):(j+3*r)),'green d');hold on
%  semilogx(Periodfit,Shearfit(:,(No+3)), 'blue .',Period((1+j+3*r):(j+4*r)), Shear((1+j+3*r):(j+4*r)),'blue d');hold on
 title(['M2817', ' (background+peak)'])
xlabel('period (s)')
ylabel(n)
ylim([0 up])



% %  M2810

No=13;
r=10; % number of periods
j=112; %bottom
 semilogx(Periodfit,Shearfit(:,No), 'red',Period((1+j):(j+r)), Shear((1+j):(j+r)),'red o','MarkerFaceColor','r');hold on
 semilogx(Periodfit,Shearfit(:,(No+1)), 'magenta', Period((1+j+r):(j+2*r)), Shear((1+j+r):(j+2*r)),'magenta o','MarkerFaceColor','magenta');hold on
 semilogx(Periodfit,Shearfit(:,(No+2)), 'green',Period((1+j+2*r):(j+3*r)), Shear((1+j+2*r):(j+3*r)),'green o','MarkerFaceColor','green');hold on
%  semilogx(Periodfit,Shearfit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r-4)), Shear((1+j+3*r):(j+4*r-4)),'blue o','MarkerFaceColor','blue');hold on
%  title(['M3093', ' (background+peak)'])
% xlabel('period (s)')
% ylabel(n)

% ylim([0 up])
%  text(4, max(Shearfit(:,1))-1.5,txt1)
%  text(4, max(Shearfit(:,1))-6,txt3)
%  text(4, max(Shearfit(:,1))-10.5,txt2)
%  text(4, max(Shearfit(:,1))-15,txt4)
%  text(4, max(Shearfit(:,1))-20,txt5)
% text(10,(min(Shearfit(:,1)))-25,txt02)
% legend('Shear-1100C-fitting','Shear-1100C','Shear-1050C-fitting','Shear-1050C','Shear-1000C-fitting','Shear-1000C','Shear-950C-fitting','Shear-950C','Location','northwest');


end
