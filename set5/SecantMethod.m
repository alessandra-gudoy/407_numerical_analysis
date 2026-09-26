function [xn, n] = SecantMethod(f, x1, x2, tol, stopcriteria)

% SecantMethod(f, x1, x2, tol, stopcriteria): use the Secant Method to 
%                                   approximate the root of function f

% INPUTS:
%   f   (function)          : function to approximate root of
%   x1  (real number)       : initial guess 1
%   x2  (real number)       : initial guess 2
%   tol (real number)       : tolerance at which to stop at
%   stopcriteria (integer)  : which criteria to check
%                               1 = |xn - x(n-1)| < tol
%                               2 = |xn - x(n-1)| / |xn| < tol
%                               3 = |f(xn)| < tol

% OUTPUT:
%   xn  : approximate root of f
%   n   : number of iterations


% check if x1 and x2 different
if x1 == x2
    error("initial guesses x1 and x2 must not be the same");
end

% check if stopcriteria valid
if stopcriteria < 1 || stopcriteria > 3
    error("invalid stopping criteria");
end


% formula for secant method  x(k+1) = xk - [ ( f(xk) * (xk - x(k-1))) / (f(xk) - f(x(k-1)) ];

% initialize starting values
xn = x1;            % xn
xn_prev = x2;       %x(n-1)

n = 0;              % initialize counter for iterations

% initialize approximation error for stopping criteria
err = Inf;


% perform secant method until within tolerance
while err > tol
    n = n + 1;      % increment n

    newXn = xn - ( (f(xn) * (xn - xn_prev)) / (f(xn) - f(xn_prev)) );   % calculate latest approximation

    % calculate err based on stopcriteria option
    if stopcriteria == 1
        err = abs(newXn - xn);                  % err = |xn - x(n-1)|
    elseif stopcriteria == 2
        err = abs(newXn - xn) / abs(newXn);     % err = |xn - x(n-1)| / |xn|
    elseif stopcriteria == 3
        err = abs(f(newXn));                    % err = |f(xn)|
    end

    % store new guess
    xn_prev = xn;
    xn = newXn;

end