% Assignment Houses
%                                                        (c) Schoettl, 2016
load('Houses2.mat')

% 1. How many house sales were recorded?
% The whos command helps
% Solution:
disp('Number of sales recorded')
disp(length(X))

%%
% 2. Understand the contents of the matrix X.
% Below, you see some expressions of X and y. Interpret and change them as
% you like. Please keep in mind that the samples in X are organized in ROWS!
X(1:5,:) % Complete sample from first to fifth
y(1:5)' % First 5 responses in a row vector

%%
% 3. Plot the data. "plot" is used to plot in 2d, "plot3" plots in
%    3D. You have to specify the coordinates x,y,z in separate arguments.
%    The option '.' stands for plotting the data points only (and not to
%    connect the points by lines).
figure(1)
plot3(X(:,1),X(:,2),y,'.');
grid on
hold on

%% 
% 4. Perform a linear regression (no constant term, quadratic cost function).
%
%% TODO: add the missing line to calculate the parameters
w = inv(X' * X) * X' * y
%%

%%
% 5. Estimate the price of a house with 150 m² living area and 500 m² plot area.
% 
%% TODO: add the missing line
X_test = [150, 500, 0; ...
                150, 500, 1]
y_est = X_test * w


plot3(X_test(:,1), X_test(:,2), y_est(:), '*r')
xlabel('living area')
ylabel('plot area')
zlabel('price')

%%


