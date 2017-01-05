%ROC_EER Find equal error rate from an ROC curve
%
% Usage:
%   auc = roc_auc(tpr,fpr)
%
%  See also ROC

function auc = roc_auc(tpr,fpr)

    error(nargchk(2,2,nargin,'struct'));

    if fpr(1)>fpr(end)
        auc = trapz(fliplr(fpr),fliplr(tpr));
    else
        auc = trapz(fpr,tpr);
    end

end