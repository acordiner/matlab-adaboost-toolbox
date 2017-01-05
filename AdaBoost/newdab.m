%NEWDAB Initialises a new Discrete AdaBoost object
%
%  See also NEWGAB, NEWGABR, NEWRAB

% Copyright 2008 Alister Cordiner

function bst = newdab

    bst = boost;
    
    % properties
    bst.renormaliseWeights = true;
    bst.singleFeatLearner = true;
    
    % functions    
    bst.initWeightFcn = @initeq;
    bst.outputFcn = @outcombth;
    bst.inputFcn = @hardlims;
    bst.weightUpdateFcn = @wupexp;
    bst.weakSimFcn = @threshfunc;
    bst.weakTrainFcn = @threshlearn;
    bst.alphaFcn = @wgtlogit;
    
end