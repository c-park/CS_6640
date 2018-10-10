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

figure(2);imshow(S, []); title('Fourier Transform');

%get the centered spectrum
Fsh = fftshift(F);
figure(3);imshow(abs(Fsh),[]);title('Centered fourier transform of Image')
%apply log transform
S2 = log(1+abs(Fsh));
figure(4);imshow(S2,[]);title('log transformed Image')
%reconstruct the Image
F = ifftshift(Fsh);
f = ifft2(F);
figure(5);imshow(f,[]),title('reconstructed Image')

%% Problem 1
clear all;close all;clc

im = rgb2gray(imread('im2.jpg'));
figure(1);imshow(im); title('Original');

[M,N] = size(im);

F = fft2(im, M, N);
S = abs(F);
figure(2);imshow(S,[]);title('Fourier Spectrum');

%% Problem 2



%% Problem 3




%% Problem 3




%% Problem 4



%% MISC

%{

% Old Problem 1 code
window = 5;

% zero padding
padIm = zeros(M+2, N+2);
padIm(1:M, 1:N) = im;

for i=3:M+2
    for j=3:N+2
        % shift to get original indices
        x = i-2;
        y = j-2;
        
        % get 5x5 window surrounding (i,j)
        w = padIm(i-2:i+2, j-2:j+2);
        
        % take FFT of window
        f = 
        
        % get power spectrum of F 
        ps = 
        
        % Fill in T at (x,y,t) where t is the texture parameter 1:25
        T(x,y,1:25) = ps;
      

        
        
    end
end

%}
