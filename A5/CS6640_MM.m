
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

bg = CS6640_backgound(vidObj);

k=1;

% Intensity threshold for establishing movement
thresh = 0.5;

vidObj.CurrentTime = 0;
while hasFrame(vidObj)
    vidFrame = double(rgb2gray(readFrame(vidObj)));
    
    % Gaussian Blur
    %vidFrame = imgaussfilt(vidFrame, 2);

    % Initialize frames first time through
    if k==1
        im = vidFrame;
        im_subtract = im;
        ROW = size(vidFrame,1);
        COL = size(vidFrame,2);
        im_tracks = zeros(ROW, COL);
    else
        % Find movement by checking sequential frames
        im_subtract = abs(vidFrame - im_last);
    end
    
    % Save current image for next procesing loop
    im_last = vidFrame;
    
    % background difference 
    im_diff = abs(bg - mat2gray(vidFrame));
    d_max = max(max(im_diff));
    
    % capture movement and use a threshold to filter small variances
    im_movement = im_diff > thresh*d_max;
    %im_movement = im_subtract > 30;
      
    %%%%%%%%%%%%
    % MORPHOLOGY
    %%%%%%%%%%%%

    im_dil = bwmorph(im_movement, 'dilate', 18);
    
    im_erode = bwmorph(im_dil, 'erode', 12);
    
    %%%%%%%%%%%%
    
    % Capture video
    figure(1);
    imshow(im_erode);
    M(k) = getframe(gca);

    k = k+1;
end

end