clear;
clc;

true_value = 86400;

%% part a:

fprintf("Part a: dt = 0.1 sec\n");

dt = 0.1;           % time step (0.1 sec)
t = 0;              % initialize time
Nsteps = true_value / dt;    % number of steps to take (1 day = 86400 s)


for j=1:Nsteps      % loop in time

    % SOME SIMULATION

    t = t + dt;     % update time
end

absolute_err = abs(t-true_value);
relative_err = absolute_err / abs(true_value);

fprintf("Number of steps: %d\n", Nsteps);
fprintf("t value = %d\n", t);
fprintf("Absolute error = %d\nRelative error = %d\n", absolute_err, relative_err);

%% part b:

fprintf("\n\nPart b: dt = 0.125 sec\n");

dt = 0.125;                 % time step (0.125 sec)
t = 0;                      % initialize time
Nsteps = true_value / dt;   % number of steps to take (1 day)


for j=1:Nsteps      % loop in time

    % SOME SIMULATION

    t = t + dt;     % update time
end

absolute_err = abs(t-true_value);
relative_err = absolute_err / abs(true_value);

fprintf("Number of steps: %d\n", Nsteps);
fprintf("t value = %d\n", t);
fprintf("Absolute error: %d\nRelative error: %d\n", absolute_err, relative_err);


%% part c:

fprintf("\n\nPart c: dt = 0.05 sec\n");

dt = 0.05;                  % time step (0.25 sec)
t = 0;                      % initialize time
Nsteps = true_value / dt;   % number of steps to take (1 day)


for j=1:Nsteps      % loop in time

    % SOME SIMULATION

    t = t + dt;     % update time
end

absolute_err = abs(t-true_value);
relative_err = absolute_err / abs(true_value);

fprintf("Number of steps: %d\n", Nsteps);
fprintf("t value = %d\n", t);
fprintf("Absolute error: %d\nRelative error: %d\n", absolute_err, relative_err);