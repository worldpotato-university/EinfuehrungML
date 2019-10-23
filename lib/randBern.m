function x=randBern(p)
% realizes Bernoulli random variables (i. e. random variables with binary
% values 0, 1)
% Input
%      p: vector of probabilities of the variable of being 1
% Output
%      a realized vector of random variables (i. e. a sequence of 0 and 1)
%                                                             Sch�ttl 2013
x = single(rand(size(p))<p);
