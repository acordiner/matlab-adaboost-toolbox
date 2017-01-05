%HARDLIM Hard limit input function
%
% Usage:
%   out = hardlim(in)
%
%  See also HARDLIMS, PURELIN

function out = hardlim(in)

    out = double(in>=0);
    
end