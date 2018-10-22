
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

% Pause time to limit playback rate
p = 0;

k=1;

% Intensity threshold for establishing movement
threshold = 20;
while hasFrame(vidObj)
    vidFrame = double(rgb2gray(readFrame(vidObj)));

    % Initialize frames first time through
    if k==1
        im = vidFrame;
        im_subtract = im;
        ROW = size(vidFrame,1);
        COL = size(vidFrame,2);
        im_tracks = zeros(ROW, COL);
    else
        % Find movement by checking sequential frames
        im_subtract = vidFrame - im_last;
    end
    
    % Save current image for next procesing loop
    im_last = vidFrame;
    
    % capture movement and use a threshold to filter small variances
    im_movement = im_subtract > threshold;
      
    %%%%%%%%%%%%
    % MORPHOLOGY
    %%%%%%%%%%%%
    
    strel1 = strel('disk',1);
    im_open = imopen(im_movement,strel1);
    
    %im_open = bwareaopen(im_open,7);
    
    strel2 = strel('rectangle', [40,65]);
    %strel2 = strel('disk', 20);
    im_dil = imdilate(im_open, strel2);
    
    %im_fill = imfill(im_dil, 'holes');
    
    strel3 = strel('rectangle', [20,25]);
    %strel3 = strel('disk', 10);
    im_erode = imerode(im_dil, strel3);
    
    %%%%%%%%%%%%
    
    % Capture video
    figure(1);
    imshow(im_erode);
    M(k) = getframe(gca);
    %pause(p);

    k = k+1;
end

end