clear;
clc;

% use Arctan() to approximate pi

PI = 3.141592653589793;

Nvals = 2 .^ [1:10];                         % N = 2, 4, 8, ..., 1024

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ start 1b ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ %

approximations_b = zeros(length(Nvals), 0);    % results using x = 1
b_errors = zeros(length(Nvals), 0);

for i = 1 : length(Nvals)
    approximations_b(i) = Arctan(1, Nvals(i));
end


approximations_b = 4 * approximations_b;        % get pi
b_errors = abs(PI - approximations_b);


n1pb = table(Nvals', approximations_b', b_errors', 'VariableNames', {'N', 'Approximation of pi: y_N', 'Absolute Error: |pi - y_N|'})

