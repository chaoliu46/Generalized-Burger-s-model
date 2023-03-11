clc 
clear
load Draw.mat
f=figure;
 Temperature=1273;
% Period=10;
grainsize=10000;
water=[1,3,10,50,30,100,200];
b=1;
plotModelPaper(Temperature,1000,water(1),x,1,'r-',1)
semilogx(1/3,log10(1/40),'o')
semilogx(1/3,log10(1/3200),'*')
semilogx(60,log10(1/80),'*')
semilogx(100,log10(1/60),'o')
for i=2:numel(water)
    
% plotTemperatureVS(Period,grainsize,water(i),x,1,'-')
% % plotTemperatureVS(Period,grainsize,water(i),x,0,'.')
% plotTemperatureVS(Period,grainsize,water(i),x,2,'-')
plotModelPaper(Temperature,grainsize,water(i),x,1,'b-',1)
% plotModelPaper(Temperature,grainsize,water(i),x,1,'-',1)
% plotModelPaper(Temperature,grainsize,water(i),x,0,'.')
% plotModelPaper(Temperature, grainsize, water(i),x,2,'-')
end
% Periodobserve=[0.33 0.33 100 60];
% Attenuobserve=[1/60 1/3200 1/50 1/600];
% ErrorobserveL=[1/30 1/2500  1/50 1/500];
% ErrorobserveP=[1/100 1/4000  1/100 1/700];
% semilogx(Periodobserve,log10(Attenuobserve),'d','MarkerSize',10)
% errorbar(Periodobserve,log10(Attenuobserve),log10(ErrorobserveL),log10(ErrorobserveP),'d','MarkerSize',10);
hold on
% f2=figure;
% for i=1:numel(water)
% %     
% % % plotTemperatureVS(Period,grainsize,water(i),x,1,'-')
% % % plotTemperatureVS(Period,grainsize,water(i),x,0,'.')
% % % plotTemperatureVS(Period,grainsize,water(i),x,2,'-')
% % % plotModelPaper(Temperature,grainsize,water(i),x,1,'d',2)
% plotModelPaper(Temperature,grainsize,water(i),x,1,'-',2)
% % % plotModelPaper(Temperature,grainsize,water(i),x,0,'.')
% % % plotModelPaper(Temperature, grainsize, water(i),x,2,'-')
% end




% % ----------------------------------------------------
% f1=figure;
% % hold on
% subplot(2,2,1)
% Period=100;
% Temperature=1273;
% grainsize=50;
% water=[1,10,20,50,100,200];
% b=1;
% for i=1:numel(water)
%  plotTemperatureVS(Period,grainsize,water(i),x,1,'-')   
% % plotModelPaper(Temperature,grainsize,water(i),x,1,'-')
% % plotModelPaper(Temperature,grainsize,water(i),x,0,'.')
% % plotModelPaper(Temperature, grainsize, water(i),x,2,'-')
% end
% 
% hold off
% 
% subplot(2,2,2)
% grainsize=100;
% for i=1:numel(water)
%  plotTemperatureVS(Period,grainsize,water(i),x,1,'-')   
% % plotModelPaper(Temperature,grainsize,water(i),x,1,'-')
% % plotModelPaper(Temperature,grainsize,water(i),x,0,'.')
% % plotModelPaper(Temperature, grainsize, water(i),x,2,'-')
% end
% hold off
% 
% subplot(2,2,3)
% grainsize=1000;
% for i=1:numel(water)
%   plotTemperatureVS(Period,grainsize,water(i),x,1,'-')  
% % plotModelPaper(Temperature,grainsize,water(i),x,1,'-')
% % plotModelPaper(Temperature,grainsize,water(i),x,0,'.')
% % plotModelPaper(Temperature, grainsize, water(i),x,2,'-')
% end
% hold off
% 
% subplot(2,2,4)
% grainsize=10000;
% for i=1:numel(water)
%   plotTemperatureVS(Period,grainsize,water(i),x,1,'-')  
% % plotModelPaper(Temperature,grainsize,water(i),x,1,'-')
% % plotModelPaper(Temperature,grainsize,water(i),x,0,'.')
% % plotModelPaper(Temperature, grainsize, water(i),x,2,'-')
% end
% hold off
% 
% % % ----------------------------------------
% % Temperature=[1173 1273 1373 1473];
% % grainsize=10000;
% % water=100;
% % for i=1:numel(Temperature)
% %     
% % plotModelPaper(Temperature(i),grainsize,water,x,1,'-')
% % % plotModelPaper(Temperature(i),grainsize,water,x,3,'.')
% % % plotModelPaper(f1,Temperature, grainsize, water,x,2,b)
% % 
% % 
% % 
% % end
% ----------------------------------------