% performas a logistic regression on the MNIST data
%                                                       Alfred Schöttl 2016

[imgs,lbls] = readMNIST( 'train', 0 );
N = size(imgs,1); % number of samples
M = size(imgs,2); % number of features
w0 = zeros( 1, M );
alpha = 0.05;
class1 = single(lbls==2);

% input arguments: 	initial value for w
%					constant how much of the gradient gets added each iteration
%					
[w, h, C] = gradientDescent( w0, alpha, imgs, class1, 100 );
prediction = single(h>0.5);

nClass1 = sum(class1);
nWrong = sum(abs(class1-prediction));
fprintf( 1, 'Class 1 members: %d, class 0 members: %d\n', nClass1, N-nClass1);
fprintf( 1, 'wrong associations: %d = %.1f %%\n', nWrong, nWrong/N*100 );


