%WUPEXP Exponential multiplicative weight update rule
%
% Usage:
%   w = wupexp(y,ysim,bst)
%
%  See also WUPSUB

% Copyright 2008 Alister Cordiner

function w = wupexp(y,ysim,bst)

    w = bst.w .* exp(-y .* (bst.alpha(end) * ysim));

end