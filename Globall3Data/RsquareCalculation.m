 

clc
clear
load('Results.mat')

SSE=sum(residual.^2);
Average=mean([J1 J2log]);

SSTJ1=sum((J1-Average(1)).^2);
R2J1=1-SSE(1)./SSTJ1;
