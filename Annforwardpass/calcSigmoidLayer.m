function Z = calcSigmoidLayer( X, W, b )
Z = sigmoid(b + X * W');
end

