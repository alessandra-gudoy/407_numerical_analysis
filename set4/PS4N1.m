clear;
clc;

% use findNorm() function
n = 100;                    % size of vector

x = randi(1000, n, 1);      % 100x1 vector of integers less than 1000
y = randi(5000, n*10, 1);   % 1000x1 vector of integers less than 5000

% find 3-norm and maxnorm of x
[pnormX, maxnormX] = findNorm(x, 3, 1);

% only find 2-norm of y
[pnormY, maxnormY] = findNorm(y, 2, 0);


fprintf("\n\nProblem Set 4 #1c\n\n");
fprintf("\t3-norm, max-norm of x: %d, %d\n", pnormX, maxnormX);
fprintf("\tUsing MATLAB built-in function: 3-norm, max-norm of x: %d, %d\n", norm(x, 3), norm(x, inf));
fprintf("\tError of p-norm |a~ - a|: %d\n", abs(pnormX-norm(x, 3)));
fprintf("\tError of max-norm |a~ - a|: %d\n\n", abs(maxnormX-norm(x, inf)));

fprintf("\t2-norm of y: %d\n", pnormY);
fprintf("\tUsing MATLAB built-in function: 2-norm of y: %d\n", norm(y, 2));
fprintf("\tError of p-norm |a~ - a|: %d\n\n", abs(pnormY-norm(y, 2)));