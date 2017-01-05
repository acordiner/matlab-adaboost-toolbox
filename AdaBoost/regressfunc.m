%REGRESSFUNC Regression weak learner simulation function
%
% Usage:
%   ysim = regressfunc(fm,x)
%
%  See also REGRESSLEARN

% Copyright 2008 Alister Cordiner

function ysim = regressfunc(fm,x)

    error(nargchk(2,2,nargin,'struct'));

    nsamps = size(x,2);
    x_aug = [x; ones(1,nsamps)];
    ysim = fm'*x_aug;

end