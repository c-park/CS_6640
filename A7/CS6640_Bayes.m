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