%  Breast Ultrasound Tumor Classification - Batch Prediction

clear; clc; close all;

modelFile = "BreastUS_CNN_Trained.mat";

if ~isfile(modelFile)
    error("❌ Model file not found. Run Train.m first.");
end

load(modelFile, "net");

inputSize = [128 128];

testFolder = uigetdir(pwd, "Select Folder Containing Test Images");

if isequal(testFolder,0)
    disp("❌ No folder selected. Exiting.");
    return;
end

imdsTest = imageDatastore(testFolder, ...
    'IncludeSubfolders', false, ...
    'LabelSource', 'none', ...
    'FileExtensions',{'.jpg','.png','.jpeg','.bmp','.tif','.tiff'});

numImages = numel(imdsTest.Files);
fprintf("\n📂 Number of test images found: %d\n", numImages);


predLabels = strings(numImages,1);

for i = 1:numImages
    
    img = readimage(imdsTest, i);

    % Preprocess
    if size(img,3)==3
        img = rgb2gray(img);
    end
    img = imresize(img, inputSize);
    img = single(img);

    % Predict
    label = classify(net, img);
    predLabels(i) = string(label);

    % Show output
    figure;
    imshow(img, []);
    title(sprintf("Predicted: %s", predLabels(i)), "FontSize",14);
end

fprintf("\n🎉 Batch Prediction Completed!\n");
