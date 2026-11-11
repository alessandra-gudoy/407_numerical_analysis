function Ainv = InverseMatrix(A)

% InverseMatrix(A): find the inverse of A

% INPUTS:
%   A (n x n matrix)

% OUTPUT:
%   Ainv (n x n matrix): inverse of A


% check if A is square matrix
[n, m] = size(A);

if n ~= m
    error("A must be a square matrix");
end


I = eye(n, n);      % identity matrix
Ainv = MatrixSolve(A, I);

