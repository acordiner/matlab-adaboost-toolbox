%NEWRAB Initialises a new Real AdaBoost object
%
%  See also NEWDAB, NEWGAB, NEWGABR

% Copyright 2008 Alister Cordiner

function bst = newrab

    bst = boost;
    
    % properties
    bst.renormaliseWeights = true;
    bst.singleFeatLearner = true;
    
    % functions    
    bst.initWeightFcn = @initeq;
    bst.outputFcn = @outcombth;
    bst.inputFcn = @hardlims;
    bst.weightUpdateFcn = @wupexp;    
    bst.weakSimFcn = @stumpfunc;
    bst.weakTrainFcn = @stumplearn;
    bst.alphaFcn = @wgthalflike;
    
end