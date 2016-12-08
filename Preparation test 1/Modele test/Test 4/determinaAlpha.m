function [ alpha ] = determinaAlpha()
    % Determina valoarea parametrului alpha
    
    x = 0:0.001:1;
    f_x = 3/2 * x .^ 2 + x;
    
    alpha = round(max(f_x) + 1);
end

