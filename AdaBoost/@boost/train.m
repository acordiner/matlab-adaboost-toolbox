%TRAIN Train an AdaBoost object
%
% Usage:
%   bst = train(bst,P,T,nrounds)
%
%  See also ADAPT, SIM

% Copyright 2008 Alister Cordiner

function bst = train(bst,P,T,nrounds)

    error(nargchk(4,4,nargin,'struct'));
    if nrounds<1
        error('nrounds must be >= 1');
    end
    
	if ~bst.quietMode, hWait = waitbar(0,'Training...'); end
    for m = 1:nrounds
        bst = bst.adaptFcn(bst,P,T);
		if ~bst.quietMode, waitbar(m/nrounds); end
    end
	if ~bst.quietMode, close(hWait); end
    
end