clc; clear all; close all;

emg = importdata("TEST\AB17\11_11_2018\levelground\emg\levelground_ccw_normal_01_02.mat");
imu = importdata("TEST\AB17\11_11_2018\levelground\imu\levelground_ccw_normal_01_02.mat");
gcRight = importdata("TEST\AB17\11_11_2018\levelground\gcRight\levelground_ccw_normal_01_02.mat");

[emg_arr, imu_arr] = intercepterWithGaitExtractor(emg, imu, gcRight);
imu_arr = imu_arr';

plot(emg_arr(1,:))