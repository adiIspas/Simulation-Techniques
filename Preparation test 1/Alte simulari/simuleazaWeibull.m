function [ rezultat ] = simuleazaWeibull(v)
    % Simularea variabilei Weibull prin metoda inversa
    
    x = rand();
    rezultat = (-log(x))^(1/v);
end

