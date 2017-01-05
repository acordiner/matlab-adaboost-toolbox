%WGTLOGIT Logit weak learner weighting function
%
% Usage:
%   alpha = wgtlogit(y,ysim,bst)
%
%  See also WGTHALFLIKE

% Copyright 2008 Alister Cordiner

function alpha = wgtlogit(y,ysim,bst)

    error(nargchk(3,3,nargin,'struct'));

    %err = mean(bst.inputFcn(ysim)~=y);
    err = sum((bst.inputFcn(ysim)~=y).*bst.w);
    alpha = .5*(log(1-err)-log(max(err,eps)));
    
end