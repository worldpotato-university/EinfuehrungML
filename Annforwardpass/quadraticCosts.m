function C = quadraticCosts( h, y )
% defines the quadratic cost function of the hypothese values h and the
% target values y,
% C(h,y) = 1/2/N \sum_{i=1}^N \sum_{j=1}^n ( h_{ij} - y_{ij} )^2
%                                                       Alfred Sch�ttl 2016

%% 
% 5. Add the quadratic cost formula
% TODO: Add a line
C = mean(sum([y-h].^2,2))
%%
end
