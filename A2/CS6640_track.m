function [M,tracks] = CS6640_track(video)
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