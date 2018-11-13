function [phi,tr] = CS6640_level_set(im,max_iter,del_t,r0,c0)
% CS6640_level_set - level set of image
% On input:
%     im (MxN array): gray level or binary image
%     max_iter (int): maximum number of iterations
%     del_t (float): time step
%     r0 (int): row center of circular level set function
%     c0 (int): column center of circular level set function
% On output:
%     phi (MxN array): final phi array
%     tr (qx1 vector): sum(sum(abs(phi_(n+1) - phi_n)))
% Call:
%     [phi,tr] = CS6640_level_set(im,300,0.1,25,25);
% Author:
%     Cade Parkison
%     UU
%     Fall 2018
%