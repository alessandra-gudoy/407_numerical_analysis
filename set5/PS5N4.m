clear;
clc;

% 4b: use Secant Method with initial guesses 3, 2.5
% 4c: use Secant Method to approximate \sqrt{2}

tol = 1e-12;

stopcriteria = [1 2 3];
columns = {'Stopping Criteria', 'Approximation of Root, xn', 'Number of Iterations, n'};

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ start 4b ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ %

f = @(x) (x^5 - (3*x^3) - 4);       % f(x) = x^5 - 3x^3 - 4

% initial guesses
bx1 = 3;
bx2 = 2.5;

% Perform for each stopping criteria
[bxn1, bn1] = SecantMethod(f, bx1, bx2, tol, 1);

[bxn2, bn2] = SecantMethod(f, bx1, bx2, tol, 2);

[bxn3, bn3] = SecantMethod(f, bx1, bx2, tol, 3);


bRoots = [bxn1 bxn2 bxn3];
bIterations = [bn1 bn2 bn3];

fprintf("\n\nProblem Set 5 #4b\n");
bRootsTable = table(stopcriteria', bRoots', bIterations', 'VariableNames', columns)


% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ start 4c ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ %

g = @(x) (x^2 - 2);         % g(x) = x^2 - 2

% initial guesses
cx1 = 1;
cx2 = 2;

% Perform for each stopping criteria
[cxn1, cn1] = SecantMethod(g, cx1, cx2, tol, 1);

[cxn2, cn2] = SecantMethod(g, cx2, cx1,  tol, 1);

[cxn3, cn3] = SecantMethod(g, cx1, cx2, tol, 3);


cRoots = [cxn1 cxn2 cxn3];
cIterations = [cn1 cn2 cn3];

fprintf("\n\nProblem Set 5 #4c\n");
cRootsTable = table(stopcriteria', cRoots', cIterations', 'VariableNames', columns)
