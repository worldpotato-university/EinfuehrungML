function showWeights( W, n, m )
nWeights = size(W,2);
nTargets = size(W,1);
for i=1:nWeights
    subplottight( n, m, i );
    dispWeight( W(:,i), '' );
end
end

