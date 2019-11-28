function h = logRegHypo( w, x )
% Calculates the value of the logistic regression hypothesis function
% h_w(x) = sigmoid( w'x )
h = sigmoid( x * w' );
end

