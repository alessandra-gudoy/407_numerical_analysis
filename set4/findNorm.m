function [pnorm, maxnorm] = findNorm(v, p, findMaxNorm)

% findNorm(v, p): calculates the p-norm of a given  v

% INPUTS:
%   v (nx1 vector)          : the vector to find the p-norm of
%   p (nonnegative integer) : p-norm (p >= 0)
%   findMaxNorm (integer)   : if 1, find the max-norm
%                             else (any other number), max-norm = NaN

% OUTPUT:
%   pnorm: p-norm of the vector v
%   maxnorm: max-norm of the vector v

% check for errors (p must be nonnegative)
if p < 0
    error("p must be nonnegative");
end

pnorm = 0;                      % initialize pnorm
maxnorm = 0;                    % initialize maxnorm

% loop through vector to find summation
for k = 1:length(v)
    pnorm = pnorm + abs(v(k))^p;
end

% find (1/p)'th root of norm
pnorm = pnorm ^ (1/p);

% find maxnorm if desired
if findMaxNorm == 1
    maxnorm = max(abs(v));
else
    maxnorm = NaN;
end