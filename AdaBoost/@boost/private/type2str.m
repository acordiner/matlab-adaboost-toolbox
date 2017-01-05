function s = type2str(var)

    sz = size(var);
    if isscalar(var)
        s = class(var);
    elseif numel(var)==0
        s = '[]';
    else
        for n = 1:numel(sz)
            if n==1
                s = num2str(sz(1));
            else
                s = [s 'x' num2str(sz(n))];
            end
        end
        s = [s ' ' class(var)];
    end

end