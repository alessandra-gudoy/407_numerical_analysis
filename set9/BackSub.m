function x = BackSub(U, b)

% BackSub(U, b): use backward substitution to solve linear system Ux = b

% INPUTS:
%   U (n x n matrix): upper triangular matrix (no zeroes on diagonal)
%   b (n x 1 vector): right hand side vector

% OUTPUT:
%   x (n x 1 vector): solution vector


% check for errors:
%   1. Check if U is an upper triangular matrix
%   2. Check if length of b matches U

if istriu(U) ~= 1
    error("U must be an upper triangular matrix");
end

if length(b) ~= size(U, 1)
    error("Dimensions of L and b do not match");
end

% initialize x
x = zeros(length(b), 1);

% length n
n = length(b);

% get x_n
x(n) = b(n) / U(n, n);

% loop to get remaining x_i (working upwards/backwards)
% for i = start : step : end
for i = n-1 : -1 : 1

    % get sum_{j=i+1}^{n}(U_{i,j} * x_i)
    subSum = 0;

    for j = i+1 : n
        subSum = subSum + (U(i, j) * x(j));
    end

    x(i) = (b(i) - subSum) / U(i, i);
end