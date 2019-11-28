function C = nCrossEntropy( h, y )
% defines the cross-entropy cost function of the hypothese values h and the
% labels y,
% C(h,y) = -1/N \sum_{i=1}^N \sum_{j=1}^n ( y_{ij} \ln h_{ij} )
%                                                       Alfred Schöttl 2013
N = size(y,1);
assert( size(h,1) == N );
C = -mean( sum( y.*log(h+1e-8), 2 ) ); 
end
