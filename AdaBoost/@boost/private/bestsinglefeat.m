% This function is used for weak learners that are only
% trained with a single feature. This function will train
% a weak learner for each feature and select the one with
% the lowest err.
function [fm,feats,err] = bestsinglefeat(x,y,w,bst)

    error(nargchk(4,4,nargin,'struct'));

    nfeats = size(x,1);

    % store all trained weak learners and their respective
    % err rates
    fm = cell(1,nfeats);
    err = zeros(1,nfeats);
    
    % iterate over all features and train a weak learner for
    % each
    for n = 1:nfeats
        fm{n} = bst.weakTrainFcn(x(n,:),y,w);
        ysim = bst.weakSimFcn(fm{n},x(n,:));
        err(n) = bst.perfFcn(y,bst.outputFcn(ysim,bst));
    end
    
    % select the weak learner with the lowest err
    [err,feats] = min(err);
    fm = fm{feats};
    
end