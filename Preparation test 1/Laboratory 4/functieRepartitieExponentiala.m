function [ rezultat ] = functieRepartitieExponentiala( x, lambda )
    if x <= 0
        rezultat = 0;
    else
        rezultat = 1 - exp(-lambda * x);
    end
end

