clc; clear all; close all;

file = 'SUBJECTS';

fList = dir(file);

emg_arr = []; imu_arr = []; 

for i = 3:length(fList)
    bolta = append(file, '\', fList(i).name);
    folta = dir(bolta);
    zolta = append(bolta, '\', folta(3).name, '\levelground\');
    emgTa = append(zolta, 'emg\'); emgList = dir(emgTa);
    imuTa = append(zolta, 'imu\'); imuList = dir(imuTa);
    gcRightTa = append(zolta, 'gcRight\'); gcRightList = dir(gcRightTa);

    for j = 3:length(emgList)
        [emg_temp, imu_temp] = intercepterWithGaitExtractor(importdata(append(emgTa, emgList(j).name)), importdata(append(imuTa, emgList(j).name)), importdata(append(gcRightTa, emgList(j).name)));
        emg_arr = [emg_arr emg_temp];
        imu_arr = [imu_arr imu_temp];
    end
end

load("trial_01_5L27N.mat");
imu_arr = imu_arr';

for i = 1:size(imu_arr, 1)
    output = predict(trainedNetwork_1, imu_arr(i,:));
    ntwk(:,i) = output;
end

RMSE = zeros(size(emg_arr, 1), 1);
R2 = zeros(size(emg_arr, 1), 1);

for j = 1:size(emg_arr, 1)
    E = emg_arr(j,:) - ntwk(j,:);
    SQE = E.^2;
    MSE = mean(SQE);
    RMSE(j) = sqrt(MSE);
    R2(j) = calculateR2(emg_arr(j,:), ntwk(j,:));
end

RSME_R2 = [RMSE, R2];
