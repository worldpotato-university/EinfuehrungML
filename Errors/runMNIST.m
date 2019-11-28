[imgs,lbls] = readMNIST( 'train', 200 );
[testimgs,testlbls] = readMNIST( 'test', 1000 );

veclbls = single(uvec(lbls+1,10)); % recode labels to vectors like (0,0,1,0,0,0,0,0,0,0)
N = size(imgs,1); % number of samples
M = size(imgs,2); % number of features

m0 = M;
m1 = 1000;
m2 = 10;
nLoops = 1000;
alpha = 0.2;
plotStep = 2;

% we construct an ANN with 
% - one input layer (linear)            dim =  784, 
% - one hidden layer (sigmoid)          dim =   m1 
% - one output layer (softmax)          dim =   10. 
% The cost function is the cross-entropy function.
% To simplify the notation, no biases are used.

W1 = randn(m0,m1) * 0.01;
W2 = randn(m1,m2) * 0.01;

% do gradient descent
figure(1)
clf
hold on
grid on

allTrainErr = [];
allTestErr = [];
xlim([1,nLoops]); ylim([0 1]);
for i=1:nLoops
    % gradient descent
    [W1, W2, C] = gradientDescent( W1, W2, alpha, imgs, veclbls );
    
    % report learn progress
    % we check the progress every plotStep steps
    fprintf(1, 'Step %i: Costs: %f\n', i, C );
    if mod(i,plotStep)==1
        trainerr = calcErr(imgs,lbls,W1,W2);
        fprintf(1, '  Train error: %f\n', trainerr );
        testerr = calcErr(testimgs,testlbls,W1,W2);
        fprintf(1, '  Test error:  %f\n', testerr );
        
       
        % 2. plot the error figures
        % The plots shall have the axes: x: loop number i, y: error figure.
        % Plot two lines: a blue line for the training error and a red line for
        % the test error.  
        %% TODO: Add code to draw the two lines, you will have to save the 
        % last errors in additional variables
        allTrainErr = [allTrainErr; trainerr];
        allTestErr = [allTestErr; testerr];
        
        

        %%
    end
end

plot(allTrainErr, 'r')
plot(allTestErr, 'b')
