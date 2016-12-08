function [ rezultat ] = functieRepartitieMinim( x, n )
    if x >= 0 && x <= 1
        rezultat = (1 - x)^n;
    else
        rezultat = 0;
    end
end

