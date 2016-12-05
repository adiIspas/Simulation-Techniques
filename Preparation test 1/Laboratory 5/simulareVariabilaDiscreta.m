function [ rezultat ] = simulareVariabilaDiscreta( X, p )
    % Generam o valoare de selectie uniforma
    valoareSelectieUniforma = rand();
    
    % Determinam sumele cumulative p1, p1+p2, ..., p1+...+pk
    sumaCumulativa = cumsum(p);
    
    % Cautam toate valorile pentru care valoarea de selectie uniforma este
    % mai mica decat sumele cumulative
    indice = find(valoareSelectieUniforma <= sumaCumulativa);
    
    % Luam prima pozitie pentru care se indeplineste conditia
    indice = indice(1);
    
    % Luam valoarea de selectie conform pozitiei determinat
    rezultat = X(indice);
end

