function y = sigmoid( x )
% defines the sigmoid (logistic) function
% sigmoid(x) = 1 / ( 1 + exp(-x) );
% x may also be a vector or matrix
%
%                                                     Alfred Schöttl 2016
y = 1 ./ ( 1 + exp(-x) );
end
