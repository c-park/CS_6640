function H_im = CS6640_Harris(im)
% CS6640_Harris - compute Harris operator at each pixel
% On input:
%     im (MxN array): graylevel image
% On output:
%     H_im (MxN array): Harris value (normalized)
% Call:
%     H = CS6640_Harris(im);
% Author:
%     Cade Parkison
%     UU
%     Fall 2018
%

% Convert to grayscale if not already grayscale
if size(im,3) == 3
    img=rgb2gray(im2double(im));
else
    img = im2double(im);
end

[dx, dy] = gradient(img);
[dxx, dxy] = gradient(dx);
[dyx, dyy] = gradient(dy);

[h,w] = size(img);

% Harris Values
H_im = zeros(h,w);

for i = 1:h
    for j = 1:w
        Hess = [ dxx(i,j), dxy(i,j); dyx(i,j), dyy(i,j)];
        H_im(i,j) = det(Hess) - 0.05*trace(Hess)^2;
    end
end




