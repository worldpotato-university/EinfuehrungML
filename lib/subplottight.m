function subplottight(m,n,k)
% Creates a subplot without borders. This is useful in plots with shall
% be composed of seamlessly arranged patches of subplots
%                                                            Schöttl 2015
[c,r] = ind2sub([m n], k);
     subplot('Position', [(c-1)/m, 1-(r)/n, 1/m, 1/n])
end
