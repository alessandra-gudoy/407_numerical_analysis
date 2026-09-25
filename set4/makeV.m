function V = makeV(n)

if n < 0
    error("n must be nonnegative");
end

V = zeros(n, n);

for row = 1:n
    for col = 1:n
        sum = 0;
        denom = row + col;

        if row <= col
            for cur = 1:denom
                sum = sum + (1/cur);
            end
        end

        V(row, col) = sum;
    end
end