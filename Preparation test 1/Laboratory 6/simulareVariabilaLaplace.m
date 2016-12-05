function [ rezultat ] = simulareVariabilaLaplace( lambda )
    % Generam o valoare de selectie uniforma
    valoareSelectieUniforma = rand();
    
    % Stabilim semnul
    if valoareSelectieUniforma <= 0.5
        s = 1;
    else
        s = -1;
    end
    
    % Generam o valoare de selectie exponentiala
    x1 = exprnd(1/lambda);
    
    % Determinam valoarea de selectie Laplace
    rezultat = s * x1;
end

