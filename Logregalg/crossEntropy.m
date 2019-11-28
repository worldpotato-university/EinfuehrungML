function C = crossEntropy( h, y )
% defines the cross-entropy cost function of the hypothesis values h and the
% labels y,
% C(h,y) = -1/N \sum_{i=1}^N ( y_i \ln h_i + (1-y_i) \ln( 1 - h_i ) )
% Observe that h is implicitly dependent on w.
%                                                       Alfred Schöttl 2016
N = size(y,1);
assert( size(h,1) == N );
%% 2b TODO:
% Complete the following line. Be sure to allow for vectors h, y giving a
% vector C(h,y). Hint: You can use the Matlab function mean.
C = (-1/N) * (y'*log(h) + (1 - y')*log(1-h));
%%
end
