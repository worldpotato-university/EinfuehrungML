function Z = calcSoftmax( X, W, b )

Z = softmax(b+X * W');

end

