function best_class = CS6640_Bayes(x,class_probs,class_models)
% CS6640_Bayes - Bayes classifier
% On input:
%     x (mx1 vector): feature vector
%     class_probs (1xn vector): probabilities of n classes (sums to 1)
%     class_models (1xn vector struct): class models: means and
%     variances
%       (k).mean (mx1 vector): k_th class mean vector
%       (k).var (mxm array): k_th class covariance matrix
% On output:
%     best_class (int): index of best class for x
% Call:
%     c = CS6640_Bayes(x,cp,cm);
% Author:
%     Cade Parkison
%     UU
%     Fall 2018
%

% number of features
m = length(x);

% number of classes
n = length(class_probs);

% stores the bayes decision function values for each class
bayes = zeros([n,1]);

% loop over each class and find the bayes decision function
for j=1:n
    Pj = class_probs(j);
    Cj = class_models(j).var;
    Mj = class_models(j).mean;
    
    bayes(j) = log(Pj) - 1/2*log(det(Cj)) - 1/2*((x-Mj)'*inv(Cj)*(x-Mj));
end

[~,best_class] = max(bayes);