%OUTCOMB Linear combination output function
%
% Usage:
%   y = outcomb(y,bst)
%
%  See also OUTCOMBTH

% Copyright 2008 Alister Cordiner

function y = outcomb(y,bst)

    % TO DO: add the alpha weighting

    error(nargchk(2,2,nargin,'struct'));
    
    y = sum(y) + bst.b;
    
end