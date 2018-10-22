
function rings = CS6640_rings
%  CS6640_rings - computes cell array of linear indices of each ring to be used with the FFT_radial function
%
% On output:
%     rings (cell array) - Structure holding the (x,y) index pairs of each ring
% Call:
%     rings = CS6640_rings;
% Author:
%     Cade Parkison
%     UU
%     Fall 2018
%

rings = {};
% center
xc = 10; yc = 10;

for r=0:9;
    ring = [];
    rmin = r;
    rmax = r+1;
    for i=1:19
        for j=1:19
            % L-p norm from pixel to center of window
            p = 10;
            x = (xc-i)^p + (yc-j)^p;
            d = nthroot(x, p);
            if d >= rmin
                if d < rmax
                    % find linear index for corresponding (i,j) in the 19x19 matrix
                    ind = sub2ind([19,19], i, j);
                    ring = [ind; ring];
                end
            end
        end
    end
    rings{r+1} = ring; 
end
end