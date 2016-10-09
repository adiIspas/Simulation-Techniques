n = 5;
A = zeros(n, n + 1);

for i=1:n
    for j=1:n+1
        if i == j
            A(i,j) = 2;
        elseif abs(i - j) == 1
            A(i,j) = -1;
        end
    end
end

X = [2 -3 8 3 2 1 -5 9 7];

sum = 0;
i = 1;
while X(i) < 8
    sum = sum + X(i);
    i = i + 1;
end
