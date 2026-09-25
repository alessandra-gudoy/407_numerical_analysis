clc;
clear;

% function f(x) = sqrt(x) - 1.1
f = @(x) (sqrt(x) - 1.1);

% interval bounds [a, b] = [0, 2]
a = 0;
b = 2;

% approximate root of f(x) using all stopping criteria

% criteria 1
[x1, n1] = BisectionMethod(f, a, b, 10^(-10), 1);

% criteria 2
[x2, n2] = BisectionMethod(f, a, b, 10^(-10), 2);

% criteria 3
[x3, n3] = BisectionMethod(f, a, b, 10^(-10), 3);

% criteria 4
[x4, n4] = BisectionMethod(f, a, b, 10^(-10), 4);

% create table of approximated roots and number of iterations
roots = [x1 x2 x3 x4];
dispRoots = num2str(roots', '%.8f');

iterations = [n1 n2 n3 n4];

labels = [1 2 3 4];
columns = {'Stopping Criteria', 'Approximated Root, x_n', 'Number of iterations, n'};


fprintf("\n\nProblem Set 4 #4a, c\n\n");
roots = table(labels', dispRoots, iterations', 'VariableNames', columns)
