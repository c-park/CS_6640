
function Object_data = CS6640_object_data(M,vidObj)
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

p = 0.1;

frames = length(M);
Object_data = struct();

for f=1:frames
    vidFrame = read(vidObj, f);
    im = M(f).cdata;
    im_bw = im2bw(im);

    data = regionprops(im_bw);
    
    Object_data(f).num_objects = length(data);
    Object_data(f).objects = struct();
    
    % Some frames return no data, if so, create struct of all zeros so program does not fail
    if length(data) == 0
        s = struct('Area', 0, 'Centroid', [1,1], 'BoundingBox', [0,0,0,0]);
    else
        s = data;
    end
    
    for p=1:length(s)
    
        Object_data(f).objects(p).row_mean  = s(p).Centroid(2);
        Object_data(f).objects(p).col_mean  = s(p).Centroid(1);
        
        Object_data(f).objects(p).ul_row = s(p).BoundingBox(2);
        Object_data(f).objects(p).ul_col = s(p).BoundingBox(1);
        Object_data(f).objects(p).lr_row = s(p).BoundingBox(2) + s(p).BoundingBox(4);
        Object_data(f).objects(p).lr_col = s(p).BoundingBox(1) + s(p).BoundingBox(3);
        
        Object_data(f).objects(p).num_pixels = s(p).Area;
        
        % Average RGB Values
        
        % round centroid to nearest pixel
        c = round(s(p).Centroid);
        
        % box centered around centroid that is half height and half width of bounding box 
        w = int32(s(p).BoundingBox(3)/4);
        h = int32(s(p).BoundingBox(4)/4);
        rgb = vidFrame(c(2)-w:c(2)+w, c(1)-h:c(1)+h, :);
        
        % separate rgb values
        r = rgb(:,:,1);
        g = rgb(:,:,2);
        b = rgb(:,:,3);
        
        % get median values
        Object_data(f).objects(p).red_median = median(r(:));
        Object_data(f).objects(p).green_median = median(g(:));
        Object_data(f).objects(p).blue_median = median(b(:));
    end
    

end