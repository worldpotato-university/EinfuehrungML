function plotLogReg2D( x, y, theta )
ymin = min(y);
ymax = max(y);
x1min = min(x(:,1));
x1max = max(x(:,1));
x2min = min(x(:,2));
x2max = max(x(:,2));
eps = 1e-8;
if ymax - ymin + 1 > 6
    error('only a maximum of 6 classes allowed');
end
if length(theta)==2
    h0 = 0;
    h1 = theta(1);
    h2 = theta(2);
elseif length(theta==3)
    h0 = theta(1);
    h1 = theta(2);
    h2 = theta(3);
else
    error('theta must be a 2 or 3 dimensional vector');
end    

if abs(h1) < eps && abs(h2) < eps
    error('the parameter vector must be non-zero');
end


clf;
cols = 'bgrkcy';
for i=1:size(x,1)
    plot(x(i,1), x(i,2), [ '.', cols(y(i)-ymin+1) ], 'MarkerSize', 30 );
hold on
end

if abs(h2) < eps
    plot( [h0/h1, h0/h1], [x2min x2max], 'k', 'LineWidth', 2 );
else
    plot( [x1min x1max], [(h0-h1*x1min)/h2,(h0-h1*x1max)/h2], 'k', 'LineWidth', 2 );
end
grid on
x1span = x1max-x1min;
x2span = x2max-x2min;
xlim([x1min-0.1*x1span,x1max+0.1*x1span]);
ylim([x2min-0.1*x2span,x2max+0.1*x2span]);
end

