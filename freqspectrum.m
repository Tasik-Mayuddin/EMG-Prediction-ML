clc; clear all; close all;

gcRight = importdata("SUBJECTS\AB06\10_09_18\levelground\gcRight\levelground_ccw_normal_01_01.mat"); 
emg = importdata("SUBJECTS\AB06\10_09_18\levelground\emg\levelground_ccw_normal_01_01.mat"); 
imu = importdata("SUBJECTS\AB06\10_09_18\levelground\imu\levelground_ccw_normal_01_01.mat"); 


%% convert table to array, extracting all lower extremity muscles

emg = emg(:,["gastrocmed", "tibialisanterior", "soleus", "vastusmedialis", "vastuslateralis", "rectusfemoris", "bicepsfemoris", "semitendinosus", "gracilis", "gluteusmedius"]);


emg_arr = table2array(emg)';


emg_arr = abs(emg_arr);

signal = emg_arr(1,:);

N = length(signal);
fs = 1000;
f = linspace(0,fs,N);
fnyst = fs/2;

Y = abs(fft(signal, N));
plot(f(1:N), Y(1:N))


