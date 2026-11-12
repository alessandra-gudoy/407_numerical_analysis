clear;
clc;

% use Jacobi and Gauss-Seidel functions

N = 1000;               % size of A

A = rand(N, N);         % N x N matrix
b = 20 * rand(N, 1);

x0 = zeros(N, 1);       % initial guess
tol = 10^(-5);          % tolerance

% ensure "strictly diagonally dominant" (big diagonal numbers compared to row)
for i=1:N
    A(i,i) = sum(abs(A(i,1:i-1))) + sum(abs(A(i,i+1:end))) + 10 * rand(1);
end


% use Gauss-Seidel
maxN = 1000000;         % max number of iterations
fprintf("Timing Gauss-Seidel function: \n");
tic
[x_GS, n_GS] = GaussSeidel(A, b, x0, tol, maxN);
toc
fprintf("The number of iterations for Gauss-Seidel method is %d.\n", n_GS);

% use Jacobi
fprintf("\nTiming Jacobi function: \n");
tic
[x_Jacobi, n_Jacobi] = IterativeJacobi(A, b, x0, tol, maxN);
toc
fprintf("The number of iterations for Jacobi method is %d.\n", n_Jacobi);


% use MATLAB
fprintf("\nTiming MATLAB solve: \n");
tic
x_ML = A \ b;
toc

% use Gauss Elimination
fprintf("\nTiming Gauss Elimination (with pivoting) function: \n");
tic
directX = Pivot_GaussianElimination(A, b);
toc


% find relative differences
diff_GS = abs(x_ML - x_GS);         % Gauss-Seidel
norm_GS = norm(diff_GS, Inf) / norm(x_ML, Inf);
fprintf("\nRelative difference in max norm of the Gauss-Seidel method is %.8f", norm_GS);

diff_Jacobi = abs(x_ML - x_Jacobi); % Jacobi
norm_Jacobi = norm(diff_Jacobi, Inf) / norm(x_ML, Inf);
fprintf("\nRelative difference in max norm of the Jacobi method is %.8f", norm_Jacobi);

diff_direct = abs(x_ML - directX); % Jacobi
norm_direct = norm(diff_direct, Inf) / norm(x_ML, Inf);
fprintf("\nRelative difference in max norm of the direct method is %.8f\n", norm_direct);
