% Testing.m - Script for testing the code for Assignment 2.
% 
% Each Problem is seperated into Matlab code sections and can be ran 
%     individually by presing CTRL-Enter with the cursor in that block. 
%
% Author:
%     Cade Parkison
%     UU
%     Fall 2018
%


%% Problem 1

% Test image
im1 = imread('im1.jpg');
imshow(im1);

T = CS6640_Laws(rgb2gray(im1));
[cidx,ctrs] = kmeans(T,4);
combo(mat2gray(rgb2gray(im1)),(reshape(cidx==1,480,640)));
combo(mat2gray(rgb2gray(im1)),(reshape(cidx==2,480,640)));
combo(mat2gray(rgb2gray(im1)),(reshape(cidx==3,480,640)));
combo(mat2gray(rgb2gray(im1)),(reshape(cidx==4,480,640)));
%combo(mat2gray(rgb2gray(im1)),(reshape(cidx==5,480,640)));
%combo(mat2gray(rgb2gray(im1)),(reshape(cidx==6,480,640)));
%combo(mat2gray(rgb2gray(im1)),(reshape(cidx==7,480,640)));
%combo(mat2gray(rgb2gray(im1)),(reshape(cidx==8,480,640)));
%combo(mat2gray(rgb2gray(im1)),(reshape(cidx==9,480,640)));
%combo(mat2gray(rgb2gray(im1)),(reshape(cidx==1|cidx==2,480,640)));




%% Problem 2


% Test image
im1 = imread('im1.jpg');

% Test points
cpts = [0 0; 0 0; 100 100; 100 100];
[m,n] = size(cpts);
num_cor = m/2;

% affine/quadratic switch (1=quadratic)
s = 0;

[imr,q,A] = CS6640_register(im1, s, cpts);



%% Problem 3


video = VideoReader('video.avi');

[M,tr] = CS6640_track(video);

% Display a red marker on original video 
displayTrack(video, tr);



%% MISC



