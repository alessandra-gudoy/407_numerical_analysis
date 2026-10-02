clear;
clc;

% 5a numerical convergence on Newton's Method
% 5b numerical convergence on Secant Method

% function and its derivative
f = @(x) (x^5 - (3*x^3) - 4);       % f(x) = x^5 - 3x^3 - 4
df = @(x) ((5*x^4) - (9 * x^2));    % f'(x) = 5x^4 - 9x^2

% tolerance to use
tol = 10 ^ (-12);

% initial guess(es)
x0 = 3;
x1 = 2.5;

% true value of root x*
x = fzero(f, x0);

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ start 5a ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ %


% perform Newton's method using stopping criteria 1
[X_a, n_a] = ConvNewtonMethod(x0, f, df, tol, 1);

% values of e_{n+1}: |x(n+1) - x*|
e_n = abs(X_a(1:length(X_a) - 1) - x);

% values of e_n: |xn - x*|
e_n1 = abs(X_a(2:length(X_a)) - x);

% plot loglog plot
figure;
loglogplot = loglog(e_n, e_n1, 'o-', 'LineWidth', 2);
title("Newton's Method Speed of Convergence");
xlabel('log(e^n)');
ylabel('log(e^{n+1})');
hold on;

% get values from loglogplot
xA = loglogplot.XData;
yA = loglogplot.YData;

% use polyfit to get m, b with p=[m, b]
pa = polyfit(xA, yA, 1);

fprintf("\n\nProblem Set 5 #5a\n");
fprintf("polyfit() output p = [m = %d, b = %d]\n", pa(1), pa(2));


% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ start 5b ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ %

[X_b, n_b] = ConvSecantMethod(f, x0, x1, tol, 1);

% values of e_{n+1}: |x(n+1) - x*|
e_nb = abs(X_b(1:length(X_b) - 1) - x);

% values of e_n: |xn - x*|
e_n1b = abs(X_b(2:length(X_b)) - x);


% plot loglog plot
figure;
loglogplot = loglog(e_nb, e_n1b, 'o-', 'LineWidth', 2);
title("Secant Method Speed of Convergence");
xlabel('log(e^n)');
ylabel('log(e^{n+1})');
hold on;

% get values from loglogplot
xB = loglogplot.XData;
yB = loglogplot.YData;

% use polyfit to get m, b with p=[m, b]
pB = polyfit(xB, yB, 1);

fprintf("\n\nProblem Set 5 #5b\n");
fprintf("y-values for Newton's Method: ");

a = flip(yA)

fprintf("\ny-values for Secant Method: ");
b = flip(yB)

% fprintf("polyfit() output p = [m = %d, b = %d]\n", pB(1), pB(2));