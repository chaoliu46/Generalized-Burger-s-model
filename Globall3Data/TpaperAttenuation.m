clear
load draw.mat
f=figure;
 Temperature=1273;
% Period=10;
grainsize=10000;
water=[1,3,10,50,30,100,200];
bg=100;
plotModelPaper(Temperature,bg,water(1),x,1,'g.',1)
semilogx(1/3,log10(1/40),'o')
semilogx(1/3,log10(1/3200),'*')
semilogx(60,log10(1/80),'*')
semilogx(100,log10(1/60),'o')
for i=2:numel(water)
    
% plotTemperatureVS(Period,grainsize,water(i),x,1,'-')
% % plotTemperatureVS(Period,grainsize,water(i),x,0,'.')
% plotTemperatureVS(Period,grainsize,water(i),x,2,'-')
plotModelPaper(Temperature,grainsize,water(i),x,1,'blue-',1)
% plotModelPaper(Temperature,grainsize,water(i),x,1,'-',1)
% plotModelPaper(Temperature,grainsize,water(i),x,0,'.')
% plotModelPaper(Temperature, grainsize, water(i),x,2,'-')
end

hold on



