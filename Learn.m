function [ prob,letters ] = Learn( train, answers )
%input: array training images,
%       array indicating correct values of each image in the training array
%output: 3d array of pixel probabilities. Each slice represents a character
         %The indeces of letters correspond to the indeces of
         %probabilities
%character.

numOfChars = size(unique(answers),2);

prob = zeros([size(train(:,:,1)),numOfChars]);
letters = sort(unique(answers));

for i = 1:size(train,3);
    char = find(letters == answers(i));
    prob(:,:,char) = prob(:,:,char) + train(:,:,i); %calculates total occurrences of each pixel
end

counts = zeros(size(answers));
for i = 1:length(answers);
    counts(i) = sum(answers==answers(i));
end


for i =1:size(prob,3);
    prob(:,:,i) = prob(:,:,i)./counts(i); %averages probs
end






end

