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

xp = q(1) + q(2)*x + q(3)*y + q(4)*x*y + q(5)*x^2 + q(6)*y^2;
yp = q(7) + q(8)*x + q(9)*y + q(10)*x*y + q(11)*x^2 + q(12)*y^2;

end
