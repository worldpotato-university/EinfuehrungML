% plot the raw data
figure(1)
clf
plot3( X(:,1), X(:,2), X(:,3), '.' );
grid on
axis equal

% 2. get the statistical values and center the data then to the pca and
% plot the results
% TODO: comment in the following lines, also modifiy file pca.m
%%
[ mu, Cov, Xc ] = statistics( X );
[ V, sig2 ] = pca( Xc );
plotAxes3( V, mu, sig2, 'r' );
%%

% 3. reduce the samples using 2 principal components
% TODO: comment in the following lines, also modify file reduce.m
%%
[Y,NewCoords] = reduce( X, V(:,1:2) );

% plot the reduced data in the original space
figure(2)
clf
plot3( Y(:,1), Y(:,2), Y(:,3), '.' );
grid on
axis equal

% plot the reduced data in the subspace defined by the principal axes
figure(3)
clf
plot( NewCoords(:,1), NewCoords(:,2), '.' );
grid on
axis equal

%%