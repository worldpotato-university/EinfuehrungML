function subplottight(m,n,k)
% Creates a subplot without borders. This is useful in plots with shall
% be composed of seamlessly arranged patches of subplots
%                                                            Sch�ttl 2015
[c,r] = ind2sub([m n], k);
     subplot('Position', [(c-1)/m, 1-(r)/n, 1/m, 1/n])
end
