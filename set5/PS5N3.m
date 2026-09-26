clear;
clc;


% set up problem
x0 = -1;

f = @(x) (x^5 - (3*x^3) - 4);       % f(x) = x^5 - 3x^3 - 4
df = @(x) ((5*x^4) - (9 * x^2));    % f'(x) = 5x^4 - 9x^2

tol = 10 ^ (-12);

x = fzero(f, x0);                   % built-in MATLAB function to calculate root

% perform Newton's method for each stopping criteria

[x1, n1, e1] = AlteredNewton(x0, f, df, tol, 1, 20);

[x2, n2, e2] = AlteredNewton(x0, f, df, tol, 2, 20);

[x3, n3, e3] = AlteredNewton(x0, f, df, tol, 3, 20);


% create table
roots = [x1 x2 x3];
disp = num2str(roots', '%.8f');       % display with 8 decimal places

iterations = [n1 n2 n3];
stopcriteria = [1 2 3];

errors = [e1 e2 e3];    % approximate errors between xn and x(n-1)

% calculate absolute error from x
absolute_err = zeros(1, length(roots));
relative_err = zeros(1, length(roots));

for i=1:length(roots)
    absolute_err(i) = abs(roots(i) - x);
    relative_err(i) = absolute_err(i) / abs(x);
end

columns = {'Stopping Criteria', 'Approximation of Root, xn', 'Number of Iterations, n', 'Error Approximation', 'Absolute Error', 'Relative Error'};

fprintf("\n\nProblem Set 5 #2b\n\n");
fprintf("According to MATLAB, f(x) = 0 when x = %d.\n\n", x);
fRootsTable = table(stopcriteria', disp, iterations', errors', absolute_err', relative_err', 'VariableNames', columns)
