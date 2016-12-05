function [ rezultat ] = functieRepartitieLomax( x, a, b )

    if x <= 0 
        rezultat = 0;
    else
        rezultat = 1 - (1+(x/(1/b)))^(-a);
    end
end

