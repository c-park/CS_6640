function im = CS6640_backgound(video)
% CS6640_background - extract background image from video sequence
% On input:
% video (video data structure): video sequence of k MxNx3 images
% On output:
% im (MxN array): image
% Call:
% im = CS4640_background(v);
% Author:
% Cade Parkison U0939163
% UU
% Fall 2018
%

nSamples = 50;

v = VideoReader(video);

t = linspace(0, v.Duration - 1/v.FrameRate, nSamples);
buffer = NaN([v.Height, v.Width, 1, nSamples]);

for i = 1:nSamples
    v.CurrentTime = t(i);
    buffer(:,:,:, mod(i, nSamples) + 1) = rgb2gray(readFrame(v));
end

im = nanmedian(buffer, 4);

end
