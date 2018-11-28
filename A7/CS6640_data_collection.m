function X = CS6640_data_collection(object_data)
% CS6640_data_collection - Cleans segmented movie data and extracts features from each video frame
% On input:
%     object_data (struct) object data of moving objects from M
% On output:
%     X (nxm array): n samples of m-tuple feature vectors
% Call:
%     X = CS6640_data_collection(M)
% Author:
%     Cade Parkison
%     UU
%     Fall 2018
%


M = 480;
N = 640;
frames = size(object_data);
n_frames = frames(2);


% Filter out all but largest objects 
for f=1:n_frames
    objs = object_data(f);
    n_objects = objs.num_objects;
    obj_sizes = [];
    for k=1:n_objects
        obj_sizes = [obj_sizes; objs.objects(k).num_pixels];
    end
    [~,largest] = max(obj_sizes);
    % Remove all but the largest object
    %for k=1:n_objects
        %if k~=largest
        %    object_data(f).objects(k) = [];
        %end
    %end
    object_data(f).objects = objs.objects(largest);
    
    
end

% Remove objects that are not near tracked line
centroids = [];  % (Px2 Array) where P is the number of object centroids in object_data
for f=1:n_frames
    objs = object_data(f);
    %n_objects = objs.num_objects;
    %for k=1:n_objects
    centroidX = objs.objects.col_mean;
    centroidY = M - objs.objects.row_mean + 1;
    centroids = [centroids; [centroidX, centroidY]];
    %end
end
d = centroids(:,1);
e = centroids(:,2);
u = [d, ones(length(d),1)]\e; % Data fitting using least squares
a=u(1);, b=u(2); % Slope and intercept of best-fit line

% filtered objects
objs_f = struct(object_data);

for f=length(object_data):-1:1
    objs = object_data(f);
    %n_objects = objs.num_objects;
    %for k=1:n_objects
    centroidX = objs.objects.col_mean;
    centroidY = M - objs.objects.row_mean + 1;
        
    Y = a*centroidX + b;
    % Remove object if distance to track line is greater than threshold
    if abs(Y - centroidY) >= 20
    
        objs_f(f) = [];
    end

    %end
end



X = objs_f;