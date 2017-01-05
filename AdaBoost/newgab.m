%NEWGAB Initialises a new Gentle AdaBoost object
%
%  See also NEWDAB, NEWGABR, NEWRAB

% Copyright 2008 Alister Cordiner

function bst = newgab

    bst = boost;
    
    % properties
    bst.renormaliseWeights = true;
    bst.singleFeatLearner = true;
    
    % functions    
    bst.initWeightFcn = @initeqc;
    bst.outputFcn = @outcombth;
    bst.inputFcn = @hardlims;
    bst.weightUpdateFcn = @wupexp;    
    bst.weakSimFcn = @stumpfunc;
    bst.weakTrainFcn = @stumplearn;
    bst.alphaFcn = @(y,ysim,bst) 1;    
    
end