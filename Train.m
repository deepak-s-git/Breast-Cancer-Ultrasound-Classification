%  Breast Cancer Ultrasound Classification (Enhanced CNN)

clear; clc; close all;

baseFolder = fullfile(pwd, "ultrasound breast classification");

trainFolder = fullfile(baseFolder, "train");
valFolder   = fullfile(baseFolder, "val");

imdsTrain = imageDatastore(trainFolder, ...
    'IncludeSubfolders', true, 'LabelSource', 'foldernames');

imdsVal = imageDatastore(valFolder, ...
    'IncludeSubfolders', true, 'LabelSource', 'foldernames');

disp("Training images:");
disp(countEachLabel(imdsTrain));
disp("Validation images:");
disp(countEachLabel(imdsVal));

tbl = countEachLabel(imdsTrain);
total = sum(tbl.Count);
classWeights = total ./ (numel(tbl.Count) * tbl.Count);
classWeights = classWeights / sum(classWeights);

inputSize = [128 128];

augmenter = imageDataAugmenter( ...
    'RandRotation',[-15 15], ...
    'RandXReflection',true, ...
    'RandScale',[0.90 1.10]);

augTrain = augmentedImageDatastore(inputSize, imdsTrain, ...
    'ColorPreprocessing','rgb2gray', ...
    'DataAugmentation',augmenter);

augVal = augmentedImageDatastore(inputSize, imdsVal, ...
    'ColorPreprocessing','rgb2gray');

layers = [
    imageInputLayer([128 128 1], "Normalization", "zscore")

    convolution2dLayer(5,16,'Padding','same')
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer(2,"Stride",2)

    convolution2dLayer(5,32,'Padding','same')
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer(2,"Stride",2)

    convolution2dLayer(3,64,'Padding','same')
    batchNormalizationLayer
    reluLayer
    dropoutLayer(0.3)

    fullyConnectedLayer(128)
    reluLayer
    dropoutLayer(0.3)

    fullyConnectedLayer(2)
    softmaxLayer
    classificationLayer("Classes", tbl.Label, "ClassWeights", classWeights')
];

options = trainingOptions("adam", ...
    "InitialLearnRate", 0.0004, ...
    "MiniBatchSize", 32, ...
    "MaxEpochs", 20, ...
    "Shuffle", "every-epoch", ...
    "ValidationData", augVal, ...
    "ValidationFrequency", 50, ...
    "Verbose", true, ...
    "Plots", "training-progress");

[net, trainInfo] = trainNetwork(augTrain, layers, options);

save("BreastUS_CNN_Trained.mat", "net", "trainInfo");

YPred = classify(net, augVal);
YTrue = imdsVal.Labels;

finalAcc = mean(YPred == YTrue) * 100;
fprintf("\n🔥 FINAL VALIDATION ACCURACY = %.2f%%\n", finalAcc);

figure;
confusionchart(YTrue, YPred);
title(sprintf("Validation Accuracy %.2f%%", finalAcc));

classes = categories(YTrue);
numClasses = numel(classes);
C = confusionmat(YTrue, YPred);

fprintf("\n================ METRICS ================\n");
for i = 1:numClasses
    TP = C(i,i);
    FN = sum(C(i,:)) - TP;
    FP = sum(C(:,i)) - TP;
    TN = sum(C(:)) - TP - FN - FP;

    prec = TP/(TP+FP+eps);
    rec  = TP/(TP+FN+eps);
    f1   = 2*(prec*rec)/(prec+rec+eps);
    spec = TN/(TN+FP+eps);

    fprintf("\nClass: %s\n", classes{i});
    fprintf("Precision: %.2f%%\n", prec*100);
    fprintf("Recall: %.2f%%\n", rec*100);
    fprintf("F1-score: %.2f%%\n", f1*100);
    fprintf("Specificity: %.2f%%\n", spec*100);
end
fprintf("\n=========================================\n");
