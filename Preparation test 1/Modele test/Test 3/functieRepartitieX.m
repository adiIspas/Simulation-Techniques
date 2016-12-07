function [ rezultat ] = functieRepartitieX( x )

    if x <= 0
        rezultat = 0;
    else
        rezultat = 1 - exp(-x^2);
    end

end

