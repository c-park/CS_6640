function  T = CS6640_FFT_texture(im)
% CS6640_FFT_texture - compute FFT texture parameters
% On input:
%     im (MxN array): input image
% On output:
%     T (M*Nx25 array): texture parameters
%       each texture parameter is a column vector in T
% Call:
%     T = CS6640_FFT_texture(im);
% Author:
%     Cade Parkison
%     UU
%     Fall 2018
%

[M,N] = size(im);
T = zeros(M,N, 25);

window = 5;

for i=3:M-2
    for j=3:N-2
        
        % get 5x5 window surrounding (i,j)
        w = im(i-2:i+2, j-2:j+2);
        
        % take FFT of window
        f = 
        
        % get power spectrum of F 
        ps = 
        
        % Fill in T at (x,y,t) where t is the texture parameter 1:25
        T(i,j,1:25) = ps;
      

        
        
    end
end

% reshape T to (480*640 x 25)
T = reshape(T, (M*N, 25));



