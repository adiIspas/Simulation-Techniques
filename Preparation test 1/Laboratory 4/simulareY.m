function [ valoareSelectie ] = simulareY( lambda )
    % Generam o valoare de selectie uniforma
    valoareSelectieUniforma = rand();
    
    % Aplicam functia inversa (F^-1) a functiei de repartitie
    valoareSelectie = (1 / (1 - valoareSelectieUniforma)) ^ (1/lambda);
end

