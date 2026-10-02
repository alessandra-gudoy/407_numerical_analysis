clear;
clc;

% function
f = @(x) (x^5 - (3*x^3) - 4);       % f(x) = x^5 - 3x^3 - 4

% initial guess
x0 = 3;

% tolerance to use
tol = 10 ^ (-5);

% true value of root x*
x = fzero(f, x0);

% interval [a, b]
a = 1.5;
b = 3;


% bisection method with stop criteria 1
[Xn, n] = ConvBisection(f, a, b, tol, 1);

% values of e_n: |x(n+1) - x*|
e_n = abs(flip(Xn(1:length(Xn) - 1)) - x);

% values of e_{n+1}: |xn - x*|
e_n1 = abs(flip(Xn(2:length(Xn))) - x);


% find ratios
ratio_rho = e_n ./ e_n1;


fprintf("\n\nProblem Set 5 #6b\n\n");

fprintf("Approximations: \n");

fprintf("x_n = \n");
fprintf("\t");
fprintf("%.5f  ", Xn(1:10));
fprintf("\n\t");
fprintf("%.5f  ", Xn(11:n-1));

fprintf("\n\nRatios e(n+1)/e(n): \n");
fprintf("ratio_rho = \n");
fprintf("\t");
fprintf("%.5f  ", ratio_rho(1:10));
fprintf("\n\t");
fprintf("%.5f  ", ratio_rho(11:n-1));

fprintf("\n\n");