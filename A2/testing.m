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
[cidx,ctrs] = kmeans(T,9);
combo(mat2gray(rgb2gray(im1)),(reshape(cidx==1,480,640)));
combo(mat2gray(rgb2gray(im1)),(reshape(cidx==2,480,640)));
combo(mat2gray(rgb2gray(im1)),(reshape(cidx==3,480,640)));
combo(mat2gray(rgb2gray(im1)),(reshape(cidx==4,480,640)));
combo(mat2gray(rgb2gray(im1)),(reshape(cidx==5,480,640)));
combo(mat2gray(rgb2gray(im1)),(reshape(cidx==6,480,640)));
combo(mat2gray(rgb2gray(im1)),(reshape(cidx==7,480,640)));
combo(mat2gray(rgb2gray(im1)),(reshape(cidx==8,480,640)));
combo(mat2gray(rgb2gray(im1)),(reshape(cidx==9,480,640)));
combo(mat2gray(rgb2gray(im1)),(reshape(cidx==1|cidx==4,480,640)));


%% Problem 2

% Test image
im1 = imread('im1.jpg');

% Test points
cpts = [218, 295; 220 293; 325 211; 324 210;...
    358 276; 356 274; 431 196; 432 195];

% affine/quadratic switch (1=quadratic)
s =0;

[imr,q,A] = CS6640_register(im1, s, cpts);

%% Problem 2b

close all
% Test image
im1 = rgb2gray(im2double(imread('imreg1.png')));
im2 = rgb2gray(im2double(imread('imreg2.png')));

% Run Harris to get set of similar points
H1 = CS6640_Harris(im1);
H2 = CS6640_Harris(im2);

%imshow(im1);
%figure()

%combo(im1,H1>0.01);
%figure()
%combo(im2,H2>0.01);

% Test points found using cpselect()
movingPoints = [1.896250000000000e+02,1.726250000000000e+02;...
    86.875000000000010,2.303750000000000e+02;2.276250000000000e+02,...
    1.588750000000000e+02;1.771250000000000e+02,2.328750000000000e+02];

fixedPoints = [2.473750000000000e+02,2.173750000000000e+02;...
    1.291250000000000e+02,2.548750000000000e+02;2.833750000000000e+02,...
    2.123750000000000e+02;2.228750000000000e+02,2.761250000000000e+02];

% create cpts matrix by alternating rows of above matrices
cpts = movingPoints([1;1]*(1:size(movingPoints, 1)), :);
cpts(1:2:end, :) = fixedPoints;


% affine/quadratic switch (1=quadratic)
s = 0;

[imr,q,A] = CS6640_register(im1, s, cpts);


%% Problem 3


video = VideoReader('video.avi');

[M,tr] = CS6640_track(video);

% Display a red marker on original video 
displayTrack(video, tr);



%% MISC
% Further Harris testing
            
close all
% Test image
im1 = rgb2gray(im2double(imread('imreg3.jpg')));
im2 = rgb2gray(im2double(imread('imreg4.jpg')));

% Run Harris to get set of similar points
H1 = CS6640_Harris(im1);
H2 = CS6640_Harris(im2);

imshow(im1);
figure()

combo(im1,H1>0.005);
figure()
combo(im2,H2>0.005);

