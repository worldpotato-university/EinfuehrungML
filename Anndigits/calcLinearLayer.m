function z = calcLinearLayer( x, W, b )
if nargin==2
    z = x*W;
else
    z = x*W+repmat(b,size(x,1),1);
end
end

