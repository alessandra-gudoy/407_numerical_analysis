function [xn, n, err] = AlteredNewton(x0, f, df, tol, stopcriteria, maxN)

% NewtonMethod(x0, f, df, tol, stopcriteria): use Newton's Method to 
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
%   maxN (positive integer) : maximum number of iterations

% OUTPUT:
%   xn  : approximate root of f
%   n   : number of iterations
%   err : error approximation used for stopping criteria

% check if stopping criteria is valid
if stopcriteria < 1 || stopcriteria > 3
    error("invalid stopping criteria");
end

% check if maximum number iterations is positive integer
if maxN < 1
    error("must iterate at least once: maximum number of iterations > 0");
end

% check if f'(x0) = 0
errZero(df(x0));    % function errZero() declared at end of file

xn = x0;            % initialize root approximation xn using initial guess
n = 0;              % initialize number of iterations counter

err = Inf;          % initialize check for stopping criteria


while n < maxN && err > tol    % continue iterations while above tolerance
                                % only stop when happy or too tired

    n = n + 1;      % increment iteration

    dfX = df(xn);   % f'(xn)
    errZero(dfX);   % check f'(xn) = 0 and throw error  if true

    newXn = xn - ( f(xn) / dfX );    % calculate x(n+1)

    % calculate err based on stopcriteria option
    if stopcriteria == 1
        err = abs(newXn - xn);              % err = |xn - x(n-1)|
    elseif stopcriteria == 2
        err = abs(newXn - xn) / abs(xn);    % err = |xn - x(n-1)| / |xn|
    elseif stopcriteria == 3
        err = abs(f(newXn));                % err = |f(xn)|
    end

    xn = newXn;     % do not need previous xn; store new xn
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