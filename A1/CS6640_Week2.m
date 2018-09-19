function CS6640_Week2
% CS6640_Week2 - demo code for Week 2
% On input:
%     N/A
% On output:
%     Some visualizations
% Call:
%     CS6640_Week2
% Author:
%     T. Henderson
%     UU
%     Fall 2018
%

% pp. 22-23, sildes4

load match
res = CS6640_corr2(match_fg,match_wg);
imshow(mat2gray(res));
combo(mat2gray(match_fg),res>0.5);

%p. 26, slides4
 Dx = [-0.5,0,0.5];
Dy = Dx';
im = zeros(101,101);
im(26:75,26:75) = 1;
dx = imfilter(im,Dx);
dy = imfilter(im,Dy);
combo(mat2gray(im),bwmorph(dx>0.1,'dilate',3));
combo(mat2gray(im),bwmorph(dy>0.1,'dilate',3));
combo(mat2gray(im),bwmorph(abs(dx)>0.1,'dilate',3));
combo(mat2gray(im),bwmorph(abs(dy)>0.1,'dilate',3));

[dx,dy] = gradient(im);
mag = sqrt(dx.^2+dy.^2);
ori = posori(atan2(dy,dx));
combo(mat2gray(im),mag>0.4);
quiver(dx,dy);

% Fourier Transform
figure(1)
clf
load img
imshow(img);
figure(2)
clf
W = img(261:271,16:26);
WF = fft(W(:));
WF_len = length(WF);
half = ceil((WF_len+1)/2);
WP = abs(real(WF(5:half)));
plot(WP);
hold on
W = img(221:231,198:208);
WF = fft(W(:));
WF_len = length(WF);
half = ceil((WF_len+1)/2);
WP = abs(real(WF(5:half)));
plot(WP,'r');
W = img(200:210,438:448);
WF = fft(W(:));
WF_len = length(WF);
half = ceil((WF_len+1)/2);
WP = abs(real(WF(5:half)));
plot(WP,'g');

tch = 0;
