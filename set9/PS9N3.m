clear;
clc;

% use SteepestDescent() and ConjugateGradient()

N = 500;

B = rand(N);            
A = B' * B + eye(N);    % NxN matrix symmetric and positive definite
b = rand(N, 1);         % Nx1 vector

maxN = 1000000;         % max number of iterations
tol = 10^(-5);          % tolerance

x0 = zeros(N, 1);       % initial value


% use Steepest Descent
fprintf("Timing Steepest Descent function: \n");
tic
[x_SD, n_SD] = SteepestDescent(A, b, x0, tol, maxN);
toc
fprintf("The number of iterations performed for Steepest Descent method is %d", n_SD);

% use Conjugate Gradient
fprintf("\n\nTiming Conjugate Gradient function: \n");
tic
[x_CG, n_CG] = ConjugateGradient(A, b, x0, tol, maxN);
toc
fprintf("The number of iterations performed for Conjugate Gradient method is %d\n", n_CG);

% MATLAB solve
x_ML = A \ b;


% find relative differences, using max norm
diff_SD = abs(x_ML - x_SD);         % Steepest Descent
norm_SD = norm(diff_SD, Inf) / norm(x_ML, Inf);
fprintf("\nRelative difference in max norm of the Steepest Descent method is %.8f", norm_SD);

diff_CG = abs(x_ML - x_CG);         % Conjugate Gradient
norm_CG = norm(diff_CG, Inf) / norm(x_ML, Inf);
fprintf("\nRelative difference in max norm of the Conjugate Gradient method is %.8f\n", norm_CG);