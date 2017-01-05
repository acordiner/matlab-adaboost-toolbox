%PERFFNR False-negative rate performance function
%
% Usage:
%   fpr = perffnr(ysim,y)
%
%  See also PERFFPR, PERFMSE, PERFER

function fnr = perffnr(ysim,y)

    error(nargchk(2,2,nargin,'struct'));
    fnr = 1-sum((ysim>0)&(y>0))/sum(y>0);
    
end