
function  X = CS6640_FFT_shape(Z,w)
%  CS6640_FFT_shape - compute Fourier shape descriptors for a curve
% On input:
%     Z (Nx2 array): input curve (should be closed)
%     w (int): distance along curve to determine angles
% On output:
%     X ((N/2-1)x1 vector): the Fourier coefficients for the curve
% Call:
%     X = CS6640_FFT_shape(curve,2);
% Author:
%     Cade Parkison
%     UU
%     Fall 2018
%

s = size(Z);
N = s(1);
theta = zeros(1,N);

for i=1:N-1
    p1 = Z(i,:);
    p2 = Z(i+1,:);
    t = atan2((p2(2)-p1(2)),(p2(1)-p1(1)));
    theta(i) = t;
end

phi = zeros(1,N);
for i=1:N
    phi_rad = theta(i) - theta(1);
    % wrap to interval [0, 2*pi]
    phi(i) = phi_rad - 2*pi*floor(phi_rad/(2*pi));
end

psi = zeros(1,N);

F = fft(phi);

% getting rid of the DC component as well as the symmetric values
X = F(2:N/2);