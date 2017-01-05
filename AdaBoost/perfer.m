%PERFER Error rate performance function
%
% Usage:
%   fpr = perfer(ysim,y)
%
%  See also PERFFPR, PERFFNR, PERFMSE

function er = perfer(ysim,y)

    error(nargchk(2,2,nargin,'struct'));
    er = mean(ysim~=y);
    
end