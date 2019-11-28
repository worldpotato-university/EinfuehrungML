function z = calcSigmoidLayer( x, W, b )
if nargin == 2
    z = sigmoid(x*W);
else
    z = sigmoid(x*W+repmat(b,size(x,1),1));
end
end
