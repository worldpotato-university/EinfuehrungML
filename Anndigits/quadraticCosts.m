function C = quadraticCosts( h, y )
% defines the quadratic cost function of the hypothese values h and the
% labels y,
% C(h,y) = 1/2/N \sum_{i=1}^N ( h_i - y_i)^2
% Observe that h implicitly depends on theta.
%                                                       Alfred Schöttl 2013
N = size(y,1);
assert( size(h,1) == N, 'The number of hypothese values and of labels must be equal.' );
C = mean( diag( (h-y)*(h-y)' ) )/2; 
end
