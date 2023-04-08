clc; clear all; close all;

load("fixedTrain.mat");
load("fixedVal.mat")

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