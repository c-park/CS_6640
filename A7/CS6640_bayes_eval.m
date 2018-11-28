function classes = CS6640_bayes_eval(X, cp, cm)
% CS6640_bayes_eval - gets resulting class for each frame in a data set
% On input:
%     X (nxm array): n samples of m-tuple feature vectors
%     class_probs (1xn vector): probabilities of n classes (sums to 1)
%     class_models (1xn vector struct): class models: means and
%     variances
%       (k).mean (mx1 vector): k_th class mean vector
%       (k).var (mxm array): k_th class covariance matrix
% On output:
%     classes (nx1 array): n detected classes from CS6640_Bayes
% Call:
%     classes = CS6640_bayes_eval(X)
% Author:
%     Cade Parkison
%     UU
%     Fall 2018
%

classes = zeros([length(X), 1]);

for i=1:length(X)
    classes(i) = CS6640_Bayes(X(i),cp,cm);
end