%ROC Find an ROC curve
%
% Usage:
%   [tpr,fpr] = roc(bst,x,y)
%   [tpr,fpr,th] = roc(bst,x,y)
%
%  See also ROC_EER, ROC_AUC

function [tpr,fpr,th] = roc(bst,x,y)

    error(nargchk(3,3,nargin,'struct'));
    error(nargoutchk(2,3,nargout,'struct'));
    
    bst.outputFcn = @(y,bst) sum(y);
    ysim = sim(bst,x);
    
    if ndims(ysim)~=ndims(y) || sum(size(ysim)~=size(y))>0
        error('Input arguments must be the same size');
    end

    %pts = unique(sort(ysim));
    pts = sort(ysim);
    th = [-Inf (pts(1:end-1)+pts(2:end))/2 Inf];
    nt = numel(th);

    tpr = zeros(1,nt);
    fpr = zeros(1,nt);

    for n = 1:nt
        yt = hardlims(ysim-th(n));
        tpr(n) = 1-perffnr(yt,y); % TPR = 1-FNR
        fpr(n) = perffpr(yt,y);
    end

end