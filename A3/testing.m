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

%% TESTING
clear all;close all;clc

im = rgb2gray(imread('im2.jpg'));
figure(1);imshow(im); title('Original');

% Get Fourier Transform
F = fft2(im);
S = abs(F);
Fsh = fftshift(S);
figure(2);imshow(Fsh,[]);title('Fourier Spectrum');
Fsh_log = log(1 + Fsh);
figure(3);imshow(Fsh_log,[]);title('Log shifted Fourier Spectrum');


%% Problem 1
clear all;close all;clc

im = rgb2gray(imread('im2.jpg'));
%figure(1);imshow(im); title('Original');

T = CS6640_FFT_texture(im);

% K-means on T 
[cidx,ctrs] = kmeans(T,9);
figure(1);combo(mat2gray(im),(reshape(cidx==1,480,640)));title('K=1');
figure(2);combo(mat2gray(im),(reshape(cidx==2,480,640)));title('K=2');
figure(3);combo(mat2gray(im),(reshape(cidx==3,480,640)));title('K=3');
figure(4);combo(mat2gray(im),(reshape(cidx==4,480,640)));title('K=4');
figure(5);combo(mat2gray(im),(reshape(cidx==5,480,640)));title('K=5');
figure(6);combo(mat2gray(im),(reshape(cidx==6,480,640)));title('K=6');
figure(7);combo(mat2gray(im),(reshape(cidx==7,480,640)));title('K=7');
figure(8);combo(mat2gray(im),(reshape(cidx==8,480,640)));title('K=8');
figure(9);combo(mat2gray(im),(reshape(cidx==9,480,640)));title('K=9');


%combo(mat2gray(rgb2gray(im)),(reshape(cidx==1|cidx==4,480,640)));



%% Problem 2



%% Problem 3




%% Problem 3




%% Problem 4



%% MISC

window = ones(19);

% Generate lists of indices for each ring
rings = [];

% center
xc = 10; yc = 10;

for r=0:9;
    ring = [];
    min = r;
    max = r+1;
    for i=1:19
        for j=1:19
            % distance from pixel to center of window
            d = sqrt((xc-i)^2 + (yc-j)^2);
            if d >= min
                if d < max
                     
                    ring = [[i,j]; ring];
                end
            end
        end
    end
    
    rings = [ring; rings];
    
end

rings


