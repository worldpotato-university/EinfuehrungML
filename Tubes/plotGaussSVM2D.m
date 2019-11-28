function plotGaussSVM2D( X, Y, W, w0, opts )
% plotGaussSVM2D plots the results of a SVM with gaussian kernels and 2D-features
% inputs:
%     X : the data matrix, one sample per row
%     Y : the data labels, one label per row
%     W : the weight matrix as result of SVM training (optional)
%                                                   (c) Alfred Schöttl 2015

if nargin <= 2
    Ysvm = Y;
    opts = [];
else
    if nargin < 5
        opts = [];
    end
    Ysvm = svmVals( X, W, w0, X );

    x1plot = linspace(min(X(:,1)-1), max(X(:,1)+1), 200)';
    x2plot = linspace(min(X(:,2)-1), max(X(:,2)+1), 200)';
    [X1, X2] = meshgrid(x1plot, x2plot);
    Xunknown = [ reshape(X1,40000,1), reshape(X2,40000,1) ]; 
    vals = svmVals( X, W, w0, Xunknown );
    vals = reshape( vals, 200, 200 );
    contour(X1, X2, vals, 'Color', 'k', 'LineWidth', 2.5);
    hold on;
end


if ~strcmp( opts, 'bw' )

    I = Y==1&Ysvm==1;
    plot( X(I,1), X(I,2), 'ro' );
    hold on
    I = Y==1&Ysvm==0;
    plot( X(I,1), X(I,2), 'rx' );
    I = Y==0&Ysvm==1;
    plot( X(I,1), X(I,2), 'bx' );
    I = Y==0&Ysvm==0;
    plot( X(I,1), X(I,2), 'bo' );
    
else
    
    I = Y==1&Ysvm==1;
    plot( X(I,1), X(I,2), 'ko', 'MarkerSize', 8, 'LineWidth', 2 );
    hold on
    I = Y==1&Ysvm==0;
    plot( X(I,1), X(I,2), 'ko', 'MarkerSize', 8, 'LineWidth', 2 );
    I = Y==0&Ysvm==1;
    plot( X(I,1), X(I,2), 'kx', 'MarkerSize', 8, 'LineWidth', 2 );
    I = Y==0&Ysvm==0;
    plot( X(I,1), X(I,2), 'kx', 'MarkerSize', 8, 'LineWidth', 2 );
    
end
    
grid on
xlim( [min(X(:,1)-1) max(X(:,1)+1)] );
ylim( [min(X(:,2)-1) max(X(:,2)+1)] );
end

function Ypred = svmVals( Xmodel, w, w0, Xunknownsamples )
    nmod = size(Xmodel,1);
    nsamp = size(Xunknownsamples,1);
    K = zeros(nsamp,nmod);
    sigma = 1;
    for i = 1:nsamp
        for j = 1:nmod
             K(i,j) = exp( - (Xmodel(j,:)-Xunknownsamples(i,:))*(Xmodel(j,:)-Xunknownsamples(i,:))'/2/sigma^2 );
        end
    end
    Ypred = zeros(nsamp,1);
    Ypred(K*w+repmat(w0,nsamp,1)>0) = 1;
end
