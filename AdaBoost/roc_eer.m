%ROC_EER Find equal error rate from an ROC curve
%
% Usage:
%   eer = roc_eer(tpr,fpr)
%   [eer,b] = roc_eer(tpr,fpr,ths)
%
%  See also ROC

% Copyright 2008 Alister Cordiner

function [eer,b] = roc_eer(tpr,fpr,th)

    if nargout>1
        error(nargchk(3,3,nargin,'struct'));
        error(nargoutchk(2,2,nargout,'struct'));
    else
        error(nargchk(2,2,nargin,'struct'));
        error(nargoutchk(1,1,nargout,'struct'));
    end
    
    % EER is when fnr == fpr
    fnr = 1-tpr;
    [null,ix] = min(abs(fnr-fpr));
    eer = mean([fnr(ix) fpr(ix)]);
    
    if nargout>1
        b = th(ix);
    end

end