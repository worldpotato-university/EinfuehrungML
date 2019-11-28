function [Y,NewCoords] = reduce( X, V )
% projects vectors X onto the subspace defined by the vectors V
%
% inputs:
% X:  vectors to be projected, one vector per row
% V:  subspace onto which the vectors X are to be projected, 
%     one vector of the subspace per column
%
% outputs:
% Y:         projections of the data, one projection per row
% NewCoords: the coordinates with respect to the vectors V, as computed by
%            the scalar products
%                                                      Alfred Sch�ttl 2015
N = size(X,1);
m = size(V,1);
dims = size(V,2);

% 3. project X on V obtaining Y. Do not forget to normalize the vectors in V!
%% TODO: 
% normalize V: divide each vector by its norm
for i=1:dims
    V(i,:) =  V(i,:)/norm(V(i,:))
end
% The new coordinates are the scalar product of the data with respect to 
% the normalized vectors.
 NewCoords = X * V
 Y = NewCoords*V'
%%
end

