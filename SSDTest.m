function [ results ] = SSDTest(testImage, pixelProbs, letters )
%Input: image to test
%       3d array of probilites for each letter of each pixel

%Output: array of probabilities for each character
results = zeros(numel(letters),1)

for i = 1:numel(letters)
    results(i) = sum(sum(log(testImage.*pixelProbs(:,:,i)+.001)));
    results(i) = results(i)+ sum(sum(log(not(testImage).*(1 - pixelProbs(:,:,i))+.001)));
    %results(i)  = -sum((testImage - pixelProbs(:,:,i).^2));
end

