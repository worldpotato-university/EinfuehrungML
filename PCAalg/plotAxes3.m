function plotAxes3( V, mu, sig2, options )
% Plots coordinate axes from origin mu in direction of unit vectors.
% The unit vectors are defined as columns of the matrix V.
% The length of the axes is given by the square root of the sig2 values
% (which are typically variances).
%                                                 (c) Alfred Schöttl 2015
nAxes = size(V,2);
hold on
for i=1:nAxes
    v = V(:,i)*sqrt(sig2(i)) + mu';
    plot3([mu(1),v(1)], [mu(2),v(2)], [mu(3),v(3)], options, 'LineWidth', 3 );
end
end
