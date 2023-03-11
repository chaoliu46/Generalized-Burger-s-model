function temperatureDepth= thermal()
%depth 175My 120My 100My 70My   25My
FileID=fopen('rawdata/thermalAll.txt');
Y=textscan(FileID,'%f64 %f64 %f64 %f64 %f64 %f64');
% STemperature=[Y{1,1}];
% depth=[Y{1,2},Y{1,3},Y{1,4},Y{1,5}];% 100 Ma,125 Ma, 150 Ma, 170 Ma,

% figure
% for i=1:4
% plot(STemperature+273, depth(:,i))
% hold on
% end
% ylabel('Depth (km)')
%  xlabel('Temperature (K)')
%  ylim([0 100])
%  ax=gca;
% ax.YDir = 'reverse';

temperatureDepth=[Y{1,1},Y{1,2},Y{1,3},Y{1,4},Y{1,5},Y{1,6}];
end