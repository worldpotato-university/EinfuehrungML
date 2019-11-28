function dC = dCrossEntropyLogReg( h, y, x )
% calculates the derivative of the cross entropy function for the logistic
% regression
%
% inputs:
% y:  labels (Nx1)
% h:  hypotheses (Nx1)
% x:  feature data (NxM)
%
% outputs:
% dC: derivatives (1xM)
%                                                       Alfred Schöttl 2016

N = size(x,1);   % number of cases
dC = 1/N * (h-y)' * x;

end

