%NEWGABR Initialises a new Gentle AdaBoost (regression) object
%
%  See also NEWDAB, NEWGAB, NEWRAB

% Copyright 2008 Alister Cordiner

function bst = newgabr

    bst = boost;
    
    % properties
    bst.renormaliseWeights = false;
    bst.singleFeatLearner = false;
    
    % functions    
    bst.initWeightFcn = @inittarg;
    bst.outputFcn = @outcomb;
    bst.inputFcn = @purelin;
    bst.weightUpdateFcn = @wupsub;
    bst.weakSimFcn = @regressfunc;
    bst.weakTrainFcn = @regresslearn;
    bst.alphaFcn = @(y,ysim,bst) 1/50;
    
end