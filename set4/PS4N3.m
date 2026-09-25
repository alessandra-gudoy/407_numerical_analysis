clc;
clear;

fprintf("\n\nProblem Set 4 #3d, e\n\n");

% dimensions of A (mxn) and B (nxp)
m = 1000;
n = 40;
p = 4000;

A = randi(30, m, n);                  % A an mxn matrix of integers less than or equal to 1000
B = randi(30, n, p);                  % B an mxn matrix of integers less than or equal to 1000

% calculate product using function and MATLAB  function

fprintf("part e\n");
fprintf("function matrixMultiplication: ");
tic
myProduct = matrixMultiplication(A, B);
toc

fprintf("MATLAB matrix multiplication: ");
tic
matlabProduct = A * B;
toc

% calculate error
absolute_err = abs(myProduct - matlabProduct);
relative_err = absolute_err ./ abs(matlabProduct);


% find max norm
maxnorm_abs = norm(absolute_err, inf);
maxnorm_rel = norm(relative_err, inf);

fprintf("\n\npart d");
fprintf("\nThe max norm of the Absolute Error matrix is %d.\n", maxnorm_abs);
fprintf("The max norm of the Relative Error matrix is %d.\n", maxnorm_rel);