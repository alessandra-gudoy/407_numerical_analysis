function [x, n] = NewtonsSolve(F, J, x0, tol, stopcriteria)

% NewtonsSolve(F, J, x0, tol): solve a system of linear equations using
%                              Newton's Method 

% INPUTS:
%   F (n x 1 vector)        : functions of which to find the root
%   J (n x m matrix)        : Jacobian of F
%   x0 (m x 1 vector)       : initial guess
%   tol (real number)       : tolerance at which to stop at
%   stopcriteria (integer)  : which criteria to check
%                               1 = ||xn - x(n-1)|| < tol
%                               2 = ||xn - x(n-1)|| / |xn| < tol
%                               3 = ||f(xn)|| < tol
%                               use max-norms

% Note: to find max-norm, use norm(--, Inf);
% Note: delX = xn - x(n-1)

% OUTPUT:
%   x (n x 1 vector)        : solution vector
%   n (integer)             : number of iterations


% initialize starting values
x = x0;
n = 0;
err = inf;

while err > tol
    % increment number of iterations
    n = n + 1;

    % evaluate f(xn)
    fxn = F(x);

    % evaluate J(xn)
    Jxn = J(x);

    % solve J(xn) * delX = f(xn)
    % use partial pivot
    delX = Pivot_GaussianElimination(Jxn, -fxn);

    newXn = x + delX;

    % check stopping criteria
    if stopcriteria == 1
        err = norm(delX, Inf);
    elseif stopcriteria == 2
        err = norm(delX, Inf) / norm(newXn, Inf);
    elseif stopcriteria == 3
        err = norm(F(newXn), Inf);
    end

    % update guess
    x = newXn;
end