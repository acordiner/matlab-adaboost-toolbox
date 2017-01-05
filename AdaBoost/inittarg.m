%INITTARG Target value initialisation function
%
% Usage:
%   w = inittarg(y)
%
%  See also INITEQ, INITEQC

% Copyright 2008 Alister Cordiner

function w = inittarg(y)

    error(nargchk(1,1,nargin,'struct'));
    
    w = y;
    
end