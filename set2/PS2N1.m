%% Problem Set 2 #1

clear;
clc;

f=@(x) (x.*exp(-(20*x).^2));    % function to integrate

I=(1-exp(-4))/800;              % exact integral
fprintf('Exact Integral = %e\n', I);

% x values for integration
x0=0;                           % lower bound
x1=0.1;                         % upper bound

Nvals=2.^(5:12);                % list of number of subintervals: 2^5, 2^6, ..., 2^12

Sn = zeros(1, length(Nvals));   % stores calculated approximations

% loop over number of subintervals
for n=1:length(Nvals)

    N = Nvals(n);               % current number of subintervals
    dx = (x1 - x0) / N;         % size of subinterval
    x = x0 + (1:N) * dx;        % vector of all right hand endpoint

    Sn(n) = dx*sum(f(x));       % store Riemann sum in list

end

% calculate successive differences
diffs = Sn(2:length(Sn)) - Sn(1:length(Sn) - 1);


% print table
columns = {'Difference of I_{2^n} and I_{2^{n-1}}', 'Difference', 'Ratio'};
labels = {'I_64 - I_32', 'I_128 - I_64', 'I_256 - I_128', 'I_512 - I_256', 'I_1024 - I_512', 'I_2048 - I_1024'};
ratio = diffs(2:length(diffs)) ./ diffs(1:length(diffs) - 1);


% ratios = table(labels', diffs(1:length(diffs)-1)', ratio', 'VariableNames', columns)


% delta x line
shift = 4;
shifted_y = 1.4 * diffs;
text_x = ((Nvals(4)+ Nvals(5)) / 2) * 0.55;
text_y = ((shifted_y(4)+ shifted_y(5)) / 2) * 0.75;

colorg=[0.4660, 0.6740, 0.1880];

figure;
P1 = loglog(Nvals(2:length(diffs)+1)', diffs, 'o-');    % need to match sizes
hold on;
loglog(Nvals(4:5)', shifted_y(4:5), '-', 'Color', colorg, 'MarkerFaceColor', colorg);       % delta x
text(text_x, text_y, "S_n - S_{n-1}", 'FontSize', 16, 'Color', colorg);                          % label
hold off;


title('Successive Differences Refinement Study');
xlabel('N, number of subintervals (such that difference = S_N - S_{N-1})');
ylabel('Successive Differences');

