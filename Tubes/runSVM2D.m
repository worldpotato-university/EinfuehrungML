
clf
K = 100;
[W,w0] = svmLearn(X, Y, K, 'gaussian' );

W
w0

figure(1)
clf
%plotLinSVM2D( X, Y, W, w0 )
plotGaussSVM2D(X, Y, W, w0,'gaussian')
% axis equal
%%  
% 1. Interpret the two variables W and w0 in the plot
%%



%%  
% 3. Decide whether the new tube is produced by machine 1 or 2
%    TODO: Add a line of code below.



%%
% plot(W(1),W(2), '+')
% 
% myX = [2.5, 7]
% plot(myX(1),myX(2), '*')
% test = W'*myX' + w0;
% test = test/norm(W)
% 


%% 
% 4. Add a call to function svmPredict to do the same prediction as in
%    task 3
%%

% svmPredict(W, w0, myX)
% svmPredict(W, w0, [0,6])
% plot(0,6,'+')


