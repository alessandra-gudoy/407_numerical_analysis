% compute values of f(x) = (1 - cos(x)) / x^2

clear;
clc;

f = @(x) (1 - cos(x)) ./ (x .^ 2);      % function f(x)

results = zeros(1, 10);                 % store results
labels = zeros(1, 10);

for i=1:10
    % evaluate f(x=10^{-i})
    results(i) = f(10^(-i));
    labels(i) = 10^(-i);
end

columns = {'x', 'f(x)'};
table(labels', results', 'VariableNames', columns)


fplot(f);           % plot function
xlim([0, 0.15]);     % change min and max values of x
ylim([0 0.65]);     % and y-axes

title('f(x) = (1-cos(x)) / x^2');
xlabel('x');
ylabel('f(x)');