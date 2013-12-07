function [listOfFolderNames] = GetFolderNames
%Code taken from Image Analyst
%http://www.mathworks.com/matlabcentral/newsreader/view_thread/266236
%to help loop through directories
    % Change the current folder to the folder of this m-file.
    % (The line of code below is from Brett Shoelson of The Mathworks.)
    cd(fileparts(which(mfilename)));

    % Define some top-level folder.
    start_path = cd;
    topLevelFolder = uigetdir(start_path);
    % topLevelFolder = 'c:\program files\Matlab\work';

    % Generate list of all subfolders.
    % Unfortunately they'll be all in one big long string, separated by
    % semi colons.
    allSubFolders = genpath(topLevelFolder);

    % Scan through them separating them.
    remain = allSubFolders;
    listOfFolderNames = {};
    while true % Demo code adapted from the help file.
    [singleSubFolder, remain] = strtok(remain, ';');
    if isempty(singleSubFolder), break; end
    listOfFolderNames = [listOfFolderNames singleSubFolder];
    end
end

