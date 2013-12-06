files = dir(['./Templates/' '*.' 'png']);
chars = zeros(15,10,1);
answerString = '';
for i= 1:length(files)
    fileName = files(i).name
    %fid = fopen(['Templates/' strrep(fileName,'.png','.txt')])
    answerString = [answerString; importdata(['Templates/' strrep(fileName,'.png','.txt')])];%Don't name files *.png.png unless the txt file is *.txt.txt
    
    lines = LineBreaker(['Templates/' fileName]);
    numEls = size(chars,3)
    if i ~= 1
        numEls = numEls + 1;
    end
    for j=1:size(lines, 3)
        brokenChars = CharBreaker(lines(:,:,j));
        size(chars)
        size(brokenChars)
        for k=1:size(brokenChars,3)
            chars(:,:,numEls+k) = brokenChars(:,:,k);
        end
    end
    
%     chars = CharBreaker(lines)
end
[prob, letters] = Learn(chars,answerString{1})
;