function [ dC1, dC2 ] = calcNumGradients( W1, W2, X, Y )
eps = 1e-3;
dC1 = zeros(size(W1));
dC2 = zeros(size(W2));
W10 = W1;
W20 = W2;

for i=1:size(W10,1)
    for j=1:size(W10,2)
        % increase W1(i,j) a little
        W1(i,j) = W10(i,j) + eps;
        Z2 = predict( X, W1, W20 );
        Cp = nCrossEntropy(Z2,Y);
        % decrease W1(i,j) a little
        W1(i,j) = W10(i,j) - eps;
        Z2 = predict( X, W1, W20 );
        Cm = nCrossEntropy(Z2,Y);
        W1(i,j) = W10(i,j);
        % calculate the change rate of the costs
        dC1(i,j) = (Cp-Cm)/2/eps;
    end
end

for i=1:size(W20,1)
    for j=1:size(W20,2)
        % increase W2(i,j) a little
        W2(i,j) = W20(i,j) + eps;
        Z2 = predict( X, W10, W2 );
        Cp = nCrossEntropy(Z2,Y);
        % decrease W2(i,j) a little
        W2(i,j) = W20(i,j) - eps;
        Z2 = predict( X, W10, W2 );
        Cm = nCrossEntropy(Z2,Y);
        W2(i,j) = W20(i,j);
        % calculate the change rate of the costs
        dC2(i,j) = (Cp-Cm)/2/eps;
    end
end
end

