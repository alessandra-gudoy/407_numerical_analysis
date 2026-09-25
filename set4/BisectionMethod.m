function [x_n, n] = BisectionMethod(f, a, b, tol, stopcriteria)

% Function to do bisection method to solve for the zero f(x)=0, for
% nonlinear f. 

%Inputs: 
%Function f
% starting interval [a,b]
%tol, tolerance for stopping criteria
% stopcriteria = flag to pick which one we want to use
    % 1 - |xn - x(n-1)| <tol
    % 2 - |xn-x(n-1)|/|xn| <tol
    % 3 - |f(xn)|<tol

%Outputs: x_n, approximation of the zero,
         % n, number of iterations 

%Errors:
if a>=b
    error('bad starting interval')
elseif f(a)*f(b)>=0
    error('function does not have opposite signs at a and b')
end

%Initialize variables
err = Inf; % for holding our stopping criterion thing
n=0;       % number of iteration
xold=a;    %initialize x(n-1) to use for stopping criterion

% loop until our stopping criterion is met
while err>tol
    
    n=n+1;         %current iteration

    x_n=(a+b)/2;   %choose middle of current interval as iterate
    fval=f(x_n);    %Evaluate function at new iterate
    
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
    else
        error('Stopcriteria input is not valid')
    end

    %Reassign xold
    xold=x_n;
end






end