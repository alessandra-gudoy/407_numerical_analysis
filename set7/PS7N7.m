clc;
clear;

% Use Pivot_LU_Factorization()

n = 50;

A = 50 * rand(n, n);            % n x n matrix A
b = 50 * rand(n, 1);            % n x 1 vector b

[P, L, U] = Pivot_LU_Factorization(A);

% check if PA = LU

pa = P*A;
lu = L*U;

relative_diff = (pa - lu) ./ abs(pa);
maxDiff = max(max(abs(relative_diff)))