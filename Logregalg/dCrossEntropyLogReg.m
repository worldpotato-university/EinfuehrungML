function dC = dCrossEntropyLogReg( h, y, x )
% calculates the derivative of the cross entropy function for the logistic
% regression with respect to the parameters w.
%
% inputs:
% y:  labels (Nx1)
% h:  hypotheses (Nx1)
% x:  feature data (NxM)
%
% outputs:
% dC: derivatives (1xM)
%                                                      Alfred Schöttl 2016

N = size(x,1);   % number of cases
%% 2c TODO:
% Complete the next line
dC = (-1/N) * ((y - h)' * x);
%%
end

