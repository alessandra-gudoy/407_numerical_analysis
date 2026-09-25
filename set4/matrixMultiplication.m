function M = matrixMultiplication(A, B)

% matrixMultiplication(A, B): performs matrix multiplication AB

% INPUTS:
%   A (mxn matrix)
%   B (nxp matrix)

% OUTPUT:
%   M (mxp matrix)  : product given by perform AB

% get dimensions of A and B
[m, nA] = size(A);
[nB, p] = size(B);

% check if matrix dimensions match
if nA ~= nB
    error("matrix dimensions do not match: number of columns in A not equal to number of rows in B");
end

M = zeros(m, p);            % initialize M of zeros

for row = 1:m
    % get row vector from A
    a = A(row, :);
    for col = 1:p
        % get column vector from B
        b = B(:, col);
        sum = 0;

        % compute M_ij
        for n = 1:nA
            sum = sum + (a(n) * b(n));
        end
        
        % save in M
        M(row, col) = sum;
    end
end