function [w, h, C] = gradientDescent( w0, alpha, x, y, verbose )
% realizes the gradient descent algorithm for the logistic regression
%
% inputs:
% w0:      initial guess of the parameters
% alpha:   learning rate
% x:       learning samples, one per row
% y:       associated labels, one per row
% verbose: 0:  no debug messages
%          >0: print the cost function value every verbose steps
%
% outputs:
% w:       estimated parameter vector
% h:       associated hypotheses' values
% C:       associated costs
%                                                        A. Schoettl 2015

w = w0;
C = 1000;
if nargin == 4
    verbose = 0;
end

cnt = 0;
while 1
    h = logRegHypo( w, x );     % Hypthese
    Calt = C;
    C = crossEntropy(h,y);      % Kosten berechnen --> Fehler zwischen Wahrheit y und Schätzung h
    if mod(cnt,verbose) == 0
        fprintf( 1, 'Iteration %5i: cost function %f\n', cnt, C );
    end
    dC = dCrossEntropyLogReg( h, y, x );
    w = w - alpha * dC;
    if C >= Calt-abs(Calt)*0.0001
        break;
    end
    cnt = cnt + 1;
end
    
if verbose == 1
    L = min(size(x,1),500);  % display max 500 elements
    fprintf( 1, '\nResult:\nh = ' );
    fprintf( 1, '%.4f ', h(1:L) );
    fprintf( 1, '\ny = ' );
    fprintf( 1, '%.4f ', y(1:L) );
    fprintf( 1, '\n\n' );
else if verbose == 2
        
end

end
