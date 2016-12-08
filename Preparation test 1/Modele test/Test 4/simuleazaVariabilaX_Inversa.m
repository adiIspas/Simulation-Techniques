function [ rezultat ] = simuleazaVariabilaX_Inversa()
    % Simularea variabilei X prin metoda inversa
    x = rand();
    rezultat = 1/(9*(x + ((x - 1/27)^2 - 1/729)^(1/2) - 1/27)^(1/3)) + (x + ((x - 1/27)^2 - 1/729)^(1/2) - 1/27)^(1/3) - 1/3;
end

