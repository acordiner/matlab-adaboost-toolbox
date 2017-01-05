%INITEQC Class-based uniform weight initialisation function
%
% Usage:
%   w = initeqc(y)
%
%  See also INITEQ, INITTARG

% Copyright 2008 Alister Cordiner

function w = initeqc(y)

    error(nargchk(1,1,nargin,'struct'));
    
    w = zeros(1,size(y,2));
    C = unique(y);
    for c = C
        ix = (y==c);
        w(ix) = 1/(sum(ix)*numel(C));
    end
    
end