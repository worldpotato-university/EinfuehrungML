function x = uvec( k, n )
% uvec returns vector of zeros with exactly one one at position k of n
% uvec(3,6) gives (0,0,1,0,0,0)
N = size(k,1);
x = zeros(N,n);
x(sub2ind(size(x), 1:N, k')) = 1;
end

