% Assignment Energy
%                                                        (c) Schoettl, 2016


%%
% 1. How many test drives have been performed?
% The whos command helps
% --> 100

%%
% 2. Plot the data. 
%    "plot" is used to plot in 2d. You have to specify the coordinates 
%    x,y in separate arguments. The option '.' stands for plotting the 
%    data points only (and not to connect the points by lines).
figure(1)
subplot(2,1,1);
plot(X,y,'.');
grid on

%%
% 3. Perform a linear regression (no constant term, quadratic cost function).
%%
% TODO: remove the comment and complete the line
w = inv(X' * X) * X' * y
%%

%%
% 4. Estimate the energy consumption of a 20 min drive.
% To print out the value of a formula, write down the formula without a
% semicolon (;)
%%
% TODO: add a line
energy_20_min = 20 * w;
%%


%%
% 5. Add the regression line to the plot.
dur = 0:0.5:100;
DUR = dur'
%%
% TODO: remove the comment and complete the following line.
engy = DUR * w;
%%
hold on

plot( dur, engy, 'r' );

%%
% 6. Compare the result with the regression line obtained by a MAP estimator.
% You will need a really big parameter lambda to see a difference.
%%
% TODO: remove the comments and complete the following 3 lines
lambda = 10000000; 
wmap = inv(X' * X + lambda*eye(size(X' * X))) * X' * y;
engymap = DUR * wmap;
%%
plot( dur, engymap, 'g' );

subplot(2,1,2);
plot( dur, engymap-engy, 'g' );




