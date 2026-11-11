clc;
clear;

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ start 8a ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ %

n = 50;

A = 50 * rand(n, n);            % n x n matrix A
B = 50 * rand(n, n);            % n x n matrix B

my_X = MatrixSolve(A, B);
X = A \ B;

relativeDiff = abs(X - my_X);
maxErr = max(max(relativeDiff));


% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ start 8b ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ %

% use A from above

myInv = InverseMatrix(A);
Ainv = inv(A);

inv_diff = abs(Ainv - myInv);
maxErr_inv = max(max(inv_diff))
