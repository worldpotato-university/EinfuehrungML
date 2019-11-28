function h = logRegHypo( w, x )
% Calculates the value of the logistic regression hypothesis function
% h_w(x) = sigmoid( w'x )
%% 2a. TODO
% complete the following line, be sure that the formula allows several
% samples given by several rows of x!
h = sigmoid(x*w');
%%
end

