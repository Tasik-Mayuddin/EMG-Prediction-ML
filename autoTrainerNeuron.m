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

i5L23N = [
    featureInputLayer(24,"Name","featureinput")
    fullyConnectedLayer(23,"Name","fc")
    reluLayer("Name","relu")
    fullyConnectedLayer(23,"Name","fc_1")
    reluLayer("Name","relu_1")
    fullyConnectedLayer(23,"Name","fc_2")
    reluLayer("Name","relu_2")
    fullyConnectedLayer(23,"Name","fc_2_1")
    reluLayer("Name","relu_3")
    fullyConnectedLayer(23,"Name","fc_2_2")
    fullyConnectedLayer(10,"Name","fc_3")
    regressionLayer("Name","regressionoutput")];
i5L24N = [
    featureInputLayer(24,"Name","featureinput")
    fullyConnectedLayer(24,"Name","fc")
    reluLayer("Name","relu")
    fullyConnectedLayer(24,"Name","fc_1")
    reluLayer("Name","relu_1")
    fullyConnectedLayer(24,"Name","fc_2")
    reluLayer("Name","relu_2")
    fullyConnectedLayer(24,"Name","fc_2_1")
    reluLayer("Name","relu_3")
    fullyConnectedLayer(24,"Name","fc_2_2")
    fullyConnectedLayer(10,"Name","fc_3")
    regressionLayer("Name","regressionoutput")];
i5L25N = [
    featureInputLayer(24,"Name","featureinput")
    fullyConnectedLayer(25,"Name","fc")
    reluLayer("Name","relu")
    fullyConnectedLayer(25,"Name","fc_1")
    reluLayer("Name","relu_1")
    fullyConnectedLayer(25,"Name","fc_2")
    reluLayer("Name","relu_2")
    fullyConnectedLayer(25,"Name","fc_2_1")
    reluLayer("Name","relu_3")
    fullyConnectedLayer(25,"Name","fc_2_2")
    fullyConnectedLayer(10,"Name","fc_3")
    regressionLayer("Name","regressionoutput")];
i5L27N = [
    featureInputLayer(24,"Name","featureinput")
    fullyConnectedLayer(27,"Name","fc")
    reluLayer("Name","relu")
    fullyConnectedLayer(27,"Name","fc_1")
    reluLayer("Name","relu_1")
    fullyConnectedLayer(27,"Name","fc_2")
    reluLayer("Name","relu_2")
    fullyConnectedLayer(27,"Name","fc_2_1")
    reluLayer("Name","relu_3")
    fullyConnectedLayer(27,"Name","fc_2_2")
    fullyConnectedLayer(10,"Name","fc_3")
    regressionLayer("Name","regressionoutput")];
i5L28N = [
    featureInputLayer(24,"Name","featureinput")
    fullyConnectedLayer(28,"Name","fc")
    reluLayer("Name","relu")
    fullyConnectedLayer(28,"Name","fc_1")
    reluLayer("Name","relu_1")
    fullyConnectedLayer(28,"Name","fc_2")
    reluLayer("Name","relu_2")
    fullyConnectedLayer(28,"Name","fc_2_1")
    reluLayer("Name","relu_3")
    fullyConnectedLayer(28,"Name","fc_2_2")
    fullyConnectedLayer(10,"Name","fc_3")
    regressionLayer("Name","regressionoutput")];
i5L29N = [
    featureInputLayer(24,"Name","featureinput")
    fullyConnectedLayer(29,"Name","fc")
    reluLayer("Name","relu")
    fullyConnectedLayer(29,"Name","fc_1")
    reluLayer("Name","relu_1")
    fullyConnectedLayer(29,"Name","fc_2")
    reluLayer("Name","relu_2")
    fullyConnectedLayer(29,"Name","fc_2_1")
    reluLayer("Name","relu_3")
    fullyConnectedLayer(29,"Name","fc_2_2")
    fullyConnectedLayer(10,"Name","fc_3")
    regressionLayer("Name","regressionoutput")];
i5L30N = [
    featureInputLayer(24,"Name","featureinput")
    fullyConnectedLayer(30,"Name","fc")
    reluLayer("Name","relu")
    fullyConnectedLayer(30,"Name","fc_1")
    reluLayer("Name","relu_1")
    fullyConnectedLayer(30,"Name","fc_2")
    reluLayer("Name","relu_2")
    fullyConnectedLayer(30,"Name","fc_2_1")
    reluLayer("Name","relu_3")
    fullyConnectedLayer(30,"Name","fc_2_2")
    fullyConnectedLayer(10,"Name","fc_3")
    regressionLayer("Name","regressionoutput")];

[net5L23N, info5L23N] = trainNetwork(dsTrain,i5L23N,opts);
[net5L24N, info5L24N] = trainNetwork(dsTrain,i5L24N,opts);
[net5L25N, info5L25N] = trainNetwork(dsTrain,i5L25N,opts);
[net5L27N, info5L27N] = trainNetwork(dsTrain,i5L27N,opts);
[net5L28N, info5L28N] = trainNetwork(dsTrain,i5L28N,opts);
[net5L29N, info5L29N] = trainNetwork(dsTrain,i5L29N,opts);
[net5L30N, info5L30N] = trainNetwork(dsTrain,i5L30N,opts);


save("iterNeuron23_30.mat", "net5L23N", "net5L24N", "net5L25N", "net5L27N", "net5L28N", "net5L29N", "net5L30N",...
    "info5L23N", "info5L24N", "info5L25N", "info5L27N", "info5L28N", "info5L29N", "info5L30N")

   
