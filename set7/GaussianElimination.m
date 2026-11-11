function x = GaussianElimination(A, b)

% GaussianElimination(A, b): solve Ax = b

% INPUTS:
%   A (n x n matrix)
%   b (n x 1 vector)

% OUTPUT:
%   x (n x 1 vector): solution vector

% find LU such that A = LU
% L = lower triangular matrix
% U = upper triangular matrix
[L, U] = LU_Factorization(A);

% solve for y in Ly = b
% use forward substitution
y = ForwardSub(L, b);

% solve for x in Ux = y
% use backward substitution
x = BackSub(U, y);

