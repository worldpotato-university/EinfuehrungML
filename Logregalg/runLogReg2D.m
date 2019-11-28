% Defines some artificial data (2D features) and performs a logistic
% regression.

x = [1 0; 0 1; 0.5 0.1; 2 1.0; 1.2 0.8; 0.3 0.7]
y = [1; 0; 0; 1; 1; 0]
w0 = [0.1 -0.3]
alpha = 0.5

w = [ 1 -3 ];
%% 1 TODO;
% comment in the next line
w = gradientDescent( w0, alpha, x, y, 100 );
%%

w
figure(1)
plotLogReg2D(x,y,w);