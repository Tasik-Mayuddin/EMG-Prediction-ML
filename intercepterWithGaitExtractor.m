function [emg_arr, imu_arr] = intercepterWithGaitExtractor(emg, imu, gcRight)

[~, k] = intersect(gcRight(:,1), emg(:,1));

%% single gait cycle extracting

gcRightArr = table2array(gcRight(k,:));
gcCount = 0;

for z = 2:size(gcRight, 1)
    if gcRightArr(z,2) < gcRightArr(z-1,2) 
        gcStart = z;
        gcCount = gcCount + 1;
    elseif gcCount == 7 && gcRightArr(z+1,2) < gcRightArr(z,2)
        gcEnd = z;
        break
    end
end

[~, i] = intersect(emg(:,1), gcRight(gcStart:gcEnd,1));

%% convert table to array, extracting all lower extremity muscles

emg = emg(:,["gastrocmed", "tibialisanterior", "soleus", "vastusmedialis", "vastuslateralis", "rectusfemoris", "bicepsfemoris", "semitendinosus", "gracilis", "gluteusmedius"]);
%imu = imu(:,[2,3,4,5,6,7,20,21,22,23,24,25]);
imu = imu(:,2:end);

emg_arr = table2array(emg)';
imu_arr = table2array(imu(gcStart:gcEnd,:))';

%% pre-processing filter at 8Hz

emg_arr = abs(emg_arr);
emg_arr = EMGprocessor(emg_arr', 1000, 8)';

%% normalize EMG of each gait cycle from 0 - 1

emg_arr = abs(emg_arr(:,i));
for j = 1:size(emg_arr, 1)
    emg_arr(j,:) = normalize(emg_arr(j,:), 'range');
end


end