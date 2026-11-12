function x = ConjugateGradientNIterations(A, b, x0, numIterations)

% ConjugateGradientNIterations(A, b, x0, numIterations): solve Ax = b using 
%        Conjugate Gradient method using exactly given number of iterations

% INPUTS:
%   A (n x n matrix)        :
%   b (n x 1 vector)        :
%   x0 (m x 1 vector)       : initial guess
%   numIterations (integer) : number of iterations to do

% OUTPUT:
%   x (n x 1 vector)        : solution vector

% check for errors
% A is a square matrix and x0, b matches dimensions

[nRows, nCols] = size(A);
if nRows ~= nCols
    error("A must be a square matrix");
end

if nRows ~= length(b)
    error("b does not match size of A");
end

if nRows ~= length(x0)
    error("x0 does not match size of A");
end

% check if maximum number of iterations is positive
if numIterations <= 0
    error("Number of iterations must be positive");
end

x = x0;                         % initialize approximations

r = b - A*x;                    % residual
r_norm = norm(r, Inf);          % norm of residual

p = r;                          % direction of search

b_norm = norm(b, Inf);          % norm of b
stopcrit = Inf;                 % ensure at least 1 iteration

for i = 1:numIterations
    w = A * p;

    alpha = (r' * r) / (w' * p);

    % get next iterate and residual (direction to move)
    x = x + alpha * p;

    oldR = r;
    r = r - alpha * w;

    % check stopping criteria
    r_norm = norm(r, Inf);
    stopcrit = r_norm / b_norm;

    % get new p
    beta = (r' * r) / (oldR' * oldR);
    p = r + (beta * p);
end