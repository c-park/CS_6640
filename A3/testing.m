% Testing.m - Script for testing the code for Assignment 3.
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
clear all;close all;clc
im = rgb2gray(imread('im2.jpg'));

% Get texture parameter and pass to k-means
T = CS6640_FFT_texture(im);
[cidx,ctrs] = kmeans(T,7);

% Creat plots of all k-values
subplot(4,2,1);combo(mat2gray(im),(reshape(cidx==1,480,640)));title('K=1');
subplot(4,2,2);combo(mat2gray(im),(reshape(cidx==2,480,640)));title('K=2');
subplot(4,2,3);combo(mat2gray(im),(reshape(cidx==3,480,640)));title('K=3');
subplot(4,2,4);combo(mat2gray(im),(reshape(cidx==4,480,640)));title('K=4');
subplot(4,2,5);combo(mat2gray(im),(reshape(cidx==5,480,640)));title('K=5');
subplot(4,2,6);combo(mat2gray(im),(reshape(cidx==6,480,640)));title('K=6');
subplot(4,2,7);combo(mat2gray(im),(reshape(cidx==7,480,640)));title('K=7');



%% Problem 2
clear all;close all;clc
im = rgb2gray(imread('im2.jpg'));

% Get texture parameter and pass to k-means
T_radial = CS6640_FFT_radial(im);
[cidx_r,ctrs_r] = kmeans(T_radial,7);

% Creat plots of all k-values
subplot(4,2,1);
combo(mat2gray(im),(reshape(cidx_r==1,480,640)));title('K=1');
subplot(4,2,2);
combo(mat2gray(im),(reshape(cidx_r==2,480,640)));title('K=2');
subplot(4,2,3);
combo(mat2gray(im),(reshape(cidx_r==3,480,640)));title('K=3');
subplot(4,2,4);
combo(mat2gray(im),(reshape(cidx_r==4,480,640)));title('K=4');
subplot(4,2,5);
combo(mat2gray(im),(reshape(cidx_r==5,480,640)));title('K=5');
subplot(4,2,6);
combo(mat2gray(im),(reshape(cidx_r==6,480,640)));title('K=6');
subplot(4,2,7);
combo(mat2gray(im),(reshape(cidx_r==7,480,640)));title('K=7');

%% Problem 3
clear all;close all;clc
im = rgb2gray(imread('im2.jpg'));

% Get texture parameter and pass to k-means
T_angular= CS6640_FFT_angular(im);
[cidx_a,ctrs_a] = kmeans(T_angular,7);

% Creat plots of all k-values
combo(mat2gray(im),(reshape(cidx_a==1,480,640)));title('K=1');
subplot(4,2,2);
combo(mat2gray(im),(reshape(cidx_a==2,480,640)));title('K=2');
subplot(4,2,3);
combo(mat2gray(im),(reshape(cidx_a==3,480,640)));title('K=3');
subplot(4,2,4);
combo(mat2gray(im),(reshape(cidx_a==4,480,640)));title('K=4');
subplot(4,2,5);
combo(mat2gray(im),(reshape(cidx_a==5,480,640)));title('K=5');
subplot(4,2,6);
combo(mat2gray(im),(reshape(cidx_a==6,480,640)));title('K=6');
subplot(4,2,7);
combo(mat2gray(im),(reshape(cidx_a==7,480,640)));title('K=7');


%% Problem 4
clear all;close all;clc









