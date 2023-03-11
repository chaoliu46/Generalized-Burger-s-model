function AfigureplotJ1(J1,Period,x,J1theta,resnorm,m,b)


Periodfit=[0.01 0.02 0.05 0.08 0.1 1 5 10 15 20 50 100 200 300 500 1000 1500 2000 5000 7000 1e4]; 
j=(-3):0.1:4;
Periodfit=10.^(j);
Temperaturefit=repmat([1373 1323 1273 1223]',[4,71]);
Waterfit=repmat([repmat(38,[1,4]) repmat(143,[1,4]) repmat(77,[1,4]) repmat(9,[1,4])]',[1,71]);
 Grainfit=repmat([repmat(6,[1,4]) repmat(12,[1,4]) repmat(11,[1,4]) repmat(6.2,[1,4])]',[1,71]);


raw=zeros(71,16);
c=zeros(71,16);
J1fit=zeros(71,16);
% J1fit=zeros(71,16);
for i=1:4
    for j=1:4
J1fit(:,(4*(i-1)+j))=(BackPeakJ1function([Periodfit' Temperaturefit((4*(i-1)+j),:)' Waterfit((4*(i-1)+j),:)', Grainfit((4*(i-1)+j),:)'],x,b));
%  J1fit(:,(4*(i-1)+j))=J1function([Periodfit' Temperaturefit((4*(i-1)+j),:)' Waterfit((4*(i-1)+j),:)', Grainfit((4*(i-1)+j),:)'],x);
%  raw(:,(4*(i-1)+j))=((10.^J1fit(:,(4*(i-1)+j))).^2+J1fit(:,(4*(i-1)+j)).^2).^(-0.5);
%  c(:,(4*(i-1)+j))=J1fit(:,(4*(i-1)+j))-log(J1fit(:,(4*(i-1)+j))); 
 
    end
end




txt02=['standard error \delta = ' num2str(J1theta) ];
   txt1=['\alpha ='  num2str(x(3))]; 
   txt3=[ 'Grain effect='  num2str(x(2))];
  txt2=[ 'water effect='  num2str(x(1))];
  txt4=['activation enthalpy='  num2str(x(4)/1000) ' KJ/mol'];
  txt5=['resnorm='  num2str(resnorm)];
    
f2=figure;

 subplot(2, 2, 1)
%  M2810
No=1;
r=8; % number of periods
j=0; %bottom

 semilogx(Periodfit,J1fit(:,No), 'red',Period((1+j):(j+r)), J1((1+j):(j+r)),'red o');hold on
 semilogx(Periodfit,J1fit(:,(No+1)), 'magenta', Period((1+j+r):(j+2*r)), J1((1+j+r):(j+2*r)),'magenta o');hold on
 semilogx(Periodfit,J1fit(:,(No+2)), 'green',Period((1+j+2*r):(j+3*r)), J1((1+j+2*r):(j+3*r)),'green o');hold on
 semilogx(Periodfit,J1fit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r)), J1((1+j+3*r):(j+4*r)),'blue o');hold on
 title(['M2810', ' (background+peak)'])
  xlabel('period (s)')
ylabel(m)

% % 
 subplot(2, 2, 2)
%  M2817

No=5;
r=10; % number of periods
j=32; %bottom
 semilogx(Periodfit,J1fit(:,No), 'red',Period((1+j):(j+r)), J1((1+j):(j+r)),'red o');hold on
 semilogx(Periodfit,J1fit(:,(No+1)), 'magenta', Period((1+j+r):(j+2*r)), J1((1+j+r):(j+2*r)),'magenta o');hold on
 semilogx(Periodfit,J1fit(:,(No+2)), 'green',Period((1+j+2*r):(j+3*r)), J1((1+j+2*r):(j+3*r)),'green o');hold on
 semilogx(Periodfit,J1fit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r)), J1((1+j+3*r):(j+4*r)),'blue o');hold on
 title(['M2817', ' (background+peak)'])
