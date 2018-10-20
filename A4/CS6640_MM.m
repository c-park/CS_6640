
function M = CS6640_MM(vidObj)
% CS6640_MM - segments moving objects in video
% On input:
%     vidObj (video object obtained by VideoReader): input video
% On output:
%     M (Matlab movie): movie of segmented moving objects
% Call:
%     vidObj = VideoReader(’../../../video.avi’);
%     M = CS6640_MM(vidObj);
% Author:
%     Cade Parkison
%     Fall 2018
%     UU
%

m = vidObj.height;
n = vidObj.width;

% Find background of vidObj
bg = CS6640_backgound(vidObj);

% Loop over each frame and create difference image
i = 1;
vidObj.CurrentTime = 0;
while hasFrame(vidObj)
    vidFrame = readFrame(vidObj);
  
    dff = mat2gray(double(rgb2gray(vidFrame))) - bg;
    % Threshold dff images to binary with threshold
    %bw = dff_gray > 50;
    
    imshow(dff);
    M(i) = getframe(gca); 
    
    i = i+1;
end