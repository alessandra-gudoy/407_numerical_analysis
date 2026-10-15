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

relative_err = abs(myX - x) ./ abs(x);


% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ start 2c ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ %

% p-norm
p = inf;

Lnorm = norm(L, p);
LinvNorm = norm(inv(L), p);

kappa = Lnorm * LinvNorm

loseDigits = log10(kappa)