function res = checkGradients( dCdW1sample, dCdW2sample, W1, W2, X, Y )
[ dC1, dC2 ] = calcNumGradients( W1, W2, X, Y );

% check if there are major differences between the numerical and
% analytical derivatives
ma2 = max(max(abs(dC2-dCdW2sample))); 
if ma2>1e-5
    fprintf( 1, 'there is a significant difference of %f between the numerical and analytical derivative of dC/dW2\n', ma2 );
end
ma1 = max(max(abs(dC1-dCdW1sample))); 
if ma1>1e-5
    fprintf( 1, 'there is a significant difference of %f between the numerical and analytical derivative of dC/dW1\n', ma1 );
end

res = ma1+ma2;

