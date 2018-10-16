
function segments = CS6640_angular(w)
%  CS6640_rings - computes cell array of linear indices of each angular segment to be used with the FFT_angular function
%
% On Input:
%    w (integer) - window size in pixels, must be odd
% On output:
%     segments (cell array) - Structure holding the (x,y) index pairs of each angular segment
% Call:
%     segments = CS6640_angular;
% Author:
%     Cade Parkison
%     UU
%     Fall 2018
%

segments = {};

% center of (w x w) window - (xc,yc)
xc = idivide(w, int32(2), 'ceil');
yc = xc;

for a=0:7;
    seg = [];
    % calculate min and max angles (degrees) for each angular segment
    amin = a*45 - 180;
    amax = (a+1)*45 -180;
    for i=1:w
        for j=1:w
            % Calculate angle from center of window to each window pixel
            dx = double(i - xc);
            dy = double(j - yc);
            theta = atan2d(dy,dx);
            if theta >= amin
                if theta < amax
                    % find linear index for corresponding (i,j) in the wxw window matrix
                    ind = sub2ind([w,w], i, j);
                    seg = [ind; seg];
                end
            end
        end
    end
    segments{a+1} = seg; 
end
end