clear;
clc;

% Use BackSub

% create an n x n matrix
n = 10;

U = triu(20 * rand(n, n));  % create n x n matrix and take upper triangle
b = 20 * rand(n, 1);        % create n x 1 vector

x = U \ b;                  % use MATLAB to solve Lx = b
myX = BackSub(U, b);        % use ForwardSub() function to sole Lx = b

% find the difference
diff = myX - x;

% print table
columns = {'x (using MATLAB)', 'x (using made function)', 'Difference'};
out = table(x, myX, diff,'VariableNames', columns)



% max norm
max_diff = max(abs(diff)) / max(abs(x))