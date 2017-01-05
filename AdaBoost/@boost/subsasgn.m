function bst = subsasgn(bst,subscripts,v)

    switch(subscripts.type)
        case '.'
            % okay
        case '{}'
            error('Cell contents assignment to a non-cell array object.');
        case '()'
            error('Array contents assignment to a non-array object.');
        otherwise
            return
    end

    switch(subscripts.subs)
        case {'initWeightFcn','weightUpdateFcn','outputFcn',...
                'alphaFcn','inputFcn','weakSimFcn',...
                'weakTrainFcn','perfFcn','featExtractFcn'}
            if ~isa(v,'function_handle')
                error('%s must be a function handle', subscripts.subs);
            end
        case {'renormaliseWeights', 'quietMode', 'singleFeatLearner'}
            if ~isa(v,'logical')
                error('%s must be of type logical', subscripts.subs);
            end
        case 'resampleSize'
            if ~isscalar(v) || ~isnumeric(v)
                error('%s must be a numeric scalar', subscripts.subs);
            elseif v<0 || v>1
                error('%s must be between 0 and 1', subscripts.subs);
            end
        case {'w','alpha'}
            if ~isnumeric(v)
                error('%s must be numeric', subscripts.subs);
            end
        case 'b'
            if ~isscalar(v) || ~isnumeric(v)
                error('%s must be a numeric scalar', subscripts.subs);
            end
        case 'userdata'
            %okay
        otherwise
            error('Unknown field: %s', subscripts.subs);
    end
    
    bst.(subscripts.subs) = v;

end