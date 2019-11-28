function [w,w0] = svmLearn(X, Y, C, kernelFunction )
% svmLearn trains an SVM classifier 
%
% input:
%   X: the samples to be learned, one per row
%   Y: the associated labels, one per row
%   C: the penalty factor (=slope of the cost function)
%   kernelFunction: 'linear' or 'gaussian' or a custom kernel function
%      handle (optional), linear is standard
%
% output:
%   w, w0: the parameter vector, x*w+w0 = 0 is the decision boundary
%
% Most of the code is by Andrew Ng. The implementation is a simplified
% version of the SMO algorithm and for demonstration purposes only.
% It is not appropriate for huge data sets and not intended for studying 
% SVM learning algorithms.

if nargin < 4
   kernelFunction = 'linear';
end

m = size(X, 1);
tol = 1e-3;
max_passes = 5;

% Map 0 to -1
Y(Y==0) = -1;

% Variables
alphas = zeros(m, 1);
w0 = 0;
E = zeros(m, 1);
passes = 0;

% Pre-compute the Kernel Matrix since our dataset is small
if ischar(kernelFunction) && strcmpi(kernelFunction, 'linear')
    K = X*X';
elseif ischar(kernelFunction) && strcmpi(kernelFunction, 'gaussian')
    K = zeros(m);
    sigma = 1;
    for i = 1:m
        for j = i:m
             K(i,j) = exp( - (X(i,:)-X(j,:))*(X(i,:)-X(j,:))'/2/sigma^2 );
             K(j,i) = K(i,j); %the matrix is symmetric
        end
    end
else
    K = zeros(m);
    for i = 1:m
        for j = i:m
             K(i,j) = kernelFunction(X(i,:)', X(j,:)');
             K(j,i) = K(i,j); %the matrix is symmetric
        end
    end
end

% Train according to the SMO (sequential minimization optimization)
% algorithm, invented by John Platt (search the internet for details)
fprintf('\nTraining ...');
dots = 12;
while passes < max_passes,
            
    num_changed_alphas = 0;
    for i = 1:m,
        
        % Calculate Ei = f(x(i)) - y(i) using (2). 
        % E(i) = b + sum (X(i, :) * (repmat(alphas.*Y,1,n).*X)') - Y(i);
        E(i) = w0 + sum (alphas.*Y.*K(:,i)) - Y(i);
        
        if ((Y(i)*E(i) < -tol && alphas(i) < C) || (Y(i)*E(i) > tol && alphas(i) > 0)),
            
            % In practice, there are many heuristics one can use to select
            % the i and j. In this simplified code, we select them randomly.
            j = ceil(m * rand());
            while j == i,  % Make sure i \neq j
                j = ceil(m * rand());
            end

            % Calculate Ej = f(x(j)) - y(j) using (2).
            E(j) = w0 + sum (alphas.*Y.*K(:,j)) - Y(j);

            % Save old alphas
            alpha_i_old = alphas(i);
            alpha_j_old = alphas(j);
            
            % Compute L and H by (10) or (11). 
            if (Y(i) == Y(j)),
                L = max(0, alphas(j) + alphas(i) - C);
                H = min(C, alphas(j) + alphas(i));
            else
                L = max(0, alphas(j) - alphas(i));
                H = min(C, C + alphas(j) - alphas(i));
            end
           
            if (L == H),
                % continue to next i. 
                continue;
            end

            % Compute eta by (14).
            eta = 2 * K(i,j) - K(i,i) - K(j,j);
            if (eta >= 0),
                % continue to next i. 
                continue;
            end
            
            % Compute and clip new value for alpha j using (12) and (15).
            alphas(j) = alphas(j) - (Y(j) * (E(i) - E(j))) / eta;
            
            % Clip
            alphas(j) = min (H, alphas(j));
            alphas(j) = max (L, alphas(j));
            
            % Check if change in alpha is significant
            if (abs(alphas(j) - alpha_j_old) < tol),
                % continue to next i. 
                % replace anyway
                alphas(j) = alpha_j_old;
                continue;
            end
            
            % Determine value for alpha i using (16). 
            alphas(i) = alphas(i) + Y(i)*Y(j)*(alpha_j_old - alphas(j));
            
            % Compute b1 and b2 using (17) and (18) respectively. 
            b1 = w0 - E(i) ...
                 - Y(i) * (alphas(i) - alpha_i_old) *  K(i,j)' ...
                 - Y(j) * (alphas(j) - alpha_j_old) *  K(i,j)';
            b2 = w0 - E(j) ...
                 - Y(i) * (alphas(i) - alpha_i_old) *  K(i,j)' ...
                 - Y(j) * (alphas(j) - alpha_j_old) *  K(j,j)';

            % Compute b by (19). 
            if (0 < alphas(i) && alphas(i) < C),
                w0 = b1;
            elseif (0 < alphas(j) && alphas(j) < C),
                w0 = b2;
            else
                w0 = (b1+b2)/2;
            end

            num_changed_alphas = num_changed_alphas + 1;

        end
        
    end
    
    if (num_changed_alphas == 0),
        passes = passes + 1;
    else
        passes = 0;
    end

    fprintf('.');
    dots = dots + 1;
    if dots > 78
        dots = 0;
        fprintf('\n');
    end

end
fprintf(' Done! \n\n');
if ischar(kernelFunction) && strcmpi(kernelFunction, 'linear')
    w = ((alphas.*Y)'*X)';
else
    w = alphas.*Y;
    b = 0;
end


end
