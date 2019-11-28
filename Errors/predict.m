function Z2 = predict( X, W1, W2 )
Z1 = calcSigmoidLayer(X,W1);
Z2 = calcSoftmaxLayer(Z1,W2);
end

