clc; clear all; close all;

trainingSetup = load("training5L26N.mat");
dsTrain = trainingSetup.dsTrain;
dsValidation = trainingSetup.dsValidation;
opts = trainingOptions("sgdm",...
    "ExecutionEnvironment","auto",...
    "InitialLearnRate",0.01,...
    "Shuffle","every-epoch",...
    "Plots","training-progress",...
    "ValidationData",dsValidation);
i7L26N = [
    featureInputLayer(24,"Name","featureinput")
    fullyConnectedLayer(26,"Name","fc")
    reluLayer("Name","relu")
    fullyConnectedLayer(26,"Name","fc_1")
    reluLayer("Name","relu_1")
    fullyConnectedLayer(26,"Name","fc_2")
    reluLayer("Name","relu_2")
    fullyConnectedLayer(26,"Name","fc_2_1")
    reluLayer("Name","relu_3")
    fullyConnectedLayer(26,"Name","fc_2_2")
    reluLayer("Name","relu_31")
    fullyConnectedLayer(26,"Name","fc_2_21")
    reluLayer("Name","relu_32")
    fullyConnectedLayer(26,"Name","fc_2_22")
    fullyConnectedLayer(10,"Name","fc_3")
    regressionLayer("Name","regressionoutput")];

i6L26N = [
    featureInputLayer(24,"Name","featureinput")
    fullyConnectedLayer(26,"Name","fc")
    reluLayer("Name","relu")
    fullyConnectedLayer(26,"Name","fc_1")
    reluLayer("Name","relu_1")
    fullyConnectedLayer(26,"Name","fc_2")
    reluLayer("Name","relu_2")
    fullyConnectedLayer(26,"Name","fc_2_1")
    reluLayer("Name","relu_3")
    fullyConnectedLayer(26,"Name","fc_2_2")
    reluLayer("Name","relu_31")
    fullyConnectedLayer(26,"Name","fc_2_21")
    fullyConnectedLayer(10,"Name","fc_3")
    regressionLayer("Name","regressionoutput")];

i5L26N = [
    featureInputLayer(24,"Name","featureinput")
    fullyConnectedLayer(26,"Name","fc")
    reluLayer("Name","relu")
    fullyConnectedLayer(26,"Name","fc_1")
    reluLayer("Name","relu_1")
    fullyConnectedLayer(26,"Name","fc_2")
    reluLayer("Name","relu_2")
    fullyConnectedLayer(26,"Name","fc_2_1")
    reluLayer("Name","relu_3")
    fullyConnectedLayer(26,"Name","fc_2_2")
    fullyConnectedLayer(10,"Name","fc_3")
    regressionLayer("Name","regressionoutput")];

i4L26N = [
    featureInputLayer(24,"Name","featureinput")
    fullyConnectedLayer(26,"Name","fc")
    reluLayer("Name","relu")
    fullyConnectedLayer(26,"Name","fc_1")
    reluLayer("Name","relu_1")
    fullyConnectedLayer(26,"Name","fc_2")
    reluLayer("Name","relu_2")
    fullyConnectedLayer(26,"Name","fc_2_1")
    fullyConnectedLayer(10,"Name","fc_3")
    regressionLayer("Name","regressionoutput")];

i3L26N = [
    featureInputLayer(24,"Name","featureinput")
    fullyConnectedLayer(26,"Name","fc")
    reluLayer("Name","relu")
    fullyConnectedLayer(26,"Name","fc_1")
    reluLayer("Name","relu_1")
    fullyConnectedLayer(26,"Name","fc_2")
    fullyConnectedLayer(10,"Name","fc_3")
    regressionLayer("Name","regressionoutput")];

i2L26N = [
    featureInputLayer(24,"Name","featureinput")
    fullyConnectedLayer(26,"Name","fc")
    reluLayer("Name","relu")
    fullyConnectedLayer(26,"Name","fc_1")
    fullyConnectedLayer(10,"Name","fc_3")
    regressionLayer("Name","regressionoutput")];


[net2L26N, info2L26N] = trainNetwork(dsTrain,i2L26N,opts);
[net3L26N, info3L26N] = trainNetwork(dsTrain,i3L26N,opts);
[net4L26N, info4L26N] = trainNetwork(dsTrain,i4L26N,opts);
[net5L26N, info5L26N] = trainNetwork(dsTrain,i5L26N,opts);
[net6L26N, info6L26N] = trainNetwork(dsTrain,i6L26N,opts);
[net7L26N, info7L26N] = trainNetwork(dsTrain,i7L26N,opts);

save("5L_vN_iter.mat", "net2L26N", "net3L26N", "net4L26N", "net5L26N", "net6L26N", "net7L26N",...
    "info2L26N", "info3L26N", "info4L26N", "info5L26N", "info6L26N", "info7L26N")

   
