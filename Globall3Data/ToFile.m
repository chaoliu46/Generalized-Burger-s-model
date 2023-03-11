function ToFile(x)

% Qm1=log(Qm1);
Periodfit=[0.01 0.02 0.05 0.08 0.1 1 5 10 15 20 50 100 200 300 500 1000 1500 2000 5000 7000 1e4]; 
Temperaturefit=repmat([1373 1323 1273 1223]',[4,21]);
Waterfit=repmat([repmat(25,[1,4]) repmat(143,[1,4]) repmat(77,[1,4]) repmat(9,[1,4])]',[1,21]);
 Grainfit=repmat([repmat(6,[1,4]) repmat(12,[1,4]) repmat(11,[1,4]) repmat(6.2,[1,4])]',[1,21]);


Qm1fit=zeros(21,16);
Shearfit=zeros(21,16);
J1fit=zeros(21,16);
J2logfit=zeros(21,16);
for i=1:4
    for j=1:4
J2logfit(:,(4*(i-1)+j))=(BackPeakJ2function([Periodfit' Temperaturefit((4*(i-1)+j),:)' Waterfit((4*(i-1)+j),:)', Grainfit((4*(i-1)+j),:)'],x));
 J1fit(:,(4*(i-1)+j))=BackPeakJ1function([Periodfit' Temperaturefit((4*(i-1)+j),:)' Waterfit((4*(i-1)+j),:)', Grainfit((4*(i-1)+j),:)'],x);
 Shearfit(:,(4*(i-1)+j))=((10.^J2logfit(:,(4*(i-1)+j))).^2+J1fit(:,(4*(i-1)+j)).^2).^(-0.5);
 Qm1fit(:,(4*(i-1)+j))=J2logfit(:,(4*(i-1)+j))-log(J1fit(:,(4*(i-1)+j))); 
 
    end
end


%  M2810
No=1;
fileID = fopen('M2810.txt', 'w');
k=[Periodfit; Qm1fit(:,No)'; Qm1fit(:,(No+1))' ;Qm1fit(:,(No+2))'; Qm1fit(:,(No+3))'; Shearfit(:,No)'; Shearfit(:,(No+1))'; Shearfit(:,(No+2))'; Shearfit(:,(No+3))'];
% k=[Periodfit'; Qm1fit(:,No) Qm1fit(:,(No+1)) Qm1fit(:,(No+2)) Qm1fit(:,(No+3)) Shearfit(:,No) Shearfit(:,(No+1)) Shearfit(:,(No+2)) Shearfit(:,(No+3))];
fprintf(fileID,'%12s  %12s  %12s  %12s  %12s  %12s  %12s  %12s  %12s\n','Period (s)','Q^{-1}1373 K','Q^{-1}1323 K','Q^{-1}1273 K','Q^{-1}1223 K','G(GPa)1373 K','G(GPa)1323 K','G(GPa)1273 K','G(GPa)1223 K');
fprintf(fileID,'%2d  %5f  %5f  %5f  %5f  %5f  %5f  %5f  %5f \n',k);
fclose(fileID);

%  M2817

No=5;

fileID = fopen('M2817.txt', 'w');
k=[Periodfit; Qm1fit(:,No)'; Qm1fit(:,(No+1))' ;Qm1fit(:,(No+2))'; Qm1fit(:,(No+3))'; Shearfit(:,No)'; Shearfit(:,(No+1))'; Shearfit(:,(No+2))'; Shearfit(:,(No+3))'];
fprintf(fileID,'%12s %12s %12s %12s %12s %12s %12s %12s %12s\n','Period (s)','Q^{-1}1373 K','Q^{-1}1323 K','Q^{-1}1273 K','Q^{-1}1223 K','G(GPa) 1373 K','G(GPa) 1323 K','G(GPa) 1273 K','G(GPa)1223 K');
fprintf(fileID,'%5d %5f %5f %5f %5f %5f %5f %5f %5f\n',k);
fclose(fileID);
 
% %  M2863

No=9;


fileID = fopen('M2863.txt', 'w');
k=[Periodfit; Qm1fit(:,No)'; Qm1fit(:,(No+1))' ;Qm1fit(:,(No+2))'; Qm1fit(:,(No+3))'; Shearfit(:,No)'; Shearfit(:,(No+1))'; Shearfit(:,(No+2))'; Shearfit(:,(No+3))'];
% k=[Periodfit' Qm1fit(:,No) Qm1fit(:,(No+1)) Qm1fit(:,(No+2)) Qm1fit(:,(No+3)) Shearfit(:,No) Shearfit(:,(No+1)) Shearfit(:,(No+2)) Shearfit(:,(No+3))];
fprintf(fileID,'%12s %12s %12s %12s %12s %12s %12s %12s %12s\n','Period (s)','Q^{-1}1373 K','Q^{-1}1323 K','Q^{-1}1273 K','Q^{-1}1223 K','G(GPa) 1373 K','G(GPa) 1323 K','G(GPa) 1273 K','G(GPa)1223 K');
fprintf(fileID,'%5d %5f %5f %5f %5f %5f %5f %5f %5f\n',k);
fclose(fileID);

 


% %  M3093

No=13;
fileID = fopen('M3093.txt', 'w');
k=[Periodfit; Qm1fit(:,No)'; Qm1fit(:,(No+1))' ;Qm1fit(:,(No+2))'; Qm1fit(:,(No+3))'; Shearfit(:,No)'; Shearfit(:,(No+1))'; Shearfit(:,(No+2))'; Shearfit(:,(No+3))'];
% k=[Periodfit' Qm1fit(:,No) Qm1fit(:,(No+1)) Qm1fit(:,(No+2)) Qm1fit(:,(No+3)) Shearfit(:,No) Shearfit(:,(No+1)) Shearfit(:,(No+2)) Shearfit(:,(No+3))];
fprintf(fileID,'%12s %12s %12s %12s %12s %12s %12s %12s %12s\n','Period (s)','Q^{-1}1373 K','Q^{-1}1323 K','Q^{-1}1273 K','Q^{-1}1223 K','G(GPa) 1373 K','G(GPa) 1323 K','G(GPa) 1273 K','G(GPa)1223 K');
fprintf(fileID,'%5d %5f %5f %5f %5f %5f %5f %5f %5f\n',k);
fclose(fileID);



% Periodfit=[0.01 0.02 0.05 0.08 0.1 1 5 10 15 20 50 100 200 300 500 1000 1500 2000 5000 7000 1e4]; 
% Temperaturefit=repmat([1373 1273 1223]',[1,21]);
% Waterfit=repmat([50 50 50]',[1,21]);
%  Grainfit=repmat([6.0 6.0 6.0]',[1,21]);
%  for i=1:3
%  J2logfit(:,i)=BackPeakJ2function([Periodfit',Temperaturefit(i,:)',Waterfit(i,:)',Grainfit(i,:)'],x);
%   J1fit(:,i)=BackPeakJ1function([Periodfit' Temperaturefit(i,:)' Waterfit(i,:)', Grainfit(i,:)'],x);
% %  Qm1fit(:,i)=((10.^J2logfit(:,i)).^2+J1fit(:,i).^2).^(-0.5);
%  Qm1fit(:,i)=J2logfit(:,i)-log(J1fit(:,i)); 
%  end
% % No=17;
% r=10; % number of periods
% j=148; %bottom
%  semilogx(Periodfit,Qm1fit(:,1), 'red',Period((1+j):(j+r)), Qm1((1+j):(j+r)),'red o');hold on
%  semilogx(Periodfit,Qm1fit(:,2), 'magenta', Period((1+j+r):(j+2*r)), Qm1((1+j+r):(j+2*r)),'magenta o');hold on
%  semilogx(Periodfit,Qm1fit(:,3), 'green',Period((1+j+2*r):(j+3*r)), Qm1((1+j+2*r):(j+3*r)),'green o');hold on
% %  semilogx(Periodfit,Qm1fit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r-4)), Qm1((1+j+3*r):(j+4*r-4)),'blue o');hold on
%  title(['M3097', ' (background+peak)'])
% xlabel('period (s)')
% ylabel(m)
% 
% 
% 
% %----------------------------------------------------------------------------------------------------------------------------------
% f2=figure;
% 
%  subplot(2, 2, 1)
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
% 
% % % 
%  subplot(2, 2, 2)
% %  M2817
% 
% No=5;
% r=10; % number of periods
% j=32; %bottom
%  semilogx(Periodfit,Shearfit(:,No), 'red',Period((1+j):(j+r)), Shear((1+j):(j+r)),'red o');hold on
%  semilogx(Periodfit,Shearfit(:,(No+1)), 'magenta', Period((1+j+r):(j+2*r)), Shear((1+j+r):(j+2*r)),'magenta o');hold on
%  semilogx(Periodfit,Shearfit(:,(No+2)), 'green',Period((1+j+2*r):(j+3*r)), Shear((1+j+2*r):(j+3*r)),'green o');hold on
%  semilogx(Periodfit,Shearfit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r)), Shear((1+j+3*r):(j+4*r)),'blue o');hold on
%  title(['M2817', ' (background+peak)'])
% xlabel('period (s)')
% ylabel(n)
% subplot(2, 2,3)
% % %  M23093
% 
% No=9;
% r=10; % number of periods
% j=72; %bottom
%  semilogx(Periodfit,Shearfit(:,No), 'red',Period((1+j):(j+r)), Shear((1+j):(j+r)),'red o');hold on
%  semilogx(Periodfit,Shearfit(:,(No+1)), 'magenta', Period((1+j+r):(j+2*r)), Shear((1+j+r):(j+2*r)),'magenta o');hold on
%  semilogx(Periodfit,Shearfit(:,(No+2)), 'green',Period((1+j+2*r):(j+3*r)), Shear((1+j+2*r):(j+3*r)),'green o');hold on
%  semilogx(Periodfit,Shearfit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r)), Shear((1+j+3*r):(j+4*r)),'blue o');hold on
%  title(['M2863', ' (background+peak)'])
% xlabel('period (s)')
% ylabel(n)
% 
% 
% subplot(2, 2, 4)
% % %  M2810
% 
% No=13;
% r=10; % number of periods
% j=112; %bottom
%  semilogx(Periodfit,Shearfit(:,No), 'red',Period((1+j):(j+r)), Shear((1+j):(j+r)),'red o');hold on
%  semilogx(Periodfit,Shearfit(:,(No+1)), 'magenta', Period((1+j+r):(j+2*r)), Shear((1+j+r):(j+2*r)),'magenta o');hold on
%  semilogx(Periodfit,Shearfit(:,(No+2)), 'green',Period((1+j+2*r):(j+3*r)), Shear((1+j+2*r):(j+3*r)),'green o');hold on
%  semilogx(Periodfit,Shearfit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r-4)), Shear((1+j+3*r):(j+4*r-4)),'blue o');hold on
%  title(['M3093', ' (background+peak)'])
% xlabel('period (s)')
% ylabel(n)
%  text(4, max(Shearfit(:,1))-1.5,txt1)
%  text(4, max(Shearfit(:,1))-2,txt3)
%  text(4, max(Shearfit(:,1))-2.5,txt2)
%  text(4, max(Shearfit(:,1))-3,txt4)
%  text(4, max(Shearfit(:,1))-4,txt5)
% text(10,(min(Shearfit(:,1)))-1,txt02)
% % legend('Shear-1100C-fitting','Shear-1100C','Shear-1050C-fitting','Shear-1050C','Shear-1000C-fitting','Shear-1000C','Shear-950C-fitting','Shear-950C','Location','northwest');
% f3=figure;
% 
% 
% 
% Periodfit=[0.01 0.02 0.05 0.08 0.1 1 5 10 15 20 50 100 200 300 500 1000 1500 2000 5000 7000 1e4]; 
% Temperaturefit=repmat([1373 1273 1223]',[1,21]);
% Waterfit=repmat([50 50 50]',[1,21]);
%  Grainfit=repmat([6.0 6.0 6.0]',[1,21]);
%  for i=1:3
%      
%  J2logfit(:,i)=BackPeakJ2function([Periodfit',Temperaturefit(i,:)',Waterfit(i,:)',Grainfit(i,:)'],x);
%   J1fit(:,i)=BackPeakJ1function([Periodfit' Temperaturefit(i,:)' Waterfit(i,:)', Grainfit(i,:)'],x);
%  Shearfit(:,i)=((10.^J2logfit(:,i)).^2+J1fit(:,i).^2).^(-0.5);
% 
%  
%  
%  end
% % No=17;
% r=10; % number of periods
% j=148; %bottom
%  semilogx(Periodfit,Shearfit(:,1), 'red',Period((1+j):(j+r)), Shear((1+j):(j+r)),'red o');hold on
%  semilogx(Periodfit,Shearfit(:,2), 'magenta', Period((1+j+r):(j+2*r)), Shear((1+j+r):(j+2*r)),'magenta o');hold on
%  semilogx(Periodfit,Shearfit(:,3), 'green',Period((1+j+2*r):(j+3*r)), Shear((1+j+2*r):(j+3*r)),'green o');hold on
% %  semilogx(Periodfit,Shearfit(:,(No+3)), 'blue',Period((1+j+3*r):(j+4*r-4)), Shear((1+j+3*r):(j+4*r-4)),'blue o');hold on
%  title(['M3097', ' (background+peak)'])
% xlabel('period (s)')
% ylabel(n)


end