xlabel('period (s)')
ylabel(m)
subplot(2, 2,3)
% %  M23093

No=9;
r=10; % number of periods
j=72; %bottom
 semilogx(Periodfit,J1fit(:,No), 'red',Period((1+j):(j+r)), J1((1+j):(j+r)),'red o');hold on
 semilogx(Periodfit,J1fit(:,(No+1)), 'magenta', Period((1+j+r):(j+2*r)), J1((1+j+r):(j+2*r)),'magenta o');hold on
 semilogx(Periodfit,J1fit(:,(No+2)), 'green',Period((1+j+2*r):(j+3*r)), J1((1+j+2*r):(j+3*r)),'green o');hold on
 semilogx(Periodfit,J1fit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r)), J1((1+j+3*r):(j+4*r)),'blue o');hold on
 title(['M2863', ' (background+peak)'])
xlabel('period (s)')
ylabel(m)


subplot(2, 2, 4)
% %  M2810

No=13;
r=10; % number of periods
j=112; %bottom
 semilogx(Periodfit,J1fit(:,No), 'red',Period((1+j):(j+r)), J1((1+j):(j+r)),'red o');hold on
 semilogx(Periodfit,J1fit(:,(No+1)), 'magenta', Period((1+j+r):(j+2*r)), J1((1+j+r):(j+2*r)),'magenta o');hold on
 semilogx(Periodfit,J1fit(:,(No+2)), 'green',Period((1+j+2*r):(j+3*r)), J1((1+j+2*r):(j+3*r)),'green o');hold on
 semilogx(Periodfit,J1fit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r-4)), J1((1+j+3*r):(j+4*r-4)),'blue o');hold on
 title(['M3093', ' (background+peak)'])
xlabel('period (s)')
ylabel(m)
 text(4, max(J1fit(:,1))-0.02,txt1)
 text(4, max(J1fit(:,1))-0.025,txt3)
 text(4, max(J1fit(:,1))-0.03,txt2)
 text(4, max(J1fit(:,1))-0.035,txt4)
 text(4, max(J1fit(:,1))-0.04,txt5)
text(10,(min(J1fit(:,1))),txt02)
% legend('J1-1100C-fitting','J1-1100C','J1-1050C-fitting','J1-1050C','J1-1000C-fitting','J1-1000C','J1-950C-fitting','J1-950C','Location','northwest');
f3=figure;



% Periodfit=[0.01 0.02 0.05 0.08 0.1 1 5 10 15 20 50 100 200 300 500 1000 1500 2000 5000 7000 1e4]; 
j=(-3):0.1:4;
Periodfit=10.^(j);
Temperaturefit=repmat([1373 1273 1223]',[1,71]);
Waterfit=repmat([50 50 50]',[1,71]);
 Grainfit=repmat([6.0 6.0 6.0]',[1,71]);
 for i=1:3
 J1fit(:,i)=BackPeakJ1function([Periodfit',Temperaturefit(i,:)',Waterfit(i,:)',Grainfit(i,:)'],x,b);
 end
% No=17;
r=10; % number of periods
j=148; %bottom
 semilogx(Periodfit,J1fit(:,1), 'red',Period((1+j):(j+r)), J1((1+j):(j+r)),'red o');hold on
 semilogx(Periodfit,J1fit(:,2), 'magenta', Period((1+j+r):(j+2*r)), J1((1+j+r):(j+2*r)),'magenta o');hold on
 semilogx(Periodfit,J1fit(:,3), 'green',Period((1+j+2*r):(j+3*r)), J1((1+j+2*r):(j+3*r)),'green o');hold on
%  semilogx(Periodfit,J1fit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r-4)), J1((1+j+3*r):(j+4*r-4)),'blue o');hold on
 title(['M3097', ' (background+peak)'])
xlabel('period (s)')
ylabel(m)


end
