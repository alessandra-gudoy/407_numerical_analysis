clear;
clc;

% ConjugateGradient n = 500 using stopping criteria vs exactly 500
% iterations

n = 500;

tol = 10^(-9);              % tolerance
maxN = 1000000;             % maximum number of iterations

B = rand(n);
A = B'*B + eye(n);          % symmetric and positive definite

b = rand(n, 1);
x0 = zeros(n, 1);           % initial value


x_ML = A \ b;               % MATLAB solution

% use stop criteria
[x_stop, numIt] = ConjugateGradient(A, b, x0, tol, maxN);

% do exactly 500 iterations
x_iterations = ConjugateGradientNIterations(A, b, x0, n);


% relative difference when n=500

fprintf("Relative Difference using stopping criteria");
fprintf(" (running for %d iterations)", numIt);
relDiff_stop = abs(x_ML - x_stop);
relDiff_stop_norm = norm(relDiff_stop, inf) / norm(x_ML, inf)

fprintf("\nRelative Difference using exactly 500 iterations");
relDiff_iterations = abs(x_ML - x_iterations);
relDiff_iterations_norm = norm(relDiff_iterations, inf) / norm(x_ML, inf)