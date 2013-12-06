function [ toReturn ] = CharBreaker( lineImages )
%Input: array of images. Each image is a line.
%Output: array of images. Each image is a char.
%filename = 'Sentence'
filelist = dir('results\*.jpg');
k = 1;
counter = 1;
while k <= size(lineImages,3);
    %image = im2double(imread(['results\' filelist(k).name]));
    image = lineImages(:,:,k);
    sums = sum(image <.4 , 1) > 0;

    A = [];
    i = 1;
    % scan image vertically for lines of text
    while (i <= size(image,2))
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
    %hardcoding values
    %toReturn = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'};
%    alph = [97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122];
%    S = char(alph);
 toReturn = [];
    for j=1:size(A,1)
        I2 = imcrop(image,[A(j,1) 0 A(j,2) - A(j,1) size(image,2) ]);    % [X Y width height]
        I2 = I2 > .4;
        I2 = imresize(I2, [15 10]);
        % outputs results in separate figure windows
        %figure(j); clf; im;imshow(I2);     %can comment out if necessary
        %imwrite(I2,sprintf('charresults/charresult_%.2d.jpg',counter),'png');
%        imwrite(I2,sprintf('charresults/charresult_%.2s.png',S(counter)),'png');
        toReturn(:,:,j) = I2;
%        outputName = ['textoutputs\',filename num2str(counter) '.txt'];
%         fileID = fopen(outputName,'w');
 %        fprintf(fileID,'%d,',I2);
 %        fprintf(fileID,S(counter));
%         fclose(fileID);
        counter = counter + 1;
    end
    
    k = k + 1;
end


