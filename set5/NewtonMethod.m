function [xn, n] = NewtonMethod(x0, f, df, tol, stopcriteria)

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

% OUTPUT:
%   xn : approximate root of f
%   n : number of iterations


xn = 0;             % initialize root approximation xn
n = 0;              % initialize number of iterations counter

err = Inf;          % initialize error


while err > tol     % continue iterations while above tolerance
                    % only stop when happy

    n = n + 1;      % increment iteration

    newXn = xn + ( f(xn) / df(xn) );   % calculate x(n+1)

    % calculate error based on stopcriteria option
    if
        somethin
    elseif
        something else
    elseif
        the other thing
    else
        something wrong
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