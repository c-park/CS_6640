% Testing.m - Script for testing the code for Assignment 6
% 
%
% Author:
%     Cade Parkison
%     UU
%     Fall 2018
%

%%%%%%%%%%%
%% Problem 1
%%%%%%%%%%%


clear all;close all;clc

load('M1.mat');
load('M2.mat');
load('M3.mat');

vidObj = VideoReader('video3.avi');
vidObj2 = VideoReader('video3.avi');
vidObj3 = VideoReader('video3.avi');
M = M3;

%%%%%%%%%%%
% RESULTS 1


% My own M2 data
M2_ = CS6640_MM(vidObj2);
ims2 = CS6640_ac(M2_, vidObj2);
implay(ims2);

M2_results = CS6640_display_results(ims2, vidObj3); 

% Display Results from A4
M2_results_o = CS6640_display(M2_, vidObj3); 

im = rgb2gray(read(vidObj,51));
imsho(im)
frame1 = M2_results(15).cdata;
imshow(frame1)
frame1_original = M2_results_o(15).cdata;
imshow(frame1_original)



%%%%%%%%%%%
%% Problem 2
%%%%%%%%%%%

clear all;close all;clc
vidObj = VideoReader('video3.avi');

im_rgb = read(vidObj, 51);
im = double(rgb2gray(im_rgb));

imshow(im,[]);

% Parking lot
clf;
imshow(im,[]);
hold on;
plot(372,340, 'r+', 'MarkerSize', 30);

[phi,tr] = CS6640_level_set(im,1000,0.8,340,372);

bw = zeros([480,640]);
indexes = find(phi<=0);
for j=1:length(indexes)
    ind = indexes(j);
    bw(ind) = 1;
end        
combo(mat2gray(im), bw);

plot(tr)

% Sidewalk
[phi,tr] = CS6640_level_set(im,1000,0.8,425,500);
plot(tr);
xlabel('Iterations');
ylabel('Trace');


% Moving Car
clf;
imshow(im,[]);
hold on;
plot(307,169, 'r+', 'MarkerSize', 20);

[phi,tr] = CS6640_level_set(im,1000,0.8,169,307);

bw = zeros([480,640]);
indexes = find(phi<=0);
for j=1:length(indexes)
    ind = indexes(j);
    bw(ind) = 1;
end       
combo(mat2gray(im), bw);











