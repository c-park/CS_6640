function  displayTrack(video,track)
% displayTrack - display a red marker on moving object in video
% On input:
%     video (video data structure): vidObj
%     track
%
% Call:
%     displayTrack(video, track);
% Author:
%     Cade Parkison U0939163
%     UU
%     Fall 2018
%

% Creating a temporary directory to store images for use in report
workingDir = 'temp';
mkdir(workingDir)
mkdir(workingDir,'images')

writer = VideoWriter('outputVideo.avi', 'Uncompressed AVI');
writer.FrameRate = video.FrameRate;
open(writer);

i = 1;
video.CurrentTime = 0;
while hasFrame(video)
    vidFrame = readFrame(video);
  
    imshow(vidFrame);
    hold on;
    plot(track(i,1),track(i,2), 'r+', 'MarkerSize', 20)  
  
    M(i) = getframe(gca);
    
    filename = [sprintf('%03d', i) '.jpg'];
    fulname = fullfile(workingDir, 'images', filename);
    imwrite(M(i).cdata, fulname);

    i = i+1;
end
end

