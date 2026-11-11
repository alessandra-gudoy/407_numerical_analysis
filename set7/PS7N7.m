clc;
clear;

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ start 7b ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ %
% Use Pivot_LU_Factorization()

n = 50;

A = 50 * rand(n, n);            % n x n matrix A
b = 50 * rand(n, 1);            % n x 1 vector b

[P, L, U] = Pivot_LU_Factorization(A);

% check if PA = LU

pa = P*A;
lu = L*U;

relative_diff_b = (pa - lu) ./ abs(pa);
maxDiff_b = max(max(abs(relative_diff_b)));

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ start 7c ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ %

% Use A, b from above

% solve using Pivot_GaussianElimination function and compare with MATLAB solution
myX = Pivot_GaussianElimination(A, b);
x = A \ b;

% find maximum relative difference
relative_diff_c = (x - myX) ./ abs(x);
maxDiff_c = max(max(abs(relative_diff_c)));

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ start 7d ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ %

% use given A and b from problem set
A_d = [ 
        20 : 2 : 36 ;
        100 : 2 : 116;
        -20 * ones(1,9);
        linspace(0.001, 0.005,9);
        21 : 2 : 37;
        23 : 2 : 39;
        24 : 2 : 40;
        linspace(-0.6, 0,9);
        linspace(-17,20,9)
    ];
    
b_d = [1380; 4980; -900; 0.165; 1425; 1515; 1560; -9; 345];

x_exact = [1 ; 2; 3; 4; 5; 6; 7; 8; 9];

% find x using Pivot_GaussianElimination function and MATLAB
myX_d = Pivot_GaussianElimination(A_d, b_d);
x_d = A_d \ b_d;

% find relative errors
my_err = abs(x_exact - myX_d);
matlab_err = abs(x_exact - x_d);

% with respect to 2-norm
x_exact_norm = norm(x_exact, 2);

my_err_norm = norm(my_err, 2) / x_exact_norm;
matlab_err_norm = norm(matlab_err, 2) / x_exact_norm;

% print
fprintf("Relative error with respect to x_exact\n");
fprintf("My relative error: %.6f\n", my_err_norm);
fprintf("MATLAB relative error: %.6f\n\n", matlab_err_norm);



% find relative difference between MATLAB and my x
matlab_relative_diff = abs(x_d - myX_d);
err_norm = norm(matlab_relative_diff) / x_exact_norm;

% print
fprintf("Relative error to MATLAB solution with respect to 2-norm");
fprintf(": %.6f\n", err_norm);
