listing = dir(fullfile( 'Templates\*.jpg'));

templates = zeros(30,30,length(listing));

for j = 1:length(listing)
    im = imread(['Templates\' listing(j).name]);
    im = im2double(im);
    templates(:,:,j) = im;
    
end