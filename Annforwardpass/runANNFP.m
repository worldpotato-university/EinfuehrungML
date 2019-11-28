X = [1 0 0.5]   ;            % input
X = [1 0 0.5;-1 0 0.5]

% a simple net with 2 neurons in the first layer
% weights of each neuron, 
W1 = [1 -1 1; 
      2 0 -1] % gewichte
b1 = [0.5 -0.5];

% a simple net and 3 neurons in the second layer
W2 = [0 1;
     -1 1; 
      1 1];
b2 = [0 1 1];

Z1 = calcSigmoidLayer( X, W1, b1 );
Z2 = calcSoftmax( Z1, W2, b2 )

% the target values
Y = [0.3 0.7 0.7]

%% 
% 5. and 6. Calculate the costs
% TODO: uncomment/change the next line, modify the m-file of the cost
% function.
C = quadraticCosts(Z2,Y)
%%