%ADAPT Perform a single step of training on an AdaBoost object
%
% Usage:
%   bst = adapt(bst,x,y)
%
%  x = nfeats x nsamps matrix
%  y = 1 x nsamps vector
%
%  See also SIM, ADAPT

% Copyright 2008 Alister Cordiner

function bst = adapt(bst,x,y)

    error(nargchk(3,3,nargin,'struct'));
    if numel(bst)==0
        error('Must be initialised first');
    elseif size(x,2)~=size(y,2)
        error('x and y must have the same number of samples');
    elseif size(y,1) ~= 1
        error('y must be a row vector');
    elseif ndims(x) ~= 2 || ndims(y) ~= 2
        error('x and y must be 2-D');
    end
    
    nsamps = size(x,2);
    
    y = bst.inputFcn(y);
    
    if ~isfield(bst,'w') || numel(bst.w)==0
        bst = init(bst,y);
    end

    % Train the next weak learner
    if bst.resampleSize>0
        [null,subset] = sort(abs(bst.w) .* rand(1,nsamps),'descend');
        subset = subset(1:ceil(nsamps*bst.resampleSize));
        x_feats = extractfeats(x(:,subset),bst.featExtractFcn);
        if bst.singleFeatLearner
            [fm,feats] = bestsinglefeat(...
                x_feats, y(subset), bst.w(subset), bst);
        else
            [fm,feats] = bst.weakTrainFcn(...
                x_feats, y(subset), bst.w(subset));
        end
    else
        x_feats = extractfeats(x,bst.featExtractFcn);
        if bst.singleFeatLearner
            [fm,feats] = bestsinglefeat(x_feats, y, bst.w, bst);
        else
            [fm,feats] = bst.weakTrainFcn(x_feats, y, bst.w);
        end
    end    

    % Add to strong classifier
    bst.stages(end+1).fm = fm;
    bst.stages(end).feats = feats;

    % Updating and computing classifier output on training samples
    x_feats = extractfeats(x,bst.featExtractFcn);
    fm_out = bst.weakSimFcn(fm,x_feats(feats,:));
    
    % Call the alpha update function
    bst.alpha(end+1) = bst.alphaFcn(y,fm_out,bst);

    % Reweight training samples
    bst.w = bst.weightUpdateFcn(y,fm_out,bst);
    if bst.renormaliseWeights
        bst.w = bst.w/sum(bst.w); %renormalise to a distribution
    end

end