clear;
clc;

% system of linear equations to solve
% x^2 + y^2 + z^2 = 6
% xy + z = 3
% x + y + z^2 = 6

% transform so that F(x) = 0
f1 = @(x,y,z) x.^2 + y.^2 +z.^2 - 6;
f2 = @(x,y,z) x.*y + z - 3;
f3 = @(x,y,z) x + y + z.^2 - 6;

F = @(x) [f1(x(1), x(2), x(3)); f2(x(1), x(2), x(3)); f3(x(1), x(2), x(3))];

% Jacobian
j1 = @(x, y, z) [2*x 2*y 2*z];
j2 = @(x, y, z) [y x 1];
j3 = @(x, y, z) [1 1 2*z];

J = @(x) [j1(x(1), x(2), x(3)); j2(x(1), x(2), x(3)); j3(x(1), x(2), x(3))];


% initial guess x0, tol, and stop criteria
x0 = [1.2 ; 0.9 ; 1.8];
tol = 10^(-8);
stopcriteria = 3;

[soln, n] = NewtonsSolve(F, J, x0, tol, stopcriteria)