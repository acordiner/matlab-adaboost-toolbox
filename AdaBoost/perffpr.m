%PERFFPR False-positive rate performance function
%
% Usage:
%   fpr = perffpr(ysim,y)
%
%  See also PERFFNR, PERFMSE, PERFER

function fpr = perffpr(ysim,y)

    error(nargchk(2,2,nargin,'struct'));
    fpr = sum((ysim>0)&(y<=0))/sum(y<=0);
    
end