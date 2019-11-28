function [W1, W2, C] = gradientDescent( W1, W2, alpha, Z0, Y )
% gradientDescent calculates the gradients and performs a gradient
% descent step. It return the modified weights.
%                                                             Schöttl 2018

N = size(Z0,1);

% forward pass 
Z1 = calcSigmoidLayer(Z0,W1);
Z2 = calcSoftmaxLayer(Z1,W2);
C = nCrossEntropy(Z2,Y);

% backpropagation
delta2 = Z2 - Y;
delta1 = Z1 .* (1-Z1) .* ( delta2*W2' );

% calculate the gradients
dCdW2 = Z1' * delta2 / N;
dCdW1 = Z0' * delta1 / N;

% note (check it!): if we had biases, the gradients with respect to biases 
% would be simply the deltas
% dCdb1 = mean(delta1);
% dCdb2 = mean(delta2);

% gradient descent
W1 = W1 - alpha * dCdW1;
W2 = W2 - alpha * dCdW2;

