%INITEQ Uniform weight initialisation function
%
% Usage:
%   w = initeq(y)
%
%  See also INITEQC, INITTARG

% Copyright 2008 Alister Cordiner

function w = initeq(y)

    error(nargchk(1,1,nargin,'struct'));
    
    w = ones(1,size(y,2))/size(y,2);
    
end