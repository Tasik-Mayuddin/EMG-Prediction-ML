
load("testEmgArr.mat")
load("testImuArr.mat")


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
