%INIT Initialise the sample weights

% Copyright 2008 Alister Cordiner

function bst = init(bst,y)

    bst.w = bst.initWeightFcn(y);

end