function X = MatrixSolve(A, B)

% MatrixSolve(A, B): solve AX = B

% INPUTS:
%   A (n x n matrix)
%   B (n x n matrix)

% OUTPUT:
%   X (n x n matrix): solution to AX = B


% check if A, B are square matrices
[n, m] = size(A);
[x, y] = size(B);

if n ~= m
    error("A must be a square matrix");
end

if x ~= y
    error("B must be a square matrix");
end

% initialize X
X = zeros(n, n);

% for each column x in X and b in B, have the following Ax = b
for j=1:n
    % get column vector in b
    b = B(:, j);

    X(:, j) = Pivot_GaussianElimination(A, b);
end