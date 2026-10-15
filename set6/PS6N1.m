clear;
clc;

A = [-2 2 0 ; 0 0 1 ; -1 -1 0];

A1 = norm(A, 1);
A2 = norm(A, 2);
Amax = norm(A, inf);


x = [1 ; -1; 1];

x1 = norm(x, 1);
x2 = norm(x, 2);
xmax = norm(x, inf);


Ax = A*x;

Ax1 = norm(Ax, 1);
Ax2 = norm(Ax, 2);
Axmax = norm(Ax, inf);


Ainv = inv(A);

AAinv1 = norm(A*Ainv, 1)
AAinvmax = norm(A*Ainv, inf)