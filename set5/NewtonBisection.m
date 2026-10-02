function [xn, n] = NewtonBisection(x0, f, df, tol, stopcriteria, h)

% NewtonBisection(x0, f, df, tol, stopcriteria): use Newton's Method to 
%                                             approximate the root 
%                                             of function f

% INPUTS:
%   x0  (real number)       : initial guess x*
%   f   (function)          : function to approximate root of
%   df  (function)          : derivative of function
%   tol (real number)       : tolerance at which to stop at
%   stopcriteria (integer)  : which criteria to check
%                               1 = |xn - x(n-1)| < tol
%                               2 = |xn - x(n-1)| / |xn| < tol
%                               3 = |f(xn)| < tol
%   h   (real number)       : increment interval during bisection method

% OUTPUT:
%   xn : approximate root of f
%   n : number of iterations

% check if stopping criteria is valid
if stopcriteria < 1 || stopcriteria > 3
    error("invalid stopping criteria");
end

% check if f'(x0) = 0
errZero(df(x0));    % function errZero() declared at end of file

xn = x0;            % initialize root approximation xn using initial guess
xprev = x0;         % holds previous approximation
n = 0;              % initialize number of iterations counter

err = Inf;          % initialize check for stopping criteria


while err > tol     % continue iterations while above tolerance
                    % only stop when happy

    % add a check if need to do bisection
    if abs(f(xn)) > abs(f(xprev))

        % interval endpoints
        a = xn;
        b = xn;

        % find interval
        while f(a)*f(b) >= 0
            a = a - h;
            b = b + h;
        end

        fprintf("\nStarting the bisection method with interval [%.6f, %.6f]\n", a, b);
        fprintf("since f(xn) = %.6f and f(x(n-1)) = %.6f\n", f(xn), f(xprev));
        fprintf("after %d iterations total\n", n);
        % perform bisection method 3 times
        for i = 1:3
            n = n + 1;  % increment iteration

            xprev = xn;
            xn = (a + b) / 2;   % middle of interval

            if f(a)*f(xn) < 0
                b = xn;
            elseif f(a)*f(xn) > 0
                a = xn;
            else
                fprintf("Stopping inside the bisection method since f(xn)=%.6f\n", f(xn));
                break;
            end

        end

        % go back to Newton's using middle of interval
        xn = (a + b) / 2;

    else    % continue with Newton's method
        n = n + 1;      % increment iteration
    
        dfX = df(xn);   % f'(xn)
        errZero(dfX);   % check f'(xn) = 0 and throw error  if true
    
        newXn = xn - ( f(xn) / dfX );    % calculate x(n+1)
    
        % calculate err based on stopcriteria option
        if stopcriteria == 1
            err = abs(newXn - xn);              % err = |xn - x(n-1)|
        elseif stopcriteria == 2
            err = abs(newXn - xn) / abs(newXn);    % err = |xn - x(n-1)| / |xn|
        elseif stopcriteria == 3
            err = abs(f(newXn));                % err = |f(xn)|
        end
    
        xn = xprev;
        xn = newXn;     % do not need previous xn; store new xn
    end
end


end




% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ errZero() ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ %
function [value] = errZero(value)

% errZero(): helper function used to check if f'(xn) is 0
%            if f'(xn) = 0, throw error
%            else, do nothing

% Inputs:
%   value (real number) : value to check if 0

% Outputs:
%   value (real number) : returns back original value

if value == 0
    error("f'(xn) = 0");
end

end