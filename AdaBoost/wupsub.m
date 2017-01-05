%WUPSUB Subtractive weight update rule
%
% Usage:
%   w = wupsub(y,ysim,bst)
%
%  See also WUPEXP

% Copyright 2008 Alister Cordiner

function w = wupsub(y,ysim,bst)

    w = bst.w - bst.alpha(end)*ysim;

end