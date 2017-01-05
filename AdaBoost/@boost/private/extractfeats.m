% Apply a feature extraction function to an entire matrix or cell array of
% input samples
function x_feats = extractfeats(x,featExtractFcn)

    error(nargchk(2,2,nargin,'struct'));

    nsamps = size(x,2);

    for n = 1:nsamps
        
        % extract the features
        if iscell(x)
            feats = featExtractFcn(x{:,n});
        else
            feats = featExtractFcn(x(:,n));
        end
        
        % pre-allocate the array
        if n==1
            nfeats = numel(feats);
            x_feats = zeros(nfeats,nsamps);
        end
        
        % add the features to the array
        x_feats(:,n) = feats(:);
        
    end

end