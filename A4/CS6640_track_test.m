
function [M] = CS6640_track_test(video)
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

% Intensity threshold for establishing movement
threshold = 30;
while hasFrame(video)
    vidFrame = double(rgb2gray(readFrame(video)));

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
            
    % Capture video
    figure(1);
    imshow(im_movement);
    M(k) = getframe(gca);

    k = k+1;
end

end