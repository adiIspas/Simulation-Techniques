function [ rezultat ] = functieRepartitieWeibull( x, v )
    rezultat = 1 - exp(-x^v);
end

