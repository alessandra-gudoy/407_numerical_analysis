clear;
clc;

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ start 2b ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ %

% Use ForwardSub

% create an n x n matrix
n = 10;

L = tril(randi(20, n, n));  % create n x n matrix and take lower triangle
b = randi(20, n, 1);        % create n x 1 vector

x = L \ b;                  % use MATLAB to solve Lx = b
myX = ForwardSub(L, b);     % use ForwardSub() function to sole Lx = b

relative_err = (myX - x) ./ abs(x)

max_diff = max(abs(relative_err))


% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ start 2c ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ %

% p-norm
p = inf;

Lnorm = norm(L, p);
LinvNorm = norm(inv(L), p);

% kappa = || A || * || A^-1 ||
kappa = Lnorm * LinvNorm


% print table
columns = {'Index (1 <= k <= n)','x (using MATLAB)', 'x (using made function)', 'Relative error'};
labels = 1:length(x);

out = table(labels', x, myX, relative_err, 'VariableNames', columns')