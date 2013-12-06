function [ toReturn ] = LineBreaker(fileName )
image = rgb2gray(im2double(imread(fileName)));
sums = sum(image <.8 , 2) > 0;

%for i = 2:size(sums,1)
%    sums2(i) = xor(sums(i-1),sums(i));
%end

A = [];
i = 1;
% scan image horizontally for lines of text
while (i <= size(image,1))
    tempx = sums(i);
    if (tempx == 1)     % found a non-white pixel
        startPos = i;         % set starting line number
        while (tempx == 1)      % until we stop detecting non-white pixels
            i = i + 1;
            tempx = sums(i);
        end
        endPos = i - 1;     % set ending line number
        A = [A;startPos endPos];  % concatenate this region to our list of line coordinates
    end
    i = i + 1;
end
toReturn = [];
for j=1:size(A,1)
    I2 = imcrop(image,[0 A(j,1) size(image,2) A(j,2) - A(j,1)]);    % [X Y width height]
    % outputs results in separate figure windows
    %figure(j); clf; imshow(I2);     %can comment out if necessary
    
    %imwrite(I2,sprintf('results/result_%.2d.jpg',j),'jpg');
    toReturn = [toReturn; I2]; 
end

end
