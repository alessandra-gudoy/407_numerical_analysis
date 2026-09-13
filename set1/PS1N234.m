%%
% #2

clc;
clear;

n=10;
f = @(t) t.^n ./ (5 + t);

% exact integral: integral(function, xmin, xmax)
I_f = integral(f, 0, 1);

function result2 = getIntegral(n)

    result2 = log(6/5);    % holds result to return

    for i=1:n
        result2 = (1/i) - (5*result2);
    end

    % clear temporary variables
    clear tmp;
    clear i;

end

result = getIntegral(10);

fprintf("Using the Matlab function integral(), the value of I_10 is %f.", I_f);
fprintf("\nUsing the recursive function, the value is %f.\n", result);


%%
% #3

clc;
clear;

% function g(x) = x^2
g = @(x) x.^2;

I_g = integral(g, 0, 10);

% lower and upper bounds of integral
lower = 0;
upper = 10;

% number of subintervals
num_subints = 2.^(1:10);

% relative and absolute errors
relative_err = zeros(1, length(num_subints));
absolute_err = zeros(1, length(num_subints));


for i=1:length(num_subints)

    n = num_subints(i);
    dx = (upper - lower) / n;

    % get right endpoints
    midpoints = lower + (1:n)*dx;
    % shift by half of dx to get midpoints
    midpoints = midpoints - 0.5*dx;

    % calculate riemann sum
    result = dx * sum(g(midpoints));

    % calculate absolute and relative errors
    absolute_err(i) = abs(result - I_g);
    relative_err(i) = absolute_err(i) / abs(I_g);

end

% clear temporary variables
clear i;
clear dx;
clear midpoints;
clear result;


% calculate error bounds
err = @(n) 2.*(10.^3) ./ (24.*n.^2);
error_bounds = err(num_subints);

% print errors
columns = {'n subintervals', 'Absolute Error', 'Relative Error', 'Error Bounds'};
errors = table(num_subints', absolute_err', relative_err', error_bounds', 'VariableNames', columns)

% ratios for errors
relative_ratios = relative_err(1:end-1) ./ relative_err(2:end)
absolute_ratios = absolute_err(1:end-1) ./ absolute_err(2:end)

fprintf("Since the ratios of the errors are 4, using the midpoints is a 2nd order method.\n");
fprintf("The error bounds calculated also match the absolute errors.\n");

% plot
figure;
loglog(num_subints', relative_err, 'o-', 'LineWidth', 2);
title('Relative Error Refinement Study');
xlabel('Number of subintervals');
ylabel('Relative errors');


%%

% #4a

clc;
clear;

%function h(x) = x^2 e^{10x}
h = @(x) x^2 * exp(10*x);
h_prime = @(x) 10 * x^2 * exp(10*x) + 2 * x * exp(10*x);

% h(3)
h3 = h(3);

% true value of h'(3)
D_h = h_prime(3);

n_values = 2.^(1:10);

% relative and absolute errors
relative_err = zeros(1, length(n_values));
absolute_err = zeros(1, length(n_values));

for i=1:length(n_values)

    dx = 1 / n_values(i);

    result = (h(3 + dx) - h3) / dx;

    % calculate absolute and relative errors
    absolute_err(i) = abs(result - D_h);
    relative_err(i) = absolute_err(i) / abs(D_h);

end

% clear temporary variables
clear i;
clear dx;
clear result;

% print errors
widths = 1 ./ n_values;
columns = {'n', 'dx = 1/n', 'Absolute Error', 'Relative Error'};
errors = table(n_values', widths', absolute_err', relative_err', 'VariableNames', columns)


% ratios for errors
relative_ratios = relative_err(1:end-1) ./ relative_err(2:end)
absolute_ratios = absolute_err(1:end-1) ./ absolute_err(2:end)

fprintf("Since the ratios of the errors approach 2, this approximation of the derivative is a 1st order method.\n");

% plot
figure;
loglog(widths', relative_err, 'o-', 'LineWidth', 2);
title('Relative Error Refinement Study');
xlabel('dx');
ylabel('Relative errors');


%%

% #4b

clc;
clear;

%function h(x) = x^2 e^{10x}
h = @(x) x^2 * exp(10*x);
h_prime = @(x) 10 * x^2 * exp(10*x) + 2 * x * exp(10*x);

% true value of h'(3)
D_h = h_prime(3);

n_values = 2.^(1:10);

% relative and absolute errors
relative_err = zeros(1, length(n_values));
absolute_err = zeros(1, length(n_values));

for i=1:length(n_values)

    dx = 1 / n_values(i);

    result = (h(3 + dx) - h(3 - dx)) / (2 * dx);

    % calculate absolute and relative errors
    absolute_err(i) = abs(result - D_h);
    relative_err(i) = absolute_err(i) / abs(D_h);

end

% clear temporary variables
clear i;
clear dx;
clear result;

% print errors
widths = 1 ./ n_values;
columns = {'n', 'dx = 1/n', 'Absolute Error', 'Relative Error'};
errors = table(n_values', widths', absolute_err', relative_err', 'VariableNames', columns)


% ratios for errors
relative_ratios = relative_err(1:end-1) ./ relative_err(2:end)
absolute_ratios = absolute_err(1:end-1) ./ absolute_err(2:end)

fprintf("Since the ratios of the errors approach 4, this approximation of the derivative is a 2nd order method.\n");

% plot
figure;
loglog(widths', relative_err, 'o-', 'LineWidth', 2);
title('Relative Error Refinement Study');
xlabel('dx');
ylabel('Relative errors');