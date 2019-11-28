function z = calcSoftmaxLayer( x, W, b )
if nargin == 2
    z = softmax(x*W);
else
    z = softmax(x*W+repmat(b,size(x,1),1));
end
end
