% Test script for A2
% Cade Parkison

%%%%%%%%%%%%%%
% Problem 2
%%%%%%%%%%%%%%

% CS6640_register()

% Test image
im1 = imread('im1.jpg');

% Test points
cpts = [0 0; 0 0; 100 100; 100 100];
[m,n] = size(cpts);
num_cor = m/2;

% affine/quadratic switch (1=quadratic)
s = 1;

[imr,q,A] = CS6640_register(im1, s, cpts);

%Q = reshape(q, [2,3])





