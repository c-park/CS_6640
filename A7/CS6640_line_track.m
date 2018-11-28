function [m,b] = CS6640_line_track(object_data)
% CS6640_line_track - find the slope and intercept of the best-fit line of segmented moving objects
% On input:
%     object_data (struct) object data of segmented moving objects
% On output:
%     m (scalar) slope of best-fit line
%     b (scalar) y-intercept of best-fit line
% Call:
%     c = CS6640_Bayes(x,cp,cm);
% Author:
%     Cade Parkison
%     UU
%     Fall 2018
%

centroids = [];  % (Px2 Array) where P is the number of object centroids in object_data
frames = size(object_data);
n_frames = frames(2);
for f=1:n_frames
    objs = object_data(f);
    n_objects = objs.num_objects;
    for k=1:n_objects
        centroidX = objs.objects(k).col_mean;
        centroidY = objs.objects(k).row_mean;
        centroids = [centroids; [centroidX, centroidY]];
    end
end

end