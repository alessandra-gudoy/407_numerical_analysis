function [tanInv_x] = Arctan(x, N)

% Arctan(x, N) : evaluate arctan(x) using N+1 terms of Taylor series
%                centered about x = 0

% INPUTS:
%   x (real number)         : x at which to evaluate
%   N (nonnegative integer) : degree of Taylor series polynomial

% OUTPUT:
%   tanInv_x (real number)  : approximation from Taylor series

% check convergence
if x ~= 1 && abs(x) >= 1
    fprintf("Approximation not useful for values of x outside");
    fprintf(" of interval (-1, 1]\n");
end

tanInv_x = 0;       % initialize result

for i = 0:N
    currentTerm = ( (-1)^i * (x^(2*i + 1)) ) / (2*i + 1);
    tanInv_x = tanInv_x + currentTerm;
end