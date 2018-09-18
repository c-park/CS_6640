function CS6640_Week3
% CS6640_Week3 - demo code for Week 3
% On input:
%     N/A
% On output:
%     Some visualizations
% Call:
%     CS6640_Week3
% Author:
%     T. Henderson
%     UU
%     Fall 2018
%

% Convolution: separable kernels
A = conv2(ones(3,1)/3,ones(1,3)/3)
A = (ones(3,1)/3)*(ones(1,3)/3)

L = fspecial('laplacian',0.7);
G = fspecial('gaussian',21,3);
LoG = imfilter(G,L);
surf(LoG);
surf(-LoG);
imshow(imresize(mat2gray(-LoG),[101,101]));

% p. 45
imp45 = imread('median.JPG');
imp45g = rgb2gray(imp45);
imp45n = imnoise(imp45g,'gaussian');
imp45m = CS6640_median2D(imp45n,3);
A = fspecial('average',3);
imp45a = imfilter(imp45n,A);
subplot(2,2,1);
imshow(imp45g);
subplot(2,2,2);
imshow(imp45n);
subplot(2,2,3);
imshow(mat2gray(imp45m));
subplot(2,2,4);
imshow(mat2gray(imp45a));

% Texture
b1 = imread('brodatz14.bmp');
clf
imshow(b1);
b2 = imread('brodatz36.bmp');
imshow(b2);
b3 = imread('brodatz53.bmp');
imshow(b3);
b4 = imread('brodatz101.bmp');
imshow(b4);
btest = zeros(200,200);
btest(1:100,1:100) = b1(1:100,1:100);
btest(1:100,101:200) = b2(1:100,1:100);
btest(101:200,1:100) = b3(1:100,1:100);
btest(101:200,101:200) = b4(1:100,1:100);
imshow(mat2gray(btest));

L3 = [1 2 1];
E3 = [-1 0 1];
S3 = [-1 2 -1];

L5 = [1 4 6 4 1];   % conv(L3,L3)
E5 = [-1 -2 0 2 1];
S5 = [-1 0 2 0 -1];
W5 = [1 -2 0 2 -1];
R5 = [1 -4 6 -4 1];

L = conv(L3,L3)

im1 = imread('im1.jpg');
T = CS6640_texture_rep_Laws(rgb2gray(im1));
[cidx,ctrs] = kmeans(T,4);
combo(mat2gray(rgb2gray(im1)),(reshape(cidx==1,480,640)));
combo(mat2gray(rgb2gray(im1)),(reshape(cidx==2,480,640)));
combo(mat2gray(rgb2gray(im1)),(reshape(cidx==3,480,640)));
combo(mat2gray(rgb2gray(im1)),(reshape(cidx==4,480,640)));
combo(mat2gray(rgb2gray(im1)),(reshape(cidx==1|cidx==2,480,640)));

tch = 0;

% Geometric transforms
% Create some x,y points
pts = [];
x = [0:0.05:1];
len_x = length(x);
for in1 = 1:len_x
    for ind2 = 1:len_x
        pts = [pts; x(in1), x(ind2)];
    end
end
num_pts = length(pts(:,1));

figure(1);
clf
plot(pts(:,1),pts(:,2),'k.');
hold on
axis equal
plot([-2,2],[0,0]);
plot([0,0],[-2,2]);

pts = [pts,ones(length(pts(:,1)),1)];

% Translation
A = eye(3,3);
A(1,3) = 2;
A(2,3) = 4;
pts2 = A*pts';
pts2 = pts2';
plot(pts2(:,1),pts2(:,2),'ro');

% Rotation about origin
A = eye(3,3);
A(1,1) = cos(pi/4);
A(2,2) = cos(pi/4);
A(1,2) = sin(-pi/4);
A(2,1) = sin(pi/4);
pts2 = A*pts';
pts2 = pts2';
plot(pts2(:,1),pts2(:,2),'ro');

% Rotation about center of mass (shift to zero mean)
pts1c = pts;
ptsm = mean(pts);
pts1c(:,1) = pts1c(:,1) - ptsm(1);
pts1c(:,2) = pts1c(:,2) - ptsm(2);
pts2 = A*pts1c';
pts2 = pts2';
plot(pts2(:,1),pts2(:,2),'go');

% Scaling
A = eye(3,3);
A(1,1) = 1/2;
A(2,2) = 1/4;
pts2 = A*pts';
pts2 = pts2';
plot(pts2(:,1),pts2(:,2),'ro');

% Skewing
A = eye(3,3);
A(1,2) = 1/2;
A(2,1) = 1/4;
pts2 = A*pts';
pts2 = pts2';
plot(pts2(:,1),pts2(:,2),'ko');
A1 = A;

num_cor = 12;
% Finding the transform using correspondences pp. 26-27, slides 2

indexes = sort(max(1,floor(441*rand(1,num_cor))));
b = zeros(num_cor,1);
A = zeros(2*num_cor,12);
for ind = 1:num_cor
    k = indexes(ind);
    b(2*(ind-1)+1) = pts2(k,1);
    b(2*(ind-1)+2) = pts2(k,2);
    A(2*(ind-1)+1,:) = [1,pts(k,1),pts(k,2),pts(k,1)*pts(k,2),...
        pts(k,1)*pts(k,1),pts(k,2)*pts(k,2),zeros(1,6)];
    A(2*(ind-1)+2,:) = [zeros(1,6),1,pts(k,1),pts(k,2),...
        pts(k,1)*pts(k,2),pts(k,1)*pts(k,1),pts(k,2)*pts(k,2)];
end

q = lsqlin(A,b);

ptst = zeros(num_pts,2);
for p = 1:num_pts
    [ptst(p,1),ptst(p,2)] = CS6640_transform2D(pts(p,1),pts(p,2),q);
end
figure(2);
clf
plot(pts2(:,1),pts2(:,2),'k.');
hold on
axis equal
plot(ptst(:,1),ptst(:,2),'ro');

% Set up system for affine transform
%   xp = a11*x + a12*y + a13
%   yp = a21*x + a22*y + a23

A = zeros(2*num_cor,6);
for ind = 1:num_cor
    k = indexes(ind);
    A(2*(ind-1)+1,:) = [pts(k,1),pts(k,2),1,zeros(1,3)];
    A(2*(ind-1)+2,:) = [zeros(1,3),pts(k,1),pts(k,2),1];
end

q = lsqlin(A,b);
As = eye(3,3);
As(1,:) = q(1:3);
As(2,:) = q(4:6);
ptsr = As*pts';
ptsr = ptsr';

figure(3);
clf
plot(pts2(:,1),pts2(:,2),'k.');
hold on
axis equal
plot(ptsr(:,1),ptsr(:,2),'ro');

% How to get corresponding points (by hand!)

clf
A = zeros(51,51);
A(13:37,13:37) = 100;
[R,MM] = CS5320_Harris(A,5);
combo(A,R>0);
im1g = rgb2gray(im1);
load Harris_im1
%[R,MM] = CS5320_Harris(im1,5);
R = R/max(R(:));

combo(mat2gray(im1g),R>.3);

% Temporal Image differences
M = CS6640_track_dif('video.avi',0);

tch = 0;
