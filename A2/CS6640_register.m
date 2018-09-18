function [imr,q,A] = CS6640_register(im,s,cpts)
% CS6640_register - produce registered image and transform
% On input:
%     im (MxN array): input image
%     s (int): transform switch: if 1, then quadratic,
%         else affine
%     cpts (2kx2 array): k corresponding points (evens are one set; 
%         odds the other)
% On output:
%     imr (MxN array): registered image
%     q (1x12 vector): quadratic coefficients
%     A (3x3 array): affinetransform
% Call:
%     [imr,q,A] = CS6640_register(im,1);
% Author:
%     Cade Parkison
%     UU
%     Fall 2018
%

[m,n] = size(cpts);

% number of corresponding points
num_cor = m/2;

% splitting cpts into two matrices, one for each image
pts1 = cpts(1:2:end,:);
pts2 = cpts(2:2:end,:);

pts1(1,1);
pts1(1,2);

switch(s)
    case 1
        % quadratic
        b = zeros(num_cor,1);
        A = zeros(2*num_cor,12);
        for i = 1:num_cor
            b(2*(i-1)+1) = pts2(i,1);
            b(2*(i-1)+2) = pts2(i,2);
            A(2*(i-1)+1,:) = [1,pts1(i,1),pts1(i,2),pts1(i,1)*pts1(i,2),...
                pts1(i,1)*pts1(i,1),pts1(i,2)*pts1(i,2),zeros(1,6)];
            A(2*(i-1)+2,:) = [zeros(1,6),1,pts1(i,1),pts1(i,2),...
                pts1(i,1)*pts1(i,2),pts1(i,1)*pts1(i,1),pts1(i,2)*pts1(i,2)];
        end
        q = lsqlin(A,b);
    otherwise
        
        % affine
        
        A = zeros(2*num_cor,6);
        b = zeros(2*num_cor,1);
        
        for i = 1:num_cor
            
            A(2*(i-1)+1,:) = [pts1(i,1),pts1(i,2),1,zeros(1,3)];
            A(2*(i-1)+2,:) = [zeros(1,3),pts1(i,1),pts1(i,2),1];
            
            b(2*(i-1)+1) = pts2(i,1);
            b(2*(i-1)+2) = pts2(i,2);
        end
        
        q = lsqlin(A,b);
        
end
        
imr = zeros(1);

        
        
end





    

