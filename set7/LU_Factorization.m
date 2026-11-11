function [L, U] = LU_Factorization(A)

% LU_Factorization(A): find L, U such that LU = A

% INPUTS:
%   A (n x n matrix)

% OUTPUT:
%   L (n x n matrix): lower triangular matrix
%   U (n x n matrix): upper triangular matrix


% check if A is square matrix
[n, m] = size(A);
if n ~= m
    error("A must be a square matrix");
end

% initialize L and U
L = eye(n, n);      % eye(n, n): creates identity matrix I_n
U = A;

% go over columns by columns
for j=1:n-1

    % in each column, find values for L, U for each row
    for i=j+1:n
        % get multiplying factor
        L(i,j) = U(i,j) / U(j,j);

        % find new row values
        U(i, j) = 0;

        for k = j+1 : n
            U(i, k) = U(i, k) - L(i, j) * U(j, k);
        end

    end

end

