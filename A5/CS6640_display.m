
function M2 = CS6640_display(M, vidObj)
% CS6640_display - Displays the tracked objects overlaid on video
% On input:
%     vidObj (video object obtained by VideoReader): input video
%     M (Matlab movie): movie of segmented moving objects
% On output:
%     M2 (Matlab movie): output movie of combo images
% Call:
%     M2 = CS6640_display(M, vidObj)
% Author:
%     Cade Parkison
%     Fall 2018
%     UU
%

k = 1;

vidObj.CurrentTime = 0;
while hasFrame(vidObj)
    vidFrame = double(rgb2gray(readFrame(vidObj)));

    bw = imcomplement(im2bw(M(k).cdata));
    
    % Capture video
    figure(1);
    combo(mat2gray(vidFrame), bw);
    M2(k) = getframe(gca);
    %pause(p);

    k = k+1;
end

end