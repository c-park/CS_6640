
function  T = CS6640_FFT_angular(im)
%  CS6640_FFT_angular - compute FFT angular texture parameters
% On input:
%     im (MxN array): input image
% On output:
%     T (M*Nx8 array): texture parameters
%       each texture parameter is a column vector in T
% Call:
%     T = CS6640_FFT_angular(im);
% Author:
%     Cade Parkison
%     UU
%     Fall 2018
%

[M,N] = size(im);
T = zeros(M,N, 8);

% Window size W (must be odd number)
W = 11;
% half window
h = double(idivide(W, int32(2), 'floor'));

% Cell array of length 8, each element containing list of (x,y) indices for each angulur segment
segments = CS6640_angular(W);

for i=h+1:M-h
    for j=h+1:N-h
        
        % get w x w window surrounding (i,j)
        window = im(i-h:i+h, j-h:j+h);
        % take FFT of window
        F = fft2(window);
        % get power spectrum of F 
        ps = F.*conj(F);
        % Compute angular segments of ps
        ps_angular = zeros(1,8);
        for s=1:8
            ps_a = ps(segments{s});
            % sum square of ps_a
            ps_angular(s) = sum(ps_a.^2);
        end
        
        % Fill in T at (x,y,t) where t is the texture parameter 1:10
        T(i,j,1:8) = ps_angular(:);
    end
end

% reshape T to (480*640 x 8)
T = reshape(T, M*N, 8);