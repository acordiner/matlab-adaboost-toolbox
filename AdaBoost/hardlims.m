%HARDLIMS Saturated hard limit input function
%
% Usage:
%   out = hardlims(in)
%
%  See also HARDLIM, PURELIN

function out = hardlims(in)

    out = sign(double(in)) + (double(in)==0);
    
end