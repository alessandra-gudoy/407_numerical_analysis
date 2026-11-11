function [P, L, U, s] = Pivot_LU_Factorization(A)

% Pivot_LU_Factorization(A): find L, U such that LU = A with partial
%                            pivoting

% INPUTS:
%   A (n x n matrix)

% OUTPUT:
%   P (n x n matrix): permutation matrix
%   L (n x n matrix): lower triangular matrix
%   U (n x n matrix): upper triangular matrix
%   s (real number) : number of row swaps


% check if A is square matrix
[n, m] = size(A);
if n ~= m
    error("A must be a square matrix");
end

% initialize P, L, and U
P = eye(n, n);      % eye(n, n): creates identity matrix I_n
L = eye(n, n);
U = A;
s = 0;


% go over columns by columns
for j=1:n-1

    % find max value in column and get its "index"
    [value, index] = max(U(j:n, j));

    % get real index row in matrix U
    index = index + j - 1;

    % check if need to swap rows
    if index ~= j
        s = s + 1;
    end

    % swap rows in U
    tmp = U(index, :);          % copy of row with pivot
    U(index, :) = U(j, :);      % overwrite pivot row with current row 
    U(j, :) = tmp;              % overwrite current row with pivot row

    % swap rows in P
    tmp = P(index, :);          % copy of row with pivot
    P(index, :) = P(j, :);      % overwrite pivot row with current row 
    P(j, :) = tmp;              % overwrite current row with pivot row

    % swap rows in L (only for columns done; up to column j-1)
    %                (no need column j since it is 1)
    % no need to swap at j=1
    if j ~= 1
        tmp = L(index, 1:j-1);
        L(index, 1:j-1) = L(j, 1:j-1);
        L(j, 1:j-1) = tmp;
    end

    % perform LU factorization as usual
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

