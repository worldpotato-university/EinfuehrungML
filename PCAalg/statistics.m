function [ mu, Cov, Xc ] = statistics( X )
% Calculates some statistical values of the data matrix X.
% mu: the mean values
% Cov: the covariance matrix
% Xc: the centered data (Date minus mean)
N = size(X,1);

% 2. compute the mean value mu of the data X, the covariance matrix Cov 
% and the centered data Xc. 
% Hint: watch the dimensions with the calculation of Xc!
% TODO: complete the following lines
%% 
mu = mean(X)
Cov = cov(X)
Xc = X-mu
%%

fprintf(1,'The mean values mu are:');
mu

fprintf(1,'The covariance matrix Cov is:');
Cov

fprintf(1,'The first 10 centered data of Xc is:');
Xc(1:10,:)

end

