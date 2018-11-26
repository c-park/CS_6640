function M2 = CS6640_display_results(im_seg, vidObj)
% CS6640_display_results - Displays the tracked objects overlaid on video
% On input:
%     vidObj (video object obtained by VideoReader): input video
%     im_seg (MxNxF binary array): improved segmentation provided as
%     sequence of F images
% On output:
%     M2 (Matlab movie): output movie of combo images
% Call:
%     M2 = CS6640_display_results(im_seg, vidObj)
% Author:
%     Cade Parkison
%     Fall 2018
%     UU
%

k = 1;

vidObj.CurrentTime = 0;
while hasFrame(vidObj)
    vidFrame = double(rgb2gray(readFrame(vidObj)));

    bw = ~im_seg(:,:,k);
    
    % Capture video
    figure(1);
    combo(mat2gray(vidFrame), bw);
    M2(k) = getframe(gca);
    %pause(p);

    k = k+1;
end

end