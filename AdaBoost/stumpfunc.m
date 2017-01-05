%STUMPFUNC Stump weak learner simulation function
%
% Usage:
%   ysim = stumpfunc(fm,x)
%
%  See also STUMPLEARN

% Copyright 2008 Alister Cordiner

function ysim = stumpfunc(fm,x)

    error(nargchk(2,2,nargin,'struct'));

    ysim = fm.polar*hardlims(x-fm.thresh);
    
end