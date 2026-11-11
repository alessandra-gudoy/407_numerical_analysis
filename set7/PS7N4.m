clc;
clear;

% Use LU_Factorization

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ start 4b ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ %
% LU factorization on A from #3

A = [1 0 0 1 ; -1 2 0 1 ; -1 -1 1 1 ; -1 3 -1 1];

fprintf("\n\nProblem Set 7 #4b\n");
[L1, U1] = LU_Factorization(A)


% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ start 4c ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ %
% LU factorization on 1000 x 1000 matrix

n = 1000;               % length of B
B = 20 * rand(n, n);    % B is n x n matrix

[L2, U2] = LU_Factorization(B);

diff = B - (L2*U2);

fprintf("\n\nProblem Set 7 #4c\n");
max_diff = max(max(abs(diff)))


% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ start 4d ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ %
fprintf("\n\nProblem Set 7 #4d\n");

n1 = 1000;
n2 = 2000;

% create matrices
C1 = 20 * rand(n1, n1);      % 1000 X 1000 matrix
C2 = 20 * rand(n2, n2);      % 2000 X 2000 matrix


fprintf("Run time for 1000 x 1000 matrix\n");
tic
[CL1, CU1] = LU_Factorization(C1);
toc


fprintf("\nRun time for 2000 x 2000 matrix\n");
tic
[CL2, CU2] = LU_Factorization(C2);
toc