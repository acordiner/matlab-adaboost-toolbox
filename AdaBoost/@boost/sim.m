%SIM Simulate a trained AdaBoost object
%
% Usage:
%   ysim = sim(bst,x)
%   [ysim,perf] = sim(bst,x,y,nstages)
%
%  See also TRAIN, ADAPT

% Copyright 2008 Alister Cordiner

function [ysim,perf] = sim(bst,x,y,nstages)

    error(nargchk(2,4,nargin,'struct'));
    if nargin>2 && numel(y)>0
        error(nargoutchk(2,3,nargout,'struct'));
    else
        error(nargoutchk(1,1,nargout,'struct'));
        y = [];
    end

    y = bst.inputFcn(y);

    if nargin>3
        if nstages<1 || nstages>numel(bst.stages)
            error('Invalid number of stages: %d', nstages);
        end
    else
        nstages = numel(bst.stages);
    end
    nsamps = size(x,2);

    ysim = zeros(nstages,nsamps);
    if nargout>1
        perf = zeros(1,nstages);
    end
    
    for m = 1:nstages
        
        x_feats = bst.featExtractFcn(x);
        ysim(m,:) = bst.alpha(m)*bst.weakSimFcn(...
            bst.stages(m).fm, x_feats(bst.stages(m).feats,:));
        
        if numel(y)>0
            if nargout>1
                perf(m) = bst.perfFcn(y,ysim);
            end
        end
        
    end
    
    ysim = bst.outputFcn(ysim,bst);

end