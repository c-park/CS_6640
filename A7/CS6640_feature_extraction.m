function X = CS6640_feature_extraction(samples)
% CS6640_feature_extraction - Given data samples, generate feature vectors
% On input:
%     samples (nx1 struct array) object_data samples 
% On output:
%     X (nxm array): n samples of m-tuple feature vectors
% Call:
%     X = CS6640_feature_extraction(samples)
% Author:
%     Cade Parkison
%     UU
%     Fall 2018
%

n = length(samples);   % number of samples
m = 1;                % number of features

X = zeros([n,m]);

for i=1:n

    % Size feature
    num_pixels = samples(i).objects.num_pixels;
    X(i,1) = num_pixels;
    
end