clear;
clc;

% 2b: check Newton Method for f(x) = x^5 - 3x^3 - 4
% 2c: approximate \sqrt(2)


% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ start 2b ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ %

% set up problem
x0 = 3;

f = @(x) (x^5 - (3*x^3) - 4);       % f(x) = x^5 - 3x^3 - 4
df = @(x) ((5*x^4) - (9 * x^2));    % f'(x) = 5x^4 - 9x^2

tol = 10 ^ (-12);

% perform Newton's method for each stopping criteria

[x1, n1] = NewtonMethod(x0, f, df, tol, 1);

[x2, n2] = NewtonMethod(x0, f, df, tol, 2);

[x3, n3] = NewtonMethod(x0, f, df, tol, 3);


% create table
fRoots = [x1 x2 x3];
dispF = num2str(fRoots', '%.8f');       % display with 8 decimal places

fIterations = [n1 n2 n3];
stopcriteria = [1 2 3];

columns = {'Stopping Criteria', 'Approximation of Root, xn', 'Number of Iterations, n'};

fprintf("\n\nProblem Set 5 #2b\n\n");
fRootsTable = table(stopcriteria', dispF, fIterations', 'VariableNames', columns)

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ end 2b ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ %


% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ start 2c ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ %

y0 = 1.5;

g = @(x) (x^2 - 2);         % g(x) = x^2 - 2
dg = @(x) (2*x);             % g'(x) = 2x

% tolerance same as before tol = 10^{-12}

% perform for each stopping criteria

[y1, m1] = NewtonMethod(y0, g, dg, tol, 1);

[y2, m2] = NewtonMethod(y0, g, dg, tol, 2);

[y3, m3] = NewtonMethod(y0, g, dg, tol, 3);


% create table

gRoots = [y1 y2 y3];
dispG = num2str(gRoots', '%.8f');       % display with 8 decimal places

gIterations = [m1 m2 m3];

fprintf("\n\nProblem Set 5 #2c\n\n");
gRootsTable = table(stopcriteria', dispG, gIterations', 'VariableNames', columns)

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ end 2c ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ %