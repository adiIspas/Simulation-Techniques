function [ alpha ] = determina_alpha()
    % Luam valori in intervalul [0,1]
    x = 0:0.0001:1;
    
    % Functia f(x) aplicata pe intervalul de valori luat
    f_x = x.^2 + 4/3 * x;

    % Determinam alpha
    alpha = round(max(f_x) + 1);
end

