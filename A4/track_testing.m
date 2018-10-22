
function M = track_testing(video)
% CS6640_track - track motion in a video
% On input:
%     video (video structure): input video
% On output:
%       M (movie structure): movie of detected differences
%           in video
%       tracks (kx2 array): row,col center of mass of largest
%           moving object in sequential video frames
% Call:
%     [M,tr] = CS6640_track(video);
% Author:
%     Stephen Jenkins
%     UU
%     Fall 2018
%

k=1;

% Find background of vidObj
im_bg = CS6640_backgound(video);

threshold = 40;
while hasFrame(video)
    vidFrame = double(rgb2gray(readFrame(video)));

    %
    %
    
    % Save current image for next procesing loop
    %im_last = vidFrame;
    
    % capture movement and use a threshold to filter small variances
    %im_movement = im_subtract > threshold;
    im_movement = im_bg > threshold;
    size(im_movement)
    
    % Capture video
    imshow(im_movement);
    M(k) = getframe(gca);

    k = k+1;
    
end

end