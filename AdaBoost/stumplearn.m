%STUMPLEARN Stump weak learner training function
%
% Usage:
%   [fm,feats] = stumplearn(x,y,w)
%
%  See also STUMPFUNC

% Copyright 2008 Alister Cordiner

function [fm,feats] = stumplearn(x,y,w)

    error(nargchk(3,3,nargin,'struct'));

    [nfeats,nsamps] = size(x);
    feat_werr = zeros(1,nfeats);
    fm = {};

    for m = 1:nfeats

        [th,ix] = sort(x(m,:),'ascend');
        th = (th(1:end-1)+th(2:end))/2;

        % Polynomial coefficients a and b for all thresholds
        % (adapted from Torralba, 2003)
        y_sort = y(ix);
        w_sort = w(ix);
        Szw = cumsum(y_sort.*w_sort); Ezw = Szw(end);
        Sw  = cumsum(w_sort);
        b = Szw ./ Sw;
        Sw(Sw==1) = 0;
        a = (Ezw - Szw) ./ (1-Sw) - b;
    
        werr = zeros(1,nsamps-1);
        for n = 1:numel(th)
            % this could be vectorised for speed, but the 
            % for-loop version uses far less memory (the
            % vectorised version requires a nsamps x nsamps-1
            % sized matrix to be created)
            werr(n) = w*(hardlims(x(m,:)-th(n))~=y)';
        end

        % determine the polarity of the classifier
        [werr1,ix1] = min(werr);
        [werr2,ix2] = max(werr);
        werr2 = 1-werr2;
        if werr1<werr2
            feat_werr(m) = werr1;
            fm(m).thresh = th(ix1);
            fm(m).polar = +1;
            
            fm(m).a = a(ix1);
            fm(m).b = b(ix1);
        else
            feat_werr(m) = werr2;
            fm(m).thresh = th(ix2);
            fm(m).polar = -1;
            
            fm(m).a = a(ix2);
            fm(m).b = b(ix2);
        end

    end
    [werr,feats] = min(feat_werr);
    fm = fm(feats);

end