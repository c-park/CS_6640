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

% Convert to grayscale if not already grayscale
if size(im,3) == 3
    im=rgb2gray(im);
else
    im = im;
end

[M,N] = size(im);

imr = zeros(M,N);

[m,n] = size(cpts);

% number of corresponding points
num_cor = m/2;

% splitting cpts into two matrices, one for each image
pts1 = cpts(1:2:end,:)
pts2 = cpts(2:2:end,:)

pts1(1,1);
pts1(1,2);

switch(s)
    
    % quadratic
    case 1 
        b = zeros(num_cor,1);
        A = zeros(2*num_cor,12);
        for i = 1:num_cor
            b(2*(i-1)+1) = pts2(i,1);
            b(2*(i-1)+2) = pts2(i,2);
            A(2*(i-1)+1,:) = [1,pts1(i,1),pts1(i,2),pts1(i,1)*pts1(i,2),...
                pts1(i,1)*pts1(i,1),pts1(i,2)*pts1(i,2),zeros(1,6)];
            A(2*(i-1)+2,:) = [zeros(1,6),1,pts1(i,1),pts1(i,2),...
                pts1(i,1)*pts1(i,2),pts1(i,1)*pts1(i,1),...
                pts1(i,2)*pts1(i,2)];
        end
        q = lsqlin(A,b);
        A = zeros(3,3);
        
        % Produce imr from q and im
        for i = 1:M
            for j = 1:N
                % NEED TO CALL TRANSFORM2D HERE
                [xp,yp] = CS6640_transform2D(i,j,q);
                
                % in case transformed coords are floats, round to int
                xp = round(xp);
                yp = round(yp);
                
                % in case the transformed coord are outside of image
                if xp < 1
                    xp = 1;
                elseif xp > M
                    xp = M
                end
                if yp < 1
                    yp = 1;
                elseif yp > N
                    yp = N
                end
                
                imr(i,j) = im(xp, yp);
            end
        end
        
    % affine
    otherwise
        a = zeros(2*num_cor,6);
        b = zeros(2*num_cor,1);
        
        for i = 1:num_cor
            
            a(2*(i-1)+1,:) = [pts1(i,1),pts1(i,2),1,zeros(1,3)];
            a(2*(i-1)+2,:) = [zeros(1,3),pts1(i,1),pts1(i,2),1];
            
            b(2*(i-1)+1) = pts2(i,1);
            b(2*(i-1)+2) = pts2(i,2);
        end
        
        a = lsqlin(a,b)
        A = eye(3,3);
        A(1,:) = a(1:3);
        A(2,:) = a(4:6);
        q = zeros(12, 1);
        
        % Produce imr from A and im
        for i = 1:M
            for j = 1:N
                xp = A(1,1)*i + A(1,2)*j + A(1,3);
                yp = A(1,1)*i + A(1,2)*j + A(1,3);
                
                % in case transformed coords are floats, round to int
                xp = round(xp);
                yp = round(yp);
                
                % in case the transformed coord are outside of image
                if xp < 1
                    xp = 1;
                elseif xp > M
                    xp = M
                end
                if yp < 1
                    yp = 1;
                elseif yp > N
                    yp = N
                end

                imr(i,j) = im(xp, yp);
                
            end
        end   
end
end





    

