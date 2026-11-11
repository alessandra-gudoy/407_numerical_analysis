clc;
clear;

% Use GaussianElimination()

n = 100;

A = 50 * rand(n, n);            % n x n matrix A
b = 50 * rand(n, 1);            % n x 1 vector b

% MATLAB solution for Ax = b
x = A \ b;

% my function solution for Ax = b
myX = GaussianElimination(A, b);

relative_diff = (x - myX) ./ abs(x);
maxDiff = max(abs(relative_diff))
