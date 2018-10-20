
function object_data = CS6640_object_data(M,vidObj)
%
% On input:
%     M (Matlab movie): movie of segmented moving objects
%     vidObj (video object obtained by VideoReader): input video
% On output:
%     object_data (struct vector): object data
%       (k).num_objects (int): number of objects in frame k
%       (k).objects (struct vector): has features for each object (p)
%         objects(p).row_mean (float): row mean
%         objects(p).col_mean (float): column mean
%         objects(p).ul_row (int): upper left row for bounding box
%         objects(p).ul_col (int): upper left col for bounding box
%         objects(p).lr_row (int): lower right row for bounding box
%         objects(p).lr_col (int): lower right col for bounding box
%         objects(p).num_pixels (int): number of pixels
%         objects(p).red_median (int): median red value for object
%         objects(p).green_median (int): median green value for object
%         objects(p).blue_median (int): median blue value for object
% Call:
%     obj_data = CS6640_object_data(M,vidObj);
% Author:
%     Cade Parkison
%     Fall 2018
%     UU
%