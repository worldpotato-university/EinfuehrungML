function [ V, sig2 ] = pca( Xc, dim )
% Runs a principal component analysis on the data.
% inputs:
% Xc:  the CENTERED data matrix, one sample per row
% dim: (optional) the number of principal axes requested. By default,
%           all principal components are returned.
% outputs:
% V:    the matrix of principal axes, one axis per column
% mu:   the mean vector (the data are automatically centered)
% sig2: the singular values (the eigenvalues of the covariance matrix)
%                                                      Alfred Sch�ttl 2015
N = size(Xc,1);
m = size(Xc,2);
if nargin <= 1
    dim = m;
end

%% MISSING: run the singular value decomposition. Hint: type "help svd"
[U,S,V] = svd(Xc);

%%
fprintf(1,'We performed an SVD. The SVD decomposes the matrix Xc into Xc = U*S*V''.\n');

fprintf(1,'The principal axes are the following columns of V:');
V

fprintf(1,['The singular values are the diagonal elements of S.\n'...
'The standard deviation is the square root of these elements.\n'...
'The first 10 rows are:']);
S(1:10,:)

% some simple post-processing steps:
V = V(:,1:dim);      % we cut out the first dim vectors 
sig2 = diag(S)';     % the diagonal matrix S is reduced to a vector
sig2 = sig2(1:dim);  % we cut out the first dim values
end
