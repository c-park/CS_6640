function T = CS6640_Laws(im)
% CS6640_Laws - compute texture parameters
% On input:
%     im (MxN array): input image
% On output:
%     T (M*Nx10 array): texture parameters
%     each texture parameter is a column vector in T
% Call:
%     T = CS6640_Laws(im);
% Author:
%     Cade Parkison
%     UU
%     Fall 2018
%

% Convert to grayscale if not already grayscale
if size(im,3) == 3
    img=rgb2gray(im);
else
    img = im;
end

% 1x7 Filter vectors
L7 = [1 6 15 20 15 6 1];
E7 = [-1 -4 -5 0 5 4 1];
S7 = [-1 -2 1 4 1 -2 -1];
W7 = [-1 0 3 0 -3 0 1];
R7 = [1 -2 -1 4 -1 -2 1];
O7 = [-1 6 -15 20 -15 6 -1];

% 9 Laws 7x7 texture filters
f1 = L7'*L7;
f2 = L7'*E7;
f3 = L7'*S7;
f4 = L7'*W7;
f5 = L7'*R7;
f6 = L7'*O7;
f7 = E7'*E7;
f8 = W7'*R7;
f9 = W7'*O7;

% mean filter
meanFilter = ones(7)/49;

% All filters in a cell array
F = cell(9,1);
F{1}=f1;F{2}=f2;F{3}=f3;F{4}=f4;F{5}=f5;F{6}=f6;F{7}=f7;F{8}=f8;F{9}=f9;F{10}=meanFilter;

T = [];

for i = 1:10
    C = conv2(img, F{i}, 'same');
    s = conv2(abs(C), meanFilter, 'same');
    S = s(:);
    T(:,i) = S;
end










    

