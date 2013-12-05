function [ output ] = CharBreaker( filename )

filelist = dir('results\*.jpg');
k = 1;
counter = 1;
while k <= length(filelist)
    image = im2double(imread(['results\' filelist(k).name]));
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
    toReturn = [];
    for j=1:size(A,1)
        I2 = imcrop(image,[A(j,1) 0 A(j,2) - A(j,1) size(image,2) ]);    % [X Y width height]
        % outputs results in separate figure windows
        %figure(j); clf; im;imshow(I2);     %can comment out if necessary
        imwrite(I2,sprintf('charresults/charresult_%.2d.jpg',counter),'jpg');
        outputName = ['textoutputs\',filename num2str(counter) '.txt'];
        fileID = fopen(outputName,'w');
        fprintf(fileID,'%.4f,',I2);
        %fprintf(fileID,'A');
        fclose(fileID);
        counter = counter + 1;
        %toReturn = [toReturn; I2]; 
    end
    k = k + 1;
end

