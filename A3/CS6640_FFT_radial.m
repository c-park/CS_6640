
function  T = CS6640_FFT_radial(im)
%  CS6640_FFT_radial - compute FFT radial texture parameters
% On input:
%     im (MxN array): input image
% On output:
%     T (M*Nx10 array): texture parameters
%       each texture parameter is a column vector in T
% Call:
%     T = CS6640_FFT_radial(im);
% Author:
%     Cade Parkison
%     UU
%     Fall 2018
%

[M,N] = size(im);
T = zeros(M,N, 10);

% Cell array of length 10, each element containing list of (x,y) indices for each annulus
rings = CS6640_rings;

for i=10:M-9
    for j=10:N-9
        
        % get 19x19 window surrounding (i,j)
        w = im(i-9:i+9, j-9:j+9);
        % take FFT of window
        F = fft2(w);
        % get power spectrum of F 
        ps = F.*conj(F);
        % Compute Radial segments of ps for each annulus
        ps_radial = zeros(1,10);
        for r=1:10
            ps_r = ps(rings{r});
            % sum square of ps_r
            ps_radial(r) = sum(ps_r.^2);
        end
        
        % Fill in T at (x,y,t) where t is the texture parameter 1:10
        T(i,j,1:10) = ps_radial(:);
    end
end

% reshape T to (480*640 x 10)
T = reshape(T, M*N, 10);