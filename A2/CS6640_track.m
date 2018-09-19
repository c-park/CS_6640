function  [M,tracks] = CS6640_track(video)
% CS6640_track - track motion in a video
% On input:
%     video (video structure): input video
% On output:
%     M (movie structure): movie of detected differences in video
%     tracks (kx2 array): row,col center of mass of largest moving object
%         in sequential video frames
% Call:
%     [M,tr] = CS6640_track(video);
% Author:
%     Cade Parkison
%     UU
%     Fall 2018
%

tracks = [];

m = video.height;
n = video.width;

% Find background of vidObj
bg = CS6640_backgound(video);

% Loop over each frame and create difference image

% Movie 

i = 1;
video.CurrentTime = 0;
while hasFrame(video)
    vidFrame = readFrame(video);
  
    dff = mat2gray(double(rgb2gray(vidFrame))) - bg;
    
    imshow(dff);
    M(i) = getframe(gca);
    
    % Find centroid of binary image
    im = rgb2gray(M(i).cdata);
    % Threshold dff images to remove noise ( this will be Binary)
    imT = im > 50;
    [y, x] = ndgrid(1:m, 1:n);
    centroid = mean([x(imT), y(imT)]);
    tracks = [tracks; centroid]; 
    
    i = i+1;
end


% movie structure - immovie(X,cmap) X is multiframe indexed image
%M = zeros(m,n);
%M = immovie(M