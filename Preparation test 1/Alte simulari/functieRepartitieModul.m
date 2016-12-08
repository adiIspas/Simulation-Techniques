function [ rezultat ] = functieRepartitieModul( x )
    if x >= -1 && x <= 1
        rezultat = (x * sqrt(x)^2)/2;
    else
        rezultat = 0;
    end
end

