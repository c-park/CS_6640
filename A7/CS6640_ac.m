function im_seg = CS6640_ac(M,vidObj)
% CS6640_ac - use active contours to improve segmentation
% On input:
%     M (Matlab movie struct): segmentation movie (binary)
%     vidObj (video struct): created by readVideo
% On output:
%     im_seg (MxNxF binary array): improved segmentation provided as
%     sequence of F images
% Call:
%     vidObj = VideoReader(’../../../A4/video3.avi’);
%     ims = CS6640_ac(M,vidObj);
% Author:
%     Cade Parkison
%     UU
%     Fall 2018
%

k = 1;
[m,n, r] = size(M(1).cdata);
n_frames = length(M);

im_seg = zeros(m,n,n_frames);

vidObj.CurrentTime = 0;
while hasFrame(vidObj)
    im = double(rgb2gray(readFrame(vidObj)));
    mask = im2bw(M(k).cdata);
    
    % Get segmented region with largest size
    [L,n_regions] = bwlabel(mask);
    region_size = zeros(n_regions,1);
    for r=1:n_regions
        region_size(r) =  length(find(L==r));
    end
    [max_, I] = max(region_size);
    mask = L==I;
    
    % Active Contours
    bw = activecontour(im, mask, 100, 'Chan-Vese');
    
    im_seg(:,:,k) = bw;

    k = k+1;
end

end