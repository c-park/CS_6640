
function [C,V] = CS6640_GC(im)
% CS6640_GC - Graph Cut segmentation
% On input:
%     im (MxN array): input image
% On output:
%     C (MxN array): binary classification
%     V (M*Nx6 array): eigenvectors of similarity matrix
% Call:
%     [C,V] = CS6640_GC(im);
% Author:
%     Cade Parkison
%     UU
%     Fall 2018
%