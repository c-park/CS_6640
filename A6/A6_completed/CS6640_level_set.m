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

% boolean to enable display of each iteration
DISPLAY = 1;

radius = 2;

[M,N] = size(im);

[Gx, Gy] = gradient(im);
Gmag = sqrt(Gx.^2+Gy.^2);

F = exp(-Gmag);

% Anonymous phi function used to generate phi_0
p = @(r,c)sqrt((r-r0)^2 + (c-c0)^2) - radius;
phi_0 = zeros([M,N]);

for r=1:M
    for c=1:N
        phi_0(r,c) = p(r,c);
    end 
end

phi = phi_0;
phi_new = phi;

tr = zeros(max_iter,1);

for i=1:max_iter
    
    for r=2:M-1
        for c=2:N-1

            Dxp = phi(r+1,c) - phi(r,c);
            Dxn = phi(r,c) - phi(r-1,c);
            Dyp = phi(r,c+1) - phi(r,c);
            Dyn = phi(r,c) - phi(r,c-1);
            
            Gphi_p = sqrt(max(Dxn,0)^2 + min(Dxp,0)^2 + max(Dyn,0)^2 + min(Dyp,0)^2);
            Gphi_n = sqrt(max(Dxp,0)^2 + min(Dxn,0)^2 + max(Dyp,0)^2 + min(Dyn,0)^2);
        
            phi_new(r,c) = phi(r,c) - del_t*(max(F(r,c),0)*Gphi_p + min(F(r,c),0)*Gphi_n);

        end
    end
    
    tr(i) = sum(sum(abs(phi_new - phi)));
    phi=phi_new;
    
    % Display iterations as movie
    if true(DISPLAY)
        bw = zeros([M,N]);
        indexes = find(phi<=0);
        for j=1:length(indexes)
            ind = indexes(j);
            bw(ind) = 1;
        end
        bw = ~bw;
        
        combo(mat2gray(im), bw);

    end
    
end

end