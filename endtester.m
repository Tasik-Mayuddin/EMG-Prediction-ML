clc; clear all; close all;

load("final5L28N.mat");

emg = importdata("TEST\AB17\11_11_2018\levelground\emg\levelground_ccw_normal_01_02.mat");
imu = importdata("TEST\AB17\11_11_2018\levelground\imu\levelground_ccw_normal_01_02.mat");
gcRight = importdata("TEST\AB17\11_11_2018\levelground\gcRight\levelground_ccw_normal_01_02.mat");

[emg_arr, imu_arr] = intercepterWithTripleGaitExtractor(emg, imu, gcRight);
imu_arr = imu_arr';

ntwk = zeros(10, size(emg_arr, 2));

for i = 1:size(imu_arr, 1)
    output = predict(trainedNetwork_1, imu_arr(i,:));
    ntwk(:,i) = output;
end

muscles = string(emg.Properties.VariableNames);
muscles = ["Gastrocnemius Medialis", "Tibialis Anterior", "Soleus", "Vastus Medialis", "Vastus Lateralis", "Rectus Femoris", "Biceps Femoris", "Semitendinosus", "Gracilis", "Gluteus Medius"];
t = 0:0.005:(size(emg_arr,2)-1)*0.005;

figure(1)

for j = 1:length(muscles)
    subplot(3,4,j)
    plot(t, emg_arr(j,:), 'b')
    hold on
    plot(t, ntwk(j,:), 'r')
    hold off
    xlabel('t (s)'); ylabel('Normalized EMG'); title(sprintf(muscles(j)), 'FontSize', 20);
end

legend1 = legend('show', 'Actual', 'Prediction');
set(legend1,...
    'Position',[0.776996529306698 0.145205955381169 0.101041664447014 0.0898234657904564],...
    'LineWidth',1,...
    'Interpreter','none',...
    'FontSize',24,...
    'EdgeColor',[0.15 0.15 0.15]);


clear trainedNetwork_1