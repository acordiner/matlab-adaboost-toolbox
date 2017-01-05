%REGRESSLEARN Regression weak learner training function
%
% Usage:
%   [fm,feats] = regresslearn(x,y,w)
%
% Note:
%   w should contain the y target values
%   y is not used by this function
%
%  See also REGRESSFUNC

% Copyright 2008 Alister Cordiner

function [fm,feats] = regresslearn(x,y,w)

    error(nargchk(3,3,nargin,'struct'));

    fm = []; best_err = Inf; feats = 0;
    
    nfeats = size(x,1);
    
    for n = 1:nfeats
        x_aug = [x(n,:); ones(1,200)];
        b = regress(w',x_aug');
        fm_out = b'*x_aug;
        
        err = w-fm_out;
        err = err*err';
        
        if err<best_err
            best_err = err;
            feats = n;
            fm = b;
        end
    end

end