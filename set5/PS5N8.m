clear;
clc;

% function and derivative
f = @(x) (x^5 - (3*x^3) - 4);       % f(x) = x^5 - 3x^3 - 4
df = @(x) ((5*x^4) - (9 * x^2));    % f'(x) = 5x^4 - 9x^2

% tolerance
tol = 10 ^ (-12);

% initial guess
x0 = -1;

% interval [a, b]
a = -10;
b = 10;
h = 1;                              % how much to widen interval at endpoints

x = fzero(f, x0);                   % built-in MATLAB function to calculate root


[xn, n] = NewtonBisection(x0, f, df, tol, 1, h)