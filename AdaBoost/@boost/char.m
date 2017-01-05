%CHAR String representation of AdaBoost object properties

% Copyright 2008 Alister Cordiner

function str = char(bst)

    str = sprintf('    AdaBoost object:\n');
    
    str = [str sprintf('\n   properties:\n\n')];
    str = [str sprintf('         quietMode: %s\n', ...
        char_logical(bst.quietMode))];
    str = [str sprintf('renormaliseWeights: %s\n', ...
        char_logical(bst.renormaliseWeights))];
    str = [str sprintf(' singleFeatLearner: %s\n', ...
        char_logical(bst.singleFeatLearner))];
    str = [str sprintf('      resampleSize: %f\n', ...
        bst.resampleSize)];
    
    str = [str sprintf('\n    functions:\n\n')];
    str = [str sprintf('     initWeightFcn: %s\n', ...
        char(bst.initWeightFcn))];
    str = [str sprintf('         outputFcn: %s\n', ...
        char(bst.outputFcn))];
    str = [str sprintf('          inputFcn: %s\n', ...
        char(bst.inputFcn))];
    str = [str sprintf('    featExtractFcn: %s\n', ...
        char(bst.featExtractFcn))];
    str = [str sprintf('   weightUpdateFcn: %s\n', ...
        char(bst.weightUpdateFcn))];
    str = [str sprintf('          alphaFcn: %s\n', ...
        char(bst.alphaFcn))];
    str = [str sprintf('        weakSimFcn: %s\n', ...
        char(bst.weakSimFcn))];
    str = [str sprintf('      weakTrainFcn: %s\n', ...
        char(bst.weakTrainFcn))];
    str = [str sprintf('           perfFcn: %s\n', ...
        char(bst.perfFcn))];
    str = [str sprintf('          adaptFcn: %s\n', ...
        char(bst.adaptFcn))];
    
    str = [str sprintf('\n    variables:\n\n')];
    str = [str sprintf('                 w: %s (%s)\n', ...
        type2str(bst.w), 'sample weights')];
    str = [str sprintf('                 b: %f (%s)\n', ...
        bst.b, 'output bias')];
    str = [str sprintf('             alpha: %s (%s)\n', ...
        type2str(bst.alpha), 'weak learner weights')];
    str = [str sprintf('            stages: %u\n', ...
        numel(bst.stages))];
    str = [str sprintf('          userdata: %s\n', ...
        type2str(bst.userdata))];
    
    bst.alpha = [];
%{
Also display no. rounds trained?
Last performance?
%}
end

function c = char_logical(x)
	if x
		c = 'true';
	else
		c = 'false';
	end
end