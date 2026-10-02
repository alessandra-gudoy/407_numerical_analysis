function [Xn, n] = BisectionMethod(f, a, b, tol, stopcriteria)

% modified version of class BisectionMethod function
% Function to do bisection method to solve for the zero f(x)=0, for
% nonlinear f.

% INPUTS:
%   f   (function)          : function to approximate root of
%   a  (real number)        : lower endpoint of interval
%   b  (real number)        : upper endpoint of interval
%   tol (real number)       : tolerance at which to stop at
%   stopcriteria (integer)  : which criteria to check
%                               1 = |xn - x(n-1)| < tol
%                               2 = |xn - x(n-1)| / |xn| < tol
%                               3 = |f(xn)| < tol
%                               4 = use 1 and 3

% OUTPUT:
%   Xn : vector of approximations of root of f [xk, ..., x1, x0]
%   n   : number of iterations


%Errors:
if a>=b
    error('bad starting interval')
elseif f(a)*f(b)>=0
    error('function does not have opposite signs at a and b')
end


%Initialize variables
err = Inf; % for holding our stopping criterion thing
n=0;       % number of iteration
Xn = [];   % each iteration approximation
xold=a;    %initialize x(n-1) to use for stopping criterion

% used if stopping criteria is 4
err1 = Inf;
err2 = Inf;

% loop until our stopping criterion is met
while (stopcriteria < 4 && err>tol) || (stopcriteria==4 && (err1>tol || err2>tol))

    n=n+1;         %current iteration
    x_n=(a+b)/2;   %choose middle of current interval as iterate
    fval=f(x_n);    %Evaluate function at new iterate

    % add current approximation to result vector Xn
    Xn = [x_n, Xn];

    if f(a)*fval<0           %Then choose interval [a, x_n]
        b=x_n;               %reset b value
    elseif f(a)*fval>0       %then choose interval [x_n, b]
        a=x_n;               %reset a value
    else                     %If f(a)f(xn)=0, then xn is our root
        break
    end

    %Calculate err to decide if we should stop the while loop
    if stopcriteria==1
        err=abs(x_n-xold);
    elseif stopcriteria==2
        err=abs(x_n-xold)/abs(x_n);
    elseif stopcriteria==3
        err=abs(fval);
    elseif stopcriteria == 4
        err1 = abs(x_n-xold);
        err2 = abs(fval);
    else
        error('Stopcriteria input is not valid')
    end
    %Reassign xold
    xold=x_n;

end

end