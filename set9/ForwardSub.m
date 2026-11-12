function x = ForwardSub(L, b)

% ForwardSub(L, b): use forward substitution to solve linear system Lx = b

% INPUTS:
%   L (n x n matrix): lower triangular matrix
%   b (n x 1 vector): right hand side vector

% OUTPUT:
%   x (n x 1 vector): solution vector


% check for errors:
%   1. Check if L is a lower triangular matrix
%   2. Check if length of b matches L

if istril(L) ~= 1
    error("L must be a lower triangular matrix");
end

if length(b) ~= size(L, 1)
    error("Dimensions of L and b do not match")
end


% initialize x
x = zeros(length(b), 1);

% get x(1) using L(1,1)x(1) = b(1)
x(1) = b(1) / L(1,1);

% loop to get remaining x(i)'s
for i = 2:length(b)

    % get sum L(i,1)x(1) + L(i,2)x(2) + ... + L(i, i-1)x(i-1)
    subtrahend = sum( L(i, 1:i-1)' .* x(1:i-1) );

    %{
    subtrahend = 0;
    
    % using a for-loop
    for j = 1:i-1
        subtrahend = subtrahend + L(i, j)*x(j);
    end
    %}

    % calculate x(i)
    x(i) = (b(i) - subtrahend) / L(i,i);

end