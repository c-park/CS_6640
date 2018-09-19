
% Image Processing - Assignment 1
% Cade Parkison


im1 = imread('im1.jpg');
im2 = imread('im2.jpg');

img = rgb2gray(im1);
size(img);

% Cross Correlation
y = 180;
Y = 195;
dy = y:Y;

x = 175;
X = 185;
dx = x:X;

% tire of moving car in im1
Sect = img(dy, dx);
%imshow(Sect)

% subtracting mean to try to center vals at 0
nimg = img-mean(mean(img));
nSec = nimg(dx, dy);

crr = xcorr2(nimg,nSec);


% The maximum of the cross-correlation corresponds to the estimated locatio
[ssr,snd] = max(crr(:));
[ij,ji] = ind2sub(size(crr),snd);

%figure
%plot(crr(:))
%title('Cross-Correlation')
%hold on
%plot(snd,ssr,'or')
%hold off
%text(snd*1.05,ssr,'Maximum')

%img(ij:-1:ij-size(Sect,1)+1,ji:-1:ji-size(Sect,2)+1) = rot90(Sect,2);

%imagesc(img)
%axis image off
%colormap gray
%title('Cross-Correlation of end of car')
%hold on
%plot([y y Y Y y],[x X X x x],'r')
%hold off







% Edge detection

img = imread('car.jpg');
car = rgb2gray(img);

BW1 = edge(car, 'canny');

figure;
imshow(BW1);
title('Canny Filter');


% Fourier Transform
img = im1;
figure(1)
clf
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











