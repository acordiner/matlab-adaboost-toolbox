%THRESHLEARN Threshold weak learner training function
%
% Usage:
%   [fm,feats] = threshlearn(x,y,w)
%
%  See also THRESHFUNC

% Copyright 2008 Alister Cordiner

function [fm,err] = threshlearn(x, y, w)

    error(nargchk(3,3,nargin,'struct'));

    if size(x,1)~=1
        error('threshlearn expects only a single feature, check that bst.singleFeatLearner is true');
    end
    nsamps = size(x,2);
    
    % all thresholds to consider
    thresh = unique(sort(x,'ascend'));
    thresh = [-Inf (thresh(1:end-1)+thresh(2:end))/2 +Inf];
    nthresh = numel(thresh);

    err = zeros(1,nthresh);
    for n = 1:nthresh
        ysim = hardlims(x-thresh(n));
        err(n) = (ysim~=y)*w'/nsamps;
    end

    [err1,ix1] = min(err);
    [err2,ix2] = max(err);

    % determine polarity
    if err1<1-err2
        thresh = thresh(ix1);
        polar = +1;
        err = err1;
    else
        thresh = thresh(ix2);
        polar = -1;
        err = 1-err2;
    end

    fm.thresh = thresh;
    fm.polar = polar;

end