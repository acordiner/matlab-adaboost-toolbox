%WGTHALFLIKE Half log-likelihood weak learner weighting function
%
% Usage:
%   alpha = wgtlogit(y,ysim,bst)
%
%  See also WGTLOGIT

% Copyright 2008 Alister Cordiner

function alpha = wgthalflike(y,ysim,bst)

    error(nargchk(3,3,nargin,'struct'));
    
    s = ysim(:).*bst.w(:);
    s_pos = (y(:)<0)'*max(s(:),0);
    s_neg = (y(:)<0)'*max(-s(:),0);
    alpha = .5*(log(s_pos+eps)-log(s_neg+eps));
    
end