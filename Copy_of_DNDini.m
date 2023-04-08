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


shuffler = randperm(size(emg_arr, 2));

emg_arr = emg_arr(:, shuffler);
imu_arr = imu_arr(:, shuffler);
train = floor(0.7*size(emg_arr,2));

emg_dsTrain = arrayDatastore(emg_arr(:, 1:train),IterationDimension=2);
imu_dsTrain = arrayDatastore(imu_arr(:, 1:train),IterationDimension=2);
imu_emg_comTrain = combine(imu_dsTrain, emg_dsTrain);
emg_dsVal = arrayDatastore(emg_arr(:, train+1:end),IterationDimension=2);
imu_dsVal = arrayDatastore(imu_arr(:, train+1:end),IterationDimension=2);
imu_emg_comVal = combine(imu_dsVal, emg_dsVal);

load("5layer26.mat");