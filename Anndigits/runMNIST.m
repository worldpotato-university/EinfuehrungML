%[imgs,lbls] = readMNIST( 'train', 100 );

%%
% 4. Change the data source to our MNIST data
% TODO: Comment out the following line as soon as the gradients are checked
%%
imgs = [ 0.1 -0.2 0.3 -0.3 0.4 ];  lbls = 3;
%%

veclbls = single(uvec(lbls+1,10)); % recode labels to vectors like (0,0,1,0,0,0,0,0,0,0)
N = size(imgs,1); % number of samples
M = size(imgs,2); % number of features

%%
% 5. constants
% m1 is the number of hidden nodes. Increase the number as soon as the
% gradients are checked.
% TODO: change the number of hidden nodes
%%
m0 = M;
m1 = 12;
m2 = 10;
%%
nLoops = 500;
alpha = 0.2;

% we construct an ANN with 
% - one input layer (linear)            dim =  784, 
% - one hidden layer (sigmoid)          dim =   m1 
% - one output layer (softmax)          dim =   10. 
% The cost function is the cross-entropy function.
% To simplify the notation, no biases are used.

%%
% 1. random initalization
% Initialize W1 and W2 (tip: use randn, the number of columns is
% the number of nodes in the next layer) 
% TODO: complete the following lines
%%
W1 = randn(m0, 1);
W2 = randn(m2, 1);
%%

% do gradient descent
for i=1:nLoops
    [W1, W2, C] = gradientDescent( W1, W2, alpha, imgs, veclbls' );
    fprintf(1, 'Step %i: Costs: %f\n', i, C );
end

% learning can take a long time. It is a good idea to save the latest
% results for later usage
save( 'Weights', 'W1', 'W2' );

