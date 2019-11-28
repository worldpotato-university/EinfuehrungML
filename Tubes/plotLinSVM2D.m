function plotLinSVM2D( X, Y, W, w0 )
% plotLinSVM2D plots the results of a linear SVM with 2D-features
% inputs:
%     X : the data matrix, one sample per row
%     Y : the data labels, one label per row
%     W : the weight matrix as result of SVM training (optional)
%     w0: the bias as result of SVM training (optional)
%                                                   (c) Alfred Schöttl 2015

if nargin <= 2
    Ysvm = Y;
else
    Ysvm = zeros(size(X,1),1);
    Ysvm(X*W+w0>0) = 1;
    if abs(W(2)) < abs(W(1))
        dbx = [ min(X(:,1)), max(X(:,1)) ];
        dby = - (W(1)*dbx + w0)/W(2);
    else
        dby = [ min(X(:,2)), max(X(:,2)) ];
        dbx = - (W(2)*dby + w0)/W(1);
    end
    plot(dbx, dby, 'k-.', 'LineWidth', 2.5); 
    hold on;
end

I = Y==1&Ysvm==1;
plot( X(I,1), X(I,2), 'ro' );
hold on
I = Y==1&Ysvm==0;
plot( X(I,1), X(I,2), 'rx' );
I = Y==0&Ysvm==1;
plot( X(I,1), X(I,2), 'bx' );
I = Y==0&Ysvm==0;
plot( X(I,1), X(I,2), 'bo' );
grid on
xlim( [min(X(:,1)) max(X(:,1))] );
ylim( [min(X(:,2)) max(X(:,2))] );

end

