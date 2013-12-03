%Randall Reyna 72186913
%CS 175 Ind Proj
listOfFolderNames = GetFolderNames;

%loop through all the training directories
numOfCategories = size(listOfFolderNames,2);
categories = [];

for i = 2:numOfCategories;
    
    listing = dir(fullfile([listOfFolderNames{i} '\*.jpg']));
    for j = 1:length(listing)
      close all;
      
      imshow([listOfFolderNames{i} '\' listing(j).name]);
      
      h = imrect(gca,[0,0,30,30]);
      setFixedAspectRatioMode(h,1);
      position = wait(h);
      
      %convert to grayscale and double, crop the selected region and resize
      %it to teh correct size. Then save the image
      im = imread([listOfFolderNames{i} '\' listing(j).name]);
      if(size(im,3) == 3)
          im = rgb2gray(im);
      end
      im = im2double(im);
      im = imcrop(im,position);
      im = imresize(im, [30 30]);
      imwrite(im,[listOfFolderNames{i} '\' listing(j).name],'jpg');
      close;
      
      
      
    end
    
end