
clear
clc
% global J1theta
% global J2logtheta

% -------------------------------------------------------------------------
FileID=fopen('rawdata/threedata.txt');
Y=textscan(FileID,'%f64 %f64 %f64 %f64 %f64 %f64 %f64 %f64 %f64');
Period=[Y{1,1}];
PeriodandTemperatureWaterGrainsize=[Y{1,1},Y{1,2},Y{1,3},Y{1,4}];
Qm1=[Y{1,5}];
Shear=[Y{1,6}];
%--------------------------------------------------------------------------
J1=1./(Shear.*(1.+Qm1.^2).^0.5);
J1log=log10(J1);
J2=Qm1./(Shear.*(1.+Qm1.^2).^0.5);
J2log=log10(J2);
% -------------------------------------------------------------------------

J1theta=0.005;
J2logtheta=0.3;


% %    %1       %2      %3        %4            %5          %6           %7          %8              %9           %10         %11             %12              %13             %14               %15                %16        %17        %18      %19         %2 0     %21        %22    %23                         
x0=[ 1        1    0.36      1.2e2         1e4          1e9         0.1        -0.01355         62           0.1             0.86          0.6e5              0.23                          0.1       ];
xL=[0       0    0.3      0.50e1        1e3          1e7           0             -0.0140         62          0               0.86            0.5e5             0.00001                        1e-10     ] ;
xH=[5      5   0.5       2e8          1e6           10e10        1e1         -0.0135          62           800               0.86          0.65e5              1                              10              ];
%       
%-----------------------------------------------------------------------------------------------------------

b=1;

fun=@(X,PeriodandTemperiature) [BackPeakJ1function(PeriodandTemperatureWaterGrainsize,X,b)./J1theta,BackPeakJ2function(PeriodandTemperatureWaterGrainsize,X,b)./J2logtheta];
options = optimoptions(@LSQCURVEFIT,'Algorithm','trust-region-reflective','MaxIterations',10000);
% options.MaxFunctionEvaluations = 5000;
[x,resnorm,residual,exitflag,output,lambda,jacobian]=lsqcurvefit(fun,x0,PeriodandTemperatureWaterGrainsize,[(J1)./J1theta,(J2log)./J2logtheta],xL,xH,options);
% x(12)=3;% x(8)=-0.027;
% x(9)=69;
%-------------------------------------------------------------------------------------------------------------
%     test=BackPeakJ2function(PeriodandTemperatureWaterGrainsize,x,2);
%  AfigureplotJ1(J1,Period,x,J1theta,resnorm,'J1',b);
%  AfigureplotJ2(J2log,Period,x,J2logtheta,resnorm,'J2log',b);
 plotQandS(Shear,Qm1,Period,x,J2logtheta,resnorm,'log(Q^{-1})','Shear modulus(GPa)',b); 
%  plotQandS1(Shear,Qm1,Period,x,J2logtheta,resnorm,'log(Q^{-1})','Shear modulus(GPa)',b);
%  plotQandSPaper(Shear,Qm1,Period,x,J2logtheta,resnorm,'log(Q^{-1})','Shear modulus(GPa)',b);
  txt01=['standard error \delta = ' num2str(J2logtheta) ];
   
    
%-------------------------------------------------------------------------------------------------------------
% theta=[repmat(1./J1theta.^2,[1 178]) repmat(1./J2logtheta.^2,[1 178])];
theta=[repmat(1./J1theta,[1 numel(Period)]) repmat(1./J2logtheta,[1 numel(Period)])];
W=diag(theta);
JtWJ=jacobian'*W*jacobian;
p=(JtWJ)^(-1);
Uncerntainty=(sqrt(diag(p)))';


beep










