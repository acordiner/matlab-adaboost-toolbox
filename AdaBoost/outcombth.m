%OUTCOMBTH Thresholded linear combination output function
%
% Usage:
%   y = outcombth(y,bst)
%
%  See also OUTCOMB

% Copyright 2008 Alister Cordiner

function y = outcombth(y,bst)

    % TO DO: add the alpha weighting

    error(nargchk(2,2,nargin,'struct'));
    
    y = hardlims(sum(y)-bst.b);
    
end