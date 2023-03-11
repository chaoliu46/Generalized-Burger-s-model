function figureplotJ2(J2,Period,x,J2theta,resnorm,m)


% Periodfit=[0.01 0.02 0.05 0.08 0.1 1 5 10 15 20 50 100 200 300 500 1000 1500 2000 5000 7000 1e4]; 
j=(-3):0.1:4;
Periodfit=10.^(j);
Temperaturefit=repmat([1373 1323 1273 1223]',[4,71]);
Waterfit=repmat([repmat(143,[1,4]) repmat(77,[1,4]) repmat(9,[1,4]) repmat(25,[1,4])]',[1,71]);
 Grainfit=repmat([repmat(12,[1,4]) repmat(11,[1,4]) repmat(6.0,[1,4]) repmat(6.2,[1,4])]',[1,71]);
 Xfit=repmat(x,[16,1]);

raw=zeros(71,16);
c=zeros(71,16);
J2logfit=zeros(71,16);
J2fit=zeros(71,16);
for i=1:4
    for j=1:4
J2logfit(:,(4*(i-1)+j))=(BackJ2function([Periodfit' Temperaturefit((4*(i-1)+j),:)' Waterfit((4*(i-1)+j),:)', Grainfit((4*(i-1)+j),:)'],x));
%  J2fit(:,(4*(i-1)+j))=J2function([Periodfit' Temperaturefit((4*(i-1)+j),:)' Waterfit((4*(i-1)+j),:)', Grainfit((4*(i-1)+j),:)'],x);
%  raw(:,(4*(i-1)+j))=((10.^J2logfit(:,(4*(i-1)+j))).^2+J2fit(:,(4*(i-1)+j)).^2).^(-0.5);
%  c(:,(4*(i-1)+j))=J2logfit(:,(4*(i-1)+j))-log(J2fit(:,(4*(i-1)+j))); 
 
    end
end




txt02=['standard error \delta = ' num2str(J2theta) ];
   txt1=['\alpha ='  num2str(x(3))]; 
   txt3=[ 'Grain effect='  num2str(x(2))];
  txt2=[ 'water effect='  num2str(x(1))];
  txt4=['activation enthalpy='  num2str(x(4)/1000) ' KJ/mol'];
  txt5=['resnorm='  num2str(resnorm)];
    
f2=figure;

 subplot(2, 2, 1)
%  M2817
No=1;
r=10; % number of periods
j=0; %bottom

 semilogx(Periodfit,J2logfit(:,No), 'red',Period((1+j):(j+r)), J2((1+j):(j+r)),'red o');hold on
 semilogx(Periodfit,J2logfit(:,(No+1)), 'magenta', Period((1+j+r):(j+2*r)), J2((1+j+r):(j+2*r)),'magenta o');hold on
 semilogx(Periodfit,J2logfit(:,(No+2)), 'green',Period((1+j+2*r):(j+3*r)), J2((1+j+2*r):(j+3*r)),'green o');hold on
 semilogx(Periodfit,J2logfit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r)), J2((1+j+3*r):(j+4*r)),'blue o');hold on
 title(['M2817', ' (background+peak)'])
  xlabel('period (s)')
ylabel(m)

% % 
 subplot(2, 2, 2)
%  M2863

No=5;
r=10; % number of periods
j=40; %bottom
 semilogx(Periodfit,J2logfit(:,No), 'red',Period((1+j):(j+r)), J2((1+j):(j+r)),'red o');hold on
 semilogx(Periodfit,J2logfit(:,(No+1)), 'magenta', Period((1+j+r):(j+2*r)), J2((1+j+r):(j+2*r)),'magenta o');hold on
 semilogx(Periodfit,J2logfit(:,(No+2)), 'green',Period((1+j+2*r):(j+3*r)), J2((1+j+2*r):(j+3*r)),'green o');hold on
 semilogx(Periodfit,J2logfit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r)), J2((1+j+3*r):(j+4*r)),'blue o');hold on
 title(['M2863', ' (background+peak)'])
xlabel('period (s)')
ylabel(m)
subplot(2, 2,3)
% %  M23093

No=9;
r=10; % number of periods
j=80; %bottom
 semilogx(Periodfit,J2logfit(:,No), 'red',Period((1+j):(j+r)), J2((1+j):(j+r)),'red o');hold on
 semilogx(Periodfit,J2logfit(:,(No+1)), 'magenta', Period((1+j+r):(j+2*r)), J2((1+j+r):(j+2*r)),'magenta o');hold on
 semilogx(Periodfit,J2logfit(:,(No+2)), 'green',Period((1+j+2*r):(j+3*r)), J2((1+j+2*r):(j+3*r)),'green o');hold on
 semilogx(Periodfit,J2logfit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r-4)), J2((1+j+3*r):(j+4*r-4)),'blue o');hold on
 title(['M3093', ' (background+peak)'])
xlabel('period (s)')
ylabel(m)


subplot(2, 2, 4)
% %  M2810

No=13;
r=8; % number of periods
j=116; %bottom
 semilogx(Periodfit,J2logfit(:,No), 'red',Period((1+j):(j+r)), J2((1+j):(j+r)),'red o');hold on
 semilogx(Periodfit,J2logfit(:,(No+1)), 'magenta', Period((1+j+r):(j+2*r)), J2((1+j+r):(j+2*r)),'magenta o');hold on
 semilogx(Periodfit,J2logfit(:,(No+2)), 'green',Period((1+j+2*r):(j+3*r)), J2((1+j+2*r):(j+3*r)),'green o');hold on
 semilogx(Periodfit,J2logfit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r)), J2((1+j+3*r):(j+4*r)),'blue o');hold on
 title(['M2810', ' (background+peak)'])
xlabel('period (s)')
ylabel(m)
 text(4, max(J2logfit(:,1))-1.5,txt1)
 text(4, max(J2logfit(:,1))-2,txt3)
 text(4, max(J2logfit(:,1))-2.5,txt2)
 text(4, max(J2logfit(:,1))-3,txt4)
 text(4, max(J2logfit(:,1))-3.5,txt5)
text(10,(min(J2logfit(:,1)))-1,txt02)
% legend('J2-1100C-fitting','J2-1100C','J2-1050C-fitting','J2-1050C','J2-1000C-fitting','J2-1000C','J2-950C-fitting','J2-950C','Location','northwest');




end
