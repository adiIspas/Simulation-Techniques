function [ rezultat ] = functieRepartitieX( x, n )
    if x >=0 && x <= 1
        rezultat = x ^ n;
    else
        rezultat = 0;
    end
end

