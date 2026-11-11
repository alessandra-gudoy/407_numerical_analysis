function x = Pivot_GaussianElimination(A, b)

% Pivot_GaussianElimination(A, b): solve Ax = b with LU factorization using
%                                  partial pivoting

% INPUTS:
%   A (n x n matrix)
%   b (n x 1 vector)

% OUTPUT:
%   x (n x 1 vector): solution vector

% find P, L, U such that PA = LU
% P = permutation matrix
% L = lower triangular matrix
% U = upper triangular matrix
[P, L, U, s] = Pivot_LU_Factorization(A);


% solve for y in Ly = Pb
% use forward substitution
y = ForwardSub(L, P*b);

% solve for x in Ux = y
% use backward substitution
x = BackSub(U, y);
