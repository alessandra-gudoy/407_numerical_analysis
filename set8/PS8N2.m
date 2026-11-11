clear;
clc;


n = 50;
A = 50 * rand(n, n);            % n x n matrix A

% find the determinant of A
detA = det(A);
my_detA = FindDeterminant(A);

relativeDiff = abs(detA - my_detA) / abs(detA);