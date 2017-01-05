%PERFMSE Mean squared error performance function
%
% Usage:
%   fpr = perfmse(ysim,y)
%
%  See also PERFFPR, PERFFNR, PERFER

function er = perfmse(ysim,y)

    error(nargchk(2,2,nargin,'struct'));
    
    er = mean((ysim(:)-y(:)).^2);
    
end