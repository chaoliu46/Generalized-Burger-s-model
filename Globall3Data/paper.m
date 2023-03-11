clc
clear

load Results.mat

Grain=[1 10 50 80  100 1000];
Temperature=1373;
Water=5;
f=figure;
% for i=1:numel(Grain)
type=2;
b=3;
% PaperPlot(Temperature,Grain(1),Water,x,type,b,'black');
% PaperPlot(Temperature,Grain(2),Water,x,type,b,'blue');
% PaperPlot(Temperature,Grain(3),Water,x,type,b,'m');
PaperPlot(Temperature,Grain(4),Water,x,type,b,'red');



% end