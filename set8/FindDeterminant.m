function detA = FindDeterminant(A)

% FindDeterminant(A): find the inverse of A

% INPUTS:
%   A (n x n matrix)

% OUTPUT:
%   Ainv (n x n matrix): inverse of A


% check if A is square matrix
[n, m] = size(A);
if n ~= m
    error("A must be a square matrix");
end


% get P, L, U, s
[P, L, U, s] = Pivot_LU_Factorization(A);

% determinant of L, U is product of diagonal entries
detL = 1;
detU = 1;
for i = 1:n
    detL = detL * L(i, i);
    detU = detU * U(i, i);
end

% det(A) = det(L) * det(U) * (-1)^s
% s = # of row swaps in the LU factorization
detA = detL * detU * ((-1)^s);