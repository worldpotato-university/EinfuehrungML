function y = softmax(x)
% defines the softmax function of a vector
% softmax(x)_j = exp(x_j) / \sum_k exp(x_k)
% x may be a vector or matrix. In this case, each row is calculated
% separately.
%                                                      Alfred Schöttl 2013
M = size(x,2);
E = exp(x);
y = E ./ repmat(sum(E,2),1,M);
