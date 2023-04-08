function [emg_arr, imu_arr] = intercepterWithTripleGaitExtractor(emg, imu, gcRight)

[~, k] = intersect(gcRight(:,1), emg(:,1));

%% triple gait cycle extracting

gcRight = gcRight(k,:);
gcStart = NaN;
gcCount = 0;

for z = 1:size(gcRight, 1)
    if table2array(gcRight(z+1,2)) > 0 && table2array(gcRight(z,2)) <= 0 && gcCount<6
        gcStart = z;
    elseif ~isnan(gcStart) && table2array(gcRight(z+1,2)) < table2array(gcRight(z,2))
        gcCount = gcCount + 1;
        switch gcCount
            case 7
                a = z;
            case 8
                b = z;
            case 9
                gcEnd = z;
                break
        end     
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
    emg_arr(j,1:a-gcStart) = normalize(emg_arr(j,1:a-gcStart), 'range');
    emg_arr(j,a-gcStart+1:b-gcStart) = normalize(emg_arr(j,a-gcStart+1:b-gcStart), 'range');
    emg_arr(j,b-gcStart+1:end) = normalize(emg_arr(j,b-gcStart+1:end), 'range');
end


end