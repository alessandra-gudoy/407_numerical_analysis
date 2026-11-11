function [x, n] = IterativeJacobi(A, b, x0, tol, maxIterations)

% IterativeJacobi(A, b, x0, tol, maxIterations): solve Ax = b using Jacobi

% INPUTS:
%   F (n x 1 vector)        : functions of which to find the root
%   J (n x m matrix)        : Jacobian of F
%   x0 (m x 1 vector)       : initial guess
%   tol (real number)       : tolerance at which to stop at
%   maxIterations (integer) : maximum number of iterations to perform
%                             if reached, stop

% stopping criteria used: || rk || / || bk || < tol

% OUTPUT:
%   x (n x 1 vector)        : solution vector
%   n (integer)             : number of iterations

% check if sizes match
[row, col] = size(A);
if row ~= col
    error("A must be a square matrix");
end

if row ~= length(x0)
    error("x0 does not match size of A");
end

x = x0;                     % iterations
n = 0;                      % number of iterations
r = b - A*x;                % residual
rnorm = norm(r, Inf);       % residual norm

Dinv = zeros(row, row);     % initialize Dinv

% Get D^(-1)
for i=1:row
    Dinv(i, i) = 1 / A(i, i);
end


while rnorm > tol && n < maxIterations
    n = n + 1;              % increment number of iterations

    x = x + Dinv * r;
    
    r = b - A * x;
    rnorm = norm(r, Inf);
end