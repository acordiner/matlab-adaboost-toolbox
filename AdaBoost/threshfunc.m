%THRESHFUNC Threshold weak learner simulation function
%
% Usage:
%   ysim = threshfunc(fm,x)
%
%  See also THRESHLEARN

% Copyright 2008 Alister Cordiner

function ysim = threshfunc(fm,x)

    error(nargchk(2,2,nargin,'struct'));

    ysim = fm.polar*hardlims(x-fm.thresh);

end