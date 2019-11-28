function [c,cntr] = kmeans( x, k, centroids0, maxloops, verbose )
% kmeans algorithm, clusters the data into k clusters
% inputs:
% x:           data, one sample per row
% k:           number of clusters
% cendtroids0: initial cluster centroids (or means) (one cluster per row)
% outputs:
% c:           row vector with assigned cluster numbers
% cntr:        the centroids, one per row
%                                                          Schöttl 2013
if nargin <= 3
    maxloops = 100;
end
if nargin <= 4
    verbose = round(maxloops/30);
end
N = size(x,1);
M = size(x,2);
c = zeros(1,N);
D = zeros(1,k);
centroids = centroids0;
for count=0:maxloops-1
    isemptycluster = ones(1,k);
    % obtain the distance to the centroids, should be vectorized for performance
    for i=1:N
        for j=1:k
            D(j) = dist( x(i,:), centroids(j,:) );
        end
        % calculate the nearest clusters (centroids)
        [~,c(i)] = min( D );
        isemptycluster(c(i)) = 0;
    end
    % update the centroids
    centroidsold = centroids;
    for j=1:k
        if ~isemptycluster(j)
            centroids(j,:) = mean(x(c==j,:),1);
        else
            centroids(j,:) = randn(1,M);
        end
    end
    % check for convergence
    if norm(centroids - centroidsold) == 0
        break;
    end
    
    if verbose > 0 && mod(count,verbose) == 0
        fprintf( 1, 'step %i\n', count );
    end
end
cntr = centroids;
end

% the used distance function
function d = dist(x,y)
d = sqrt((x-y)*(x-y)');
end

