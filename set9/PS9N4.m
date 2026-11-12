clear;
clc;

% use ConjugateGradient for n=5, 10, ..., 500 and graph

n = (1:100) * 5;            % size of A
tol = 10^(-9);              % tolerance
maxN = 1000000;             % maximum number of iterations

itCounts = zeros(length(n), 1);     % list of number of iterations per n

for i=1:length(n)
    size = n(i);

    B = rand(size);
    A = B'*B + eye(size);       % symmetric and positive definite

    b = rand(size, 1);
    x0 = zeros(size, 1);        % initial value

    % perform Conjugate Gradient
    [x, numIterations] = ConjugateGradient(A, b, x0, tol, maxN);

    % store iterations
    itCounts(i) = numIterations;
end


figure;
scatter(n, itCounts);

% get line of best fit
% mb = polyfit(n, itCounts, 1);
% yLine = polyval(mb, n);
% plot(linspace(0,500), yLine);

title('Number of Iterations vs. n (size of A, an n\timesn matrix)');
xlabel('n');
ylabel('Number of Iterations');


columns = {'n', 'Number of iterations'};
table = table(n', itCounts, 'VariableNames', columns)
