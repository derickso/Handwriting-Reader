function [ output_args ] = LineBreaker( image )
sums = sum(image <.8 , 2)>0;

%for i = 2:size(sums,1)
%    sums2(i) = xor(sums(i-1),sums(i));
%end
A = [];
startx = find(sums,1);
r1 = startx;
tempx = sums(startx);
for i=startx:size(image,1)
    tempx = sums(i);
    if (tempx == 0)
        r2 = i-1;
        lastx = r2+1;
        A = [A;r1 r2];
        for i=lastx:size(image,1)
            tempx = sums(i)
            if (tempx == 1)
                startx = i;
        end
        break;
    end
end
%while 
%rtemp = find(sums,2);
%r1 = rtemp(1)
%r2 = rtemp(2)
%for i=r1:r2
xwid = size(image,1);
ywid = r2 - r1;
RECT = [0 r1 xwid ywid];
   I2 = imcrop(image,RECT); 
   imshow(I2)
%end
%for i=1:size(sums,1)
%    b.add sums(i) XOR sums(i+1)
        
%end


end

