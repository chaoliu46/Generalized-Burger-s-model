clc
clear
%velocity measurement
 load Draw.mat
 f1=figure;
% hold on
Period=10;
% Temperature=1173;
grainsize=10000;
water=[5,50,100,150,200];
% plotVelocity(Period,1000,water(1),x,0,'-')
plotVelocity(Period,grainsize,water(1),x,1,'-')
b=1;
for i=2:numel(water)
% 
plotVelocityPartial(Period,grainsize,water(i),x,1,'-');

end
ax=gca;
% ax.XDir = 'reverse';
ax.YDir = 'reverse';
ylim([0 150])
% xlim([0 150])
xlim([0.7 1.0])