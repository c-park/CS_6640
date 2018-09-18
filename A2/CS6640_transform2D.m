function [xp,yp] = CS6640_transform2D(x,y,q)
% CS6640_transform2D - produce transformed points from given points 
%     and quadratic coeffients
% On input:
%     x (float): x value
%     y (float): y value
%     q (1x12 vector): quadratic coefficients
% On output:
%     xp (float): x value of transformed point
%     yp (float): y value of transformed point
% Call:
%     [xp,yp] = CS6640_transform2D(3,3,q);
% Author:
%     Cade Parkison
%     UU
%     Fall 2018
%

