function [ valoareSelectie ] = simulareExponentiala( lambda )
    % Generam o valoare de selectie uniforma
    valoareSelectieUniforma = rand();
    
    % Aplicam functia inversa (F^-1) a functiei de repartitie exponentiale
    valoareSelectie = (-1/lambda) * log(valoareSelectieUniforma);
end

