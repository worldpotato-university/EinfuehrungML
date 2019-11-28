function C = crossEntropy( h, y )
% defines the cross-entropy cost function of the hypothesis values h and the
% labels y,
% C(h,y) = -1/N \sum_{i=1}^N ( y_i \ln h_i + (1-y_i) \ln( 1 - h_i ) )
% Observe that h is implicitly dependent on theta.
%                                                       Alfred Schöttl 2016
N = size(y,1);
assert( size(h,1) == N );
C = -mean( y.*log(h+1e-8) + (1-y).*log(1-h+1e-8) ); 
end
