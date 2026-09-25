clear;
clc;

e = exp(1);

% function f(x) = (e^x - 3x)^5
f = @(x) ((e^x - 3*x)^5);

% find roots
[x1_1, n1_1] = BisectionMethod(f, 0, 1, 1e-10, 1);
[x1_2, n1_2] = BisectionMethod(f, 0, 1, 1e-10, 2);
[x1_3, n1_3] = BisectionMethod(f, 0, 1, 1e-10, 3);
[x1_4, n1_4] = BisectionMethod(f, 0, 1, 1e-10, 4);

[x2_1, n2_1] = BisectionMethod(f, 1, 2, 1e-10, 1);
[x2_2, n2_2] = BisectionMethod(f, 1, 2, 1e-10, 2);
[x2_3, n2_3] = BisectionMethod(f, 1, 2, 1e-10, 3);
[x2_4, n2_4] = BisectionMethod(f, 1, 2, 1e-10, 4);


% create tables of approximated roots and number of iterations
roots1 = [x1_1 x1_2 x1_3 x1_4];
roots2 = [x2_1 x2_2 x2_3 x2_4];
dispRoots1 = num2str(roots1', '%.8f');
dispRoots2 = num2str(roots2', '%.8f');

iterations1 = [n1_1 n1_2 n1_3 n1_4];
iterations2 = [n2_1 n2_2 n2_3 n2_4];

labels = [1 2 3 4];
columns = {'Stopping Criteria', 'Approximated Root, x_n', 'Number of iterations, n'};

fprintf("\n\nProblem Set 4 #5b\n\n");
root1 = table(labels', dispRoots1, iterations1', 'VariableNames', columns)
root2 = table(labels', dispRoots2, iterations2', 'VariableNames', columns)