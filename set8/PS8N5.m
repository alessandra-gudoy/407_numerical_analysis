clear;
clc;


n = 1000;
A = 10 * rand(n,n);         % create nxn matrix
b = 10 * rand(n,1);         % create nx1 vector

% ensure "strictly diagonally dominant" (big diagonal numbers compared to row)
for i=1:n
    A(i,i) = sum(abs(A(i,1:i-1))) + sum(abs(A(i,i+1:end))) + 10 * rand(1);
end

x0 = zeros(n, 1);
tol = 10^(-2);
maxIterations = 100000;

fprintf("Timing IterativeJacobi function: \n");
tic
[myJacobiX, numIterations] = IterativeJacobi(A, b, x0, tol, maxIterations);
toc

fprintf("\nTiming LU with pivoting function: \n");
tic
myX = Pivot_GaussianElimination(A, b);
toc

fprintf("\nTiming MATLAB function: \n");
tic
x = A \ b;
toc


% relative differences
jacobi_rel_diff = abs(x - myJacobiX);
rel_diff = abs(x - myX);

% with respect to max norm
jacobiMax = max(jacobi_rel_diff) / max(abs(x));
relMax = max(rel_diff) / max(abs(x));

fprintf("\nJacobi relative difference in max norm: %f\n", jacobiMax);
fprintf("Pivoting relative difference in max norm: %f\n", relMax);