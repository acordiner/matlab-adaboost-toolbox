%BOOST Generic AdaBoost object
%
% You should not need to use this object directly, instead use
% one of the specific initialisers.
%
%  See also NEWDAB, NEWRAB, NEWGAB, NEWGABR

% Copyright 2008 Alister Cordiner

function bst = boost

    % properties
    bst.quietMode = false;
    bst.renormaliseWeights = true;
    bst.singleFeatLearner = true;
    bst.resampleSize = 0;
    
    % functions
    bst.initWeightFcn = @initeqc;
    bst.outputFcn = @outcombth;
    bst.inputFcn = @hardlims;
    bst.featExtractFcn = @(x) x;
    bst.weightUpdateFcn = @wupexp;
    bst.adaptFcn = @adapt;
    bst.weakSimFcn = @stumpfunc;
    bst.weakTrainFcn = @stumplearn;
    bst.perfFcn = @perfer;
    bst.alphaFcn = @(y,ysim,bst) 1;
    
    % variables
    bst.w = [];
    bst.b = 0;    
    bst.alpha = [];
    bst.stages = [];
    bst.userdata = {};
    
    bst = class(bst,'boost');

end