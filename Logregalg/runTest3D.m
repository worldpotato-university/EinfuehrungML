% Defines some artificial data (3D features) and performs a logistic
% regression.

x = [1 0 0.5;0 1 0.5]
y = [1; 0]
w0 = [0.1 -0.3 1]
alpha = 0.5

gradientDescent( w0, alpha, x, y, 100 )


figure(1)
plotLogReg2D(x,y,w);